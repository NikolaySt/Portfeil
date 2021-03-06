unit Passchg;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, BitBtn, ExtCtrls;

type
  TDlgChangePass = class(TForm)
    Bevel1: TBevel;
    EdtNewPass: TEdit;
    EdtConfirmPass: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ChkBoxDisable: TCheckBox;
    Bevel2: TBevel;
    BtnOK: TButton;
    BtnCancel: TButton;
    procedure ChkBoxDisableClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Procedure WritePasswordA(Pass: String);
  public
    { Public declarations }
  end;

var
  DlgChangePass: TDlgChangePass;

implementation

Uses SetupReg, MyConst, DlgMess, ConstMessage, CodePassword;

{$R *.DFM}

procedure TDlgChangePass.ChkBoxDisableClick(Sender: TObject);
	Procedure DisableEditPass(Const E: Boolean);
  Begin
  	EdtNewPass.Enabled := E;
		EdtConfirmPass.Enabled := E;
  End;
begin
  If ChkBoxDisable.Checked Then DisableEditPass(False)
  Else DisableEditPass(True);
end;

procedure TDlgChangePass.BtnOKClick(Sender: TObject);
begin
	If ChkBoxDisable.Checked Then WritePasswordA(cNoPassword)
  Else Begin
  	If EdtNewPass.Text = EdtConfirmPass.Text Then Begin
    	If EdtNewPass.Text = '' Then Begin
      	MessageDlg1(C_Mess_NotPassword, mtWarning, [mbOK], 0);
        EdtNewPass.SetFocus;
      End
      Else WritePasswordA( EdtNewPass.Text);
    End
    Else Begin
    	If (EdtConfirmPass.Text = '')or(EdtNewPass.Text = '') Then Begin
	    	MessageDlg1(C_Mess_CorectPassword, mtInformation, [mbOK], 0);
        EdtConfirmPass.SetFocus;
      End
      Else Begin
      	MessageDlg1(C_Mess_ErrorPassword, mtWarning, [mbOK], 0);
        EdtNewPass.SetFocus;
      End;
    End;
  End;
end;

procedure TDlgChangePass.FormShow(Sender: TObject);
begin
	If EdtNewPass.Enabled Then EdtNewPass.SetFocus;
end;

procedure TDlgChangePass.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = 27 Then Close;
end;

Procedure TDlgChangePass.WritePasswordA(Pass: String);
begin
	With ProgOptions.SecProgram Do Begin
		Path := ExtractFileDir(ParamStr(0));
    FileName := cFileLIb;
    Password := Pass;
		IntWritePassword(cPassPos);
	  Case Result Of
  	  C_NotError: ModalResult := mrOK;
  	Else
  		MessageDlg1(C_Mess_NotWritePass, mtWarning, [mbOK], 0);
	  End;
	End;
end;

end.
