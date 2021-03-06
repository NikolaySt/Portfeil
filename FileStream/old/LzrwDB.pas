unit LzrwDB;
{$A+}{ word align }
{$O+}{ ?? ?? }
{$R-}{ NO range checking possible, or this code will fail !! -- dh -- }
interface

uses SysUtils, ConstArr;

type
  Int16 = Integer;

  {.$DEFINE DEBUG}
  {$IFDEF DEBUG}
  {$D+}
  {$ENDIF}
  
type
  ELzrw1KHCompressor = class(Exception);

function Compression( Source, Dest: BufferPtr;
  SourceSize: BufferSize): BufferSize;
function Decompression( Source, Dest: BufferPtr;
  SourceSize: BufferSize): BufferSize;

implementation

type
  HashTable = array[0..4095] of Int16;
  HashTabPtr = ^HashTable;

var
  Hash: HashTabPtr;

{ check if this string has already been seen }
{ in the current 4 KB window }
function GetMatch( Source: BufferPtr;
  X: BufferIndex;
  SourceSize: BufferSize;
  Hash: HashTabPtr;
  var Size: Word;
  var Pos: BufferIndex): Boolean;
var
  HashValue: Word;
  TmpHash: Int16;
begin
  HashValue := (40543 * ((((Source^[X] shl 4) XOR Source^[X + 1]) shl 4) XOR
    Source^[X + 2]) shr 4) and $0FFF;
  Result := False;
  TmpHash := Hash^[HashValue];
  if (TmpHash <> -1) and (X - TmpHash < 4096) then begin
    Pos := TmpHash;
    Size := 0;
    while ((Size < 18) and (Source^[X + Size] = Source^[Pos + Size])
    and (X + Size < SourceSize)) do begin
      Inc(Size);
    end;
    Result := (Size >= 3)
  end;
  Hash^[HashValue] := X
end;
{ compress a buffer of max. 32 KB }
function Compression(Source, Dest: BufferPtr;
  SourceSize: BufferSize): BufferSize;
var
  Bit, Command, Size: Word;
  Key: Word;
  X, Y, Z, Pos: BufferIndex;
begin
  FillChar(Hash^,SizeOf(HashTable), $FF);
  Dest^[0] := FLAG_Compress;
  X := 0;
  Y := 3;
  Z := 1;
  Bit := 0;
  Command := 0;
  while (X < SourceSize) and (Y <= SourceSize) do begin
    if (Bit > 15) then begin
      Dest^[Z] := Hi(Command);
      Dest^[Z + 1] := Lo(Command);
      Z := Y;
      Bit := 0;
      Inc(Y, 2)
    end;
    Size := 1;
    while ((Source^[X] = Source^[X + Size]) and (Size < $FFF)
    and (X + Size < SourceSize)) do begin
      Inc(Size);
    end;
    if (Size >= 16) then begin
      Dest^[Y] := 0;
      Dest^[Y + 1] := Hi(Size - 16);
      Dest^[Y + 2] := Lo(Size - 16);
      Dest^[Y + 3] := Source^[X];
      Inc(Y, 4);
      Inc(X, Size);
      Command := (Command shl 1) + 1;
    end
    else begin{ not size >= 16 }
      if (GetMatch(Source, X, SourceSize, Hash, Size, Pos)) then begin
        Key := ((X - Pos) shl 4) + (Size - 3);
        Dest^[Y] := Hi(Key);
        Dest^[Y + 1] := Lo(Key);
        Inc(Y, 2);
        Inc(X, Size);
        Command := (Command shl 1) + 1
      end
      else begin
        Dest^[Y] := Source^[X];
        Inc(Y);
        Inc(X);
        Command := Command shl 1
      end;
    end; { size <= 16 }
    Inc(Bit);
  end; { while x < sourcesize ... }
  Command := Command shl (16 - Bit);
  Dest^[Z] := Hi(Command);
  Dest^[Z + 1] := Lo(Command);
  if (Y > SourceSize) then begin
    Move(Source^[0], Dest^[1], SourceSize);
    Dest^[0] := FLAG_Copied;
    Y := Succ(SourceSize)
  end;
  Result := Y
end;

{ decompress a buffer of max 32 KB }
function Decompression(Source, Dest: BufferPtr;
  SourceSize: BufferSize): BufferSize;
var
  X, Y, Pos: BufferIndex;
  Command, Size, K: Word;
  Bit: Byte;
  SaveY: BufferIndex; { unsafe for-loop variable Y -- dh --}

begin
  if (SourceSize <= 1) then begin{ correction of a bug found by }
    Result := 0; { Dominique Willems            }
    Exit; { <Domus@compuserve.com>       }
  end;
  if (Source^[0] = FLAG_Copied) then begin
    for Y := 1 to Pred(SourceSize) do begin
      Dest^[Pred(Y)] := Source^[Y];
      SaveY := Y;
    end;
    Y := SaveY;
  end
  else begin
    Y := 0;
    X := 3;
    Command := (Source^[1] shl 8) + Source^[2];
    Bit := 16;
    while (X < SourceSize) do begin
      if (Bit = 0) then begin
        Command := (Source^[X] shl 8) + Source^[X + 1];
        Bit := 16;
        Inc(X, 2)
      end;
      if ((Command and $8000) = 0) then begin
        Dest^[Y] := Source^[X];
        Inc(X);
        Inc(Y)
      end
      else begin{ command and $8000 }
        Pos := ((Source^[X] shl 4)
           + (Source^[X + 1] shr 4));
        if (Pos = 0) then begin
          Size := (Source^[X + 1] shl 8) + Source^[X + 2] + 15;
          for K := 0 to Size do begin
            Dest^[Y + K] := Source^[X + 3];
          end;
          Inc(X, 4);
          Inc(Y, Size + 1)
        end
        else begin{ pos = 0 }
          Size := (Source^[X + 1] and $0F) + 2;
          for K := 0 to Size do
            Dest^[Y + K] := Dest^[Y - Pos + K];
          Inc(X, 2);
          Inc(Y, Size + 1)
        end; { pos = 0 }
      end; { command and $8000 }
      Command := Command shl 1;
      Dec(Bit)
    end{ while x < sourcesize }
    end;
  Result := Y
end; { decompression }

{
Unit "Finalization" as Delphi 2.0 would have it
}

var
  ExitSave: Pointer;

procedure Cleanup; far;
begin
  ExitProc := ExitSave;
  if (Hash <> nil) then
    FreeMem(Hash, SizeOf(HashTable));
end;

initialization
  Hash := nil;
  try
    GetMem(Hash, SizeOf(HashTable));
  except
    raise ELzrw1KHCompressor.Create('LZRW1KH : no memory for HASH table');
  end;
  ExitSave := ExitProc;
  ExitProc := @Cleanup;
  
end.

