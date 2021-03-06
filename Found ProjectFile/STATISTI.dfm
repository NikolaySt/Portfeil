object DlgCenaStatistica: TDlgCenaStatistica
  Left = 180
  Top = 24
  Width = 200
  Height = 512
  HelpContext = 1000
  Caption = 'Пазарни цени'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000077777700000000000000000000000077
    88888870000000000000000000000788FFFFFF8707777770000000000000078F
    FFFFFFF80888888707777700000007800FFFFFFF08FFFF80788888770000000F
    FFFFFFFFFFFFFFF078FFFF887000008FFFFFFFFFFFFFFFF07FFFFFFF870008FF
    FFFFFFFFFFFFFFFF0FFFFFFFF87008FFFFFFFFFFFFFFFFFFF00FFF88F87008FF
    FFFFFFFFFFFFFFFFFFFFFF77887008FFFFF80FFFFFFFFFFFFFFFFF007870078F
    F8870FFFFFFFFFFFFFFFFFFF070000788770FFFFFFFFFFFFFFFFFFFFF0000807
    700FFFFFFF0FFFFFFFFFFFFFF00080800FFFFFFFF07FFFFFFFFFFFFFFF0007FF
    FFFFFFFFF07FFFFFFFFFFFFFF70007FFFFFFFFFFF077FFFFFFFFF0777000077F
    F07FFFFFF70077FFFFFFFF0000000007707FFFFF770000777777770000000000
    0007777700000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFF03FFFFFC01FFFFF80081FFF0000083F0000
    000F000000078000000380000001000000000000000000000000000000000000
    00018000000380000001000000010000000100000003000000078001001FE403
    C03FFE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  KeyPreview = True
  Menu = MenuStatistic
  OldCreateOrder = True
  Scaled = False
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object LblAlign3: TLabel
    Left = 0
    Top = 30
    Width = 192
    Height = 1
    Align = alTop
    AutoSize = False
    Transparent = True
  end
  object PnlDrug: TPanel
    Left = 0
    Top = 0
    Width = 192
    Height = 30
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    BorderWidth = 1
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object DBGridStatistic: TDBGrid
    Left = 0
    Top = 31
    Width = 192
    Height = 432
    Align = alClient
    DataSource = DtSPazarCena
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = NewDBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'Data'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
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
        FieldName = 'Pazar_Cena'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
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
  object QryPazarCena: TQuery
    BeforeEdit = QryPazarCenaBeforeEdit
    BeforePost = QryPazarCenaBeforePost
    AfterCancel = QryPazarCenaAfterCancel
    BeforeDelete = QryPazarCenaBeforeDelete
    DatabaseName = 'Portfeil'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM PAZRCENA'
      'WHERE ID_INV = :ID AND Data < :Data1'
      ''
      '')
    UniDirectional = True
    Left = 143
    Top = 104
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
      end>
    object QryPazarCenaID_Inv: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'No'
      DisplayWidth = 4
      FieldName = 'ID_Inv'
      Visible = False
    end
    object QryPazarCenaData: TDateField
      Alignment = taCenter
      DisplayLabel = 'Дата'
      DisplayWidth = 10
      FieldName = 'Data'
      EditMask = '!90/90/9900;1;_'
    end
    object QryPazarCenaPazar_Cena: TFloatField
      DisplayLabel = 'Пазарна цена ~(лв)'
      DisplayWidth = 9
      FieldName = 'Pazar_Cena'
      DisplayFormat = '# ### ##0.#0##'
      EditFormat = '#0.#0###'
    end
  end
  object DtSPazarCena: TDataSource
    DataSet = QryPazarCena
    Left = 142
    Top = 148
  end
  object MenuStatistic: TMainMenu
    Left = 143
    Top = 200
    object N1: TMenuItem
      Caption = 'Опции'
      object N5: TMenuItem
        Caption = 'Копиране'
        ShortCut = 16451
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object N2: TMenuItem
        Caption = 'Добавяне'
        ShortCut = 16470
        OnClick = N2Click
      end
      object N4: TMenuItem
        Caption = 'Изтриване...'
        ShortCut = 16452
        OnClick = N4Click
      end
    end
    object N3: TMenuItem
      Caption = 'Изход'
      OnClick = N3Click
    end
  end
end
