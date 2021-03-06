unit Arhiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  GoldZip, StdCtrls, Gauges, ComCtrls, Menus, ExtCtrls, FileCtrl;

type
  TDlgArhiv = class(TForm)
    GoldZip1: TGoldZip;
    BtnCreateArchiv: TButton;
    BtnOpenArchiv: TButton;
    OpenArhiv: TOpenDialog;
    SaveArhiv: TSaveDialog;
    MainMenu1: TMainMenu;
    MnuClose: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    BtnExit: TButton;
    Bevel1: TBevel;
    Image1: TImage;
    Bevel2: TBevel;
    procedure BtnCreateArchivClick(Sender: TObject);
    procedure BtnOpenArchivClick(Sender: TObject);
    procedure GoldZip1StatusAdd(Sender: TObject; Path: String;
      Progress: Integer);
    procedure FormCreate(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FDBPath: String;
    Procedure DeleteFiles(Path: String);
    Procedure MoveFiles(Path: String);
  public
		Procedure Execute(Path: String);
  end;

var
  DlgArhiv: TDlgArhiv;

implementation

{$R *.DFM}

Uses DlgMess, ArhivPr, SetupReg, MyConst, Upravlen, Portfeil, NewInv,
	DataAccessLock, ConstMessage;

procedure TDlgArhiv.Execute(Path: String);
begin
  FDBPath := Path;
	ShowModal;
end;

procedure TDlgArhiv.BtnCreateArchivClick(Sender: TObject);
begin
	If SaveArhiv.Execute Then Begin
  	If FileExists(SaveArhiv.FileName) Then
	  	If MessageDlg1(C_Mess_OverrideFile,	mtConfirmation,
      															[mbYES, mbNO], 0) = mrNo Then Exit;
  	GoldZip1.ZipFile := SaveArhiv.FileName;
    GoldZip1.FilesToProcess(FDBPath+'*.DB');
    GoldZip1.FilesToProcess(FDBPath+'*.MB');
    G_V_SavePath := ExtractFileDir(SaveArhiv.FileName);
    Try
    	DataLock.CloseAll;
  		DlgArhivProgres.Show;
    	GoldZip1.Add;
    Finally
    	DlgArhivProgres.Close;
      Update;
      DataLock.OpenAll;
    End;
    MessageDlg1(C_Mess_ReadyOK, mtInformation, [mbOK], 0);
	End;
end;

procedure TDlgArhiv.BtnOpenArchivClick(Sender: TObject);
Var
	Path: String;
  A: Array[0..255] Of Char;
begin
	If OpenArhiv.Execute Then
  	If MessageDlg1(C_Mess_ArchiveOpen,
    	mtConfirmation, [mbYES, mbNO], 0) = mrYES Then Begin

      If GetWindowsDirectory(A, MAX_PATH) = 0 Then Exit;
      Path := StrPas(A) + '\TEMP';
      If Not DirectoryExists(Path) Then ForceDirectories(Path);
      Path := Path + '\';
      
      G_V_SavePath := ExtractFileDir(OpenArhiv.FileName);
      Try
      	Try
        	DataLock.CloseAll;
      		DlgArhivProgres.Show;
		  		GoldZip1.PathToExpand := Path;
  				GoldZip1.ZipFile := OpenArhiv.FileName;
					GoldZip1.Expand;
        Finally
        	DlgArhivProgres.Close;
        End;
        AppliCation.ProcessMessages;         
        DeleteFiles(FDBPath);
        MoveFiles(Path);

				If Assigned(DlgNewInv) Then DlgNewInv.AddDrugestva := True;
        If Assigned(DlgUpravlenie) Then DlgUpravlenie.OpenArhiv := True;
        DlgPortfeil.RecalcPortfeil;

        MessageDlg1(C_Mess_ReadyOK, mtInformation, [mbOK], 0);
      Finally
      	DataLock.OpenAll;
        DeleteFiles(Path);
      End;

	  End;//If MessageDlg1('Информацията....
end;

procedure TDlgArhiv.GoldZip1StatusAdd(Sender: TObject; Path: String;
  Progress: Integer);
begin
	DlgArhivProgres.LblFileName.Caption := Path;
	DlgArhivProgres.GProgress.Progress := Progress;
end;

procedure TDlgArhiv.DeleteFiles(Path: String);
Var
	i: Integer;
  Search: TSearchRec;
  ListFile: TStringList;
begin
  I := FindFirst(Path+'*.DB', faAnyFile, Search);
  ListFile := TStringList.Create;
  Try
  	While i = 0 Do Begin
      ListFile.Add(Path + Search.Name);
    	i := FindNext(Search);
    End;
   	For i := 0 To ListFile.Count - 1 Do
    	DeleteFile(PChar(ListFile.Strings[i]));
  Finally
  	ListFile.Free;
  	FindClose(Search)
  End;
  I := FindFirst(Path+'*.MB', faAnyFile, Search);
  Try
  	If i = 0 Then	DeleteFile(PChar(Path+Search.Name));
  Finally
  	FindClose(Search)
  End;
end;

procedure TDlgArhiv.MoveFiles(Path: String);
Var
	i: Integer;
  Search: TSearchRec;
  ListFile: TStringList;
begin
  I := FindFirst(Path+'*.DB', faAnyFile, Search);
  ListFile := TStringList.Create;
  Try
  	While i = 0 Do Begin
      ListFile.Add(Path + Search.Name);
    	i := FindNext(Search);
    End;
   	For i := 0 To ListFile.Count - 1 Do
    	MoveFile(
      	PChar(ListFile.Strings[i]),
      	PChar(FDBPath + ExtractFileName(ListFile.Strings[i]))
        );
  Finally
  	ListFile.Free;
  	FindClose(Search)
  End;
  I := FindFirst(Path+'*.MB', faAnyFile, Search);
  Try
  	If i = 0 Then
    	MoveFile( PChar(Path+Search.Name), PChar(FDBPath+Search.Name)  );
  Finally
  	FindClose(Search)
  End;
end;

procedure TDlgArhiv.FormCreate(Sender: TObject);
begin
  If Not Assigned(DlgArhivProgres) Then
  	Application.CreateForm(TDlgArhivProgres, DlgArhivProgres);
    
	ProgOptions.OpenPathArhive;
{$I-}
	If G_V_SavePath <> '' Then ChDir(G_V_SavePath);
{$I+}
end;

procedure TDlgArhiv.N5Click(Sender: TObject);
begin
	Close;
end;

procedure TDlgArhiv.FormDestroy(Sender: TObject);
begin
	ProgOptions.SavePathArhive;
end;

end.
