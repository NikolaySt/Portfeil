object DlgPrintDohod: TDlgPrintDohod
  Left = -4
  Top = -4
  Width = 1032
  Height = 746
  Caption = 'Печат доход'
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
    Left = 10
    Top = 5
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
      Left = 63
      Top = 53
      Width = 672
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
      Left = 70
      Top = 72
      Width = 657
      Height = 29
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
      Width = 159
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
      Left = 63
      Top = 128
      Width = 187
      Height = 74
      Brush.Style = bsClear
      Figures = tfRoundRect
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      FindBottom = True
      RoundEllipseWidth = 30
      RoundEllipseHeight = 30
      ViewAllPages = True
    end
    object PrintLabel1: TPrintLabel
      Left = 68
      Top = 150
      Width = 82
      Height = 18
      ViewAllPages = True
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Шифър:'
      Alignment = taRightJustify
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
    object LblShifur: TPrintLabel
      Left = 151
      Top = 150
      Width = 94
      Height = 18
      ViewAllPages = True
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'ОбА'
      Alignment = taCenter
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
    object DBTblSpravka: TPrintDBGrid
      Left = 475
      Top = 214
      Width = 265
      Height = 836
      Anchors = [akLeft, akTop, akBottom]
      DataSource = DtSPrintSpravka
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
      TitleFont.Height = -13
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      TitleRow = 3
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
    object PrintPageLabel1: TPrintPageLabel
      Left = 560
      Top = 24
      Width = 123
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
    object DBTbl: TPrintDBGrid
      Left = 64
      Top = 214
      Width = 392
      Height = 836
      Anchors = [akLeft, akTop, akBottom]
      DataSource = DtSPrintDoh
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
      TitleFont.Height = -13
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      TitleRow = 3
    end
    object LblData: TPrintLabel
      Left = 151
      Top = 173
      Width = 94
      Height = 18
      ViewAllPages = True
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
      Left = 68
      Top = 173
      Width = 82
      Height = 18
      ViewAllPages = True
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Дата:'
      Alignment = taRightJustify
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
    object PrintFigure2: TPrintFigure
      Left = 259
      Top = 127
      Width = 472
      Height = 74
      Brush.Style = bsClear
      Figures = tfRoundRect
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      FindBottom = True
      RoundEllipseWidth = 30
      RoundEllipseHeight = 30
      ViewAllPages = True
    end
    object PrtTitle: TPrintLabel
      Left = 264
      Top = 155
      Width = 463
      Height = 27
      ViewAllPages = True
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Color = clWhite
      Caption = 'Доход от дивиденти'
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
    object PrintDesignLabel1: TPrintDesignLabel
      Left = 67
      Top = 202
      Width = 105
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
  end
  object DtSPrintDoh: TDataSource
    DataSet = QryPrtDohod
    Left = 149
    Top = 4
  end
  object DtSPrintSpravka: TDataSource
    DataSet = QryPrtSpravka
    Left = 273
    Top = 16
  end
  object QryPrtSpravka: TQuery
    DatabaseName = 'Portfeil'
    SQL.Strings = (
      'SELECT'
      '  Godina,'
      '  Sum(Prod_Cena),'
      '  Sum(Kap_Vuzv)'
      'FROM'
      ' "2_22_51.db"'
      'WHERE'
      '  Doh_Prih = "D"'
      'GROUP BY '
      '  Godina')
    Left = 213
    Top = 12
    object QryPrtSpravkaGodina: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Година'
      DisplayWidth = 8
      FieldName = 'Godina'
      DisplayFormat = '####'
    end
    object QryPrtSpravkaSUMofProd_Cena: TFloatField
      DisplayLabel = 'Дивидент на акция (лв)'
      DisplayWidth = 11
      FieldName = 'SUM of Prod_Cena'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '######0.#0'
    end
    object QryPrtSpravkaSUMofKap_Vuzv: TFloatField
      DisplayLabel = 'Дивидентна възвращаемост (лв)'
      DisplayWidth = 16
      FieldName = 'SUM of Kap_Vuzv'
      DisplayFormat = '# ### ##0.#0'
    end
  end
  object QryPrtDohod: TQuery
    DatabaseName = 'Portfeil'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      ' RedNom,'
      ' Data,'
      ' Broi,'
      ' Godina,'
      ' Prih_Div,'
      ' Bezpl_Akcii,'
      ' Prod_Cena,'
      ' Kap_Vuzv,'
      ' Doh_Prih'
      'FROM'
      ' "2_22_51.db"'
      'WHERE'
      ' Doh_Prih = "D"')
    UniDirectional = True
    Left = 71
    Top = 10
    object QryPrtDohodRedNom: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'No по ред'
      DisplayWidth = 5
      FieldName = 'RedNom'
    end
    object QryPrtDohodData: TDateField
      Alignment = taCenter
      DisplayLabel = 'Дата'
      DisplayWidth = 10
      FieldName = 'Data'
    end
    object QryPrtDohodBroi: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Брой'
      DisplayWidth = 10
      FieldName = 'Broi'
    end
    object QryPrtDohodGodina: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Година'
      DisplayWidth = 8
      FieldName = 'Godina'
    end
    object QryPrtDohodPrih_Div: TFloatField
      DisplayLabel = 'Получен дивидент (лв)'
      DisplayWidth = 12
      FieldName = 'Prih_Div'
      DisplayFormat = '# ### ##0.#0'
    end
    object QryPrtDohodBezpl_Akcii: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Безпл. акции (бр)'
      DisplayWidth = 9
      FieldName = 'Bezpl_Akcii'
      DisplayFormat = '# ### ##0'
    end
    object QryPrtDohodProd_Cena: TFloatField
      FieldName = 'Prod_Cena'
      Visible = False
    end
    object QryPrtDohodKap_Vuzv: TFloatField
      FieldName = 'Kap_Vuzv'
      Visible = False
    end
    object QryPrtDohodDoh_Prih: TStringField
      FieldName = 'Doh_Prih'
      Visible = False
      Size = 1
    end
  end
end
