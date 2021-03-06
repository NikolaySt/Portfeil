unit Lzrw1;

{$A+}{ word align }
{$O+}{ ?? ?? }

{*****************************************************************************
*
*TLZRW1 file compression component.
*----------------------------------
*
*Compresses a file with :
*------------------------
*
*    either the LZRW1/KH or LZH compression algorithm,
*           with code posted by Kurt Haenen on the SWAG (lzrw1).
*    or the Japanese LZH compression algorithm
*           ( LZSS coded by Haruhiko OKUMURA
*             Adaptive Huffman Coding coded by Haruyasu YOSHIZAKI
*             Edited and translated to English by Kenji RIKITAKE
*             Translated from C to Turbo Pascal by Douglas Webb   2/18/91
*             posted by Doug Webb on the SWAG (preskit2\lzh).)
*
*
*Visual feedback on a Panel if so desired.
*
*All VCL code by D. Heijl , may 8-9 1996
*
*The Getblock/PutBlock procedures are based on the code in
*lzhtest.pas by Douglas Webb.
*
*
*The files lzh.pas and lzrw1kh.pas are essentially untouched
*(only some cosmetic changes, also added exceptions)
*
*--------------------------------------------------------------------
* V2.00.00 :
*
* Code for using a Stream  instead of a File added by Stefan Westner
*                          25 May 1997 (stefan.westner@stud.uni-bamberg.de)
* I removed the seeks to the beginning of the stream (except for the auto guess)
* and the Steeam.Clear call, so that you have more freedom using TFileStream.
*                          30 May 1997 (Danny.Heijl@cevi.be)
* I also added a "Threshold" property that dictates the behaviour of Advise.
*--------------------------------------------------------------------
*
* Feel free to use or give away this software as you see fit.
* Just leave the credits in place if you alter the source.
*
* This software is delivered to you "as is",
* no guarantees, it may blow up or trigger World War Three
* for all I know.
*
* If you find any bugs and let me know, I will try to fix them.
*
* I believe in programmers around the world helping each other
* out by distributing free source code.
*
*Danny Heijl, may 10 1996.
*Danny.Heijl@cevi.be
*
*----------------------------------------------------------------
*****************************************************************}

interface

uses SysUtils, WinTypes, WinProcs, Classes, ExtCtrls, Controls, Forms,
  Graphics, Menus,
  Lzrw1kh, Lzh;

  {$IFDEF WIN32}
type
  Int16 = SmallInt;
  SString = ShortString;
  {$ELSE}
type
  Int16 = Integer;
  {$ENDIF}

type
  ELzrw1Exception = class(Exception);
  TCompressMode = (Good, Fast, Auto);

type
  TLzrw1 = class(TCustomPanel)

  private
    FIn: string;
    FOut: string;
    FCompressMode: TCompressMode;

    FUseStream: Boolean;
    FInputStream: TStream;
    FOutputStream: TStream;

    FThreshold: Integer; { autoguess "fast" threshold }

    procedure CheckWrite(Actual, Desired: Longint);
    procedure CheckRead(Actual, Desired: Longint);

    procedure GetBlock(var Target; NoBytes: Word; var Actual_Bytes: Word);
    procedure PutBlock(var Source; NoBytes: Word; var Actual_Bytes: Word);

    procedure LZrw1Compress;
    procedure LZrw1Decompress;
    procedure LZHCompress;
    procedure LZHDecompress;

  protected
    function CompressFile: Longint;
    function DeCompressFile: Longint;
    function GetBestMode: TCompressMode;
    procedure Loaded; override;

  public
    constructor Create(AOwner: TComponent); override;
    property InputStream: TStream read FInputStream write FInputStream;
    property OutputStream: TStream read FOutputStream write FOutputStream;

  published
    function Compress: Longint;
    function Decompress: Longint;
    function Advise: TCompressMode;
    property UseStream: Boolean read FUseStream write FUseStream
    default False;
    property InputFile: string read FIn write FIn;
    property OutputFile: string read FOut write FOut;
    property CompressMode: TCompressMode read FCompressMode
    write FCompressMode default Good;
    property Threshold: Integer read FThreshold
    write FThreshold default 40;

    property Align;
    property Alignment;
    property BevelInner;
    property BevelOuter;
    property BevelWidth;
    property BorderWidth;
    property BorderStyle;
    property DragCursor;
    property DragMode;
    property Enabled;
    {property Caption; }
    property Color;
    property Ctl3D;
    property Font;
    property Locked;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;

  end;

