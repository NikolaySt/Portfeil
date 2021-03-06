object DlgBankLihva: TDlgBankLihva
  Left = 576
  Top = 24
  Width = 198
  Height = 512
  HelpContext = 1000
  Caption = 'ОЛП'
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
  object DBGridStatistic: TDBGrid
    Left = 0
    Top = 0
    Width = 190
    Height = 463
    Align = alClient
    DataSource = DtSPazarCena
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = DBGridStatisticKeyDown
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
        FieldName = 'Lihva'
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
        Width = 70
        Visible = True
      end>
  end
  object QryPazarCena: TQuery
    AfterInsert = QryPazarCenaAfterInsert
    BeforeEdit = QryPazarCenaBeforeEdit
    BeforePost = QryPazarCenaBeforePost
    AfterPost = QryPazarCenaAfterPost
    AfterCancel = QryPazarCenaAfterCancel
    BeforeDelete = QryPazarCenaBeforeDelete
    AfterDelete = QryPazarCenaAfterDelete
    DatabaseName = 'Portfeil'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM "BLihva.DB"'
      'WHERE Data < :D'
      ''
      ''
      '')
    UniDirectional = True
    Left = 34
    Top = 73
    ParamData = <
      item
        DataType = ftDate
        Name = 'D'
        ParamType = ptUnknown
      end>
    object QryPazarCenaData: TDateField
      ConstraintErrorMessage = 'KOOOO'
      DisplayLabel = 'Дата'
      FieldName = 'Data'
      EditMask = '!99/99/9999;1;_'
    end
    object QryPazarCenaLihva: TFloatField
      DisplayLabel = 'Основен лихвен процент'
      FieldName = 'Lihva'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '#0.0#'
    end
  end
  object DtSPazarCena: TDataSource
    DataSet = QryPazarCena
    Left = 109
    Top = 73
  end
  object MenuStatistic: TMainMenu
    Left = 63
    Top = 161
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
