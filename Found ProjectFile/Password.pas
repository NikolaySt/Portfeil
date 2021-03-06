unit Password;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TDlgPass = class(TForm)
    Image1: TImage;
    EdtPassword: TEdit;
    BtnOK: TButton;
    BtnCancel: TButton;
    procedure BtnOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  public
    Function Execute: Boolean;
  end;

var
  DlgPass: TDlgPass;

implementation

Uses MyConst, SetupReg, DlgMess, ConstMessage, CodePassword;

{$R *.DFM}

Function TDlgPass.Execute: Boolean;
Begin
	If ShowModal = mrOK Then Result := True
	Else Result := False;
End;

procedure TDlgPass.BtnOKClick(Sender: TObject);
begin
	with ProgOptions.SecProgram do begin
		Path := ExtractFileDir(ParamStr(0));
    FileName := cFileLIb;
    Password := EdtPassword.Text;
		IntComparePassword(cPassPos);

{$IFDEF PRG_DESIGN}    
    Result := C_NotError;
{$ENDIF}

	  case Result of
  	  C_NotError: ModalResult := mrOK;
  	else
  		MessageDlg1(C_Mess_ErrorPassword, mtInformation, [mbOK], 0);
	    EdtPassword.SetFocus;
	  end;
	end;
end;

procedure TDlgPass.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = 27 Then Close;
end;

end.