procedure Register;

implementation

const
  LZRWIdentifier: Longint =
  ((((((Ord('L') shl 8) + Ord('Z')) shl 8) + Ord('R')) shl 8) + Ord('W'));

  LZHIdentifier: Longint =
  ((((((Ord('L') shl 8) + Ord('Z')) shl 8) + Ord('H')) shl 8) + Ord('!'));

  ChunkSize = 32768;
  IOBufSize = (ChunkSize + 16);

type

  LZHBuf = array[1..ChunkSize] of Byte;
  PLZHBuf = ^LZHBuf;

var
  LZHInBuf, LZHOutBuf: PLZHBuf;
  SRCBuf, DSTBuf: BufferPtr; { defined in LZRW1KH }

  SrcFh, DstFh: Integer;
  SRCSize, DSTSize: Longint;

  Tmp: Longint;
  Identifier: Longint;
  CompIdentifier: Longint;
  InSize, OutSize: Longint;

  Size: Longint;

  Buf: Longint; { getblock }
  PosnR: Word; { getblock }
  PosnW: Word; { putblock }

  ReadProc: TreadProc; { must be passed to LZHPACK/UNPACK }
  WriteProc: TWriteProc; { must be passed to LZHPACK/UNPACK }

procedure Register;
begin
  RegisterComponents('Compon', [TLzrw1]);
end;

constructor TLzrw1.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{ initialize defaults }
  FCompressMode := Good;
  FUseStream := False;
  FThreshold := 40; { 40 % autoguess default threshold }
end;

procedure TLzrw1.Loaded;
const
  SLZRW1 = 'LZRW1/KH Compressor / Decompressor';

begin
  inherited Loaded;
{ the caption is fixed }
  if (csDesigning in ComponentState) then begin
    Caption := SLZRW1;
  end else begin
    Caption := '';
  end;
end;

{ the 2 execute methods : compress and decompress }
{-------------------------------------------------}

function TLzrw1.Compress: Longint;
begin
  Result := CompressFile; { compress stream/file }
end;

function TLzrw1.Decompress: Longint;
begin
  Result := DeCompressFile; { decompress stream/file }
end;

{ the 3d execute method : advise compression method }
{---------------------------------------------------}

function TLzrw1.Advise: TCompressMode;
begin
  Result := GetBestMode; { get a guess on file/stream }
end;

{ some common subroutine functions }
{----------------------------------}
const
  SLZRW1FILERIO = 'Lzrw1 : Error reading from input file : ';
  SLZRW1STREAMRIO = 'Lzrw1 : Error reading from input stream !';
  SLZRW1FILEWIO = 'Lzrw1 : Error writing to output file : ';
  SLZRW1STREAMWIO = 'Lzrw1 : Error writing to output stream !';

{ Check if Write was successfull, raise an exception if not }
procedure TLzrw1.CheckWrite(Actual, Desired: Longint);
begin
  if (Actual <> Desired) then begin
    if FUseStream then
      raise ELzrw1Exception.Create(SLZRW1STREAMWIO)
    else
      raise ELzrw1Exception.Create(SLZRW1FILEWIO + FOut)
    end;
  Application.ProcessMessages;
end;

