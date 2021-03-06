unit InstallGenSerial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, FileCtrl, BevelNew, RestructTable,
  GoldZip, Db, DBTables;

type
  TDlgGenNum = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    ListBox1: TListBox;
    Edit1: TEdit;
    EdtDir: TEdit;
    BevelNew1: TBevelNew;
    Button3: TButton;
    GroupBox2: TGroupBox;
    Button2: TButton;
    TblPortfeil: TTable;
    GoldZip1: TGoldZip;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    NextProg: Integer;
    DbPassword: String;
		Procedure SetDateToFile(AFileName: String);
    Procedure SaveInfo;
    Procedure DbCopyNew(Dir: String);
    Procedure RestructDb(Dir: String);
    Procedure ArhiveDB(Dir: String; FileName: String);
    Function CreateDBPassword(Number: String): String;
  public
  end;

Var
	DlgGenNum: TDlgGenNum;  

implementation

{$R *.DFM}

Uses GenSerialNumber, CodePassword, LocalSystemInfo;

Const
 	cSerialPos   = $E5D0 + 1;
  cInfoPos     = cSerialPos + 36;

  cFileLIb     = 'ardsinfo.dll';
  cSetupFile   = '_install.dll';
  cResFile     = 'infodata.res';
  cDelunIns    = '_unindel.exe';

  C_FileIndex       = 'BIndex.DB';
  C_FileLihva       = 'BLihva.DB';
  C_FileDataUpra    = 'DataUpra.DB';
  C_FilePazrCena    = 'PazrCena.DB';
  C_FilePortData    = 'PortData.DB';
  C_FilePortDataMB  = 'PortData.MB';
  
  IntSystemTime: TSYSTEMTIME =
  	(
    wYear: 1999;
    wMonth: 04;
    wDayOfWeek: 4;
    wDay: 08;
    wHour: 01;
    wMinute: 01;
    wSecond: 01;
    wMilliseconds: 01;
    );

Function GetFloppyInfo(FloppyDisk: Char): String;
Var
	Info: TDiskInfo;
  Str: String;
Begin
  GetDiskInfo(Info, FloppyDisk);
  Try
  	Str := IntToHex(HiWord(Info.HDDNumber), 4)+'-'+IntToHex(LoWord(Info.HDDNumber), 4);
  	Str := Str+','+IntToStr(Info.HDDSize);
  	Result := Str;
	Except
  	Result := '';
  End;
End;

Function GetCreateDate(FileName: String): String;
Var
	FH: THandle;
  Tf: OFSTRUCT;
  CreationTime: TFILETIME;
  LastAccessTime: TFILETIME;
  LastWriteTime: TFILETIME;

  SystemTime: TSYSTEMTIME ;
Begin
	FH := OpenFile(PChar(FileName), Tf, OF_READ);
	If FH <> 0 Then
  	Try
    	If GetFileTime(FH, @CreationTime,
      		@LastAccessTime,	@LastWriteTime) Then Begin

   			FileTimeToSystemTime(CreationTime, SystemTime);

    		Result :=
        	IntToStr(SystemTime.wDay)+'/'+
      		IntToStr(SystemTime.wMonth)+'/'+
       		IntToStr(SystemTime.wYear);
    	End
      Else Result := ''
    Finally
      _lclose(FH);
    End
    
	Else Result := ''
End;

procedure TDlgGenNum.SetDateToFile(AFileName: String);
Var
	FH: THandle;
	Tf: OFSTRUCT;

	FileTime: TFILETIME;
begin
  FH := OpenFile( PChar(AFileName), Tf, OF_READWRITE );
	If FH <> 0 Then Begin
  	If SystemTimeToFileTime(IntSystemTime, FileTime) Then
		    SetFileTime(FH, @FileTime, @FileTime, @FileTime);

    _lclose(FH);
	End;
end;

Procedure TDlgGenNum.SaveInfo;
Var
	SecCode: TCustomSaveResource;
  BasePathInfo, Path, Str: String;
  F: TextFile;
  FileData: String; 
