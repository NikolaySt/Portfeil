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
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  public
    function Execute(var Pass: string): Boolean;
  end;

var
  DlgPass: TDlgPass;

implementation

{$R *.DFM}

function TDlgPass.Execute(var Pass: string): Boolean;
begin
  Result := False;
  if ShowModal = mrOK then
  begin
    Pass := EdtPassword.Text;
    Result := True;
  end
end;

procedure TDlgPass.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = 27 then ModalResult := mrCancel;
end;

end.