{ check if Read was successfull, raise an exception if not }
procedure TLzrw1.CheckRead(Actual, Desired: Longint);
begin
  if (Actual <> Desired) then begin
    if FUseStream then
      raise ELzrw1Exception.Create(SLZRW1STREAMRIO)
    else
      raise ELzrw1Exception.Create(SLZRW1FILERIO + FIn);
  end;
  Application.ProcessMessages;
end;

{ the LZH reader and writer procedures }
{--------------------------------------}

const
  SLZHIN = '(LZH) Bytes in : ';
  SLZHOUT = ' Bytes out : ';

{ the reader : GetBlock }

procedure TLzrw1.GetBlock(var Target; NoBytes: Word; var Actual_Bytes: Word);
begin
  if (PosnR > Buf) or (PosnR + NoBytes > Succ(Buf)) then begin
    if PosnR > Buf then begin
      if not FUseStream then
        Buf := FileRead(SrcFh, LZHInBuf^,ChunkSize)
      else
        Buf := FInputStream.Read(LZHInBuf^,ChunkSize);
      if (Buf < 0) then begin
        if FUseStream
        then raise ELzrw1Exception.Create(SLZRW1STREAMRIO + ' (LZH)')
        else raise ELzrw1Exception.Create(SLZRW1FILERIO + FIn + ' (LZH)');
      end;
      Inc(InSize, Buf);
      Application.ProcessMessages;
      if Visible then begin
        Caption := SLZHIN + IntToStr(InSize) + SLZHOUT + IntToStr(OutSize);
        Update;
      end;
    end else begin
      Move(LZHInBuf^[PosnR], LZHInBuf^[1], Buf - PosnR);
      if not FUseStream then
        Tmp := FileRead(SrcFh, LZHInBuf^[Buf - PosnR], ChunkSize - (Buf - PosnR))
      else
        Tmp := FInputStream.Read(LZHInBuf^[Buf - PosnR], ChunkSize - (Buf - PosnR));
      if (Tmp < 0) then begin
        if FUseStream
        then raise ELzrw1Exception.Create(SLZRW1STREAMRIO + ' (LZH)')
        else raise ELzrw1Exception.Create(SLZRW1FILERIO + FIn + ' (LZH)');
      end;
      Application.ProcessMessages;
      if Visible then begin
        Caption := SLZHIN + IntToStr(InSize) + SLZHOUT + IntToStr(OutSize);
        Update;
      end;
      Inc(InSize, Tmp);
      Buf := Buf - PosnR + Tmp;
    end;

    if Buf = 0 then begin
      Actual_Bytes := 0;
      Exit;
    end;

    PosnR := 1;
  end;

  Move(LZHInBuf^[PosnR], Target, NoBytes);
  Inc(PosnR, NoBytes);

  if PosnR > Succ(Buf) then
    Actual_Bytes := NoBytes - (PosnR - Succ(Buf))
  else
    Actual_Bytes := NoBytes;

end;

{ and the writer : PutBlock }

procedure TLzrw1.PutBlock(var Source; NoBytes: Word; var Actual_Bytes: Word);

begin
  if NoBytes = 0 then begin{ Flush condition }
    if not FUseStream then
      Tmp := FileWrite(DstFh, LZHOutBuf^,Pred(PosnW))
    else
      Tmp := FOutputStream.Write(LZHOutBuf^,Pred(PosnW));
    CheckWrite(Tmp, Pred(PosnW));
    Inc(OutSize, Tmp);
    if Visible then begin
      Caption := SLZHIN + IntToStr(InSize) + SLZHOUT + IntToStr(OutSize);
      Update;
    end;
    Exit;
  end;
  if (PosnW > ChunkSize) or (PosnW + NoBytes > Succ(ChunkSize)) then begin
    if not FUseStream then
      Tmp := FileWrite(DstFh, LZHOutBuf^,Pred(PosnW))
    else
      Tmp := FOutputStream.Write(LZHOutBuf^,Pred(PosnW));
    CheckWrite(Tmp, Pred(PosnW));
    Inc(OutSize, Tmp);
    PosnW := 1;
    if Visible then begin
      Caption := SLZHIN + IntToStr(InSize) + SLZHOUT + IntToStr(OutSize);
      Update;
    end;
  end;
  Move(Source, LZHOutBuf^[PosnW], NoBytes);
  Inc(PosnW, NoBytes);
  Actual_Bytes := NoBytes;
