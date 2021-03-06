program Compresp;

uses
  Forms,
  Compress in 'COMPRESS.PAS' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
