program GenSerial;

uses
  Forms,
  InstallGenSerial in 'InstallGenSerial.pas' {Form1},
  RestructTable in 'RestructTable.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDlgGenNum, DlgGenNum);
  Application.Run;
end.