end;

{ compress a file with LZRW1/KH (FAST) }
{--------------------------------------}

const
  SLZRW1KHIN = '(LZRW1/KH) Bytes in : ';
  SLZRW1KHOUT = ' Bytes out : ';
  SLZRW1KHSIZEEXC =
  'Lzrw1 (decompression LZRW1/KH) : Original and compressed sizes do not match !';

procedure TLzrw1.LZrw1Compress;
begin{ start compressing }
  SRCSize := ChunkSize;
  InSize := 0;
  while (SRCSize = ChunkSize) do begin
  { read a block af data }
    if FUseStream then
      SRCSize := FInputStream.Read(SRCBuf^, ChunkSize)
    else
      SRCSize := FileRead(SrcFh, SRCBuf^, ChunkSize);

  { this fix is BAD, and not needed because    }
  { LZRW1KH.PAS handles the problem now        }
    {    if (SrcSize = 0) then exit;}{      fix of bug in decompression discovered}
    {                               }{      by <Domus@compuserve.com> }

    if (SRCSize < 0) then begin
      if FUseStream
      then raise ELzrw1Exception.Create(SLZRW1STREAMRIO + ' (LZRW1/KH)')
      else raise ELzrw1Exception.Create(SLZRW1FILERIO + FIn + ' (LZRW1/KH)');
    end;
    Application.ProcessMessages;
    Inc(InSize, SRCSize);
  { compress it }
    DSTSize := Compression(SRCBuf, DSTBuf, SRCSize);
  { write out compressed size }
    if not FUseStream then
      Tmp := FileWrite(DstFh, DSTSize, SizeOf(Word))
    else
      Tmp := FOutputStream.Write(DSTSize, SizeOf(Word));
    CheckWrite(Tmp, SizeOf(Word));
    Inc(OutSize, Tmp);
  { write out compressed data }
    if not FUseStream then
      Tmp := FileWrite(DstFh, DSTBuf^, DSTSize)
    else
      Tmp := FOutputStream.Write(DSTBuf^, DSTSize);
    CheckWrite(Tmp, DSTSize);
    Inc(OutSize, Tmp);
    if Visible then begin
      Caption := SLZRW1KHIN + IntToStr(InSize) + SLZRW1KHOUT + IntToStr(OutSize);
      Update;
    end;

  end; { endwhile SRCSize = ChunkSize }
end;

{ compress a file with LZH (GOOD) }
{---------------------------------}

procedure TLzrw1.LZHCompress;
var
  Bytes_Written: Longint;
  Temp: Word;

begin

  ReadProc := GetBlock;
  WriteProc := PutBlock;

{ initialize put/getblock variables }
  Buf := 0;
  PosnR := 1;
  PosnW := 1;
{ pack the file with LZH }
  LZHPack(Bytes_Written, ReadProc, WriteProc);

{ flush last buffer }
  PutBlock(Size, 0, Temp);

end;

{ decompress a file with LZRW1 (FAST) }
{-------------------------------------}

procedure TLzrw1.LZrw1Decompress;
var
  OrigSize: Longint;

