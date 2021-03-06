unit Invest;

interface
      
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Menus, ExtCtrls, DB, DBTables, ComCtrls, DBiProcs, DBiTypes,
  StdCtrls, Buttons, Dialogs, FileCtrl, IPCMemThrd;

type
  TDlgInvest = class(TForm)
    DBaseInv: TDatabase;
    MainMenu1: TMainMenu;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N24: TMenuItem;
    N26: TMenuItem;
    N25: TMenuItem;
    N27: TMenuItem;
    N8: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N7: TMenuItem;
    N4: TMenuItem;
    N3: TMenuItem;
    StatusBar1: TStatusBar;
    Notebook1: TNotebook;
    BtnNewInv: TSpeedButton;
    BtnSpisuk: TSpeedButton;
    BtnProdagbi: TSpeedButton;
    BtnDohod: TSpeedButton;
    BtnPortfeil: TSpeedButton;
    BtnUpravlenie: TSpeedButton;
    BtnKartoteka: TSpeedButton;
    BtnArhiv: TSpeedButton;
    BtnExit: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    TimerOut: TTimer;
    N9: TMenuItem;
    PrtSetup: TPrinterSetupDialog;
    procedure BtnPortfeilClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnNewInvClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSpisukClick(Sender: TObject);
    procedure BtnDohodClick(Sender: TObject);
    procedure BtnProdagbiClick(Sender: TObject);
    procedure BtnUpravlenieClick(Sender: TObject);
    procedure BtnKartotekaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure BtnArhivClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure TimerOutTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
  	FDBPath: String;
    FActiveTimer: Boolean;
    FRootProgram: TIPCRootProgram;
    Procedure OnExceptions(Sender: TObject; E: Exception);
    procedure ShowHint(Sender: TObject);
		Procedure WMSETCURSOR(Var Msg: TWMSETCURSOR); Message WM_SETCURSOR;
    procedure SetActiveTimer(const Value: Boolean);
    procedure DataBaseAlias;
	public
  	Property DBPath: String Read FDBPath Write FDBPath;
    Property ActiveTimer: Boolean Read FActiveTimer Write SetActiveTimer; 
  end;

var
  DlgInvest: TDlgInvest;

implementation

Uses Spisuk, Prodagbi, Dohod ,Portfeil, Upravlen, Kartotek,
	PrgAbout, SetupReg, Calculat, CreatTbl, PassChg, DlgMess, Arhiv, MyConst,
  NewInv, Password, RegisterProgram, ReadWriteResource, ConstMessage, ClipBrd;

{$R *.DFM}
{$R OtherIco.RES}
{$R Infodata.Res}

Procedure TDlgInvest.WMSETCURSOR(Var Msg: TWMSETCURSOR);
Begin
	Inherited;
	If Msg.MouseMsg = WM_LBUTTONDOWN Then Begin
  	If Assigned(DlgSpisuk) Then Begin
		 	If DlgSpisuk.Visible And(DlgSpisuk.WindowState = wsMinimized) Then Begin
  	  	DlgSpisuk.WindowState := wsNormal;
        Exit;
      End;
    End;

    If Assigned(DlgProdagbi) Then Begin
    	If DlgProdagbi.Visible And(DlgProdagbi.WindowState = wsMinimized) Then Begin
    		DlgProdagbi.WindowState := wsNormal;
        Exit;
      End;
    End;

    If Assigned(DlgDohod) Then Begin
	    If DlgDohod.Visible And(DlgDohod.WindowState = wsMinimized) Then Begin
  	  	DlgDohod.WindowState := wsNormal;
        Exit;
      End;
    End;

    If Assigned(DlgPortfeil) Then Begin
    	If DlgPortfeil.Visible And(DlgPortfeil.WindowState = wsMinimized) Then Begin
    		DlgPortfeil.WindowState := wsNormal;
        Exit;
      End;
    End;

    If Assigned(DlgUpravlenie) Then Begin
    	If DlgUpravlenie.Visible And(DlgUpravlenie.WindowState = wsMinimized) Then Begin
    		DlgUpravlenie.WindowState := wsNormal;
        Exit;
      End;
    End;

    If Assigned(DlgKartoteka) Then Begin
    	If DlgKartoteka.Visible And(DlgKartoteka.WindowState = wsMinimized) Then Begin
    		DlgKartoteka.WindowState := wsNormal;
        Exit;
      End;
    End;

    If Assigned(DlgArhiv) Then Begin
    	If DlgArhiv.Visible And(DlgArhiv.WindowState = wsMinimized) Then Begin
    		DlgArhiv.WindowState := wsNormal;
        Exit;
      End;
    End;

	End;
