object Form2: TForm2
  Left = 218
  Top = 105
  Width = 696
  Height = 480
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Chart1: TChart
    Left = 0
    Top = 37
    Width = 688
    Height = 414
    AnimatedZoom = True
    AnimatedZoomSteps = 13
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    MarginBottom = 0
    MarginLeft = 1
    MarginRight = 1
    MarginTop = 0
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -11
    Title.Font.Name = 'Arial'
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'General Electric')
    BottomAxis.DateTimeFormat = 'dd/mm/yy'
    BottomAxis.Grid.Color = 10079436
    BottomAxis.Grid.Style = psSolid
    BottomAxis.Grid.Visible = False
    BottomAxis.Increment = 1
    BottomAxis.LabelsMultiLine = True
    BottomAxis.LabelsOnAxis = False
    BottomAxis.LabelsSeparation = 0
    BottomAxis.LabelsSize = 16
    BottomAxis.LabelStyle = talText
    BottomAxis.MinorTicks.Visible = False
    BottomAxis.TickLength = 0
    BottomAxis.TickOnLabelsOnly = False
    DepthAxis.Visible = True
    LeftAxis.AxisValuesFormat = '##0.#0'
    LeftAxis.ExactDateTime = False
    LeftAxis.Grid.Color = 10079436
    LeftAxis.Grid.Style = psSolid
    LeftAxis.Increment = 0.01
    LeftAxis.LabelsSeparation = 40
    LeftAxis.MinorTickCount = 5
    LeftAxis.MinorTickLength = 3
    LeftAxis.MinorTicks.Visible = False
    LeftAxis.Title.Angle = 0
    Legend.DividingLines.Visible = True
    Legend.Visible = False
    RightAxis.Automatic = False
    RightAxis.AutomaticMaximum = False
    RightAxis.AutomaticMinimum = False
    TopAxis.Grid.Color = 10079436
    TopAxis.Grid.Style = psSolid
    View3D = False
    View3DWalls = False
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 0
    Color = 13564413
    TabOrder = 0
    object Series1: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlue
      LinePen.Color = clBlue
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1
      YValues.Order = loNone
    end
    object Series2: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      LinePen.Color = clRed
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1
      YValues.Order = loNone
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 37
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    object Button1: TButton
      Left = 9
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