begin
{ read in uncompressed filesize }
  if not FUseStream then
    Tmp := FileRead(SrcFh, OrigSize, SizeOf(Longint))
  else
    Tmp := FInputStream.Read(OrigSize, SizeOf(Longint));
  CheckRead(Tmp, SizeOf(Longint));
  Inc(InSize, SizeOf(Longint));
{ start decompression }
  while (DSTSize = ChunkSize) do begin
  { read size of compressed block }
    if not FUseStream then
      Tmp := FileRead(SrcFh, SRCSize, SizeOf(Word))
    else
      Tmp := FInputStream.Read(SRCSize, SizeOf(Word));
    CheckRead(Tmp, SizeOf(Word));
  { read compressed block }
    if not FUseStream then
      Tmp := FileRead(SrcFh, SRCBuf^, SRCSize)
    else
      Tmp := FInputStream.Read(SRCBuf^, SRCSize);
    CheckRead(Tmp, SRCSize);
    Inc(InSize, Tmp + SizeOf(Word));
  { decompress block }
    DSTSize := Decompression(SRCBuf, DSTBuf, SRCSize);
  { write it out }
    if FUseStream then
      Tmp := FOutputStream.Write(DSTBuf^, DSTSize)
    else
      Tmp := FileWrite(DstFh, DSTBuf^, DSTSize);
    CheckWrite(Tmp, DSTSize);
    Inc(OutSize, Tmp);
    if Visible then begin
      Caption := SLZRW1KHIN + IntToStr(InSize) + SLZRW1KHOUT + IntToStr(OutSize);
      Update;
    end;
  end; { endwhile data to read }

  if (OutSize <> OrigSize) then
    raise ELzrw1Exception.Create(SLZRW1KHSIZEEXC);

end;

{ decompress a file with LZH (GOOD) }
{-----------------------------------}

const
  SLZHSIZEEXC =
  'Lzrw1 (LZH decompression) : Original and compressed sizes do not match !';

procedure TLzrw1.LZHDecompress;
var
  OrigSize: Longint;
  Temp: Word;

begin
  ReadProc := GetBlock;
  WriteProc := PutBlock;

{ read in uncompressed filesize }
  if FUseStream then
    Tmp := FInputStream.Read(OrigSize, SizeOf(Longint))
  else
    Tmp := FileRead(SrcFh, OrigSize, SizeOf(Longint));

  CheckRead(Tmp, SizeOf(Longint));
  Inc(InSize, SizeOf(Longint));

{ initialize put/getblock variables }
  PosnR := 1;
  Buf := 0;
  PosnW := 1;
{ unpack the file with LZH }
  LZHUnPack(OrigSize, ReadProc, WriteProc);

{ flush last buffer }
  PutBlock(Size, 0, Temp);

  if (OutSize <> OrigSize) then begin
    raise ELzrw1Exception.Create(SLZHSIZEEXC);
  end;

end;

{ the main code common to both (de)compression methods  }
{-------------------------------------------------------}

const
  SNOMEMORY = 'Lzrw1 (de)compression : Failed to get memory for I/O buffers !';
  SNOSIZESTREAM = 'Lzrw1 compression : Failed to obtain the size of the input stream !';
  SNOSIZEFILE = 'Lzrw1 compression : Failed to obtain the size of : ';
  SINSTREAMERR = 'Lzrw1 (de)compression : Failed to initialize input stream !';
  SOUTSTREAMERR = 'Lzrw1 (de)compression : Failed to initialize output stream !';
  SINFILEERR = 'Lzrw1 (de)compression : Failed to open input file : ';
  SOUTFILEERR = 'Lzrw1 (de)compression : Failed to open output file : ';
  SINSTREAMFMT = 'Lzrw1 decompression : input stream contains no valid header !';
  SINFILEFMT = ' : Lzrw1 decompression : this file has no valid header !';
  SINSTREAMSTATC = 'Lzrw1 : inputstream successfully compressed at ';
  SINFILESTATC = ' : Lzrw1 : successfully compressed at ';
  SINSTREAMSTATD = 'LZrw1 : inputstream successfully decompressed at ';
  SINFILESTATD = ' : Lzrw1 : successfully decompressed at ';

{ compress a file }
  {-----------------}

function TLzrw1.CompressFile: Longint;
var
  Infile: file;
  Mode: TCompressMode;

