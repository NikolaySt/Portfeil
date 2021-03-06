object DlgPrintSpisuk: TDlgPrintSpisuk
  Left = 2
  Top = 186
  Width = 812
  Height = 356
  HorzScrollBar.Position = 767
  Caption = 'Печат Списък'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'System'
  Font.Style = []
  OldCreateOrder = True
  PrintScale = poNone
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 16
  object PrintPage1: TPrintPage
    Left = -764
    Top = 7
    Width = 763
    Height = 1088
    BaseDesign.Pen.Color = clWhite
    BaseDesign.Font.Charset = DEFAULT_CHARSET
    BaseDesign.Font.Color = clWindowText
    BaseDesign.Font.Height = -11
    BaseDesign.Font.Name = 'MS Sans Serif'
    BaseDesign.Font.Style = []
    BaseDesign.GridPen.Color = 14342874
    BaseDesign.GridPen.Style = psDot
    BaseDesign.CenterPen.Color = clRed
    BaseDesign.CenterPen.Style = psDot
    object PrintFigure2: TPrintFigure
      Left = 76
      Top = 697
      Width = 680
      Height = 288
      Brush.Style = bsClear
      Caption = 'Бележки'
      Figures = tfRoundRect
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FindBottom = True
      RoundEllipseWidth = 30
      RoundEllipseHeight = 30
    end
    object PrintFigure7: TPrintFigure
      Left = 228
      Top = 239
      Width = 528
      Height = 51
      Brush.Style = bsClear
      Figures = tfRoundRect
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FindBottom = True
      RoundEllipseWidth = 30
      RoundEllipseHeight = 30
    end
    object PrintFigure6: TPrintFigure
      Left = 65
      Top = 36
      Width = 180
      Height = 94
      Brush.Style = bsClear
      Figures = tfEllipse
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FindBottom = True
      RoundEllipseWidth = 30
      RoundEllipseHeight = 30
    end
    object PrintFigure3: TPrintFigure
      Left = 228
      Top = 298
      Width = 528
      Height = 244
      Brush.Style = bsClear
      Figures = tfRoundRect
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FindBottom = True
      RoundEllipseWidth = 30
      RoundEllipseHeight = 30
    end
    object PrintFigure5: TPrintFigure
      Left = 229
      Top = 548
      Width = 528
      Height = 140
      Brush.Style = bsClear
      Caption = 'Данни за емисията'
      Figures = tfRoundRect
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FindBottom = True
      RoundEllipseWidth = 30
      RoundEllipseHeight = 30
    end
    object PrintFigure4: TPrintFigure
      Left = 256
      Top = 475
      Width = 486
      Height = 15
      Brush.Style = bsClear
      Figures = tfRectangle
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FindBottom = True
      RoundEllipseWidth = 80
      RoundEllipseHeight = 80
    end
    object PrintFigure1: TPrintFigure
      Left = 228
      Top = 133
      Width = 528
      Height = 100
      Brush.Style = bsClear
      Figures = tfRoundRect
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FindBottom = True
      RoundEllipseWidth = 30
      RoundEllipseHeight = 30
    end
    object PrintLabel2: TPrintLabel
      Left = 460
      Top = 321
      Width = 84
      Height = 21
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Дата:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object PrintLabel3: TPrintLabel
      Left = 388
      Top = 356
      Width = 155
      Height = 21
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Брой(Колич.):'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object LblData: TPrintLabel
      Left = 549
      Top = 321
      Width = 135
      Height = 21
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = '12/12/1999'
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object LblBroi: TPrintLabel
      Left = 549
      Top = 356
      Width = 135
      Height = 21
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = '10 000 000'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object PrintLabel10: TPrintLabel
      Left = 274
      Top = 391
      Width = 270
      Height = 21
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Покупна цена за един брой:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object PrintLabel11: TPrintLabel
      Left = 234
      Top = 423
      Width = 310
      Height = 26
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Стойност на инвестицията:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object LblCenaNaBroi: TPrintLabel
      Left = 549
      Top = 391
      Width = 170
      Height = 21
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = '10 000 000.00'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      CaptionDim = 'лв'
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 30
      Freese = True
      FreeseWidth = 5
    end
    object LblStoi: TPrintLabel
      Left = 549
      Top = 424
      Width = 170
      Height = 21
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = '10 000 000.00'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      CaptionDim = 'лв'
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 30
      Freese = True
      FreeseWidth = 5
    end
    object PrintLabel18: TPrintLabel
      Left = 327
      Top = 459
      Width = 217
      Height = 21
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Разход за покупката:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object LblRazhod: TPrintLabel
      Left = 549
      Top = 459
      Width = 170
      Height = 21
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = '10 000 000.00'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      CaptionDim = 'лв'
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 30
      Freese = True
      FreeseWidth = 5
    end
    object PrintLabel14: TPrintLabel
      Left = 427
      Top = 502
      Width = 116
      Height = 24
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'ОБЩО:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object LblObtcho: TPrintLabel
      Left = 549
      Top = 503
      Width = 170
      Height = 21
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = '10 000 000.00'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      CaptionDim = 'лв'
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 30
      Freese = True
      FreeseWidth = 5
    end
    object LblLongName: TPrintLabel
      Left = 236
      Top = 257
      Width = 512
      Height = 28
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Глобални депозитарни разписки(за облиг.)'
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object LblNo: TPrintLabel
      Left = 501
      Top = 204
      Width = 237
      Height = 22
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Инвестиция No: '
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object LblDrugestvo: TPrintLabel
      Left = 230
      Top = 160
      Width = 509
      Height = 36
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Златен лев АД'
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object PrintLabel4: TPrintLabel
      Left = 466
      Top = 580
      Width = 78
      Height = 22
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Падеж:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object LblDataPadeg: TPrintLabel
      Left = 549
      Top = 580
      Width = 135
      Height = 21
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = '12/12/1999'
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object LblPravo: TPrintLabel
      Left = 549
      Top = 614
      Width = 170
      Height = 21
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = '10 000 000.00'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      CaptionDim = 'лв'
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 30
      Freese = True
      FreeseWidth = 5
    end
    object PrintLabel7: TPrintLabel
      Left = 274
      Top = 613
      Width = 270
      Height = 22
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Право за покупка на акции:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object PrintLabel8: TPrintLabel
      Left = 283
      Top = 648
      Width = 261
      Height = 22
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Купонен лихвен процент:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object LblLihva: TPrintLabel
      Left = 549
      Top = 648
      Width = 170
      Height = 21
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = '10 000 000.00'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      CaptionDim = 'лв'
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 30
      Freese = True
      FreeseWidth = 5
    end
    object PrintLabel1: TPrintLabel
      Left = 83
      Top = 71
      Width = 141
      Height = 41
      ViewAllPages = True
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Първоначални данни'
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      WordWrap = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object Belegki: TPrintDesignMemo
      Left = 89
      Top = 724
      Width = 656
      Height = 247
      FindBottom = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ViewAllPages = False
      WordBreak = True
    end
  end
  object PrintPage2: TPrintPage
    Left = 29
    Top = 2
    Width = 763
    Height = 1088
    BaseDesign.Pen.Color = clWhite
    BaseDesign.Font.Charset = DEFAULT_CHARSET
    BaseDesign.Font.Color = clWindowText
    BaseDesign.Font.Height = -11
    BaseDesign.Font.Name = 'MS Sans Serif'
    BaseDesign.Font.Style = []
    BaseDesign.GridPen.Color = 14342874
    BaseDesign.GridPen.Style = psDot
    BaseDesign.CenterPen.Color = clRed
    BaseDesign.CenterPen.Style = psDot
    object PrintFigure9: TPrintFigure
      Left = 60
      Top = 75
      Width = 683
      Height = 49
      Brush.Style = bsClear
      Figures = tfRoundRect
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = []
      FindBottom = True
      RoundEllipseWidth = 30
      RoundEllipseHeight = 30
      ViewAllPages = True
    end
    object PrintFigure8: TPrintFigure
      Left = 388
      Top = 124
      Width = 356
      Height = 80
      Brush.Style = bsClear
      Figures = tfRoundRect
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = []
      FindBottom = True
      RoundEllipseWidth = 30
      RoundEllipseHeight = 30
    end
    object PrintDBGrid2: TPrintDBGrid
      Left = 44
      Top = 216
      Width = 718
      Height = 825
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DtSSpisuk
      EnableFrame = True
      FrameType = ftVertLines
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      MoveTable = True
      RowHeight = 10
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -12
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      TitleRow = 3
    end
    object LblSpisTitle: TPrintLabel
      Left = 75
      Top = 93
      Width = 656
      Height = 26
      ViewAllPages = True
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'СПИСЪК НА ИНВЕСТИЦИИТЕ КЪМ '
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object PrintPageLabel1: TPrintPageLabel
      Left = 603
      Top = 39
      Width = 106
      Height = 18
      ViewAllPages = True
      ShowCurrentPage = True
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Лист : '
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object PrintPageLabel2: TPrintPageLabel
      Left = 603
      Top = 59
      Width = 106
      Height = 18
      ViewAllPages = True
      ShowCurrentPage = False
      ShowAllPages = True
      FindBottom = True
      Color = clWhite
      Caption = 'Вс. листа : '
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object PrintLabel5: TPrintLabel
      Left = 394
      Top = 149
      Width = 172
      Height = 37
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Обща стойност на инвестициите:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      WordWrap = True
      AutoSize = False
      BorderStyle = bsNone
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object LblObtchaStoi: TPrintLabel
      Left = 576
      Top = 158
      Width = 161
      Height = 21
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = '99 000 000.00'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      CaptionDim = 'лв'
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 25
      Freese = True
      FreeseWidth = 2
    end
    object PrintDesignLabel1: TPrintDesignLabel
      Left = 77
      Top = 123
      Width = 68
      Height = 14
      ViewAllPages = True
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      AutoSize = False
    end
    object PrintDesignFigure1: TPrintDesignFigure
      Left = 67
      Top = 133
      Width = 156
      Height = 65
      Brush.Style = bsClear
      Figures = tfEllipse
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FindBottom = False
      RoundEllipseWidth = 0
      RoundEllipseHeight = 0
    end
    object PrintDesignFigure2: TPrintDesignFigure
      Left = 228
      Top = 133
      Width = 156
      Height = 65
      Brush.Style = bsClear
      Figures = tfEllipse
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FindBottom = False
      RoundEllipseWidth = 0
      RoundEllipseHeight = 0
    end
    object LblBroiInv: TPrintDesignLabel
      Left = 72
      Top = 163
      Width = 147
      Height = 16
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Caption = 'Брой инвестиции - 300'
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      AutoSize = False
    end
    object LblSort: TPrintDesignLabel
      Left = 240
      Top = 154
      Width = 133
      Height = 40
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Caption = 'Сортиран - по дружество'
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      WordWrap = True
      AutoSize = False
    end
  end
  object DtSSpisuk: TDataSource
    DataSet = QrySpisuk
    Left = 145
    Top = 1
  end
  object QrySpisuk: TQuery
    DatabaseName = 'Portfeil'
    SQL.Strings = (
      
        'SELECT ID_INV, Chifur, Drugestvo, Data_Inv, Purvo_Broi, Purvo_Ce' +
        'na, Purvo_Broi * Purvo_Cena Purvo_Stoi_NoRazhod, Purvo_Razhod, P' +
        'urvo_Stoi'
      'FROM "PortData.DB"'
      ''
      '')
    Left = 226
    Top = 31
    object QrySpisukID_Inv: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'No'
      DisplayWidth = 4
      FieldName = 'ID_Inv'
    end
    object QrySpisukChifur: TStringField
      Alignment = taCenter
      DisplayLabel = 'Шифър'
      DisplayWidth = 8
      FieldName = 'Chifur'
      Size = 6
    end
    object QrySpisukDrugestvo: TStringField
      DisplayLabel = '~Дружество (Емитент, издател...)'
      DisplayWidth = 20
      FieldName = 'Drugestvo'
      Size = 50
    end
    object QrySpisukData_Inv: TDateField
      Alignment = taCenter
      DisplayLabel = 'Дата'
      DisplayWidth = 12
      FieldName = 'Data_Inv'
    end
    object QrySpisukPurvo_Broi: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Брой'
      DisplayWidth = 9
      FieldName = 'Purvo_Broi'
      Origin = '"PortData.DB".Purvo_Broi'
      DisplayFormat = '# ### ### ##0'
    end
    object QrySpisukPurvo_Cena: TFloatField
      DisplayLabel = 'Покупна   цена ~(лв)'
      DisplayWidth = 12
      FieldName = 'Purvo_Cena'
      DisplayFormat = '# ### ##0.#0##'
    end
    object QrySpisukPurvo_Stoi_NoRazhod: TFloatField
      DisplayLabel = 'Стойност  (лв)'
      DisplayWidth = 14
      FieldName = 'Purvo_Stoi_NoRazhod'
      DisplayFormat = '# ### ##0.#0'
    end
    object QrySpisukPurvo_Razhod: TFloatField
      DisplayLabel = '~Разход ~(лв)'
      DisplayWidth = 10
      FieldName = 'Purvo_Razhod'
      DisplayFormat = '# ### ##0.#0'
    end
    object QrySpisukPurvo_Stoi: TFloatField
      DisplayLabel = 'Общо ~(лв)'
      DisplayWidth = 14
      FieldName = 'Purvo_Stoi'
      DisplayFormat = '# ### ##0.#0'
    end
  end
end
