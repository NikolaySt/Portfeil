unit UninsProgram;

interface

uses
  Windows, SysUtils, Graphics, Classes, Controls, Forms, Dialogs, DBTables,
  StdCtrls, FileCtrl, ExtCtrls, ComCtrls, Registry, SecurityPrograms;

type
  TDlgUnInst = class(TForm)
    ProgressBar: TProgressBar;
    Label1: TLabel;
    BtnOK: TButton;
    Panel1: TPanel;
    Image1: TImage;
    LblFinall: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Check1: TImage;
    Check2: TImage;
    Check3: TImage;
    Check4: TImage;
    Check5: TImage;
    Check6: TImage;
    Bevel1: TBevel;
    procedure BtnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FReg: TRegistry;
    FPath: String;
    FResultToInfo: String;
    SecProgram: TSecurityProgram;
    Procedure DeleteRigister;
    Procedure RemoveProgram;
    Procedure RemoveDBAlias;
    Function Slow: Integer;
  public
    { Public declarations }
  end;

var
  DlgUnInst: TDlgUnInst;
  InstallDrv: Char;
  chOKUninstall: Boolean;

implementation

{$R *.DFM}

Uses DeleteFiles, DlgMess, ConstMessage, MyConst, CodePassword;

Const
	cLocalRootKey = HKEY_LOCAL_MACHINE;
  cClassRootKey = HKEY_CLASSES_ROOT;
	cUnArhivFile1 = '.acp';
  cUnArhivFile2 = 'Portfeil.Arhiv';
  cUnInstKey    =
  	'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Ariadna Portfeil 1.0';
  C_Path = 'ProgramPath';

Procedure TDlgUnInst.DeleteRigister;
Var
	Str: String;
Begin
	Try
    Str := C_Procduct;
		While Str <> '' Do
 	 		If FReg.DeleteKey(Str) Then Begin

		    Str := BackPath(Str);
        If FReg.OpenKey(Str, False) Then Begin
      		Try
				  	If FReg.HasSubKeys Then Str := '';
					Finally
          	FReg.CloseKey;
          End;
				End
        Else Str := '';

    	End
      Else Str := '';
    With FReg Do Begin
	  	RootKey := cLocalRootKey;
  	  DeleteKey(cUnInstKey);

  		RootKey := cClassRootKey;
			DeleteKey(cUnArhivFile1);
  		DeleteKey(cUnArhivFile2);
  	End;
	Except
  End;      
End;


procedure TDlgUnInst.BtnOKClick(Sender: TObject);
begin
	Close;
end;

procedure TDlgUnInst.FormCreate(Sender: TObject);
begin
	SecProgram := TSecurityProgram.Create;

	ProgressBar.Position := 0;
  
	FReg := TRegistry.Create;
  FReg.RootKey := C_khRoot;

	If FReg.KeyExists(C_Procduct) Then Begin
  	FReg.OpenKey(C_Procduct, False);
	  Try
  		FPath := FReg.ReadString(C_Path);
  	Finally
    	FReg.CloseKey;
    End;
	End;
  
end;

procedure TDlgUnInst.FormDestroy(Sender: TObject);
begin
	FReg.Free;
  SecProgram.Free;
end;

procedure TDlgUnInst.RemoveDBAlias;
begin
	Try
		If Session.IsAlias(cDBAliasName) Then Begin
  		Session.DeleteAlias(cDBAliasName);
    	Session.SaveConfigFile;
	  End;
  Except
  End;
end;


procedure TDlgUnInst.RemoveProgram;
Var
	WinDir, TmpPath: String;
  A: Array[0..255] Of Char;
	Serial: String;
  MResult: TModalResult;

Label TryAgeanRegister;
  
begin
	FResultToInfo := '';
  Self.Update;
	With SecProgram Do begin
		Path := FPath+'\Ard';
    FileName := cFileLIb;
    IsRegisterFile(cSerialPos, cHDDRegister);
    If Result = C_NotError Then Begin
    	GetSerialNumber(cSerialPos);
	    If Result = C_NotError Then Begin

      	Serial := Password;
        DiskDrive := InstallDrv;
	    	Path := InstallDrv +':';
        FileName := cSetupFile;
        