begin

  if (FCompressMode = Auto) then
    Mode := GetBestMode
  else
    Mode := FCompressMode;

  try
    GetMem(SRCBuf, IOBufSize);
    GetMem(DSTBuf, IOBufSize);
    LZHInBuf := PLZHBuf(SRCBuf);
    LZHOutBuf := PLZHBuf(DSTBuf);
  except
    raise ELzrw1Exception.Create(SNOMEMORY);
  end;

  if (Mode = Fast) then
    CompIdentifier := LZRWIdentifier
  else
    CompIdentifier := LZHIdentifier;

  try
    SrcFh := 0; DstFh := 0;
    try
      if FUseStream then
        Size := FInputStream.Size
      else begin
        AssignFile(Infile, FIn);
        Reset(Infile, 1);
        try
          Size := FileSize(Infile);
        finally;
          CloseFile(Infile);
        end;
      end;
    except
      if FUseStream
      then raise ELzrw1Exception.Create(SNOSIZESTREAM)
      else raise ELzrw1Exception.Create(SNOSIZEFILE + FIn);
    end;

    try{ try to open the streams/files }
      if FUseStream then begin
        if FInputStream.Seek(0, soFromCurrent) < 0 then
          raise ELzrw1Exception.Create(SINSTREAMERR);
        if FOutputStream.Seek(0, soFromCurrent) < 0 then
          raise ELzrw1Exception.Create(SOUTSTREAMERR);
      end else begin
        SrcFh := FileOpen(FIn, fmOpenRead);
        if (SrcFh < 0) then
          raise ELzrw1Exception.Create(SINFILEERR + FIn);
        DstFh := FileCreate(FOut);
        if (DstFh < 0) then
          raise ELzrw1Exception.Create(SOUTFILEERR + FOut);
      end;

      try{ try to compress the file }
      { write out compression ID }
        if FUseStream then
          Tmp := FOutputStream.Write(CompIdentifier, SizeOf(Longint))
        else
          Tmp := FileWrite(DstFh, CompIdentifier, SizeOf(Longint));
        CheckWrite(Tmp, SizeOf(Longint));
        OutSize := SizeOf(Longint);
        InSize := 0;
      { write out uncompressed filesize }
        if FUseStream then
          Tmp := FOutputStream.Write(Size, SizeOf(Longint))
        else
          Tmp := FileWrite(DstFh, Size, SizeOf(Longint));
        CheckWrite(Tmp, SizeOf(Longint));
        Inc(OutSize, SizeOf(Longint));

        if (Mode = Fast) then
          LZrw1Compress
        else
          LZHCompress;

      except{ error while compressing }
      { leave streams alone , delete outputfile }
        on Exception do begin
          if not FUseStream then begin
            FileClose(DstFh); DstFh := 0;
          { get rid of output file }
            SysUtils.DeleteFile(FOut);
            raise; { and reraise to inform user }
          end;
        end;
      end;

    finally
      if not FUseStream then begin
        if (SrcFh > 0) then FileClose(SrcFh);
        if (DstFh > 0) then FileClose(DstFh);
      end;
    end;

    if Visible then begin
      if FUseStream then
        Caption := SINSTREAMSTATC + IntToStr((OutSize * 100) div InSize) + '%'
      else
        Caption := FIn + SINFILESTATC + IntToStr((OutSize * 100) div InSize) + '%';
      Update;
    end;

  finally
    FreeMem(SRCBuf, IOBufSize);
    FreeMem(DSTBuf, IOBufSize);
  end;

  Result := OutSize;

end;

{ decompress a file }
{-------------------}

