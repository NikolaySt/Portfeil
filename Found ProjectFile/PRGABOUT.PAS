unit PrgAbout;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, BevelNew;

type
  TDlgAbout = class(TForm)
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LblName: TLabel;
    LblFirma: TLabel;
    LblNumber: TLabel;
    Label9: TLabel;
    BtnOK: TButton;
    BevelNew1: TBevelNew;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
		FChMouseDown: Boolean;
  public
    { Public declarations }
  end;

var
  DlgAbout: TDlgAbout;

implementation

Uses MyConst, SetupReg;

{$R *.DFM}

procedure TDlgAbout.FormShow(Sender: TObject);
Var
	S1, S2: String;
begin
	FChMouseDown := False;
	LblNumber.Caption := G_V_Serial;
  Try
  	ProgOptions.OpenProgramRegister(S1, S2);
  	LblName.Caption := S1;
    LblFirma.Caption := S2;
  Except
  	LblName.Caption := 'няма';
    LblFirma.Caption := 'няма';
  End;
end;

procedure TDlgAbout.Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
	If (Shift = [ssCtrl, ssShift, ssAlt])And(FChMouseDown) Then Begin
  	FChMouseDown := False;
  	ProgOptions.LocalHideInfoProgram;
  End;
end;

procedure TDlgAbout.Label1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
	If Shift = [ssAlt] Then FChMouseDown := True;
end;

end.