TryAgeanRegister:

        CompareOriginalFloppy(cSerialPos, cInfoPos);
        If Result = C_NotError Then Begin

        	IsRegisterFile(cSerialPos, cFloppyRegister);
          If Result = C_NotError Then Begin
          	MResult := mrOK;
          	Repeat
          		RemoveProtectionToFloppyDisk(cSerialPos, cNoRegister);
              If Result <> C_NotError Then Begin
	              MResult := MessageDlg1(C_Mess_ReadOnlyDisk,
                	mtWarning, [mbOK, mbAbort], 0);
                Self.Update;
              End;
            Until (Result = C_NotError)Or(MResult <> mrOK);
            If (Result <> C_NotError)And(MResult = mrAbort) Then Begin
            	FResultToInfo := C_Mess_NoFinall;
            	Exit;
            End;
          End;

        End
        Else Begin
					If Result = C_Error_NotReadFile Then
            MResult :=
            	MessageDlg1(C_Mess_ReadOnlyDisk,	mtWarning, [mbOK, mbAbort], 0)
          Else
          	MResult :=
            	MessageDlg1(C_Mess_NoLicenseDisk, mtWarning, [mbOK, mbAbort], 0);
              
          Case MResult Of
          	mrAbort: Begin
            					Exit;
                      FResultToInfo := C_Mess_NoFinall;
            				End;
            mrOK: Goto TryAgeanRegister;
          End;
          Self.Update;          
        End;

      End
      Else Begin
        Exit;
        FResultToInfo := C_Mess_NoFinall;
      End;
		End;
  	Path := FPath+'\Ard';
  	FileName := cFileLIb;
  	RemoveProtectionToHDDDisk(cSerialPos);     
	End; //With SecProgram

	Slow;

	DeletePathFiles(FPath, '*.*');
	DeletePathFiles(FPath+'\Ard', '*.*');
  RemoveDir(FPath+'\Ard');
  ProgressBar.Position := 15;
  Check1.Visible := True;
	Slow;

	DeletePathFiles(FPath+'\DataBase', '*.*');
  RemoveDir(FPath+'\DataBase');
  ProgressBar.Position := ProgressBar.Position + 15;
  Check2.Visible := True;
	Slow;

  DeleteFile(FPath+'\Portfeil\empty portfeil.acp');
  DeleteFile(FPath+'\Portfeil\simul portfeil.acp');
  RemoveDir(FPath+'\Portfeil');
  ProgressBar.Position := ProgressBar.Position + 15;
  Check3.Visible := True;
	Slow;

	DeletePathFiles(FPath+'\Help', '*.*');
  RemoveDir(FPath+'\Help');
  ProgressBar.Position := ProgressBar.Position + 15;
	Check4.Visible := True;  
  Slow;

  GetWindowsDirectory(A, MAX_PATH);
  WinDir := StrPas(A);
  DeleteFile(PChar(WinDir+'\DESKTOP\Ariadna Portfeil 1.0.LNK'));

  DeletePathFiles(WinDir+'\Start Menu\Programs\Ariadna Portfeil 1.0', '*.*');
  RemoveDir(WinDir+'\Start Menu\Programs\Ariadna Portfeil 1.0');
  ProgressBar.Position := ProgressBar.Position + 15;
  Check5.Visible := True;
	Slow;

  RemoveDBAlias;  
  DeleteRigister;
  TmpPath := FPath;
	While TmpPath <> '' Do Begin
  	If RemoveDir(TmpPath) Then TmpPath := BackPath(TmpPath)
		Else TmpPath := '';
	End;
  ProgressBar.Position := ProgressBar.Position + 25;
	Check6.Visible := True;  
  Slow;                 
  chOKUninstall := True;
  FResultToInfo := C_Mess_Finall;
end;

Function TDlgUnInst.Slow: Integer;
Var
	i, n, S: Integer;
begin
	S := 0;
	For i := 0 To 150 Do
  	For n := 0 To 32000 Do Inc(s);
  Application.ProcessMessages;
  Result := S
end;

procedure TDlgUnInst.FormActivate(Sender: TObject);
begin
	Try
  	Try

			If FPath <> '' Then RemoveProgram
      Else FResultToInfo := C_Mess_NotInstallProgram;

      LblFinall.Caption := FResultToInfo;
    Finally
		  BtnOK.Enabled := True;  
    End;
  Except
  	LblFinall.Caption := C_Mess_NoFinall;
  	Raise;
  End;
end;

procedure TDlgUnInst.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
end;

end.