End;

procedure TDlgInvest.ShowHint(Sender: TObject);
Begin
	StatusBar1.SimpleText := Application.Hint;
End;

Procedure TDlgInvest.OnExceptions(Sender: TObject; E: Exception);
Begin
 	MessageDlg1(E.Message, mtWarning, [mbOk], 0);
End;
	
procedure TDlgInvest.BtnPortfeilClick(Sender: TObject);
begin
	StartWindow := owNone;
	DlgPortfeil.ShowModal;
  DlgInvest.Update;
	Case StartWindow of
  	owKartoteka: BtnKartotekaClick(nil);
    owUpravlenie: BtnUpravlenieClick(nil);
  End;
  StartWindow := owNone;
end;

procedure TDlgInvest.BtnExitClick(Sender: TObject);
begin
  DBaseInv.Connected := False;
  Close;
end;

procedure TDlgInvest.BtnNewInvClick(Sender: TObject);
begin
	If Not Assigned(DlgNewInv) Then Application.CreateForm(TDlgNewInv, DlgNewInv);
	DlgNewInv.ShowModal;
end;

procedure TDlgInvest.FormCreate(Sender: TObject);
Begin
	FRootProgram := TIPCRootProgram.Create(Application.Handle);
  
	FActiveTimer := False;
  ProgOptions.OpenHelpFile;//Инциализира Help на програмата
  DBPassword := ProgOptions.DBPassword;
  Clipboard.SetTextBuf(PChar(DBPassword));

	DatabaseAlias;

	CreateVidList;
  MyCalc := TCustomCalc.CalcCreate;

  Top := -3;
  Left := -3;

  Application.OnException := OnExceptions;
  Application.ShowHint := True;
  Application.OnHint := ShowHint;

  Session.AddPassword(DBPassword);
  DBaseInv.Connected := True;

  CreateDB := TCreateDataBase.Create;
  CreateDB.FindTable;

  ProgOptions.OpenWindowExt(DlgInvest, 'MainForm');
end;

procedure TDlgInvest.BtnSpisukClick(Sender: TObject);
begin
  If Not Assigned(DlgSpisuk) Then	Application.CreateForm(TDlgSpisuk, DlgSpisuk);
	DlgSpisuk.ShowModal;
end;

procedure TDlgInvest.BtnDohodClick(Sender: TObject);
begin
  If Not Assigned(DlgDohod) Then Application.CreateForm(TDlgDohod, DlgDohod);
	DlgDohod.ShowModal;
end;

procedure TDlgInvest.BtnProdagbiClick(Sender: TObject);
begin
	If Not Assigned(DlgProdagbi) Then 
  	Application.CreateForm(TDlgProdagbi, DlgProdagbi);
	DlgProdagbi.ShowModal;
end;

procedure TDlgInvest.BtnUpravlenieClick(Sender: TObject);
begin
	If Not Assigned(DlgUpravlenie) Then
  	Application.CreateForm(TDlgUpravlenie, DlgUpravlenie);
    
	StartWindow := owNone;
	DlgUpravlenie.ShowModal;
  DlgInvest.Update;
	Case StartWindow of
  	owPortfeil: BtnPortfeilClick(nil);
    owKartoteka: BtnKartotekaClick(nil);
  End;
  StartWindow := owNone;
end;

procedure TDlgInvest.BtnKartotekaClick(Sender: TObject);
begin
	If Not Assigned(DlgKartoteka) Then
  	Application.CreateForm(TDlgKartoteka, DlgKartoteka);
    
	StartWindow := owNone;
	DlgKartoteka.ShowModal;
  DlgInvest.Update;
	Case StartWindow of
  	owPortfeil: BtnPortfeilClick(nil);
    owUpravlenie: BtnUpravlenieClick(nil);
  End;
  StartWindow := owNone;