begin
	If Edit1.Text <> '' Then Begin
  	SecCode := TCustomSaveResource.Create;
  	Try
			BasePathInfo := 'D:\Installs';

      Inc(NextProg);

      While DirectoryExists(BasePathInfo +'\Prog'+IntToStr(NextProg)) Do
      	Inc(NextProg);

      Path := BasePathInfo +'\Prog'+IntToStr(NextProg);

      ForceDirectories(Path);

      CopyFile(PChar(BasePathInfo+'\'+cFileLIb), PChar(Path+'\'+cFileLIb), False);
      CopyFile(PChar(BasePathInfo+'\'+cResFile), PChar(Path+'\'+cResFile), False);

    	SecCode.FileName :=	cFileLIb;
      SecCode.Path := Path;
      SecCode.Password := Edit1.Text;
      SecCode.EncodePassword;
      SecCode.SaveToFile(cSerialPos);

      SecCode.Filename := cResFile;
     	SecCode.Password := Edit1.Text;
      SecCode.EncodePassword;
      SecCode.SaveToFile($58 + 1);

      CopyFile(PChar(Path+'\'+cFileLIb), PChar(Path+'\'+cSetupFile), False);
      Str := GetFloppyInfo('A');
    	SecCode.Filename := cSetupFile;
      SecCode.Path := Path;
      SecCode.Password := Str;
      SecCode.EncodePassword;
			SecCode.SaveToFile(cInfoPos);
      
      CopyFile(PChar(BasePathInfo+'\'+cDelunIns), PChar('A:\'+cDelunIns), False);
      CopyFile(PChar(Path+'\'+cSetupFile), PChar('A:\'+cSetupFile), False);

      SetDateToFile('A:\'+cSetupFile);

      FileData :=
      	IntToStr(IntSystemTime.wDay)+'/'+
        IntToStr(IntSystemTime.wMonth)+'/'+
        IntToStr(IntSystemTime.wYear);

      DbPassword := CreateDBPassword(Edit1.Text);

      AssignFile(F, Path+'\Serial'+IntToStr(NextProg)+'.txt');
      ReWrite(F);
      Try
				WriteLn(F, Edit1.Text);
        WriteLn(F, 'Disk1 info - '+Str);
        WriteLn(F, 'DBPassword = '+DbPassword);
        WriteLn(F, cSetupFile+' - CreateDate = '+FileData);
      Finally
      	CloseFile(F);
      End;
    Finally
    	SecCode.Free;
  	End;
  End;
end;

procedure TDlgGenNum.DbCopyNew(Dir: String);
Var
  FileName: String;
  BasePathDB: String;
  CopyPathDb: String;
begin
  BasePathDB := 'E:\Installs\'+Dir;
  CopyPathDb := 'E:\Installs\Prog'+IntToStr(NextProg)+'\'+Dir;

	ForceDirectories(CopyPathDb);

  With TblPortfeil Do Begin
  	DatabaseName := BasePathDB;
    TableName := 'PortData.DB';
    Open;
    Try
	    While Not(Eof) Do Begin
  	  	FileName := FieldByName('Inv_File').AsString+'.DB';
				CopyFile(
      		PChar(BasePathDB+'\'+FileName),
      		PChar(CopyPathDb+'\'+FileName), False);
	    	Next;
  	  End;
    Finally
			Close;
    End;
  End;//With TblPortfeil
	CopyFile(
    PChar(BasePathDB+'\'+C_FileIndex),
    PChar(CopyPathDb+'\'+C_FileIndex), False);
	CopyFile(
    PChar(BasePathDB+'\'+C_FileLihva),
    PChar(CopyPathDb+'\'+C_FileLihva), False);
	CopyFile(
    PChar(BasePathDB+'\'+C_FileDataUpra),
    PChar(CopyPathDb+'\'+C_FileDataUpra), False);
	CopyFile(
    PChar(BasePathDB+'\'+C_FilePazrCena),
    PChar(CopyPathDb+'\'+C_FilePazrCena), False);
	CopyFile(
    PChar(BasePathDB+'\'+C_FilePortData),
    PChar(CopyPathDb+'\'+C_FilePortData), False);
	CopyFile(
    PChar(BasePathDB+'\'+C_FilePortDataMB),
    PChar(CopyPathDb+'\'+C_FilePortDataMB), False);
end;

Procedure TDlgGenNum.RestructDb(Dir: String);
Var
  PathDB: String;
  Tbl: TTable;
begin
  PathDb :=  'E:\Installs\Prog'+IntToStr(NextProg)+'\'+Dir;
  RestrDB.Password := DbPassword;
  Tbl := TTable.Create(Self);
  Tbl.DataBaseName := PathDb;
  Try
    With TblPortfeil Do Begin
    	DatabaseName := PathDb;
      TableName := 'PortData.DB';
      Open;
      Try
		    While Not(Eof) Do Begin
    	  	Tbl.TableName := FieldByName('Inv_File').AsString+'.DB';
          RestrDB.RestructTable(Tbl);
		    	Next;
    	  End;
      Finally
				Close;
      End;
    End;//With TblPortfeil
    Tbl.TableName := C_FileIndex;    RestrDB.RestructTable(Tbl);
    Tbl.TableName := C_FileLihva;    RestrDB.RestructTable(Tbl);
    Tbl.TableName := C_FileDataUpra; RestrDB.RestructTable(Tbl);
    Tbl.TableName := C_FilePazrCena; RestrDB.RestructTable(Tbl);
    Tbl.TableName := C_FilePortData; RestrDB.RestructTable(Tbl);
	Finally
  	Tbl.Free;
  End;
End;

procedure TDlgGenNum.Button1Click(Sender: TObject);
Var
	NewGen: TGenSerialNumber;
begin
	GenerateSerialNumber(Date, 'AP1',	701, NewGen);
  ListBox1.Items.Add(NewGen.FullNumber);
  ListBox1.ItemIndex := ListBox1.Items.Count - 1;
  Edit1.Text := NewGen.FullNumber;
end;

procedure TDlgGenNum.FormCreate(Sender: TObject);
begin
	NextProg := 0;
  //Session.AddPassword('nick');
  RestrDB := TRestructDataBase.Create;
end;

procedure TDlgGenNum.Button2Click(Sender: TObject);
begin
	SaveInfo;
  DbCopyNew('ZEmpty');
  DbCopyNew('ZSimul');

  RestructDb('ZEmpty');
  RestructDb('ZSimul');

  ArhiveDB('ZEmpty','empty portfeil.acp');
  ArhiveDB('ZSimul','simul portfeil.acp');
  
  MessageDlg('Готово.', mtInformation, [mbOK], 0);
end;

procedure TDlgGenNum.Button3Click(Sender: TObject);
var
  Dir: string;
begin
  Dir := EdtDir.Text;
  if SelectDirectory('Select',WideString(PChar(Dir)), Dir) then
    EdtDir.Text := Dir;

end;

procedure TDlgGenNum.FormDestroy(Sender: TObject);
begin
	RestrDB.Free;
end;

Function TDlgGenNum.CreateDBPassword(Number: String): String;
Var
	Str1, Str2, Str3: String;
begin
  Result := Number;

  Delete(Result, 1, Pos('-', Result));
  Delete(Result, 1, Pos('-', Result));
  Result := Copy(Result, 1, Pos('-', Result) - 1);

  Str1 := Copy(Result, 1, 2);
  Str2 := Copy(Result, 3, 2);
  Str3 := Copy(Result, 5, 2);
  Result := Str2+Str3+Str1+'AP1';
end;

procedure TDlgGenNum.ArhiveDB(Dir: String; FileName: String);
Var
	PathDB, Tmp: String;
Begin
	PathDb :=  'E:\Installs\Prog'+IntToStr(NextProg)+'\'+Dir;
  Tmp := 'E:\Installs\Prog'+IntToStr(NextProg);
	ForceDirectories(Tmp);

  GoldZip1.ZipFile := Tmp+'\'+FileName;
  GoldZip1.FilesToProcess(PathDb+'\*.DB');
  GoldZip1.FilesToProcess(PathDb+'\*.MB');
 	GoldZip1.Add;
end;

end.


