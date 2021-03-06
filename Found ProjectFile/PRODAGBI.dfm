object DlgProdagbi: TDlgProdagbi
  Left = 99
  Top = 55
  Width = 651
  Height = 461
  HelpContext = 300
  ActiveControl = CBoxSpisuk
  Caption = 'Продажби'
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
    000000000000000000000000000000000007777FF77F777F777FF77700000000
    00077F77F777F77F777777770000000000077F7777777F7777F7777F00000000
    000777777FFF777777777F7F00000000000F77FF777777FF77777F7F00000000
    00077F77F7777FF77F7777770000000000077777F77FF77F7F77F77700000000
    000F777F77FF77777777F77F000000000007777777F7F777F77FFF7700000000
    000F7777F77777F77F777F7700000000000F7FF7777777FF77777F7700000000
    000F77F7FF7F7777FFF77777000000000007FF7F7F7FF7F7FFF777F700000000
    000F7777FF77FFF777777777000000000007777777FF7F7FFF7F777700000000
    000F7F77FF77F77777F7F777000000000007FFF7777F777F7F777F7700000000
    000777777FF77F7F777F7F770000000000077F7FF000000000FF777F00000000
    000777FF0FFFFFFFFF07F77700000000000FF7770FFFFFFFFF07777F00000000
    00077FF70FFFFFFFFF077F7F00000000000FF7770FFFFFFFFF07777F00000000
    0007777F0FFFFFFFFF0F777F0000000000077FFF0FFFFFFFFF0FF77700000000
    000F77F7F0000000007F77FF000000000007F777F777F777FFF7777700000000
    000F7F777777F777777F777700000000000FF7F777F7777777F7F77700000000
    00077F7F7FF777777FF7777F000000000000000000000000000000000000E000
    000FE0000007E0000007E0000007E0000007E0000007E0000007E0000007E000
    0007E0000007E0000007E0000007E0000007E0000007E0000007E0000007E000
    0007E0000007E0000007E0000007E0000007E0000007E0000007E0000007E000
    0007E0000007E0000007E0000007E0000007E0000007E0000007E000000F}
  Menu = MenuProdagbi
  OldCreateOrder = True
  PrintScale = poNone
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object BevelNew4: TBevelNew
    Left = 2
    Top = 0
    Width = 305
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
  object LblAlign: TLabel
    Left = 0
    Top = 0
    Width = 643
    Height = 192
    Align = alTop
    AutoSize = False
    Transparent = True
  end
  object BevelNew1: TBevelNew
    Left = 310
    Top = 118
    Width = 323
    Height = 71
    Caption = 'Продажби'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Shape = bsFrame
  end
  object DBTextRec7: TDBTextRec
    Left = 498
    Top = 135
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'Broi'
    DataSource = DtSSumaProd
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    BorderStyle = bsSingle
    CheckValue = True
    FontDim.Charset = DEFAULT_CHARSET
    FontDim.Color = clWindowText
    FontDim.Height = -13
    FontDim.Name = 'System'
    FontDim.Style = []
    DimBuffer = 23
    Freese = True
    FreeseWidth = 2
    IsValue = 1
    Redraw = False
    ZeroCheck = True
    ZeroType = ztInteger
  end
  object DBTextRec8: TDBTextRec
    Left = 498
    Top = 160
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'NetenPrihod'
    DataSource = DtSSumaProd
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    BorderStyle = bsSingle
    CheckValue = True
    CaptionDim = 'лв.'
    FontDim.Charset = DEFAULT_CHARSET
    FontDim.Color = clBlack
    FontDim.Height = -13
    FontDim.Name = 'MS Sans Serif'
    FontDim.Style = []
    DimBuffer = 23
    Freese = True
    FreeseWidth = 2
    IsValue = 1
    Redraw = False
    ZeroCheck = True
    ZeroType = ztFloat
  end
  object Label14: TLabel
    Left = 411
    Top = 137
    Width = 86
    Height = 16
    Alignment = taRightJustify
    Caption = 'Брой (Колич.):'
    Transparent = True
  end
  object Label15: TLabel
    Left = 411
    Top = 161
    Width = 86
    Height = 16
    Alignment = taRightJustify
    Caption = 'Нетен приход:'
    Transparent = True
  end
  object DBTextRec1: TDBTextRec
    Left = 174
    Top = 16
    Width = 128
    Height = 20
    Alignment = taCenter
    Color = 15269887
    DataField = 'Chifur'
    DataSource = DtSPortfeil
    ParentColor = False
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
    Left = 174
    Top = 37
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'Broi'
    DataSource = DtSPortfeil
    ParentColor = False
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
    Left = 174
    Top = 58
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'Edin_Cena'
    DataSource = DtSPortfeil
    ParentColor = False
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
    Left = 174
    Top = 79
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'Stoinost'
    DataSource = DtSPortfeil
    ParentColor = False
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
    Left = 174
    Top = 100
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'Otn_dial'
    DataSource = DtSPortfeil
    ParentColor = False
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
    Left = 174
    Top = 121
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'Period'
    DataSource = DtSPortfeil
    ParentColor = False
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
    Left = 125
    Top = 17
    Width = 46
    Height = 16
    Alignment = taRightJustify
    Caption = 'Шифър:'
    Transparent = True
  end
  object Label27: TLabel
    Left = 85
    Top = 38
    Width = 86
    Height = 16
    Alignment = taRightJustify
    Caption = 'Брой (Колич.):'
    Transparent = True
  end
  object Label28: TLabel
    Left = 36
    Top = 59
    Width = 135
    Height = 16
    Alignment = taRightJustify
    Caption = 'Цена на придобиване:'
    Transparent = True
  end
  object Label29: TLabel
    Left = 113
    Top = 80
    Width = 58
    Height = 16
    Alignment = taRightJustify
    Caption = 'Стойност:'
    Transparent = True
  end
  object Label30: TLabel
    Left = 65
    Top = 101
    Width = 106
    Height = 16
    Alignment = taRightJustify
    Caption = 'Относителен дял:'
    Transparent = True
  end
  object Label31: TLabel
    Left = 23
    Top = 122
    Width = 148
    Height = 16
    Alignment = taRightJustify
    Caption = 'Период на притежаване:'
    Transparent = True
  end
  object Bevel1: TBevel
    Left = 2
    Top = 149
    Width = 305
    Height = 40
  end
  object Label50: TLabel
    Left = 3
    Top = 152
    Width = 168
    Height = 33
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Първоначална стойност на инвестицията:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object DBTextRec19: TDBTextRec
    Left = 174
    Top = 159
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'Purvo_Stoi'
    DataSource = DtSPortfeil
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    BorderStyle = bsSingle
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
  object BevelNew2: TBevelNew
    Left = 310
    Top = 0
    Width = 323
    Height = 31
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
    Left = 310
    Top = 22
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
    Top = 192
    Width = 643
    Height = 220
    Align = alClient
    DataSource = DtSProdagbi
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
        Width = 35
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
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prod_Cena'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prih_Div'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Razhodi'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kap_Pechalba'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kap_Vuzv'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Width = 137
        Visible = True
      end>
  end
  object MenuProdagbi: TMainMenu
    Left = 173
    Top = 281
    object N3: TMenuItem
      Caption = 'Продажби'
      OnClick = N3Click
    end
    object N2: TMenuItem
      Caption = 'Редактиране'
      object N4: TMenuItem
        Caption = 'Корекции...'
        OnClick = PMenuChangeClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object N7: TMenuItem
        Caption = 'Триене на запис...'
        OnClick = PMenuDeleteClick
      end
    end
    object N8: TMenuItem
      Caption = 'Печат'
      OnClick = N8Click
    end
    object N1: TMenuItem
      Caption = 'Изход'
      OnClick = N1Click
    end
  end
  object QryProdagbi: TQuery
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
      ' "5_14_49.DB"'
      'WHERE'
      ' Doh_Prih = '#39'P'#39' ')
    Left = 28
    Top = 230
    object QryProdagbiRedNom: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'No по ред'
      DisplayWidth = 4
      FieldName = 'RedNom'
      DisplayFormat = '#####0'
      EditFormat = '######0'
    end
    object QryProdagbiData: TDateField
      Alignment = taCenter
      DisplayLabel = 'Дата'
      DisplayWidth = 10
      FieldName = 'Data'
    end
    object QryProdagbiBroi: TIntegerField
      Alignment = taCenter
      DisplayLabel = '~Брой (Колич.)'
      DisplayWidth = 5
      FieldName = 'Broi'
      DisplayFormat = '# ### ##0'
      EditFormat = '######0'
    end
    object QryProdagbiProd_Cena: TFloatField
      DisplayLabel = 'Продажна цена ~(лв)'
      DisplayWidth = 11
      FieldName = 'Prod_Cena'
      DisplayFormat = '# ### ##0.#0##'
      EditFormat = '#0.#####'
    end
    object QryProdagbiPrih_Div: TFloatField
      DisplayLabel = '~Приход (лв)'
      DisplayWidth = 8
      FieldName = 'Prih_Div'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '######0.#0'
    end
    object QryProdagbiRazhodi: TFloatField
      DisplayLabel = '~Разход (лв)'
      DisplayWidth = 8
      FieldName = 'Razhodi'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '######0.#0'
    end
    object QryProdagbiKap_Pechalba: TFloatField
      DisplayLabel = 'Капиталова печалба /загуба/ (лв)'
      DisplayWidth = 17
      FieldName = 'Kap_Pechalba'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '######0.#0'
    end
    object QryProdagbiKap_Vuzv: TFloatField
      DisplayLabel = 'Капиталова възвращаемост (на годишна база) (%)'
      DisplayWidth = 17
      FieldName = 'Kap_Vuzv'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '######0.#0'
    end
    object QryProdagbiDoh_Prih: TStringField
      FieldName = 'Doh_Prih'
      Visible = False
      Size = 1
    end
  end
  object DtSProdagbi: TDataSource
    DataSet = QryProdagbi
    Left = 97
    Top = 231
  end
  object QryPortfeil: TQuery
    DatabaseName = 'Portfeil'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' Portdata'
      '')
    UniDirectional = True
    Left = 398
    Top = 244
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
      DisplayFormat = '# ### ##0'
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
      Origin = '"Portdata.DB".Period'
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
    object QryPortfeilPazar_Cena: TFloatField
      FieldName = 'Pazar_Cena'
    end
    object QryPortfeilPazar_Stoin: TFloatField
      FieldName = 'Pazar_Stoin'
    end
    object QryPortfeilInv_Stoi: TFloatField
      FieldName = 'Inv_Stoi'
    end
    object QryPortfeilPurvo_Stoi: TFloatField
      FieldName = 'Purvo_Stoi'
      DisplayFormat = '# ### ##0.#0'
    end
    object QryPortfeilVuzv_God: TFloatField
      FieldName = 'Vuzv_God'
    end
    object QryPortfeilKapLihva: TFloatField
      FieldName = 'KapLihva'
    end
    object QryPortfeilInv_Stoi_Alternat: TFloatField
      FieldName = 'Inv_Stoi_Alternat'
    end
    object QryPortfeilPurvo_Broi: TIntegerField
      FieldName = 'Purvo_Broi'
      DisplayFormat = '# ### ##0'
    end
    object QryPortfeilPurvo_Cena: TFloatField
      FieldName = 'Purvo_Cena'
      DisplayFormat = '# ### ##0.#0##'
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
  end
  object DtSPortfeil: TDataSource
    DataSet = QryPortfeil
    Left = 396
    Top = 296
  end
  object QrySumaProd: TQuery
    DatabaseName = 'Portfeil'
    SQL.Strings = (
      'SELECT '
      ' Sum(Broi) Broi, '
      ' Sum(Prih_Div - Razhodi) NetenPrihod'
      'FROM'
      ' "5_14_49.DB"'
      'WHERE'
      ' Doh_Prih = '#39'P'#39' ')
    Left = 25
    Top = 280
    object QrySumaProdBroi: TFloatField
      FieldName = 'Broi'
      DisplayFormat = '# ### ##0'
    end
    object QrySumaProdNetenPrihod: TFloatField
      FieldName = 'NetenPrihod'
      DisplayFormat = '# ### ##0.#0'
    end
  end
  object DtSSumaProd: TDataSource
    DataSet = QrySumaProd
    Left = 96
    Top = 280
  end
end
