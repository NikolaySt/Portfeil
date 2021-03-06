unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls;

type
  TForm2 = class(TForm)
    Chart1: TChart;
    Series1: TFastLineSeries;
    Panel1: TPanel;
    Button1: TButton;
    Series2: TFastLineSeries;
    procedure Button1Click(Sender: TObject);
  private
    procedure CalcSpline;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses DataSpline;

CONST
   n=High(Arr_Spline);
   pi=3.1415926;
   
TYPE
  glnarray = ARRAY [1..n] OF real;
  
VAR
   s: integer;
   yp1, ypn: real;
   x, y, y2: glnarray;
(*I SPLINE.PAS *)
procedure TForm2.CalcSpline;
var
  i: integer;
BEGIN
(* generate array for interpolation *)
   FOR i := 1 to n DO BEGIN
        x[i] := i;//arr_price[i][0];//i*pi/n;
        y[i] := StrToFloat(Arr_Spline[i][1]);//sin(x[i])
   END;
(* calculate 2nd derivative with spline *)
   yp1 := 1;
   ypn := 1;
   //spline(x, y, n, yp1, ypn, y2);
END;

procedure TForm2.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  CalcSpline;
  for i := 1 to n do
  begin
    Series1.AddXY(i, y2[i]);
    //Series2.AddXY(i, y[i]);
  end;
end;

end.
 