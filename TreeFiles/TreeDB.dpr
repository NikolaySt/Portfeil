program TreeDB;

{%File 'Operations.txt'}

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  TVExt in 'TVExt.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
