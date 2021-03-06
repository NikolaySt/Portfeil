unit Logo;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, Gauges, jpeg;

type
  TDlgLogo = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  DlgLogo: TDlgLogo;

implementation

{$R *.DFM}

procedure TDlgLogo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
end;

end.