end;

procedure TDlgInvest.FormDestroy(Sender: TObject);
begin
	DestroyVidList;
  MyCalc.Free;
  CreateDB.Free;
  Application.HelpCommand(HELP_QUIT, 0);

  ProgOptions.SaveWindowExt(DlgInvest, 'MainForm');
  
  ProgOptions.Free;
  FRootProgram.Free;
end;

procedure TDlgInvest.N3Click(Sender: TObject);
begin
	If Not Assigned(DlgAbout) Then Application.CreateForm(TDlgAbout, DlgAbout);
	DlgAbout.ShowModal;
end;

procedure TDlgInvest.N7Click(Sender: TObject);
begin
	Application.HelpJump('INFO_PROGRAM');
end;

procedure TDlgInvest.BtnArhivClick(Sender: TObject);
begin
	If Not Assigned(DlgArhiv) Then Application.CreateForm(TDlgArhiv, DlgArhiv);
  If Screen.Height - (Height + Top) < DlgArhiv.Height Then
	  DlgArhiv.Top := Top - DlgArhiv.Height - 2
  Else
	  DlgArhiv.Top := Top + Height + 2;

  If Screen.Width - (Width + Left) < 0 Then
   	DlgArhiv.Left := Screen.Width - DlgArhiv.Width
  Else
   	DlgArhiv.Left := Left + Width - DlgArhiv.Width;
  DlgArhiv.Execute(DBPath);
end;

procedure TDlgInvest.N8Click(Sender: TObject);
begin
	If Not Assigned(DlgChangePass) Then
  	Application.CreateForm(TDlgChangePass, DlgChangePass);
	DlgChangePass.ShowModal;
end;

procedure TDlgInvest.TimerOutTimer(Sender: TObject);
begin
//	Close;
end;

procedure TDlgInvest.FormActivate(Sender: TObject);
begin
	ProgOptions.StartProgram;
end;

procedure TDlgInvest.N9Click(Sender: TObject);
begin
	Try
		PrtSetup.Execute;
	Except
  	MessageDlg1(C_Mess_NotPrinter, mtInformation, [mbOK], 0);
  End;
end;

procedure TDlgInvest.SetActiveTimer(const Value: Boolean);
begin
  FActiveTimer := Value;
  If Value Then TimerOut.Enabled := True;
end;

procedure TDlgInvest.DataBaseAlias;
var
  AParams: TStringList;
  Dir: String;
  Buff: array[0..255] of char;
begin
	If Not Session.IsAlias(cDBAliasName) Then Begin
		DBPath := ProgOptions.BackPath(ExtractFileDir(ParamStr(0)))+'\Database';
  	If Not DirectoryExists(DBPath) Then ForceDirectories(DBPath);
    Session.AddStandardAlias(cDBAliasName, DBPath, 'Paradox');
    Session.SaveConfigFile;
  End
  Else Begin
  	AParams := TStringList.Create;
    Try
	    Session.GetAliasParams(cDBAliasName, AParams);

//:TODO Make ShortPath from Alias      
      GetShortPathName(PChar(Copy(AParams.Strings[0], 6, 255)), Buff, Length(Buff));
  	  Dir := StrPas(Buff);
      
      If Not DirectoryExists(Dir) Then Begin
     		DBPath := ProgOptions.BackPath(ExtractFileDir(ParamStr(0)))+'\Database';
      	ForceDirectories(DBPath);
	      AParams.Clear; AParams.Add('PATH=' + DBPath);
    	  Session.ModifyAlias(cDBAliasName, AParams);
        Session.SaveConfigFile; 
    	End
      Else DBPath := Dir;
    Finally
    	AParams.Free;
    End;
	End;
  DBPath := DBPath + '\';
  DBaseInv.AliasName := cDBAliasName;
end;

procedure TDlgInvest.N2Click(Sender: TObject);
Var
  A: Array[0..255] of Char;
begin
  StrCopy(A, '');
	Application.HelpCommand(HELP_PARTIALKEY, 0);
end;

End.
