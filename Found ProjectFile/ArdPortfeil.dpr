program ArdPortfeil;

uses
  Forms,
  Windows,
  Controls,
  Classes,
  Invest in 'INVEST.PAS' {DlgInvest},
  Portfeil in 'PORTFEIL.PAS' {DlgPortfeil},
  Spisuk in 'SPISUK.PAS' {DlgSpisuk},
  Dohod in 'DOHOD.PAS' {DlgDohod},
  Prihdoh in 'PRIHDOH.PAS' {DlgPrihDohod},
  Prodagbi in 'PRODAGBI.PAS' {DlgProdagbi},
  Prihprod in 'PRIHPROD.PAS' {DlgPrihProd},
  Logo in 'LOGO.PAS' {DlgLogo},
  Upravlen in 'UPRAVLEN.PAS' {DlgUpravlenie},
  Prgabout in 'PRGABOUT.PAS' {DlgAbout},
  Statisti in 'STATISTI.PAS' {DlgCenaStatistica},
  Delpceni in 'DELPCENI.PAS' {DlgDelPazarCena},
  SpisChan in 'SPISCHAN.PAS' {DlgNewChange},
  Kartotek in 'KARTOTEK.PAS' {DlgKartoteka},
  Blihva in 'BLIHVA.PAS' {DlgBankLihva},
  Statinde in 'STATINDE.PAS' {DlgBorsovIndex},
  Prtportf in 'PRTPORTF.PAS' {DlgPrintPortfeil},
  Prtspis in 'PRTSPIS.PAS' {DlgPrintSpisuk},
  Prtprod in 'PRTPROD.PAS' {DlgPrintProdagbi},
  Prtdohod in 'PRTDOHOD.PAS' {DlgPrintDohod},
  Prtkarto in 'PRTKARTO.PAS' {DlgPrintKartoteka},
  NewInv in 'Newinv.pas' {DlgNewInv},
  Password in 'Password.pas' {DlgPass},
  Passchg in 'Passchg.pas' {DlgChangePass},
  Arhiv in 'Arhiv.pas' {DlgArhiv},
  ArhivPr in 'Arhivpr.pas' {DlgArhivProgres},
  DataAccessLock in 'DataAccessLock.pas' {DataLock: TDataModule},
  RegisterProgram in 'RegisterProgram.pas' {DlgRegProgram},
  DlgDiskDrive in 'DlgDiskDrive.pas' {DlgDrive},
  MyConst in 'Myconst.pas',
  ConstMessage in 'ConstMessage.pas',
  WinRegistrySecurity in '..\Extra Units\WinRegistrySecurity.pas',
  CodePassword in '..\Extra Units\CodePassword.pas',
  CreatTbl in '..\Extra Units\Creattbl.pas',
  DBAddition in '..\Extra Units\DBAddition.pas',
  DBCurrCeni in '..\Extra Units\DBCurrCeni.pas',
  DBCustomPortfeil in '..\Extra Units\DBCustomPortfeil.pas',
  DBPortfeil in '..\Extra Units\DBPortfeil.pas',
  FileSystemSecurity in '..\Extra Units\FileSystemSecurity.pas',
  GenSerialNumber in '..\Extra Units\GenSerialNumber.pas',
  LocalSystemInfo in '..\Extra Units\LocalSystemInfo.pas',
  SetupReg in '..\Extra Units\Setupreg.pas',
  Calculat in '..\Extra Units\Calculat.pas',
  SecurityPrograms in '..\Extra Units\SecurityPrograms.pas',
  IPCMemThrd in '..\Extra Units\IPCMemThrd.pas';

{$R *.RES}

Procedure RunProgram;
Begin
 	Try
  	Screen.Cursor := crHourGlass;

{$IFNDEF PRG_DESIGN}    
  	DlgLogo := TDlgLogo.Create(Application);

  	If '/ns' <> ParamStr(1) Then Begin
	  	DlgLogo.FormStyle := fsStayOnTop;
		  DlgLogo.Show;
 			DlgLogo.Update;
		End;
{$ENDIF PRG_DESIGN}

	  Application.CreateForm(TDlgInvest, DlgInvest);
    Application.CreateForm(TDlgPass, DlgPass);
    Application.CreateForm(TDlgPortfeil, DlgPortfeil);
    Application.CreateForm(TDataLock, DataLock);
    Application.CreateForm(TDlgRegProgram, DlgRegProgram);
    Application.CreateForm(TDlgDrive, DlgDrive);
  Finally
  	Screen.Cursor := crDefault;
{$IFNDEF PRG_DESIGN}
		DlgLogo.Close;
{$ENDIF PRG_DESIGN}
    
  	//Проверява дали трябва да Стартира програмата
  	//стартира я когато датата е по голяма от датата на инвестицйте
  	If not DlgInvest.ActiveTimer Then Application.Run;
 	End;
End;

procedure CheckPreviousInstance;
var
  H: THandle;
begin
  if IsMonitorRunning(H) then
  begin
    if IsIconic(H) then
      ShowWindow(H, SW_RESTORE);
    SetForegroundWindow(H);
    Halt(0);
  end;
end;

Begin
  CheckPreviousInstance;
	Application.Title := 'Ариадна Портфейл';
  RunProgram;
end.
