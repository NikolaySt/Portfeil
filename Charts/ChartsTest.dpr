program ChartsTest;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form3},
  DataMsft in 'DataMsft.pas',
  ExtSeries in 'C:\Program Files\Borland\Delphi6\Projects\ExtSeries.pas',
  DataGE in 'DataGE.pas',
  Unit2 in 'Unit2.pas' {Form2},
  DataSpline in 'DataSpline.pas',
  SplineUtils in 'SplineUtils.pas',
  Unit3 in 'Unit3.pas' {Form4},
  Unit4 in 'Unit4.pas' {Form5},
  BSplines in 'C:\Program Files\Borland\Delphi6\Projects\BSplines.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
