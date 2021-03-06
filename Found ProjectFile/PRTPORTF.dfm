object DlgPrintPortfeil: TDlgPrintPortfeil
  Left = -4
  Top = -4
  Width = 1032
  Height = 746
  VertScrollBar.Position = 8
  Caption = 'Печат Портфейл'
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
    Left = 4
    Top = 59
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
    object PrintFigure4: TPrintFigure
      Left = 262
      Top = 81
      Width = 563
      Height = 54
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
      ViewAllPages = True
    end
    object PrintFigure1: TPrintFigure
      Left = 266
      Top = 135
      Width = 733
      Height = 78
      Brush.Style = bsClear
      Caption = 'Сравнение'
      Figures = tfRoundRect
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FindBottom = False
      RoundEllipseWidth = 30
      RoundEllipseHeight = 30
    end
    object PrintFigure3: TPrintFigure
      Left = 648
      Top = 217
      Width = 351
      Height = 95
      Brush.Style = bsClear
      Caption = 'Показатели'
      Figures = tfRoundRect
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FindBottom = False
      RoundEllipseWidth = 30
      RoundEllipseHeight = 30
    end
    object PrintFigure2: TPrintFigure
      Left = 267
      Top = 216
      Width = 374
      Height = 95
      Brush.Style = bsClear
      Caption = 'Стойност'
      Figures = tfRoundRect
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FindBottom = False
      RoundEllipseWidth = 30
      RoundEllipseHeight = 30
    end
    object LblTitle: TPrintLabel
      Left = 278
      Top = 98
      Width = 538
      Height = 32
      ViewAllPages = True
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'СЪДЪРЖАНИЕ НА ПОРТФЕЙЛА КЪМ 01/01/1980'
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
    object PrintLabel2: TPrintLabel
      Left = 364
      Top = 167
      Width = 143
      Height = 17
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Color = clWhite
      Caption = 'От инвестициите:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
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
      Left = 371
      Top = 187
      Width = 136
      Height = 17
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Color = clWhite
      Caption = 'Алтернатива:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
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
    object LblOtInvest: TPrintLabel
      Left = 505
      Top = 167
      Width = 125
      Height = 17
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Color = clWhite
      Caption = '100 000 000.00'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
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
      FreeseWidth = 3
    end
    object LblAlternativa: TPrintLabel
      Left = 505
      Top = 188
      Width = 125
      Height = 17
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Color = clWhite
      Caption = '100 000 000.00'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
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
      FreeseWidth = 3
    end
    object PrintLabel6: TPrintLabel
      Left = 627
      Top = 168
      Width = 245
      Height = 17
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Color = clWhite
      Caption = 'Възвращаемост от инвестициите:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
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
    object PrintLabel7: TPrintLabel
      Left = 655
      Top = 187
      Width = 217
      Height = 17
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Color = clWhite
      Caption = 'Ефективен лихвен процент:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
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
    object LblInvestVuzv: TPrintLabel
      Left = 872
      Top = 168
      Width = 125
      Height = 17
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Color = clWhite
      Caption = '100 000 000.00'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      CaptionDim = '%'
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 25
      Freese = True
      FreeseWidth = 3
    end
    object LblLihva: TPrintLabel
      Left = 872
      Top = 187
      Width = 125
      Height = 17
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Color = clWhite
      Caption = '100 000 000.00'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      CaptionDim = '%'
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 25
      Freese = True
      FreeseWidth = 3
    end
    object PrintLabel10: TPrintLabel
      Left = 268
      Top = 242
      Width = 239
      Height = 17
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Color = clWhite
      Caption = 'Стойност на портфейла:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
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
      Left = 268
      Top = 263
      Width = 239
      Height = 17
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Color = clWhite
      Caption = 'Пазарна стойност на портфейла:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
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
    object LblInvestStoi: TPrintLabel
      Left = 505
      Top = 243
      Width = 125
      Height = 17
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Color = clWhite
      Caption = '100 000 000.00'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      CaptionDim = 'лв'
      FontDim.Charset = RUSSIAN_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -13
      FontDim.Name = 'Arial'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 25
      Freese = True
      FreeseWidth = 3
    end
    object LblPazarStoi: TPrintLabel
      Left = 505
      Top = 264
      Width = 125
      Height = 17
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Color = clWhite
      Caption = '100 000 000.00'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      CaptionDim = 'лв'
      FontDim.Charset = RUSSIAN_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -13
      FontDim.Name = 'Arial'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 25
      Freese = True
      FreeseWidth = 3
    end
    object PrintLabel18: TPrintLabel
      Left = 268
      Top = 284
      Width = 239
      Height = 17
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Color = clWhite
      Caption = 'Възвращаемост на портфейла:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
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
    object LblPortfeilVuzv: TPrintLabel
      Left = 505
      Top = 285
      Width = 125
      Height = 17
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Color = clWhite
      Caption = '100 000 000.00'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      CaptionDim = '%'
      FontDim.Charset = RUSSIAN_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -13
      FontDim.Name = 'Arial'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 25
      Freese = True
      FreeseWidth = 3
    end
    object PrintLabel14: TPrintLabel
      Left = 671
      Top = 245
      Width = 202
      Height = 17
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Color = clWhite
      Caption = 'Основен лихвен процент:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
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
    object PrintLabel15: TPrintLabel
      Left = 673
      Top = 266
      Width = 200
      Height = 17
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Color = clWhite
      Caption = 'Борсов индекс:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
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
    object LblOLP: TPrintLabel
      Left = 873
      Top = 245
      Width = 125
      Height = 17
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Color = clWhite
      Caption = '100 000 000.00'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      AutoSize = False
      BorderStyle = bsNone
      CaptionDim = '%'
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 25
      Freese = True
      FreeseWidth = 3
    end
    object LblIndex: TPrintLabel
      Left = 873
      Top = 266
      Width = 125
      Height = 17
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Color = clWhite
      Caption = '100 000 000.00'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
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
      DimBuffer = 25
      Freese = True
      FreeseWidth = 3
    end
    object PrintPageLabel1: TPrintPageLabel
      Left = 831
      Top = 63
      Width = 141
      Height = 16
      ViewAllPages = True
      ShowCurrentPage = True
      ShowAllPages = False
      FindBottom = False
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
    object PrintDBGrid1: TPrintDBGrid
      Left = 68
      Top = 320
      Width = 659
      Height = 726
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DtSPortfeil
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
    object PrintPageLabel2: TPrintPageLabel
      Left = 831
      Top = 82
      Width = 141
      Height = 16
      ViewAllPages = True
      ShowCurrentPage = False
      ShowAllPages = True
      FindBottom = False
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
    object PrintDesignFigure1: TPrintDesignFigure
      Left = 78
      Top = 115
      Width = 181
      Height = 78
      Brush.Style = bsClear
      Figures = tfEllipse
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FindBottom = True
      RoundEllipseWidth = 0
      RoundEllipseHeight = 0
      ViewAllPages = True
    end
    object LblInfoSort: TPrintDesignLabel
      Left = 77
      Top = 143
      Width = 182
      Height = 50
      ViewAllPages = True
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Caption = 'Справка - спрямо алтернативата'
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      WordWrap = True
      AutoSize = False
    end
    object PrintDesignFigure2: TPrintDesignFigure
      Left = 78
      Top = 225
      Width = 181
      Height = 78
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
      Left = 87
      Top = 260
      Width = 164
      Height = 25
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Caption = 'Брой инвестиции: 30'
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      WordWrap = True
      AutoSize = False
    end
    object PrintDesignLabel1: TPrintDesignLabel
      Left = 116
      Top = 193
      Width = 105
      Height = 16
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
  end
  object DtSPortfeil: TDataSource
    DataSet = QryPrnPortfeil
    Left = 120
    Top = 7
  end
  object QryPrnPortfeil: TQuery
    DatabaseName = 'Portfeil'
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      ' *'
      'FROM'
      ' PortData'
      '')
    UniDirectional = True
    Left = 184
    Top = 7
    object QryPrnPortfeilID_Inv: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'No'
      DisplayWidth = 5
      FieldName = 'ID_Inv'
    end
    object QryPrnPortfeilData_Inv: TDateField
      Alignment = taCenter
      DisplayLabel = 'Дата'
      DisplayWidth = 12
      FieldName = 'Data_Inv'
    end
    object QryPrnPortfeilChifur: TStringField
      Alignment = taCenter
      DisplayLabel = 'Шифър'
      DisplayWidth = 8
      FieldName = 'Chifur'
      Size = 6
    end
    object QryPrnPortfeilBroi: TIntegerField
      Alignment = taCenter
      DisplayLabel = '~Брой (Колич.)'
      DisplayWidth = 10
      FieldName = 'Broi'
      DisplayFormat = '# ### ##0'
    end
    object QryPrnPortfeilEdin_Cena: TFloatField
      DisplayLabel = 'Цена на придобиване (лв)'
      DisplayWidth = 14
      FieldName = 'Edin_Cena'
      DisplayFormat = '# ### ##0.#0##'
      EditFormat = '#######.#####'
    end
    object QryPrnPortfeilStoinost: TFloatField
      DisplayLabel = '~Стойност ~(лв)'
      DisplayWidth = 14
      FieldName = 'Stoinost'
      DisplayFormat = '# ### ##0.#0'
      Precision = 2
    end
    object QryPrnPortfeilOtn_dial: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Отн. дял в (%)'
      DisplayWidth = 7
      FieldName = 'Otn_dial'
      DisplayFormat = '##0.#0'
      EditFormat = '#0.#####0'
    end
    object QryPrnPortfeilDrugestvo: TStringField
      DisplayLabel = '~Дружество (Емитент, издател...)'
      DisplayWidth = 30
      FieldName = 'Drugestvo'
      Size = 50
    end
    object QryPrnPortfeilPazar_Cena: TFloatField
      DisplayLabel = 'Пазарна ~цена ~(лв)'
      DisplayWidth = 14
      FieldName = 'Pazar_Cena'
      Required = True
      DisplayFormat = '# ### ##0.#0##'
      EditFormat = '#0.#0'
    end
    object QryPrnPortfeilPazar_Stoin: TFloatField
      DisplayLabel = 'Пазарна стойност ~(лв)'
      DisplayWidth = 14
      FieldName = 'Pazar_Stoin'
      DisplayFormat = '# ### ##0.#0'
    end
    object QryPrnPortfeilPeriod: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Период на притеж. в дни'
      FieldName = 'Period'
      Origin = '"Portdata.DB".Period'
      DisplayFormat = '# ### ### ##0'
    end
  end
end
