unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TeEngine, Series, TeeProcs, Chart, SplineUtils,
  BubbleCh;

type
  TForm4 = class(TForm)
    Chart1: TChart;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    Panel1: TPanel;
    Button1: TButton;
    Series3: TBubbleSeries;
    procedure Button1Click(Sender: TObject);
  private
    procedure ReadCord(var x, y: TArrSpline);
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses ClipBrd, Unit1;

procedure TForm4.Button1Click(Sender: TObject);
var
    n, nn: Integer;

    x, y, b, c, d: TArrSpline;
    xx, yy: TArrSpline;

  step: Double;
  i: Integer;
  Str: string;
begin
  n := Form3.Series2.Count;
  nn := Form3.Series1.Count;

  ReadCord(x, y);

  SplineUniversal(0, n, x, y, b, c, d, 0, 0);
  step := (x[n] - x[1])/(nn - 1);

  for i := 1 to nn do
  begin
    xx[i] := x[1] + (i - 1)*step;
    yy[i] := sen(n, xx[i], x, y, b, c, d);
  end;

 // for i := 1 to n do
    //Series1.AddXY(x[i], y[i]);

//  Form3.Series2.Active := False;

  for i := 1 to nn do begin
    //Series2.AddXY(xx[i], yy[i]);
    Form3.Series6.AddXY(xx[i], yy[i]);
  end;

  Form3.Series6.Active := True;

  for i := 1 to nn do
    if i = 1 then
      Str := FloatToStr(xx[i]) + Chr(VK_TAB) + FloatToStr(yy[i])
    else
      Str := Str + #13 + FloatToStr(xx[i]) + Chr(VK_TAB) + FloatToStr(yy[i]);

  ClipBoard.SetTextBuf(PChar(Str));
end;

procedure TForm4.ReadCord(var x, y: TArrSpline);
var
  i: Integer;
begin
  for i := 0 to Form3.Series2.Count - 1 do
  begin
    x[i + 1] := Form3.Series2.XValues[i];
    y[i + 1] := Form3.Series2.YValues[i];
  end;
end;

end.
