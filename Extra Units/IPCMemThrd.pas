unit IPCMemThrd;

interface

uses SysUtils, Classes, Windows;

type
  THandledObject = class(TObject)
  protected
    FHandle: THandle;
  public
    destructor Destroy; override;
    property Handle: THandle read FHandle;
  end;

  TSharedMem = class(THandledObject)
  private
    FName: string;
    FSize: Integer;
    FCreated: Boolean;
    FFileView: Pointer;
  public
    constructor Create(const Name: string; Size: Integer);
    destructor Destroy; override;
    property Name: string read FName;
    property Size: Integer read FSize;
    property Buffer: Pointer read FFileView;
    property Created: Boolean read FCreated;
  end;

const
	ONE_COPY_IN_MEM = 'Ariadna_Portfeil_1_0';

type
	PRootInfo = ^TRootInfo;
  TRootInfo = record
  	ID: Integer;
  end;

  TIPCRootProgram = class
  private
  	FSharedMem: TSharedMem;
    FRootInfo: PRootInfo;
  public
  	constructor Create(ID: Integer); virtual;
    destructor Destroy; override;
  end;

function IsMonitorRunning(var Hndl: THandle): Boolean;

implementation

procedure Error(const Msg: string);
begin
  raise Exception.Create(Msg);
end;

function IsMonitorRunning(var Hndl: THandle): Boolean;
var
  SharedMem: TSharedMem;
begin
  SharedMem := TSharedMem.Create(ONE_COPY_IN_MEM, 4);
  Hndl := PHandle(SharedMem.Buffer)^;
  Result := Hndl <> 0;
  SharedMem.Free;
end;

{ THandledObject }

destructor THandledObject.Destroy;
begin
  if FHandle <> 0 then CloseHandle(FHandle);
  inherited;
end;

{ TSharedMem }

constructor TSharedMem.Create(const Name: string; Size: Integer);
begin
  try
    FName := Name;
    FSize := Size;
    { CreateFileMapping, when called with $FFFFFFFF for the hanlde value,
      creates a region of shared memory }
    FHandle := CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0,
        Size, PChar(Name));
    if FHandle = 0 then Abort;
    FCreated := GetLastError = 0;
    { We still need to map a pointer to the handle of the shared memory region }
    FFileView := MapViewOfFile(FHandle, FILE_MAP_ALL_ACCESS
    	{FILE_MAP_WRITE}, 0, 0, Size);
    if FFileView = nil then abort;
  except
    Error(Format('Error creating shared memory %s (%d)', [Name, GetLastError]));
  end;
end;

destructor TSharedMem.Destroy;
begin
  if FFileView <> nil then
    UnmapViewOfFile(FFileView);
  inherited Destroy;
end;

{ TIPCRootProgram }

constructor TIPCRootProgram.Create(ID: Integer);
begin
	FSharedMem := TSharedMem.Create(ONE_COPY_IN_MEM, SizeOf(TRootInfo));
	FRootInfo := FSharedMem.Buffer;
  FRootInfo.ID := ID;
end;

destructor TIPCRootProgram.Destroy;
begin
	FSharedMem.Free;
  inherited;
end;

end.


