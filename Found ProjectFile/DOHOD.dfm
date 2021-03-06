object DlgDohod: TDlgDohod
  Left = 57
  Top = 53
  Width = 655
  Height = 429
  HelpContext = 400
  ActiveControl = CBoxSpisuk
  Caption = 'Доход от дивиденти и лихви'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    1111111111111111111111111000001187777777777777777777777770000010
    0000000000000000000000000800000590077777777777777777777770000070
    595007777777777777777777F000000095959008888888888888887FF0000001
    5959595007777777777777FFF00000709595959590088888888888FFF0000000
    59595959595007777777FFFFF00000019595959595990888888888FFF0000070
    595959595959077777FFFFFFF00000009595959595990888888888FFF0000001
    5959595959590777FFFFFFFFF00000709595959595990888888888FFF0000000
    59595959595907FFFFFFFFFFF00000019595959595990888888888FFF0000070
    5959595959590FFFFFFFFFFFF00000009595959595990888888888FFF0000001
    5959595959590FFFFFFFFFFFF00000709595959595990888888888FFF0000000
    5959595959590FFFFFFFFFFFF000000195959595959900000000000000000000
    0959595959590000000000000000000000059595959900000000000000000000
    0000095959590000000000000000000000000005959900000000000000000000
    0000000009590000000000000000000000000000000900000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFF0000007C0000003C0000001C00000018000000180000001C000
    00018000000180000001C00000018000000180000001C0000001800000018000
    0001C00000018000000180000001C00000018000000180000003C0000003E000
    7FFFF8007FFFFE007FFFFF807FFFFFE07FFFFFF87FFFFFFE7FFFFFFFFFFF}
  Menu = DohodMenu
  OldCreateOrder = True
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object LblAlign: TLabel
    Left = 0
    Top = 0
    Width = 647
    Height = 149
    Align = alTop
    AutoSize = False
    Transparent = True
  end
  object BevelNew4: TBevelNew
    Left = 1
    Top = 0
    Width = 300
    Height = 146
    Caption = 'Портфейл'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Shape = bsFrame
  end
  object DBTextRec7: TDBTextRec
    Left = 166
    Top = 16
    Width = 128
    Height = 20
    Alignment = taCenter
    Color = 15269887
    DataField = 'Chifur'
    DataSource = DtSPortfeil
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    BorderStyle = bsNone
    CheckValue = False
    FontDim.Charset = DEFAULT_CHARSET
    FontDim.Color = clWindowText
    FontDim.Height = -13
    FontDim.Name = 'System'
    FontDim.Style = []
    DimBuffer = 27
    Freese = True
    FreeseWidth = 2
    IsValue = 1
    Redraw = False
    ZeroType = ztInteger
  end
  object DBTextRec14: TDBTextRec
    Left = 166
    Top = 37
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'Broi'
    DataSource = DtSPortfeil
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    BorderStyle = bsNone
    CheckValue = True
    FontDim.Charset = DEFAULT_CHARSET
    FontDim.Color = clWindowText
    FontDim.Height = -13
    FontDim.Name = 'System'
    FontDim.Style = []
    DimBuffer = 27
    Freese = True
    FreeseWidth = 2
    IsValue = 1
    Redraw = False
    ZeroCheck = True
    ZeroType = ztInteger
  end
  object DBTextRec15: TDBTextRec
    Left = 166
    Top = 58
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'Edin_Cena'
    DataSource = DtSPortfeil
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    BorderStyle = bsNone
    CheckValue = True
    CaptionDim = 'лв.'
    FontDim.Charset = DEFAULT_CHARSET
    FontDim.Color = clBlack
    FontDim.Height = -13
    FontDim.Name = 'MS Sans Serif'
    FontDim.Style = []
    DimBuffer = 27
    Freese = True
    FreeseWidth = 2
    IsValue = 1
    Redraw = False
    ZeroCheck = True
    ZeroType = ztFloat
  end
  object DBTextRec16: TDBTextRec
    Left = 166
    Top = 79
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'Stoinost'
    DataSource = DtSPortfeil
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    BorderStyle = bsNone
    CheckValue = True
    CaptionDim = 'лв.'
    FontDim.Charset = DEFAULT_CHARSET
    FontDim.Color = clBlack
    FontDim.Height = -13
    FontDim.Name = 'MS Sans Serif'
    FontDim.Style = []
    DimBuffer = 27
    Freese = True
    FreeseWidth = 2
    IsValue = 1
    Redraw = False
    ZeroCheck = True
    ZeroType = ztFloat
  end
  object DBTextRec17: TDBTextRec
    Left = 166
    Top = 100
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'Otn_dial'
    DataSource = DtSPortfeil
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    BorderStyle = bsNone
    CheckValue = True
    CaptionDim = '%'
    FontDim.Charset = DEFAULT_CHARSET
    FontDim.Color = clBlack
    FontDim.Height = -13
    FontDim.Name = 'MS Sans Serif'
    FontDim.Style = []
    DimBuffer = 27
    Freese = True
    FreeseWidth = 2
    IsValue = 1
    Redraw = False
    ZeroCheck = True
    ZeroType = ztFloat
  end
  object DBTextRec18: TDBTextRec
    Left = 166
    Top = 121
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'Period'
    DataSource = DtSPortfeil
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    BorderStyle = bsNone
    CheckValue = True
    CaptionDim = 'дни'
    FontDim.Charset = DEFAULT_CHARSET
    FontDim.Color = clBlack
    FontDim.Height = -13
    FontDim.Name = 'MS Sans Serif'
    FontDim.Style = []
    DimBuffer = 27
    Freese = True
    FreeseWidth = 2
    IsValue = 1
    Redraw = False
    ZeroCheck = True
    ZeroType = ztInteger
  end
  object Label26: TLabel
    Left = 117
    Top = 18
    Width = 46
    Height = 16
    Alignment = taRightJustify
    Caption = 'Шифър:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label27: TLabel
    Left = 77
    Top = 39
    Width = 86
    Height = 16
    Alignment = taRightJustify
    Caption = 'Брой (Колич.):'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label28: TLabel
    Left = 28
    Top = 60
    Width = 135
    Height = 16
    Alignment = taRightJustify
    Caption = 'Цена на придобиване:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label29: TLabel
    Left = 105
    Top = 81
    Width = 58
    Height = 16
    Alignment = taRightJustify
    Caption = 'Стойност:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label30: TLabel
    Left = 57
    Top = 102
    Width = 106
    Height = 16
    Alignment = taRightJustify
    Caption = 'Относителен дял:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label31: TLabel
    Left = 15
    Top = 123
    Width = 148
    Height = 16
    Alignment = taRightJustify
    Caption = 'Период на притежаване:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Splitter1: TSplitter
    Left = 377
    Top = 149
    Width = 2
    Height = 231
    Cursor = crHSplit
    Beveled = True
    ResizeStyle = rsLine
  end
  object BevelNew2: TBevelNew
    Left = 306
    Top = 0
    Width = 320
    Height = 27
    Caption = 'Списък'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Shape = bsTopLine
  end
  object CBoxSpisuk: TComboBox
    Left = 306
    Top = 18
    Width = 323
    Height = 24
    Style = csDropDownList
    DropDownCount = 16
    ItemHeight = 16
    TabOrder = 0
    OnChange = CBoxSpisukChange
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 149
    Width = 377
    Height = 231
    Align = alLeft
    DataSource = DtSDohod
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    OnDblClick = PMenuChangeClick
    Columns = <
      item
        Expanded = False
        FieldName = 'RedNom'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Broi'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Godina'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prih_Div'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bezpl_Akcii'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Width = 52
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 379
    Top = 149
    Width = 268
    Height = 231
    Align = alClient
    DataSource = DtSSpravka
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'Godina'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUM of Prod_Cena'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUM of Kap_Vuzv'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Width = 117
        Visible = True
      end>
  end
  object QryDohod: TQuery
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
      ' "1_49_83.db"'
      'WHERE'
      ' Doh_Prih = "D"')
    UniDirectional = True
    Left = 28
    Top = 271
    object QryDohodRedNom: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'No по ред'
      DisplayWidth = 4
      FieldName = 'RedNom'
    end
    object QryDohodData: TDateField
      Alignment = taCenter
      DisplayLabel = 'Дата'
      DisplayWidth = 9
      FieldName = 'Data'
    end
    object QryDohodBroi: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Брой'
      DisplayWidth = 8
      FieldName = 'Broi'
    end
    object QryDohodGodina: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Година'
      DisplayWidth = 5
      FieldName = 'Godina'
    end
    object QryDohodPrih_Div: TFloatField
      DisplayLabel = 'Получен дивидент (лв)'
      DisplayWidth = 11
      FieldName = 'Prih_Div'
      DisplayFormat = '# ### ##0.#0'
    end
    object QryDohodBezpl_Akcii: TIntegerField
      DisplayLabel = 'Безпл. акции (бр)'
      DisplayWidth = 7
      FieldName = 'Bezpl_Akcii'
    end
    object QryDohodProd_Cena: TFloatField
      FieldName = 'Prod_Cena'
      Visible = False
    end
    object QryDohodKap_Vuzv: TFloatField
      FieldName = 'Kap_Vuzv'
      Visible = False
    end
    object QryDohodDoh_Prih: TStringField
      FieldName = 'Doh_Prih'
      Visible = False
      Size = 1
    end
  end
  object DtSDohod: TDataSource
    DataSet = QryDohod
    Left = 27
    Top = 323
  end
  object QrySpravka: TQuery
    DatabaseName = 'Portfeil'
    SQL.Strings = (
      'SELECT'
      '  Godina,'
      '  Sum(Prod_Cena),'
      '  Sum(Kap_Vuzv)'
      'FROM'
      ' "1_49_83.db"'
      'WHERE'
      '  Doh_Prih = "D"'
      'GROUP BY '
      '  Godina')
    Left = 490
    Top = 255
    object QrySpravkaGodina: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Година'
      DisplayWidth = 5
      FieldName = 'Godina'
      DisplayFormat = '####'
    end
    object QrySpravkaSUMofProd_Cena: TFloatField
      DisplayLabel = 'Дивидент на акция (лв)'
      DisplayWidth = 11
      FieldName = 'SUM of Prod_Cena'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '######0.#0'
    end
    object QrySpravkaSUMofKap_Vuzv: TFloatField
      DisplayLabel = 'Дивидентна възвращаемост (лв)'
      DisplayWidth = 16
      FieldName = 'SUM of Kap_Vuzv'
      DisplayFormat = '# ### ##0.#0'
    end
  end
  object DtSSpravka: TDataSource
    DataSet = QrySpravka
    Left = 490
    Top = 303
  end
  object DohodMenu: TMainMenu
    Left = 113
    Top = 273
    object N1: TMenuItem
      Caption = 'Доход'
      object N2: TMenuItem
        Caption = 'Дивидент...'
        OnClick = N2Click
      end
      object N4: TMenuItem
        Caption = 'Лихва...'
        OnClick = N4Click
      end
    end
    object N5: TMenuItem
      Caption = 'Редактиране'
      object N7: TMenuItem
        Caption = 'Корекции...'
        OnClick = PMenuChangeClick
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object N9: TMenuItem
        Caption = 'Триене на запис...'
        OnClick = PMenuDeleteClick
      end
    end
    object N10: TMenuItem
      Caption = 'Печат'
      OnClick = N10Click
    end
    object N3: TMenuItem
      Caption = 'Изход'
      OnClick = N3Click
    end
  end
  object QryPortfeil: TQuery
    DatabaseName = 'Portfeil'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' Portdata'
      'WHERE'
      
        ' Chifur in ("ОбА","ПрА","КПрА", "ГДРа", "КОбл", "ККОбл", "ДОбл",' +
        ' "ОбОбл", "ИпОбл", "ПрОбл" ,"Обл", "ДСерт", "ГДРоб")'
      '')
    UniDirectional = True
    Left = 228
    Top = 267
    object QryPortfeilID_Inv: TSmallintField
      FieldName = 'ID_Inv'
    end
    object QryPortfeilData_Inv: TDateField
      FieldName = 'Data_Inv'
    end
    object QryPortfeilChifur: TStringField
      Alignment = taCenter
      FieldName = 'Chifur'
      Size = 6
    end
    object QryPortfeilBroi: TIntegerField
      FieldName = 'Broi'
      DisplayFormat = '# ### ### ##0'
    end
    object QryPortfeilEdin_Cena: TFloatField
      FieldName = 'Edin_Cena'
      DisplayFormat = '# ### ##0.#0##'
    end
    object QryPortfeilStoinost: TFloatField
      FieldName = 'Stoinost'
      DisplayFormat = '# ### ##0.#0'
    end
    object QryPortfeilOtn_dial: TFloatField
      FieldName = 'Otn_dial'
      DisplayFormat = '# ### ##0.#0'
    end
    object QryPortfeilDrugestvo: TStringField
      FieldName = 'Drugestvo'
      Size = 50
    end
    object QryPortfeilPeriod: TIntegerField
      FieldName = 'Period'
    end
    object QryPortfeilInv_File: TStringField
      FieldName = 'Inv_File'
      Size = 8
    end
    object QryPortfeilSuma_Div: TFloatField
      FieldName = 'Suma_Div'
    end
    object QryPortfeilSuma_Prod: TFloatField
      FieldName = 'Suma_Prod'
    end
    object QryPortfeilVuzv_Obtcha: TFloatField
      FieldName = 'Vuzv_Obtcha'
    end
    object QryPortfeilPazar_Stoin: TFloatField
      FieldName = 'Pazar_Stoin'
    end
    object QryPortfeilPurvo_Stoi: TFloatField
      FieldName = 'Purvo_Stoi'
    end
    object QryPortfeilVuzv_God: TFloatField
      FieldName = 'Vuzv_God'
    end
    object QryPortfeilPazar_Cena: TFloatField
      FieldName = 'Pazar_Cena'
    end
    object QryPortfeilInv_Stoi: TFloatField
      FieldName = 'Inv_Stoi'
    end
    object QryPortfeilPurvo_Broi: TIntegerField
      FieldName = 'Purvo_Broi'
      DisplayFormat = '# ### ##0'
    end
    object QryPortfeilPurvo_Cena: TFloatField
      FieldName = 'Purvo_Cena'
    end
    object QryPortfeilPurvo_Razhod: TFloatField
      FieldName = 'Purvo_Razhod'
    end
    object QryPortfeilValid_Padeg: TDateField
      FieldName = 'Valid_Padeg'
    end
    object QryPortfeilProd_Pokupka: TIntegerField
      FieldName = 'Prod_Pokupka'
    end
    object QryPortfeilN_F_D_Cena: TFloatField
      FieldName = 'N_F_D_Cena'
    end
    object QryPortfeilKup_Lihva: TFloatField
      FieldName = 'Kup_Lihva'
    end
    object QryPortfeilAlternativa: TFloatField
      FieldName = 'Alternativa'
    end
    object QryPortfeilMemo: TBlobField
      FieldName = 'Memo'
      BlobType = ftBlob
      Size = 240
    end
    object QryPortfeilKapLihva: TFloatField
      FieldName = 'KapLihva'
    end
    object QryPortfeilInv_Stoi_Alternat: TFloatField
      FieldName = 'Inv_Stoi_Alternat'
    end
  end
  object DtSPortfeil: TDataSource
    DataSet = QryPortfeil
    Left = 294
    Top = 263
  end
end