function TLzrw1.DeCompressFile: Longint;
begin
  try
    GetMem(SRCBuf, IOBufSize);
    GetMem(DSTBuf, IOBufSize);
    LZHInBuf := PLZHBuf(SRCBuf);
    LZHOutBuf := PLZHBuf(DSTBuf);
  except
    raise ELzrw1Exception.Create(SNOMEMORY);
    Exit;
  end;

  try
    SrcFh := 0; DstFh := 0;
    try
      if FUseStream then begin
        if FInputStream.Seek(0, soFromCurrent) < 0 then
          raise ELzrw1Exception.Create(SINSTREAMERR);
        if FOutputStream.Seek(0, soFromCurrent) < 0 then
          raise ELzrw1Exception.Create(SOUTSTREAMERR);
      end else begin
        SrcFh := FileOpen(FIn, fmOpenRead);
        if (SrcFh < 0) then
          raise ELzrw1Exception.Create(SINFILEERR + FIn);
        DstFh := FileCreate(FOut);
        if (DstFh < 0) then
          raise ELzrw1Exception.Create(SOUTFILEERR + FOut);
      end;

      try
      { read compression ID }
        if FUseStream then
          Tmp := FInputStream.Read(Identifier, SizeOf(Longint))
        else
          Tmp := FileRead(SrcFh, Identifier, SizeOf(Longint));
        CheckRead(Tmp, SizeOf(Longint));
        if (Identifier <> LZRWIdentifier)
        and (Identifier <> LZHIdentifier) then begin
          if FUseStream then
            raise ELzrw1Exception.Create(SINSTREAMFMT)
          else
            raise ELzrw1Exception.Create(FIn + SINFILEFMT);
        end;
        DSTSize := ChunkSize;
        InSize := SizeOf(Longint);
        OutSize := 0;

        if (Identifier = LZRWIdentifier) then
          LZrw1Decompress
        else
          LZHDecompress;

        if Visible then begin
          if FUseStream then
            Caption := SINSTREAMSTATD + IntToStr((OutSize * 100) div InSize) + '%'
          else
            Caption := FIn + SINFILESTATD + IntToStr((OutSize * 100) div InSize) + '%';
          Update;
        end;

      except
        on Exception do begin
        { leave streams alone }
          if FUseStream then begin
            FileClose(DstFh); DstFh := 0;
          { get rid of output file }
            SysUtils.DeleteFile(FOut);
            raise;
          end;
        end;
      end;

    finally
      if not FUseStream then begin
        if (SrcFh > 0) then FileClose(SrcFh);
        if (DstFh > 0) then FileClose(DstFh);
      end;
    end;

  finally
    FreeMem(SRCBuf, IOBufSize);
    FreeMem(DSTBuf, IOBufSize);
  end;

  Result := OutSize;

end;

{ Guess the best compression mode }
{ returns Good or Fast }
const
  SGUESSSTRM = 'Guessing the best compression mode for the inputstream';
  SGUESSFILE = 'Guessing the best compression mode for : ';
  SGUESSMEMERR = 'Lzrw1 advise : Error getting I/O buffers';
  SGUESSSTRMSIZEERR = 'Lzrw1 advise : can not get size of inputstream !';
  SGUESSFILESIZEERR = 'Lzrw1 advise : can not get the size of : ';
  SGUESSSTRMOPENERR = 'Lzrw1 edvise : can not initialize the input stream!';
  SGUESSFILEOPENERR = 'Lzrw1 advise : can open input file : ';
  SGUESSSTRMRDERR = 'Lzrw1 advise : input stream read error !';
  SGUESSFILERDERR = 'Lzrw1 advise : read error on input file : ';
  SGUESSFAST = 'Lzrw1 recommends FAST compression : ';
  SGUESSGOOD = 'Lzrw1 recommends GOOD compression : ';

function TLzrw1.GetBestMode: TCompressMode;
var
  Infile: file;
  CompressedSize: Longint;
  UncompressedSize: Longint;
  SavedStreamPos: Longint;

