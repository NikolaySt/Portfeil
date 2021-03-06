unit MemSave;

interface

uses Windows, Classes, SysUtils, LzrwDB, CRC32;

type
  EInvalidPassword = class(Exception);
  EInvalidDatabase = class(Exception);
  EIncorectVersion = class(Exception);
  ECrcValidate = class(Exception);
  ECancelPassword = class(Exception);

  THeaderInfo = packed record
    DBFile: Word;
    Size: Word;
    Init: array[0..1] of byte;
    CRC_1: DWORD; //след кодирането ако има такова
    CRC_2: DWORD; //след компресирането ако има такова
    Master: string[30];
    //--------Compress-----
    CountCompress: Longword;
    PositionTable: Longword; 
    //---------------------
    PasswordMask: Longword;
  end;

  TOnPassword = procedure (var APassword: string; var ACancel: Boolean) of object; 

  TDBMemory = class(TMemoryStream)
  private
    FCompress: Boolean;
    FCoding: Boolean;
    FDBFile: Boolean;
    FCRCvalue: DWORD;
    FSecMem: TMemoryStream;
    FHeaderInfo: THeaderInfo;
    FPasswordMask: Longword;
    FOnPassword: TOnPassword;
    FOnwer: TComponent;
    function InternalLoadData: Boolean;
    procedure InternalSaveData;
    procedure InternalDeleteHeader;
    procedure InternalAddHeader;    
    procedure CheckHeaderInfo;
    procedure CheckPassword;
  protected
    procedure ReadHeaderInfo;
    procedure WriteHeaderInfo(Stream: TMemoryStream);
    procedure Encode;
    procedure Decode;
    procedure CalcCRC(StartPos: Integer = 0);
    function CheckCRC(ValueCheck: Longword): Boolean;
    procedure CompressStream;
    procedure DecompressStream;
  public
    constructor Create(AOnwer: TComponent); virtual;
    destructor Destroy; override;

    procedure SaveToStream(Stream: TStream); virtual;
    procedure SaveToFile(const FileName: string); virtual;

    function LoadFromStream(Stream: TStream): Boolean; virtual;
    function LoadFromFile(const FileName: string): Boolean; virtual;

    property Compress: Boolean read FCompress write FCompress;
    property Coding: Boolean read FCoding write FCoding;
    property PasswordMask: Longword read FPasswordMask write FPasswordMask;
    property OnPassword: TOnPassword read FOnPassword write FOnPassword;
  end;

implementation

uses DBPassword, ProtectData, ConstMemSave, ConstArr, MemDB;

const
  ChunkSize = 4096;
  BuffSize = ChunkSize;

{ TDBMemory }
    
constructor TDBMemory.Create(AOnwer: TComponent); 
begin
  FOnwer := AOnwer;
  FCompress := True;
  FCoding := True;
  FPasswordMask := 0;
  FSecMem := TMemoryStream.Create;
end;

destructor TDBMemory.Destroy;
begin
  FSecMem.Free;
  inherited;
end;

function TDBMemory.LoadFromFile(const FileName: string): Boolean;
begin
  TMemoryStream(Self).LoadFromFile(FileName);
  Result := InternalLoadData;
end;

function TDBMemory.LoadFromStream(Stream: TStream): Boolean;
begin
  Stream.Position := 0;
  TMemoryStream(Self).LoadFromStream(Stream);
  Result := InternalLoadData;
end;

procedure TDBMemory.SaveToFile(const FileName: string);
begin
  InternalSaveData;
  TMemoryStream(Self).SaveToFile(FileName);
end;

procedure TDBMemory.SaveToStream(Stream: TStream);
begin
  InternalSaveData;
  TMemoryStream(Self).SaveToStream(Stream);
end;
 
procedure TDBMemory.CompressStream;
var
  Dest, Source: BufferPtr;
  CompSize, ReadSize, Count_Comp: Longword;
  MemCompSize: TMemoryStream;
