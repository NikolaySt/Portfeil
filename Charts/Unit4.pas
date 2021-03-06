unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TeEngine, Series, TeeProcs, Chart, BSplines;

type
  TForm5 = class(TForm)
    Chart1: TChart;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    Panel1: TPanel;
    BtnSpline: TButton;
    Splines1: TSplines;
    procedure BtnSplineClick(Sender: TObject);
  private
    procedure Draw(SourceSer, DestSeries: TChartSeries);
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm5.Draw(SourceSer, DestSeries: TChartSeries);
var
  BSpline: TBSpline;
  I: Integer;
  J: Integer;
  V: TVertex;
begin
  Splines1.Clear;
  BSpline := TBSpline.Create;

  Randomize;

  BSpline.Color := Random(832873285425);
  for I := 0 to SourceSer.Count - 1 do
  begin
    V.X := SourceSer.XValues[i];
    V.Y := SourceSer.YValues[i];
    BSpline.AddPoint(V);// Use the AddPoint method to add a point to the spline
  end;

  BSpline.Interpolated := True; // Interpolate property can be true or false
  BSpline.Showvertices := True; // Showvertices property enables the user to view the defined controlpoints
  BSpline.Fragments := {20 + Random(100)} 500; // Set the number of straight line-segments for drawing the line
  Splines1.Addspline(BSpline);

  for I := 1 to Splines1.Count do
  begin
    BSpline := Splines1.Items[I-1];
    for J := 0 to BSpline.Fragments do
    begin
      V := BSpline.Value(J / BSpline.Fragments);
      DestSeries.AddXY(V.X, V.Y);
    end;
  end;
  DestSeries.Active := True;
end;

procedure TForm5.BtnSplineClick(Sender: TObject);
begin
  Draw(Form3.Series2, Form3.Series3);
  Draw(Form3.Series7, Form3.Series6);
  (Sender as TButton).Enabled := False;  
end;

end.
