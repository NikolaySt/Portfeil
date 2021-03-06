object DlgPrintProdagbi: TDlgPrintProdagbi
  Left = 3
  Top = 94
  Width = 794
  Height = 349
  VertScrollBar.Position = 32
  Caption = 'Печат продажби'
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
  object PrintDesignPage1: TPrintDesignPage
    Left = 11
    Top = -47
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
    object PrintFigure1: TPrintFigure
      Left = 81
      Top = 54
      Width = 638
      Height = 74
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
    object LblDrugestvo: TPrintLabel
      Left = 90
      Top = 71
      Width = 615
      Height = 36
      ViewAllPages = True
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
    object LblNo: TPrintLabel
      Left = 96
      Top = 105
      Width = 153
      Height = 18
      ViewAllPages = True
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Инвестиция No: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
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
    object PrintFigure3: TPrintFigure
      Left = 81
      Top = 131
      Width = 356
      Height = 176
      Brush.Style = bsClear
      Caption = 'Първоначални данни'
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
      Left = 189
      Top = 184
      Width = 106
      Height = 20
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Дата:'
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
      Left = 163
      Top = 207
      Width = 132
      Height = 20
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Брой (Колич.):'
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
    object LblData: TPrintLabel
      Left = 301
      Top = 183
      Width = 102
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
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object LblBroi: TPrintLabel
      Left = 301
      Top = 207
      Width = 101
      Height = 20
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = '99 000 000'
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
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object PrintLabel14: TPrintLabel
      Left = 85
      Top = 255
      Width = 209
      Height = 38
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Първоначална стойност на инвестицията:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
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
    object LblObtcho: TPrintLabel
      Left = 301
      Top = 265
      Width = 129
      Height = 20
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = '99 000 000.00'
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
      FontDim.Style = [fsBold]
      FontOwner = True
      DimBuffer = 25
      Freese = True
      FreeseWidth = 3
    end
    object PrintLabel1: TPrintLabel
      Left = 197
      Top = 161
      Width = 98
      Height = 20
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Шифър:'
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
    object LblShifur: TPrintLabel
      Left = 301
      Top = 162
      Width = 102
      Height = 18
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'ОбА'
      Alignment = taCenter
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
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object PrintFigure2: TPrintFigure
      Left = 444
      Top = 132
      Width = 272
      Height = 176
      Brush.Style = bsClear
      Caption = 'Продажби към '
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
    object PrintLabel6: TPrintLabel
      Left = 460
      Top = 209
      Width = 117
      Height = 18
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Брой (Колич.):'
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
    object LblSumaBroi: TPrintLabel
      Left = 582
      Top = 207
      Width = 101
      Height = 20
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = '99 000 000'
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
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
    end
    object PrintLabel9: TPrintLabel
      Left = 454
      Top = 265
      Width = 122
      Height = 18
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Нетен приход:'
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
    object LblSumaPrihod: TPrintLabel
      Left = 582
      Top = 265
      Width = 129
      Height = 20
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = '99 000 000.00'
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
      FontDim.Style = [fsBold]
      FontOwner = True
      DimBuffer = 25
      Freese = True
      FreeseWidth = 3
    end
    object PrintPageLabel1: TPrintPageLabel
      Left = 565
      Top = 24
      Width = 117
      Height = 17
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
      Left = 559
      Top = 44
      Width = 123
      Height = 17
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
    object PrintDesignDBGrid1: TPrintDesignDBGrid
      Left = 65
      Top = 326
      Width = 668
      Height = 735
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DtSPrintProd
      EnableFrame = True
      FrameType = ftVertLines
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      MoveTable = True
      RowHeight = 10
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      TitleRow = 3
    end
    object PrintLabel4: TPrintLabel
      Left = 85
      Top = 231
      Width = 210
      Height = 20
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Покупна цена за един брой:'
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
    object LblCena: TPrintLabel
      Left = 301
      Top = 231
      Width = 129
      Height = 20
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = '99 000 000.00'
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
      FontDim.Style = [fsBold]
      FontOwner = True
      DimBuffer = 25
      Freese = True
      FreeseWidth = 3
    end
    object PrintDesignLabel1: TPrintDesignLabel
      Left = 621
      Top = 126
      Width = 98
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
  object DtSPrintProd: TDataSource
    DataSet = QryPrintProd
    Left = 200
  end
  object QryPrintProd: TQuery
    DatabaseName = 'Portfeil'
    SQL.Strings = (
      'SELECT'
      ' RedNom,'
      ' Data,'
      ' Broi,'
      ' Prod_Cena,'
      ' Prih_Div,'
      ' Razhodi,'
      ' Chist_Prih,'
      ' Kap_Pechalba,'
      ' Kap_Vuzv,'
      ' Doh_Prih'
      'FROM'
      ' "2_22_51.db"'
      'WHERE'
      ' Doh_Prih = '#39'P'#39' ')
    Left = 264
    Top = 1
    object QryPrintProdRedNom: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'No по ред'
      DisplayWidth = 4
      FieldName = 'RedNom'
      DisplayFormat = '#####0'
      EditFormat = '######0'
    end
    object QryPrintProdData: TDateField
      Alignment = taCenter
      DisplayLabel = 'Дата'
      DisplayWidth = 12
      FieldName = 'Data'
    end
    object QryPrintProdBroi: TIntegerField
      Alignment = taCenter
      DisplayLabel = '~Брой (Колич.)'
      DisplayWidth = 10
      FieldName = 'Broi'
      DisplayFormat = '# ### ##0'
      EditFormat = '######0'
    end
    object QryPrintProdProd_Cena: TFloatField
      DisplayLabel = 'Продажна цена ~(лв)'
      DisplayWidth = 14
      FieldName = 'Prod_Cena'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '######0.#0'
    end
    object QryPrintProdPrih_Div: TFloatField
      DisplayLabel = '~Приход ~(лв)'
      DisplayWidth = 14
      FieldName = 'Prih_Div'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '######0.#0'
    end
    object QryPrintProdRazhodi: TFloatField
      DisplayLabel = '~Разход ~ (лв)'
      DisplayWidth = 10
      FieldName = 'Razhodi'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '######0.#0'
    end
    object QryPrintProdKap_Pechalba: TFloatField
      DisplayLabel = 'Капиталова печалба /загуба/ (лв)'
      DisplayWidth = 15
      FieldName = 'Kap_Pechalba'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '######0.#0'
    end
    object QryPrintProdKap_Vuzv: TFloatField
      DisplayLabel = 'Капиталова възвращаемост (на годишна база) (%)'
      DisplayWidth = 20
      FieldName = 'Kap_Vuzv'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '######0.#0'
    end
    object QryPrintProdDoh_Prih: TStringField
      FieldName = 'Doh_Prih'
      Visible = False
      Size = 1
    end
  end
end