begin
  //add CRC32
  GetMem(Source, BuffSize);
  GetMem(Dest, BuffSize);
  FSecMem.Clear;
  MemCompSize := TMemoryStream.Create;
  try
    Position := 0;
    Count_Comp := 0;
    while Position < Size do
    begin
      ReadSize := Read(Source^, BuffSize);
      CompSize := Compression(Source, Dest, ReadSize);

      //записва само компресираните данни
      FSecMem.Write(Dest^, CompSize);

      //записва големината на компресираните парчета
      MemCompSize.Write(CompSize, SizeOf(Longword));
      Inc(Count_Comp);
    end;

    FHeaderInfo.CountCompress := Count_Comp;
    FHeaderInfo.PositionTable := FSecMem.Size;

    //записва големината на компресираните парчета
    FSecMem.Write(MemCompSize.Memory^, MemCompSize.Size);

    Clear; //изчистване на текущия поток и запис на архива в него
    FSecMem.SaveToStream(Self);
  finally
    FSecMem.Clear;
    MemCompSize.Free;
    FreeMem(Source, BuffSize);
    FreeMem(Dest, BuffSize);
  end;
end;
    
procedure TDBMemory.DecompressStream;
var
  Dest, Source: BufferPtr;
  CompSize, ReadSize: Longword;
  i: Longword;

  Size_arr: Longword;
  Buff_arr: array of Longword;
begin
  GetMem(Dest, BuffSize);
  FSecMem.Clear;
  try
    //прочита броя на архивните парчета
    Size_arr := FHeaderInfo.CountCompress;
    SetLength(Buff_arr, Size_arr);

    //попълва масива с големените на архивните части
    Position := FHeaderInfo.PositionTable;
    for i := 0 to Size_arr - 1 do
      Read(Buff_arr[i], SizeOf(Longword));

    i := 0;
    Position := 0;
    while i < Size_arr do
    begin
      GetMem(Source, Buff_arr[i]);
      try
        ReadSize := Read(Source^, Buff_arr[i]);
        CompSize := Decompression(Source, Dest, ReadSize);
        FSecMem.Write(Dest^, CompSize);
      finally
        FreeMem(Source, BuffSize);
      end;
      inc(i);
    end;
    Clear;
    FSecMem.SaveToStream(Self);
  finally
    FSecMem.Clear;
    FreeMem(Dest, BuffSize);
  end;
end;
    
procedure TDBMemory.CalcCRC(StartPos: Integer = 0);
var
  ReadSize: Integer;
  Source: ^Pointer;  
begin
  Position := StartPos;
  GetMem(Source, BuffSize);
  FCRCvalue := 0;
  try
    while Position < Size do
    begin
      ReadSize := Read(Source^, BuffSize);
      CalcCRC32(Source, ReadSize, FCRCvalue);
    end;
  finally
    FreeMem(Source, BuffSize);
  end;
end;

procedure TDBMemory.Decode;
var
  Data: BufferPtr;
  Size_Read: Longword;
begin
  GetMem(Data, BuffSize);
  FSecMem.Clear;
  try
    Position := 0;
    while Position < Size do
    begin
      Size_Read := Read(Data^, BuffSize);
      InternalDecode(Data, Size_Read, FPasswordMask{FHeaderInfo.PasswordMask});
      FSecMem.Write(Data^, Size_Read);
    end;
    Clear;
    FSecMem.SaveToStream(Self);
  finally
    FreeMem(Data);
    FSecMem.Clear;
  end;
end;

procedure TDBMemory.Encode;
var
  Data: BufferPtr;
  Size_Read: Longword;
begin
  GetMem(Data, BuffSize);
  FSecMem.Clear;
  try
    Position := 0;
    while Position < Size do
    begin
      Size_Read := Read(Data^, BuffSize);
      InternalEncode(Data, Size_Read, FPasswordMask);
      FSecMem.Write(Data^, Size_Read);
    end;
    Clear;
    FSecMem.SaveToStream(Self);
  finally
    FreeMem(Data);
    FSecMem.Clear;
  end;
end;

procedure TDBMemory.ReadHeaderInfo;
begin
  Position := 0;
  Read(FHeaderInfo, SizeOf(THeaderInfo));
end;

function TDBMemory.CheckCRC(ValueCheck: Longword): Boolean;
begin
  //изчислява CRC на архивните данни без HeaderInfo
  CalcCRC;

  if ValueCheck <> FCRCvalue then
    raise ECrcValidate.Create(c_crc_validate);
    
  Result := True;
end;

