unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, Series, TeeFunci, TeeShape,
  TeeConst, ExtSeries, StdCtrls, ExtSeriesBar, ExtFunc, ComCtrls, DdeMan;

type
  TForm3 = class(TForm)
    Chart1: TChart;
    Series1: TFastLineSeries;
    Series2: TLineSeries;
    Chart2: TChart;
    Series5: TExtLineSeries;
    Panel1: TPanel;
    Button2: TButton;
    Series4: TExtBarSeries;
    Series6: TLineSeries;
    UpDown1: TUpDown;
    TeeFunction2: TAverageTeeFunction;
    Series3: TLineSeries;
    Series7: TLineSeries;
    TeeFunction1: TAverageTeeFunction;
    Button1: TButton;
    Series8: TLineSeries;
    Series9: TLineSeries;
    TeeFunction3: TAverageTeeFunction;
    DdeClientItem1: TDdeClientItem;
    DdeClientConv1: TDdeClientConv;
    Splitter1: TSplitter;
    Chart3: TChart;
    Button3: TButton;
    Splitter2: TSplitter;
    Series10: TLineSeries;
    Button4: TButton;
    Series11: TLineSeries;
    Series12: TLineSeries;
    Series13: TLineSeries;
    Button5: TButton;
    Chart4: TChart;
    Series14: THorizBarSeries;
    procedure Chart1GetAxisLabel(Sender: TChartAxis; Series: TChartSeries;
      ValueIndex: Integer; var LabelText: String);
    procedure Button2Click(Sender: TObject);
    procedure Chart1BeforeDrawSeries(Sender: TObject);
    procedure Chart2GetAxisLabel(Sender: TChartAxis; Series: TChartSeries;
      ValueIndex: Integer; var LabelText: String);
    procedure Chart2BeforeDrawSeries(Sender: TObject);
    procedure UpDown1ChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Smallint; Direction: TUpDownDirection);
    procedure Chart1Zoom(Sender: TObject);
    procedure Chart1UndoZoom(Sender: TObject);
    procedure Chart1Scroll(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Chart1GetLegendRect(Sender: TCustomChart; var Rect: TRect);
    procedure Chart1AfterDraw(Sender: TObject);
    procedure Chart2AfterDraw(Sender: TObject);
    procedure Chart2GetLegendRect(Sender: TCustomChart; var Rect: TRect);
    procedure Chart2GetLegendText(Sender: TCustomAxisPanel;
      LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
    procedure Chart1GetLegendText(Sender: TCustomAxisPanel;
      LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    FSaveRect, FSaveRect_1: TRect;

    FOldYear: Word;
    FOldMonth: Word;
    FOldDay: Word;
    FOldX: Integer;

    FOldYear_1: Word;
    FOldMonth_1: Word;
    FOldDay_1: Word;
    FOldX_1: Integer;

    FChFirstYear: Boolean;
    FChFirstYear_1: Boolean;

    FP1, FP2: PStruct;
    FPer_date: Integer;
    FPer_Real: Integer;
    FRatio: Real;

    FIntLen_Volume: Integer;
    FIntLen_Price: Integer;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;


implementation

uses DateUtils, TeCanvas, DataMsft, DataGE, Unit4;

{$R *.dfm}

procedure TForm3.Chart1GetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  P: PStruct;
  Year, Month, Day: Word;
  Date_cur: TDateTime;
  Y1, Y2: Longint;
  AxisRange: Double;
  M: string;
  i: Integer;
begin
          
  if ValueIndex <> - 1 then
  begin
    LabelText := '';
    P := Series5.GetLabelPointer(ValueIndex);
    if P = nil then Exit;
    DecodeDate(P.Date, Year, Month, Day);
    AxisRange := Chart1.BottomAxis.Maximum - Chart1.BottomAxis.Minimum;
    if not FChFirstYear then
    begin
      FOldYear := Year;
      FOldMonth := Month;
      FOldDay := Day;
      FChFirstYear := True;
    end
    else begin
      if FOldYear < Year then
      begin
        Date_cur := EncodeDate(Year, 1, 1);
        FOldX := Series1.CalcXPos(ValueIndex);
//        FOldX := Series1.CalcXPosValue(Chart1.BottomAxis.Minimum + (Date_cur - FP1.Date)/FRatio);

        Y1 := Series1.CalcYPosValue(Chart1.LeftAxis.Maximum );
        Y2 := Series1.CalcYPosValue(Chart1.LeftAxis.Minimum );

        Chart1.Canvas.Pen.Color := Chart1.BottomAxis.Grid.Color;
        Chart1.Canvas.Line(FOldX-1, Y1, FOldX-1, Y2);
        Chart1.Canvas.Line(FOldX+1, Y1, FOldX+1, Y2);

        if LabelText = '' then begin
          Sender.LabelsFont.Style := [fsBold];
          LabelText := IntToStr(Year);
        end;

        FOldYear := Year;
        FOldMonth := 1;        
      end
      else if (FOldMonth < Month) and (AxisRange < 600) then
      begin
        Date_cur := EncodeDate(Year, Month, 1);
        //FOldX := Series1.CalcXPosValue(Chart1.BottomAxis.Minimum + (Date_cur - FP1.Date)/FRatio);
        FOldX := Series1.CalcXPos(ValueIndex);
        
        Chart1.Canvas.Pen.Color := Chart1.BottomAxis.Grid.Color;

        Y1 := Series1.CalcYPosValue(Chart1.LeftAxis.Maximum );
        Y2 := Series1.CalcYPosValue(Chart1.LeftAxis.Minimum );

        if LabelText = '' then begin

          if not (AxisRange > 35) then Sender.LabelsFont.Style := [fsBold]
          else Sender.LabelsFont.Style := [];

          M := FormatDateTime('MMMM', Date_cur);
          if Length(M) > 5 then
            LabelText := Copy(M, 1, 3)
          else
           LabelText :=  M;
        end;
        Chart1.Canvas.Line(FOldX, Y1, FOldX, Y2);

        FOldMonth := Month;
        FOldDay := 1;
      end;
      {
      if P.Date = Date - 57 then
      begin
        //FOldX := Series1.CalcXPosValue(Chart1.BottomAxis.Minimum + (Abs(Date - 57 - FP1.Date))/FRatio);
        FOldX := Series1.CalcXPos(ValueIndex);
        Y1 := Series1.CalcYPosValue(Chart1.LeftAxis.Maximum );
        Y2 := Series1.CalcYPosValue(Chart1.LeftAxis.Minimum );

        Chart1.Canvas.Pen.Color := clRed;
        Chart1.Canvas.Line(FOldX, Y1, FOldX, Y2);
      end;
      }
    end;
      if (AxisRange < 35) then
      begin
        Date_cur := EncodeDate(Year, Month, Day);
//        FOldX := Series1.CalcXPosValue(Chart1.BottomAxis.Minimum + (Date_cur - FP1.Date)/FRatio);
        FOldX := Series1.CalcXPos(ValueIndex);
        Chart1.Canvas.Pen.Color := Chart1.BottomAxis.Grid.Color;

        Y1 := Series1.CalcYPosValue(Chart1.LeftAxis.Maximum );
        Y2 := Series1.CalcYPosValue(Chart1.LeftAxis.Minimum );

        if LabelText = '' then begin
          Sender.LabelsFont.Style := [];
          LabelText := FormatDateTime('dd', Date_cur);
        end;

        Chart1.Canvas.Line(FOldX, Y1, FOldX, Y2);
        FOldMonth := Month;
      end;
  end
end;

procedure TForm3.Button2Click(Sender: TObject);
var
  i: Integer;
  P: PStruct;
  YMin, YMax: Real;
begin
  FChFirstYear := False;

  YMin := 20000; YMax := 0;

  for i := Low(Arr_Msft) + 1700 to High(Arr_Msft) do
  begin
    New(P);
    P.Date := StrToInt(Arr_Msft[i][0]);
    P.Open := StrToFloat(Arr_Msft[i][1]);
    P.High := StrToFloat(Arr_Msft[i][2]);
    P.Low := StrToFloat(Arr_Msft[i][3]);
    P.Close := StrToFloat(Arr_Msft[i][4]);
    P.Volume := StrToInt(Arr_Msft[i][5]);

    if YMin > P.Low then YMin := P.Low;
    if YMax < P.High then YMax := P.High;

    Series4.AddXY(i{P.Date}, P.Volume, IntToStr(Round(P.Date)));

    Series1.AddXY(i{P.Date}, P.Close);
    Series5.AddXYExt(i{P.Date}, P.Close, P);
  end;

  FP1 := Series5.GetLabelPointer(0);
  FP2 := Series5.GetLabelPointer(Series5.Count - 1);
  FPer_date := Round(FP2.Date - FP1.Date);
  FPer_real := Series1.Count;
  FRatio := FPer_date / FPer_real;

  with Chart1 do
  begin
    LeftAxis.AutomaticMaximum := False;
    LeftAxis.AutomaticMinimum := False;
    LeftAxis.Maximum := YMax + YMax * 0.004;
    LeftAxis.Minimum := YMin - YMin * 0.004;

    BottomAxis.AutomaticMaximum := False;
    BottomAxis.AutomaticMinimum := False;
    BottomAxis.Maximum := Series1.MaxXValue + 1;
    BottomAxis.Minimum := Series1.MinXValue - 1;
  end;
  with Chart2 do
  begin
    BottomAxis.AutomaticMaximum := False;
    BottomAxis.AutomaticMinimum := False;
    BottomAxis.Maximum := Series4.MaxXValue + 1;
    BottomAxis.Minimum := Series4.MinXValue - 1;
  end;
  Series2.FunctionType.Period := 10;
  Series7.FunctionType.Period := 30;
//  Series9.FunctionType.Period := 30;  
  //Series6.FunctionType.Period := 40;

  Series8.AddXY(Series1.XValue[0], 56.67);
  Series8.AddXY(Series1.XValue[Series1.Count - 1], 56.67);

  (Sender as TButton).Enabled := False;
end;

procedure TForm3.Chart1BeforeDrawSeries(Sender: TObject);
begin
  FChFirstYear := False;
end;

procedure TForm3.Chart2GetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  D: TDateTime;
  Year, Month, Day: Word;
  Date_cur: TDateTime;
  Y1, Y2: Longint;
  AxisRange: Double;
  R: Double;  
begin
  if ValueIndex <> - 1 then
  begin
    LabelText := '';
    D := StrToFloat(PChar(Series4.Labels[ValueIndex]));
    DecodeDate(D, Year, Month, Day);
    AxisRange := Chart2.BottomAxis.Maximum - Chart2.BottomAxis.Minimum;
    if not FChFirstYear_1 then
    begin
      FOldYear_1 := Year;
      FOldMonth_1 := Month;
      FOldDay_1 := Day;
      FChFirstYear_1 := True;
    end
    else begin
      if FOldYear_1 < Year then
      begin
        Date_cur := EncodeDate(Year, 1, 1);
        FOldX_1 := Series4.CalcXPos(ValueIndex);
//        FOldX := Series1.CalcXPosValue(Chart1.BottomAxis.Minimum + (Date_cur - FP1.Date)/FRatio);

        Y1 := Series4.CalcYPosValue(Chart2.LeftAxis.Maximum );
        Y2 := Series4.CalcYPosValue(Chart2.LeftAxis.Minimum );

        Chart2.Canvas.Pen.Color := Chart2.BottomAxis.Grid.Color;
        Chart2.Canvas.Line(FOldX_1-1, Y1, FOldX_1-1, Y2);
        Chart2.Canvas.Line(FOldX_1+1, Y1, FOldX_1+1, Y2);

        if LabelText = '' then begin
          Sender.LabelsFont.Style := [fsBold];
          LabelText := IntToStr(Year);
        end;

        FOldYear_1 := Year;
        FOldMonth_1 := 1;        
      end
      else if (FOldMonth_1 < Month) and {(Series1.Count < 600)}(AxisRange < 600) then
      begin
        Date_cur := EncodeDate(Year, Month, 1);
        //FOldX := Series1.CalcXPosValue(Chart1.BottomAxis.Minimum + (Date_cur - FP1.Date)/FRatio);
        FOldX_1 := Series4.CalcXPos(ValueIndex);

        Chart2.Canvas.Pen.Color := Chart2.BottomAxis.Grid.Color;

        Y1 := Series4.CalcYPosValue(Chart2.LeftAxis.Maximum );
        Y2 := Series4.CalcYPosValue(Chart2.LeftAxis.Minimum );

        if LabelText = '' then begin

          if not (AxisRange > 35) then Sender.LabelsFont.Style := [fsBold]
          else Sender.LabelsFont.Style := [];
          
          LabelText := Copy(FormatDateTime({'dd/MM'}'MMMM', Date_cur), 1, 3);
        end;
        Chart2.Canvas.Line(FOldX_1, Y1, FOldX_1, Y2);
        FOldMonth_1 := Month;
        FOldDay_1 := 1;
      end;
    end;
      if {(FOldDay < Day) and }{(Series1.Count < 35)} (AxisRange < 35) then
      begin
        Date_cur := EncodeDate(Year, Month, Day);
//        FOldX := Series1.CalcXPosValue(Chart1.BottomAxis.Minimum + (Date_cur - FP1.Date)/FRatio);
        FOldX_1 := Series4.CalcXPos(ValueIndex);
        Chart2.Canvas.Pen.Color := Chart2.BottomAxis.Grid.Color;

        Y1 := Series4.CalcYPosValue(Chart2.LeftAxis.Maximum );
        Y2 := Series4.CalcYPosValue(Chart2.LeftAxis.Minimum );

        if LabelText = '' then begin
          Sender.LabelsFont.Style := [];
          LabelText := FormatDateTime('dd', Date_cur);
        end;

        Chart2.Canvas.Line(FOldX_1, Y1, FOldX_1, Y2);
        FOldMonth_1 := Month;
      end;
      LabelText := '';
  end
  else begin
  {
    if (Pos('/', LabelText) > 0) or (LabelText = '') then exit;    

    try
      R := StrToFloat(LabelText) * 1000000;
    except
    end;
      if R > 1000000 then LabelText := FormatFloat('#.0M', R / 1000000)
      else if R > 100000 then LabelText := FormatFloat('#.0K', R / 100000)
      else if R > 10000 then LabelText := FormatFloat('#.0', R / 10000)
      else LabelText := '';
  }
  end;
end;

procedure TForm3.Chart2BeforeDrawSeries(Sender: TObject);
begin
  FChFirstYear_1 := False;
end;

procedure TForm3.UpDown1ChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
begin
  if Direction = updUP then
    Chart1.ZoomPercent(102)
  else
    Chart1.ZoomPercent(98)
end;

procedure TForm3.Chart1Zoom(Sender: TObject);
begin
  Chart1.BottomAxis.Automatic := False ;

  Chart2.BottomAxis.Minimum   := Chart1.BottomAxis.Minimum;
  Chart2.BottomAxis.Maximum   := Chart1.BottomAxis.Maximum;

  Chart2.LeftAxis.AutomaticMaximum := False;

                                      {
  Chart3.BottomAxis.AutomaticMaximum := False;
  Chart3.BottomAxis.Minimum   := Chart1.BottomAxis.Minimum;
  Chart3.BottomAxis.Maximum   := Chart1.BottomAxis.Maximum;
  Chart3.BottomAxis.AutomaticMaximum := False;
  }
end;

procedure TForm3.Chart1UndoZoom(Sender: TObject);
begin
  Chart1.BottomAxis.Automatic := False ;
  Chart2.BottomAxis.Minimum   := Chart1.BottomAxis.Minimum;
  Chart2.BottomAxis.Maximum   := Chart1.BottomAxis.Maximum;

  Chart2.LeftAxis.AutomaticMaximum := True;
end;

procedure TForm3.Chart1Scroll(Sender: TObject);
begin
  Chart2.BottomAxis.Minimum   := Chart1.BottomAxis.Minimum;
  Chart2.BottomAxis.Maximum   := Chart1.BottomAxis.Maximum;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  //Button2Click(Button2);
end;

procedure TForm3.Chart1GetLegendRect(Sender: TCustomChart;
  var Rect: TRect);
begin
  Rect := Classes.Rect(5, 5, Sender.Width - 5, 20);
  FSaveRect := Rect;
end;

procedure TForm3.Chart1AfterDraw(Sender: TObject);
begin
  Chart1.Canvas.Font.Assign(Chart1.Legend.Font);
  
  Chart1.Canvas.TextOut(
    FSaveRect.Left + 2,
    FSaveRect.Top,
    'GE - General Electric');

  Chart1.Canvas.TextOut(
    FSaveRect.Right - Chart1.Canvas.TextWidth(DateToStr(Date)) - 2,
    FSaveRect.Top,
    DateToStr(Date));
end;

procedure TForm3.Chart2AfterDraw(Sender: TObject);
begin
  Chart2.Canvas.Font.Assign(Chart2.Legend.Font);
  
  Chart2.Canvas.TextOut(
    FSaveRect_1.Left + 2,
    FSaveRect_1.Top,
    'Volume');
end;

procedure TForm3.Chart2GetLegendRect(Sender: TCustomChart;
  var Rect: TRect);
begin
  Rect := Classes.Rect(5, 5, Sender.Width - 5, 20);
  FSaveRect_1 := Rect;
end;

procedure TForm3.Chart2GetLegendText(Sender: TCustomAxisPanel;
  LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
begin
  LegendText := '';
end;

procedure TForm3.Chart1GetLegendText(Sender: TCustomAxisPanel;
  LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
begin
  LegendText := '';
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  Form5.BtnSplineClick(Sender);
end;

procedure TForm3.Button3Click(Sender: TObject);
var
  i: Integer;
  Period: integer;
  Ind: double;

  function Close(shift: integer): double;
  begin
    result := Series1.YValue[shift];
  end;
  function DateTime(shift: integer): double;
  begin
    result := Series1.XValues[shift];
  end;
begin
  Series10.Clear;
//  ExtBarSeries1
  Period := 14;
  for i := Period to Series1.Count - 1 do
  begin
    Ind := (Close(i)/Close(i-period))*100;
    Series10.AddXY(DateTime(i), Ind);
  end;

  with Chart3 do
  begin
    BottomAxis.AutomaticMaximum := true;
    BottomAxis.AutomaticMinimum := true;
    LeftAxis.AutomaticMaximum := true;
    LeftAxis.AutomaticMinimum := true;
  end;

end;

procedure TForm3.Button4Click(Sender: TObject);
var
  i, cnt: Integer;
  Period: integer;
  Ind, sum, MA, stddiv, boll_down, boll_up: double;

  function Close(shift: integer): double;
  begin
    result := Series1.YValue[shift];
  end;
  function DateTime(shift: integer): double;
  begin
    result := Series1.XValues[shift];
  end;
  
  function MABoll(shift: integer): double;
  begin
    result := Series13.YValues[shift];
  end;

begin
  Series10.Clear;
//  ExtBarSeries1
  Period := 20;
  for i := Period to Series1.Count - 1 do
  begin
		sum := 0;
    MA := 0;
		For cnt := 0 To Period - 1 do
			sum := sum + Close(i - cnt);

		MA := sum/Period;
    
    Series13.AddXY(DateTime(i), MA);


    sum := 0;
    For cnt := 0 To Period - 1 do
      sum := sum + (Close(i-cnt) - MA) * (Close(i-cnt) - MA);

    stddiv := sqrt( sum / Period );

    boll_down := MA - 2*stddiv;
    boll_up := MA + 2*stddiv;

      Series11.AddXY(DateTime(i), boll_down);
      Series12.AddXY(DateTime(i), boll_up);



    Ind := (Close(i)/Close(i-period))*100;

    Series10.AddXY(DateTime(i), Ind);
  end;

  with Chart3 do
  begin
    BottomAxis.AutomaticMaximum := true;
    BottomAxis.AutomaticMinimum := true;
    LeftAxis.AutomaticMaximum := true;
    LeftAxis.AutomaticMinimum := true;
  end;
end;

//-----------------------------
var
  Rows: integer = 3000;
  Cols: integer = 3000;
  MatrixMP : Array[1..3000, 1..3000] of double;   //[rows, columns]
//-----------------------------

procedure TForm3.Button5Click(Sender: TObject);
var
   P: PStruct;
   begin_high: double;
   PointRatio, k, n, i, add_price, bar_count, bar_index: Integer;
   bar_range, curr_col, back_col, save_col: Integer;
   begin_row, curr_row, point_sub: integer;
   ch_exit: boolean;
   begin_index: integer;
begin
  begin_row := Round(Rows/2);

  PointRatio := 10;
  curr_col := 1;
  add_price := 1;
  FillChar(MatrixMP, sizeof(MatrixMP), 0);

  begin_index := 1;
  for i := begin_index to Series5.Count - 1 do
  begin
      P := PStruct(Series5.GetLabelPointer(i));

      if Assigned(P) then begin

      if i = begin_index then
      begin
        begin_high := p.high;
			  bar_range := Round((p.high - p.low)*PointRatio);
			  for k := 0 to bar_range - 1 do
        begin
	  			MatrixMP[begin_row + k, curr_col] := add_price;
        end;
      end;

        if i > begin_index then
        begin
          curr_col := curr_col + 1;

          bar_range := Round((p.high - p.low)*PointRatio);

		      point_sub := Round(abs(begin_high - p.high)*PointRatio);

		      if p.high - begin_high > 0 then begin

            if point_sub > begin_row then
            asm
              int 03h;
            end;

			      curr_row := begin_row - point_sub
          end
	      	else
			      curr_row := begin_row + point_sub;

	      	add_price := add_price + 1;
		      //---Izvar6a narejdaneto na matricata za teku6tia bar-------------
		      for n := 0 to bar_range - 1 do begin
			       ch_exit := false;
		      	back_col := curr_col;
    		    while not ch_exit do begin
              if (back_col < 1) or (back_col > 3000) or (curr_row + n < 1) or (curr_row + n > 3000) then
              asm
                int 03h;
              end;

				      if MatrixMP[curr_row + n, back_col] = 0 then begin
                if back_col = 1 then begin
  						    save_col := 1;
	  					    ch_exit := true;
                end else begin
			  			    save_col := back_col;
				  		    back_col := back_col - 1;
                end;
              end else
                ch_exit := true;
            end;
			      MatrixMP[curr_row + n, save_col] := add_price;
          end;
        end;
      end;
  end;



		bar_index := 1;
		for n := 1 to Rows do begin
			if MatrixMP[n, 1] <> 0 then begin

				ch_exit := false;
				i := 1;
				bar_count := 0;

				while not ch_exit do begin
					bar_count := bar_count + 1;
					MatrixMP[n, i] := 0;
					i := i + 1;
					if (MatrixMP[n, i] = 0) or (i = 3000) then
						ch_exit := true
  			end;
        Series14.AddXY(bar_count, bar_index);
        bar_index := bar_index + 1;
      end;
    end;
end;


end.
