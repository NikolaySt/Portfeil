object DlgPortfeil: TDlgPortfeil
  Left = 9
  Top = 30
  Width = 950
  Height = 671
  HelpContext = 500
  ActiveControl = DbGridPortfeil
  Caption = 'Съдържание на портфейла'
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
    000B3B3B3B33330000BB3B3000000000B3B3B3B3333333030BB3303300000003
    3330000000000030BB0B3B3330000003333B8B8383333033BBBB333330000000
    3333333333330B3B3BB33B3B3B0000000B3B3B3333330B3B33B3BBB3330000B3
    B3B3B3B333330B3B333BBB333B0003333000000000000B3B33BBBBB3B3000300
    000B3B3B33330B3B333BB0B33B000030B3B3B3B3B3330B3B333BBBB3B3000303
    3333333333330B33333BBB3B3B000003000B888383830BB33333333BB0000000
    33330000000000B33B3333BB300000033000B3B3B3B3B0BB33330BBB00000000
    0B3B3B3B3B3B3B0BB33B3BB00000000033333333333333300B33330000000000
    3000BBB838383830003000000000000003333380000000000000000000000000
    3338000B3B3B3B3B3B000000000000000330B3B3B3B3B3B3B3B3300000000000
    0003333FFFFFF33333333300000000000003088BBBB3B3B3B300030000000000
    000033333BBBBB3B3B33300000000000000333B3B3BBBBB3B3B3330000000000
    0000333B3BBBBBBB333330000000000000000003B3B3BFFFFB00000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFE003C1FF000000FE0000007C0000003C0000003C0000001C00000018000
    00010000000100000001000000010000000180000003C0000003C0000007E000
    000FE000001FE00000FFE00000FFE000007FF000003FF800001FFC00001FFC00
    001FFC00001FFE00003FFF00007FFFE003FFFFFFFFFFFFFFFFFFFFFFFFFF}
  KeyPreview = True
  Menu = MenuPortfeil
  OldCreateOrder = True
  PrintScale = poNone
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object LblTop: TLabelRec
    Left = 0
    Top = 0
    Width = 942
    Height = 156
    Align = alTop
    AutoSize = False
    BorderStyle = bsNone
    Color = clWhite
    DimBuffer = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FontDim.Charset = DEFAULT_CHARSET
    FontDim.Color = clWindowText
    FontDim.Height = -13
    FontDim.Name = 'System'
    FontDim.Style = []
    Freese = False
    FreeseWidth = 0
    ParentFont = False
    ParentColor = False
    Redraw = False
    Transparent = True
  end
  object BevelNew1: TBevelNew
    Left = 1
    Top = 0
    Width = 697
    Height = 63
    Caption = 'Сравнение'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Shape = bsFrame
  end
  object BevelNew3: TBevelNew
    Left = 358
    Top = 65
    Width = 340
    Height = 66
    Caption = 'Показатели'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Shape = bsFrame
  end
  object BevelNew2: TBevelNew
    Left = 1
    Top = 65
    Width = 349
    Height = 88
    Caption = 'Стойност'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Shape = bsFrame
  end
  object LblTextRec1: TLabelRec
    Left = 213
    Top = 37
    Width = 128
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0.00'
    CaptionDim = 'лв.'
    Color = 15269887
    DimBuffer = 23
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    FontDim.Charset = DEFAULT_CHARSET
    FontDim.Color = clBlack
    FontDim.Height = -13
    FontDim.Name = 'MS Sans Serif'
    FontDim.Style = []
    Freese = True
    FreeseWidth = 2
    ParentFont = False
    ParentColor = False
    Redraw = False
  end
  object LblTextRec2: TLabelRec
    Left = 213
    Top = 15
    Width = 128
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0.00'
    CaptionDim = 'лв.'
    Color = 15269887
    DimBuffer = 23
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    FontDim.Charset = DEFAULT_CHARSET
    FontDim.Color = clBlack
    FontDim.Height = -13
    FontDim.Name = 'MS Sans Serif'
    FontDim.Style = []
    Freese = True
    FreeseWidth = 2
    ParentFont = False
    ParentColor = False
    Redraw = False
  end
  object LblTextRec3: TLabelRec
    Left = 212
    Top = 81
    Width = 128
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0.00'
    CaptionDim = 'лв.'
    Color = 15269887
    DimBuffer = 23
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    FontDim.Charset = DEFAULT_CHARSET
    FontDim.Color = clBlack
    FontDim.Height = -13
    FontDim.Name = 'MS Sans Serif'
    FontDim.Style = []
    Freese = True
    FreeseWidth = 2
    ParentFont = False
    ParentColor = False
    Redraw = False
  end
  object LblTextRec4: TLabelRec
    Left = 212
    Top = 103
    Width = 128
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0.00'
    CaptionDim = 'лв.'
    Color = 15269887
    DimBuffer = 23
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    FontDim.Charset = DEFAULT_CHARSET
    FontDim.Color = clBlack
    FontDim.Height = -13
    FontDim.Name = 'MS Sans Serif'
    FontDim.Style = []
    Freese = True
    FreeseWidth = 2
    ParentFont = False
    ParentColor = False
    Redraw = False
  end
  object Label4: TLabel
    Left = 67
    Top = 83
    Width = 143
    Height = 16
    Alignment = taRightJustify
    Caption = 'Стойност на портфейла:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 15
    Top = 105
    Width = 195
    Height = 16
    Alignment = taRightJustify
    Caption = 'Пазарна стойност на портфейла:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 358
    Top = 18
    Width = 202
    Height = 16
    Alignment = taRightJustify
    Caption = 'Възвращаемост от инвестициите:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 131
    Top = 39
    Width = 79
    Height = 16
    Alignment = taRightJustify
    Caption = 'Алтернатива:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label8: TLabel
    Left = 100
    Top = 17
    Width = 110
    Height = 16
    Alignment = taRightJustify
    Caption = 'От инвенстициите:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label18: TLabel
    Left = 407
    Top = 83
    Width = 153
    Height = 16
    Alignment = taRightJustify
    Caption = 'Основен лихвен процент:'
    Color = clBtnFace
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label19: TLabel
    Left = 667
    Top = 81
    Width = 12
    Height = 16
    Caption = '%'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label21: TLabel
    Left = 466
    Top = 105
    Width = 94
    Height = 16
    Alignment = taRightJustify
    Caption = 'Борсов индекс:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label11: TLabel
    Left = 395
    Top = 40
    Width = 165
    Height = 16
    Alignment = taRightJustify
    Caption = 'Ефективен лихвен процент:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 23
    Top = 127
    Width = 187
    Height = 16
    Alignment = taRightJustify
    Caption = 'Възвращаемост на портфейла:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object LabelRec1: TLabelRec
    Left = 212
    Top = 125
    Width = 128
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0.00'
    CaptionDim = '%'
    Color = 15269887
    DimBuffer = 23
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    FontDim.Charset = DEFAULT_CHARSET
    FontDim.Color = clBlack
    FontDim.Height = -13
    FontDim.Name = 'MS Sans Serif'
    FontDim.Style = []
    Freese = True
    FreeseWidth = 2
    ParentFont = False
    ParentColor = False
    Redraw = False
  end
  object LabelRec2: TLabelRec
    Left = 563
    Top = 15
    Width = 128
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0.00'
    CaptionDim = '%'
    Color = 15269887
    DimBuffer = 23
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    FontDim.Charset = DEFAULT_CHARSET
    FontDim.Color = clBlack
    FontDim.Height = -13
    FontDim.Name = 'MS Sans Serif'
    FontDim.Style = []
    Freese = True
    FreeseWidth = 2
    ParentFont = False
    ParentColor = False
    Redraw = False
  end
  object LabelRec3: TLabelRec
    Left = 563
    Top = 37
    Width = 128
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0.00'
    CaptionDim = '%'
    Color = 15269887
    DimBuffer = 23
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    FontDim.Charset = DEFAULT_CHARSET
    FontDim.Color = clBlack
    FontDim.Height = -13
    FontDim.Name = 'MS Sans Serif'
    FontDim.Style = []
    Freese = True
    FreeseWidth = 2
    ParentFont = False
    ParentColor = False
    Redraw = False
  end
  object LblData: TLabelRec
    Left = 358
    Top = 134
    Width = 340
    Height = 19
    Alignment = taCenter
    AutoSize = False
    Caption = 'Съдържание на портфейла към'
    Color = 13494247
    DimBuffer = 0
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    FontDim.Charset = DEFAULT_CHARSET
    FontDim.Color = clWindowText
    FontDim.Height = -13
    FontDim.Name = 'System'
    FontDim.Style = []
    Freese = False
    FreeseWidth = 0
    ParentFont = False
    ParentColor = False
    Redraw = False
  end
  object DbGridPortfeil: TDBGrid
    Left = 0
    Top = 156
    Width = 942
    Height = 447
    Align = alClient
    Ctl3D = True
    DataSource = DtSPortfeil
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnDrawColumnCell = DbGridPortfeilDrawColumnCell
    OnExit = DbGridPortfeilExit
    OnKeyDown = DBGridPortfeilKeyDown
    OnKeyPress = DbGridPortfeilKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_Inv'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Color = clAqua
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Inv'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Color = clAqua
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Chifur'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Color = clAqua
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Broi'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Color = clAqua
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Edin_Cena'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Color = clAqua
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Stoinost'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Color = clAqua
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Otn_dial'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Color = clAqua
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Drugestvo'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Color = clWhite
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pazar_Cena'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pazar_Stoin'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Color = clAqua
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Period'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Color = clAqua
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vuzv_Obtcha'
        ReadOnly = True
        Title.Caption = 'Възвращ. %'
        Title.Color = clAqua
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CALC_CHANGE'
        Title.Caption = 'Промяна ~(лв.)'
        Title.Color = clAqua
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 72
        Visible = True
      end>
  end
  object EdtLihva: TValueEdit
    Left = 563
    Top = 79
    Width = 101
    Height = 22
    AutoSize = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MaxLength = 7
    ParentFont = False
    TabOrder = 1
    OnEnter = EdtIndexEnter
    OnExit = EdtLihvaExit
    OnKeyDown = EdtLihvaKeyDown
    OnKeyPress = EdtLihvaKeyPress
    OnKeyUp = EdtLihvaKeyUp
    Format = '#0.#0'
    TypeValue = tvReal
  end
  object EdtIndex: TValueEdit
    Left = 563
    Top = 103
    Width = 101
    Height = 22
    AutoSize = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MaxLength = 7
    ParentFont = False
    TabOrder = 2
    OnEnter = EdtIndexEnter
    OnExit = EdtIndexExit
    OnKeyDown = EdtIndexKeyDown
    OnKeyPress = EdtIndexKeyPress
    OnKeyUp = EdtIndexKeyUp
    Format = '#0.#0'
    TypeValue = tvReal
  end
  object Status: TStatusBar
    Left = 0
    Top = 603
    Width = 942
    Height = 19
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Panels = <
      item
        Width = 150
      end
      item
        Width = 235
      end
      item
        Width = 200
      end
      item
        Width = 70
      end>
    SimplePanel = False
    SizeGrip = False
    UseSystemFont = False
  end
  object DtSPortfeil: TDataSource
    DataSet = QryPortfeil
    OnDataChange = DtSPortfeilDataChange
    Left = 70
    Top = 298
  end
  object QrySumaPort: TQuery
    DatabaseName = 'Portfeil'
    SQL.Strings = (
      'SELECT '
      'Sum(Inv_Stoi) InvStoi, '
      'Sum(Alternativa) Alternativa, '
      'Sum(Stoinost) SumStoi, '
      'Sum(Pazar_Stoin) SumPStoi,'
      'Sum(Purvo_Stoi) PurvoStoi'
      'FROM "PortData.DB"')
    Left = 145
    Top = 243
    object QrySumaPortInvStoi: TFloatField
      FieldName = 'InvStoi'
      DisplayFormat = '# ### ##0.#0'
    end
    object QrySumaPortAlternativa: TFloatField
      FieldName = 'Alternativa'
      DisplayFormat = '# ### ##0.#0'
    end
    object QrySumaPortSumStoi: TFloatField
      FieldName = 'SumStoi'
      DisplayFormat = '# ### ##0.#0'
    end
    object QrySumaPortSumPStoi: TFloatField
      FieldName = 'SumPStoi'
      DisplayFormat = '# ### ##0.#0'
    end
    object QrySumaPortPurvoStoi: TFloatField
      FieldName = 'PurvoStoi'
      DisplayFormat = '# ### ##0.#0'
    end
  end
  object DtSQrySuma: TDataSource
    DataSet = QrySumaPort
    Left = 147
    Top = 298
  end
  object QryPortfeil: TQuery
    BeforePost = QryPortfeilBeforePost
    AfterPost = QryPortfeilAfterPost
    OnCalcFields = QryPortfeilCalcFields
    DatabaseName = 'Portfeil'
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      ' *'
      'FROM'
      ' PortData'
      '')
    UniDirectional = True
    Left = 73
    Top = 243
    object QryPortfeilID_Inv: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'No'
      DisplayWidth = 3
      FieldName = 'ID_Inv'
    end
    object QryPortfeilData_Inv: TDateField
      Alignment = taCenter
      DisplayLabel = 'Дата'
      DisplayWidth = 9
      FieldName = 'Data_Inv'
    end
    object QryPortfeilChifur: TStringField
      Alignment = taCenter
      DisplayLabel = 'Шифър'
      DisplayWidth = 7
      FieldName = 'Chifur'
      Size = 6
    end
    object QryPortfeilBroi: TIntegerField
      Alignment = taCenter
      DisplayLabel = '~Брой (Колич.)'
      DisplayWidth = 7
      FieldName = 'Broi'
      DisplayFormat = '# ### ##0'
    end
    object QryPortfeilEdin_Cena: TFloatField
      DisplayLabel = 'Цена на придобиване (лв)'
      DisplayWidth = 13
      FieldName = 'Edin_Cena'
      DisplayFormat = '# ### ##0.#0##'
      EditFormat = '#0.#####'
    end
    object QryPortfeilStoinost: TFloatField
      DisplayLabel = '~Стойност (лв)'
      DisplayWidth = 9
      FieldName = 'Stoinost'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '#0.####'
      Precision = 2
    end
    object QryPortfeilOtn_dial: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Отн. дял в (%)'
      DisplayWidth = 6
      FieldName = 'Otn_dial'
      DisplayFormat = '##0.#0'
      EditFormat = '#0.####'
    end
    object QryPortfeilDrugestvo: TStringField
      DisplayLabel = 'Дружество (Емитент, издател...)'
      DisplayWidth = 13
      FieldName = 'Drugestvo'
      Size = 50
    end
    object QryPortfeilPazar_Cena: TFloatField
      DisplayLabel = 'Пазарна цена ~(лв)'
      DisplayWidth = 8
      FieldName = 'Pazar_Cena'
      DisplayFormat = '# ### ##0.#0##'
      EditFormat = '#0.#####'
    end
    object QryPortfeilPazar_Stoin: TFloatField
      DisplayLabel = 'Пазарна стойност ~(лв)'
      DisplayWidth = 9
      FieldName = 'Pazar_Stoin'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '#0.###'
    end
    object QryPortfeilPeriod: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Период на притежаване в дни'
      FieldName = 'Period'
      Origin = '"Portdata.DB".Period'
      DisplayFormat = '# ### ### ##0'
    end
    object QryPortfeilPurvo_Broi: TIntegerField
      FieldName = 'Purvo_Broi'
      Visible = False
    end
    object QryPortfeilPurvo_Cena: TFloatField
      FieldName = 'Purvo_Cena'
      Visible = False
    end
    object QryPortfeilPurvo_Stoi: TFloatField
      FieldName = 'Purvo_Stoi'
      Visible = False
    end
    object QryPortfeilPurvo_Razhod: TFloatField
      FieldName = 'Purvo_Razhod'
      Visible = False
    end
    object QryPortfeilValid_Padeg: TDateField
      FieldName = 'Valid_Padeg'
      Visible = False
    end
    object QryPortfeilProd_Pokupka: TIntegerField
      FieldName = 'Prod_Pokupka'
      Visible = False
    end
    object QryPortfeilN_F_D_Cena: TFloatField
      FieldName = 'N_F_D_Cena'
      Visible = False
    end
    object QryPortfeilKup_Lihva: TFloatField
      FieldName = 'Kup_Lihva'
      Visible = False
    end
    object QryPortfeilInv_Stoi: TFloatField
      FieldName = 'Inv_Stoi'
      Visible = False
    end
    object QryPortfeilAlternativa: TFloatField
      FieldName = 'Alternativa'
      Visible = False
    end
    object QryPortfeilSuma_Div: TFloatField
      FieldName = 'Suma_Div'
      Visible = False
    end
    object QryPortfeilSuma_Prod: TFloatField
      FieldName = 'Suma_Prod'
      Visible = False
    end
    object QryPortfeilVuzv_Obtcha: TFloatField
      FieldName = 'Vuzv_Obtcha'
      Visible = False
      DisplayFormat = '# ### ##0.#0'
    end
    object QryPortfeilInv_File: TStringField
      FieldName = 'Inv_File'
      Visible = False
      Size = 8
    end
    object QryPortfeilMemo: TBlobField
      FieldName = 'Memo'
      Visible = False
      BlobType = ftBlob
      Size = 240
    end
    object QryPortfeilVuzv_God: TFloatField
      FieldName = 'Vuzv_God'
      Visible = False
    end
    object QryPortfeilKapLihva: TFloatField
      FieldName = 'KapLihva'
      Visible = False
    end
    object QryPortfeilInv_Stoi_Alternat: TFloatField
      FieldName = 'Inv_Stoi_Alternat'
      Visible = False
    end
    object QryPortfeilCALC_CHANGE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_CHANGE'
      DisplayFormat = '# ### ### ##0.#0'
      Calculated = True
    end
  end
  object QryPazrcenaUpDate: TQuery
    DatabaseName = 'Portfeil'
    RequestLive = True
    SQL.Strings = (
      'UPDATE "PazrCena.DB" '
      'SET Pazar_Cena = :Cena'
      'WHERE ID_Inv = :ID AND Data = :Data1')
    UniDirectional = True
    Left = 237
    Top = 245
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Cena'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftSmallint
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'Data1'
        ParamType = ptInput
      end>
  end
  object MenuPortfeil: TMainMenu
    Left = 239
    Top = 346
    object N20: TMenuItem
      Caption = 'Избор'
      object N22: TMenuItem
        Caption = 'Управление...'
        ShortCut = 16469
        OnClick = N22Click
      end
      object N23: TMenuItem
        Caption = 'Картотека...'
        ShortCut = 16459
        OnClick = N23Click
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object N13: TMenuItem
        Caption = 'Изход'
        ShortCut = 32883
        OnClick = N13Click
      end
    end
    object N1: TMenuItem
      Caption = 'Сортиране'
      object N2: TMenuItem
        Tag = 12
        Caption = 'Дата'
        OnClick = SortPortfeil
      end
      object N3: TMenuItem
        Tag = 13
        Caption = 'Шифър'
        OnClick = SortPortfeil
      end
      object N4: TMenuItem
        Tag = 14
        Caption = 'Брой'
        OnClick = SortPortfeil
      end
      object N5: TMenuItem
        Tag = 15
        Caption = 'Цена'
        OnClick = SortPortfeil
      end
      object N6: TMenuItem
        Tag = 16
        Caption = 'Стойност'
        OnClick = SortPortfeil
      end
      object N7: TMenuItem
        Tag = 17
        Caption = 'Относителен дял'
        OnClick = SortPortfeil
      end
      object N8: TMenuItem
        Tag = 18
        Caption = 'Дружество'
        OnClick = SortPortfeil
      end
      object N9: TMenuItem
        Tag = 19
        Caption = 'Пазарна цена'
        OnClick = SortPortfeil
      end
      object N10: TMenuItem
        Tag = 110
        Caption = 'Пазарна стойност'
        OnClick = SortPortfeil
      end
      object N11: TMenuItem
        Tag = 111
        Caption = 'Период на притежаване'
        OnClick = SortPortfeil
      end
      object N44: TMenuItem
        Caption = '-'
      end
      object N12: TMenuItem
        Tag = 11
        Caption = 'Подреден'
        OnClick = SortPortfeil
      end
    end
    object N14: TMenuItem
      Caption = 'Филтър'
      object N15: TMenuItem
        Caption = 'Възвращаемост'
        object N301: TMenuItem
          Tag = 211
          Caption = 'Суперзвезди >= 30 %'
          OnClick = SortPortfeil
        end
        object N201: TMenuItem
          Tag = 212
          Caption = 'Минизвезди  >= 20 %'
          OnClick = SortPortfeil
        end
        object N24: TMenuItem
          Tag = 213
          Caption = 'Пълзящи'
          OnClick = SortPortfeil
        end
        object N25: TMenuItem
          Tag = 214
          Caption = 'Губещи'
          OnClick = SortPortfeil
        end
      end
      object N26: TMenuItem
        Caption = 'Групиране'
        object N27: TMenuItem
          Tag = 220
          Caption = 'Акции'
          OnClick = SortPortfeil
        end
        object N28: TMenuItem
          Tag = 221
          Caption = 'Облигации'
          OnClick = SortPortfeil
        end
        object N34: TMenuItem
          Tag = 222
          Caption = 'Съкр. бонове'
          OnClick = SortPortfeil
        end
        object N32: TMenuItem
          Tag = 223
          Caption = 'Деп. сертификати'
          OnClick = SortPortfeil
        end
        object N31: TMenuItem
          Tag = 224
          Caption = 'ГДР'
          OnClick = SortPortfeil
        end
        object N50: TMenuItem
          Tag = 225
          Caption = 'Записи'
          OnClick = SortPortfeil
        end
        object N30: TMenuItem
          Tag = 226
          Caption = 'Опции'
          OnClick = SortPortfeil
        end
        object N35: TMenuItem
          Tag = 227
          Caption = 'Варанти'
          OnClick = SortPortfeil
        end
        object N36: TMenuItem
          Tag = 228
          Caption = 'Права'
          OnClick = SortPortfeil
        end
        object N29: TMenuItem
          Tag = 229
          Caption = 'Твърда валута'
          OnClick = SortPortfeil
        end
        object N33: TMenuItem
          Tag = 2210
          Caption = 'Ценности'
          OnClick = SortPortfeil
        end
      end
      object N37: TMenuItem
        Caption = 'Инвестиции'
        object N39: TMenuItem
          Tag = 231
          Caption = 'Печеливши  A...'
          OnClick = SortPortfeil
        end
        object N38: TMenuItem
          Tag = 232
          Caption = 'Губещи  A...'
          OnClick = SortPortfeil
        end
      end
      object O1: TMenuItem
        Caption = 'Относ. дял'
        object N051: TMenuItem
          Tag = 241
          Caption = '0 - 5 %'
          OnClick = SortPortfeil
        end
        object N5101: TMenuItem
          Tag = 242
          Caption = '5 - 10 %'
          OnClick = SortPortfeil
        end
        object N10151: TMenuItem
          Tag = 243
          Caption = '10 - 15 %'
          OnClick = SortPortfeil
        end
        object N15201: TMenuItem
          Tag = 244
          Caption = '15 - 20 %'
          OnClick = SortPortfeil
        end
        object N20251: TMenuItem
          Tag = 245
          Caption = '20 - 25 %'
          OnClick = SortPortfeil
        end
        object N251: TMenuItem
          Tag = 246
          Caption = 'над 25 %'
          OnClick = SortPortfeil
        end
      end
      object N46: TMenuItem
        Caption = '-'
      end
      object N47: TMenuItem
        Tag = 11
        Caption = 'Подреден'
        OnClick = SortPortfeil
      end
    end
    object N40: TMenuItem
      Caption = 'Справки'
      object N41: TMenuItem
        Tag = 310
        Caption = 'По възвращаемост'
        OnClick = SortPortfeil
      end
      object N42: TMenuItem
        Tag = 320
        Caption = 'Спрямо алтернативата'
        OnClick = SortPortfeil
      end
      object N48: TMenuItem
        Caption = '-'
      end
      object N49: TMenuItem
        Tag = 11
        Caption = 'Подреден'
        OnClick = SortPortfeil
      end
    end
    object N16: TMenuItem
      Caption = 'Статистика'
      object N19: TMenuItem
        Caption = 'Основен лихвен процент...'
        ShortCut = 16464
        OnClick = N19Click
      end
      object N18: TMenuItem
        Caption = 'Борсов индекс...'
        ShortCut = 16457
        OnClick = N18Click
      end
      object N17: TMenuItem
        Caption = 'Пазарни цени...'
        ShortCut = 16451
        OnClick = N17Click
      end
    end
    object N43: TMenuItem
      Caption = 'Печат'
      object N45: TMenuItem
        Caption = 'Печат...'
        OnClick = N45Click
      end
    end
  end
  object QryIndexExt: TQuery
    DatabaseName = 'Portfeil'
    RequestLive = True
    SQL.Strings = (
      'UPDATE "BIndex.DB" Set BorIndex = :I WHERE Data = :D')
    UniDirectional = True
    Left = 327
    Top = 301
    ParamData = <
      item
        DataType = ftFloat
        Name = 'I'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'D'
        ParamType = ptUnknown
      end>
  end
  object QryLihvaExt: TQuery
    DatabaseName = 'Portfeil'
    RequestLive = True
    SQL.Strings = (
      'INSERT INTO "BLihva.DB" (Data, Lihva) Values(:D, :L)')
    UniDirectional = True
    Left = 326
    Top = 246
    ParamData = <
      item
        DataType = ftDate
        Name = 'D'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'L'
        ParamType = ptUnknown
      end>
  end
  object QryPazrcenaInsert: TQuery
    DatabaseName = 'Portfeil'
    SQL.Strings = (
      'INSERT INTO "PazrCena.DB"'
      '(ID_Inv, Data, Pazar_Cena)'
      'VALUES(:ID, :Data1, :Cena)')
    Left = 238
    Top = 295
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Cena'
        ParamType = ptUnknown
      end>
  end
end