procedure TDBMemory.WriteHeaderInfo(Stream: TMemoryStream);
begin
  //изчислява CRC на архивните данни без HeaderInfo
  CalcCRC;
  
  with FHeaderInfo do
  begin
    DBFile := c_db_file;
    Size := SizeOf(THeaderInfo);
    if FCoding then Init[0] := c_coding else Init[0] := c_no_coding;
    if FCompress then Init[1] := c_compres else Init[1] := c_no_compres;
    CRC_1 := FCRCvalue;    
    Master := c_master_info;
    PasswordMask := FPasswordMask;
  end;
  
  //записва HeaderInfo в началото на файла
  Position := 0;
  Stream.Write(FHeaderInfo, SizeOf(THeaderInfo));
end;

procedure TDBMemory.CheckHeaderInfo;
begin
  if FHeaderInfo.DBFile = c_db_file then
    FDBFile := True
  else begin
    FDBFile := False;
    raise EInvalidDatabase.Create(c_invalid_database);
  end;
  if not FHeaderInfo.Size = SizeOf(THeaderInfo) then
    raise EIncorectVersion.Create(c_incorect_version);

  if FHeaderInfo.Init[0] = c_coding then FCoding := True else FCoding := False;
  if FHeaderInfo.Init[1] = c_compres then FCompress := True else FCompress := False;
end;

function TDBMemory.InternalLoadData: Boolean;
begin
  Result := False;
  FPasswordMask := 0;

  ReadHeaderInfo;
  CheckHeaderInfo;
  InternalDeleteHeader;

  CheckCRC(FHeaderInfo.CRC_1);
  try
    CheckPassword;
  except
    on ECancelPassword do Exit;
  end;
  
  if FCoding then Decode;

  CheckCRC(FHeaderInfo.CRC_2);

  if FCompress then DecompressStream;
  
  Result := True;
end;

procedure TDBMemory.InternalSaveData;
begin
  if FCompress then CompressStream;

  CalcCRC;
  FHeaderInfo.CRC_2 := FCRCvalue;

  if FCoding then Encode;
  InternalAddHeader;
end;

procedure TDBMemory.InternalDeleteHeader;
var
  Data: BufferPtr;
  Size_Read: Longword;
begin
  GetMem(Data, BuffSize);
  FSecMem.Clear;
  try
    Position := SizeOf(THeaderInfo);
    while Position < Size do
    begin
      Size_Read := Read(Data^, BuffSize);
      FSecMem.Write(Data^, Size_Read);
    end;
    Clear;
    FSecMem.SaveToStream(Self);
  finally
    FreeMem(Data);
    FSecMem.Clear;
  end;
end;

procedure TDBMemory.InternalAddHeader;
var
  Data: BufferPtr;
  Size_Read: Longword;
begin
  GetMem(Data, BuffSize);
  FSecMem.Clear;
  try
    WriteHeaderInfo(FSecMem);
    Position := 0;
    while Position < Size do
    begin
      Size_Read := Read(Data^, BuffSize);
      FSecMem.Write(Data^, Size_Read);
    end;
    Clear;
    FSecMem.SaveToStream(Self);
  finally
    FreeMem(Data);
    FSecMem.Clear;
  end;
end;

procedure TDBMemory.CheckPassword;
var
  count_repeat: Byte;
  Pass: string;
  Key: Longword;
  ch_true, Cancel: Boolean;
  i: Integer;
begin
  if FHeaderInfo.PasswordMask = 0 then Exit;

  Key := 0;
  ch_true := False;
  count_repeat := 0;
  Pass := '';
  Cancel := False;

  i := 0;
  while (i < DBMemSession.Passwords.Count) and not ch_true do
  begin
    Pass := DBMemSession.Passwords.Strings[i];
    Inc(i);
    Key := GenerationKeyMask(Pass, Length(Pass));
    if FHeaderInfo.PasswordMask = Key then ch_true := True;
  end;

  while (count_repeat < 6) and not ch_true do
  begin
    if FHeaderInfo.PasswordMask <> Key then
    begin
      PasswordDialog(Pass, Cancel);
      if Assigned(FOnPassword) then FOnPassword(Pass, Cancel);

      if Cancel then
        Break
      else
        Key := GenerationKeyMask(Pass, Length(Pass))
    end
    else begin
      ch_true := True;
      DBMemSession.AddPassword(Pass);
    end;

    Inc(count_repeat);
  end;
  
  if Cancel then
    raise ECancelPassword.Create('')
  else begin
    if not ch_true then
      raise EInvalidPassword.Create(c_invalid_password)
    else
      FPasswordMask := Key;
  end;
end;

end.

