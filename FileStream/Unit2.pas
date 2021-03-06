unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    function Execute(var Pass: string): Boolean;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

{ TForm2 }

function TForm2.Execute(var Pass: string): Boolean;
begin
  Result := False;
  if ShowModal = mrOK then
  begin
    Pass := Edit1.Text;
    Result := True;
  end
end;

end.
