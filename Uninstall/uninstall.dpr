program Uninstall;

uses
  Forms,
  Controls,
  ShellApi,
  DlgMess,
  Windows,
  ConstMessage in 'ConstMessage.pas',
  DeleteFiles in 'DeleteFiles.pas',
  SecurityPrograms in '..\Extra Units\SecurityPrograms.pas',
  UninsProgram in 'UninsProgram.pas' {DlgUnInst},
  DlgDiskDrive in '..\Found ProjectFile\DlgDiskDrive.pas' {DlgDrive};

{$R *.RES}

begin
	chOKUninstall := False;
	If MessageDlg1(C_Mess_Run, mtConfirmation,
  	[mbYes, mbNo], 0) = mrYes Then Begin

  	Application.Initialize;
    Application.Title := 'Деинсталация на програмата';
  	DlgDrive := TDlgDrive.Create(Application);
  	InstallDrv := 'A';
  	If DlgDrive.Execute(InstallDrv) Then Begin
    	DlgUnInst := TDlgUnInst.Create(Application);
      DlgUnInst.ShowModal;
		End;
	End;
  If chOKUninstall Then
	  ShellExecute(0, 'open', PChar(InstallDrv+':\_unindel.exe'),
    		PChar(ParamStr(0)), nil, SW_SHOW);
end.
