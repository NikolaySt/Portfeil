program LocalInfo;

uses
  Forms,
  LocalHideInfo in 'LocalHideInfo.pas' {Form2},
  CodePassword in '..\Extra Units\CodePassword.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