begin

  Result := Good;

  if FUseStream then begin
    Caption := SGUESSSTRM;
    SavedStreamPos := FInputStream.Position;
  end else
    Caption := SGUESSFILE + FIn;

  try
    GetMem(SRCBuf, IOBufSize);
    GetMem(DSTBuf, IOBufSize);
  except
    raise ELzrw1Exception.Create(SGUESSMEMERR);
  end;

  try{ use I/O buffers, finally release }
    SrcFh := 0;
    if FUseStream then begin
      try
        Size := FInputStream.Size;
      except
        raise ELzrw1Exception.Create(SGUESSSTRMSIZEERR);
      end;
    end
    else begin
      try{ need the filesize to start, get it }
        AssignFile(Infile, FIn);
        Reset(Infile, 1);
        try
          Size := FileSize(Infile);
        finally;
          CloseFile(Infile);
        end;
      except
        raise ELzrw1Exception.Create(SGUESSFILESIZEERR + FIn);
      end;
    end;

    if FUseStream then begin
      if FInputStream.Seek(0, soFromBeginning) < 0 then
        raise ELzrw1Exception.Create(SGUESSSTRMOPENERR);
    end
    else begin
      SrcFh := FileOpen(FIn, fmOpenRead);
      if (SrcFh < 0) then begin
        raise ELzrw1Exception.Create(SGUESSFILEOPENERR + FIn);
      end;
    end;

    try{ try to use the inputfile, finally close }

    { small files can afford LZH }
      if (Size < (3 * ChunkSize)) then begin
        FCompressMode := Good;
        Result := Good;
        Caption := SGUESSGOOD + ' small file !!';
        Exit;
      end;
    { try 2 blocks with fast at 1/3 and 2/3 of file }
      if FUseStream then
        FInputStream.Seek((Size div 3) and $7FFF8000, soFromBeginning)
      else
        FileSeek(SrcFh, (Size div 3) and $7FFF8000, soFromBeginning);

      if FUseStream then begin
        SRCSize := FInputStream.Read(SRCBuf^, ChunkSize);
        if (SRCSize < 0) then begin
          raise ELzrw1Exception.Create(SGUESSSTRMRDERR);
        end;
      end
      else begin
        SRCSize := FileRead(SrcFh, SRCBuf^, ChunkSize);
        if (SRCSize < 0) then begin
          raise ELzrw1Exception.Create(SGUESSFILERDERR + FIn);
        end;
      end;
      UncompressedSize := SRCSize;
      Application.ProcessMessages;
      CompressedSize := Compression(SRCBuf, DSTBuf, SRCSize);
      if FUseStream then begin
        FInputStream.Seek(((Size * 2) div 3) and $7FFF8000, soFromBeginning);
        SRCSize := FInputStream.Read(SRCBuf^, ChunkSize);
        if (SRCSize < 0) then begin
          raise ELzrw1Exception.Create(SGUESSSTRMRDERR);
        end;
      end
      else begin
        FileSeek(SrcFh, ((Size * 2) div 3) and $7FFF8000, soFromBeginning);
        SRCSize := FileRead(SrcFh, SRCBuf^, ChunkSize);
        if (SRCSize < 0) then begin
          raise ELzrw1Exception.Create(SGUESSFILERDERR + FIn);
        end;
      end;
      Inc(UncompressedSize, SRCSize);
      Application.ProcessMessages;
      Inc(CompressedSize, Compression(SRCBuf, DSTBuf, SRCSize));

      if (((UncompressedSize * FThreshold) div 100) > CompressedSize) then begin
        Result := Fast;
        Caption := SGUESSFAST + IntToStr((CompressedSize * 100)
          div UncompressedSize) + '%.';
      end
      else begin
        Result := Good;
        Caption := SGUESSGOOD + IntToStr((CompressedSize * 100)
          div UncompressedSize) + '%.';
      end;

    finally
      if FUseStream then
        InputStream.Seek(SavedStreamPos, soFromBeginning)
      else begin
        if (SrcFh > 0) then FileClose(SrcFh);
      end;
    end;

  finally
    FreeMem(SRCBuf, IOBufSize);
    FreeMem(DSTBuf, IOBufSize);
  end;

end;

end.
