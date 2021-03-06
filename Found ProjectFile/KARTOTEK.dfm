object DlgKartoteka: TDlgKartoteka
  Left = 17
  Top = 54
  Width = 770
  Height = 478
  HelpContext = 700
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Картотека на инвестициите'
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
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000CCCCCCCCCCCCCCCCC000000000000000000
    00000000000000C0000000000000007777C8777C8777780C0000000000000000
    00C8000C80000000C00000000000000FFFC8FFFC8FFFFF080C00000000000008
    F870FFF708F8FF0000C000000000000F8F8FFFFFFF8F8F0F080C00000000000F
    F78787878FF8FF0F0000C0000000000FFF8F8FFFFFFF8F0F0F080C000000000F
    F787878FFFFFFF0F0F0000C00000000FFFFF8FFFFFFFFF0F0F0F080C0000000F
    F78787878FFFFF0F0F0F0000C000000FFFFFFF8FFFFFFF0F0F0F0F080000000F
    FFFFFFFFFFFFFF0F0F0F0F000000000000000000000000FF0F0F0F0CC0000000
    0FFFFFFFFCCCCFFF0F0F0F0CCC000000000000000FCCF000FF0F0F0000000000
    000FFFFFFFFFFFFFFF0F0F0000000000000000000000000000FF0F0000000000
    00000FFFFCCCCFFFFFFF0F0000000000000000000FCCF0000000FF0000000000
    0000000FFFFFFFFFCCCCFF000000000000000000000000000CC0000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFF00001FFF00001FFF80000FFF800007FFC000
    03FFC00001FFC00000FFC000007FC000003FC000001FC000000FC0000007C000
    0003C0000003C0000003E0000003F0000001F8000001FC00001FFE00001FFF00
    001FFF80001FFFC0001FFFE0093FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  Menu = MenuKartoteka
  OldCreateOrder = True
  PrintScale = poNone
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object BevelNew4: TBevelNew
    Left = 427
    Top = 230
    Width = 334
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
  object Label26: TLabel
    Left = 571
    Top = 248
    Width = 46
    Height = 16
    Alignment = taRightJustify
    Caption = 'Шифър:'
    Transparent = True
  end
  object BevelNew2: TBevelNew
    Left = 0
    Top = 0
    Width = 759
    Height = 68
    Caption = 'Сравнение'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Shape = bsFrame
  end
  object Label6: TLabel
    Left = 437
    Top = 19
    Width = 173
    Height = 16
    Alignment = taRightJustify
    Caption = 'Възвращаемост за периода:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label8: TLabel
    Left = 80
    Top = 19
    Width = 110
    Height = 16
    Alignment = taRightJustify
    Caption = 'От инвенстицията:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object BevelNew1: TBevelNew
    Left = 344
    Top = 71
    Width = 416
    Height = 86
    Caption = 'Разходи'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Shape = bsFrame
  end
  object LabelRec1: TLabelRec
    Left = 614
    Top = 129
    Width = 128
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0.00'
    CaptionDim = 'лв.'
    Color = 15269887
    DimBuffer = 23
    Font.Charset = DEFAULT_CHARSET
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
  object DBTextRec9: TDBTextRec
    Left = 614
    Top = 87
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'Purvo_Razhod'
    DataSource = DtSPortfeil
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
  object DBTextRec10: TDBTextRec
    Left = 614
    Top = 108
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'SUM of Razhodi'
    DataSource = DtSKarton
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
  object DBTextRec1: TDBTextRec
    Left = 193
    Top = 39
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'Alternativa'
    DataSource = DtSPortfeil
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
  object DBTextRec2: TDBTextRec
    Left = 193
    Top = 17
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'Inv_Stoi'
    DataSource = DtSPortfeil
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
  object DBTextRec5: TDBTextRec
    Left = 614
    Top = 17
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'Vuzv_Obtcha'
    DataSource = DtSPortfeil
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    BorderStyle = bsSingle
    CheckValue = True
    CaptionDim = '%'
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
  object Label7: TLabel
    Left = 111
    Top = 41
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
  object Label18: TLabel
    Left = 540
    Top = 91
    Width = 70
    Height = 16
    Alignment = taRightJustify
    Caption = 'За покупка:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label21: TLabel
    Left = 528
    Top = 110
    Width = 82
    Height = 16
    Alignment = taRightJustify
    Caption = 'За продажби:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label11: TLabel
    Left = 445
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
  object DBTextRec6: TDBTextRec
    Left = 614
    Top = 38
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'KapLihva'
    DataSource = DtSPortfeil
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    BorderStyle = bsSingle
    CheckValue = True
    CaptionDim = '%'
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
  object Label2: TLabel
    Left = 570
    Top = 131
    Width = 40
    Height = 16
    Alignment = taRightJustify
    Caption = 'Общо:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object LblResultData: TLabelRec
    Left = 344
    Top = 161
    Width = 416
    Height = 21
    Alignment = taCenter
    AutoSize = False
    Caption = 'Резултат към'
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
  object BevelNew3: TBevelNew
    Left = 0
    Top = 71
    Width = 334
    Height = 110
    Caption = 'Получен чист доход'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Shape = bsFrame
  end
  object DBTextRec7: TDBTextRec
    Left = 620
    Top = 246
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
    Left = 620
    Top = 267
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
    Left = 620
    Top = 288
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
    Left = 620
    Top = 309
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
    Left = 620
    Top = 330
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
    Left = 620
    Top = 351
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
  object Label27: TLabel
    Left = 531
    Top = 269
    Width = 86
    Height = 16
    Alignment = taRightJustify
    Caption = 'Брой (Колич.):'
    Transparent = True
  end
  object Label28: TLabel
    Left = 482
    Top = 290
    Width = 135
    Height = 16
    Alignment = taRightJustify
    Caption = 'Цена на придобиване:'
    Transparent = True
  end
  object Label29: TLabel
    Left = 559
    Top = 311
    Width = 58
    Height = 16
    Alignment = taRightJustify
    Caption = 'Стойност:'
    Transparent = True
  end
  object Label30: TLabel
    Left = 511
    Top = 332
    Width = 106
    Height = 16
    Alignment = taRightJustify
    Caption = 'Относителен дял:'
    Transparent = True
  end
  object Label31: TLabel
    Left = 469
    Top = 353
    Width = 148
    Height = 16
    Alignment = taRightJustify
    Caption = 'Период на притежаване:'
    Transparent = True
  end
  object Bevel1: TBevel
    Left = 427
    Top = 383
    Width = 334
    Height = 43
  end
  object Label50: TLabel
    Left = 447
    Top = 388
    Width = 170
    Height = 32
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
    Left = 620
    Top = 394
    Width = 128
    Height = 20
    Alignment = taRightJustify
    Color = 15269887
    DataField = 'Purvo_Stoi'
    DataSource = DtSPortfeil
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
    DimBuffer = 27
    Freese = True
    FreeseWidth = 2
    IsValue = 1
    Redraw = False
    ZeroCheck = True
    ZeroType = ztFloat
  end
  object BevelNew5: TBevelNew
    Left = 427
    Top = 185
    Width = 334
    Height = 22
    Caption = 'Списък'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Shape = bsTopLine
  end
  object Dohod: TNotebook
    Left = 2
    Top = 88
    Width = 327
    Height = 88
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'Akcii'
      object DBTextRec3: TDBTextRec
        Left = 191
        Top = 1
        Width = 128
        Height = 20
        Alignment = taRightJustify
        Color = 15269887
        DataField = 'Suma_Div'
        DataSource = DtSPortfeil
        ParentColor = False
        BorderStyle = bsSingle
        CheckValue = True
        CaptionDim = 'лв'
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
      object DBTextRec4: TDBTextRec
        Left = 191
        Top = 22
        Width = 128
        Height = 20
        Alignment = taRightJustify
        Color = 15269887
        DataField = 'Suma_Prod'
        DataSource = DtSPortfeil
        ParentColor = False
        BorderStyle = bsSingle
        CheckValue = True
        CaptionDim = 'лв'
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
      object Label4: TLabel
        Left = 102
        Top = 3
        Width = 86
        Height = 16
        Alignment = taRightJustify
        Caption = 'От дивиденти:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label5: TLabel
        Left = 11
        Top = 25
        Width = 177
        Height = 16
        Alignment = taRightJustify
        Caption = 'Капиталова печалба /загуба/:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label17: TLabel
        Left = 148
        Top = 46
        Width = 40
        Height = 16
        Alignment = taRightJustify
        Caption = 'Общо:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label20: TLabel
        Left = 84
        Top = 66
        Width = 104
        Height = 16
        Alignment = taRightJustify
        Caption = 'Безплатни акции:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DBTextRec8: TDBTextRec
        Left = 191
        Top = 64
        Width = 128
        Height = 20
        Alignment = taRightJustify
        Color = 15269887
        DataField = 'SUM of Bezpl_Akcii'
        DataSource = DtSKarton
        ParentColor = False
        BorderStyle = bsSingle
        CheckValue = True
        CaptionDim = 'бр.'
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
        ZeroType = ztInteger
      end
      object LabelRec2: TLabelRec
        Left = 191
        Top = 43
        Width = 128
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0.00'
        CaptionDim = 'лв'
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
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Zlato'
      object Label14: TLabel
        Left = 11
        Top = 3
        Width = 177
        Height = 16
        Alignment = taRightJustify
        Caption = 'Капиталова печалба /загуба/:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DBTextRec11: TDBTextRec
        Left = 191
        Top = 1
        Width = 128
        Height = 20
        Alignment = taRightJustify
        Color = 15269887
        DataField = 'Suma_Prod'
        DataSource = DtSPortfeil
        ParentColor = False
        BorderStyle = bsSingle
        CheckValue = True
        CaptionDim = 'лв'
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
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Obligacii'
      object DBTextRec12: TDBTextRec
        Left = 191
        Top = 1
        Width = 128
        Height = 20
        Alignment = taRightJustify
        Color = 15269887
        DataField = 'Suma_Div'
        DataSource = DtSPortfeil
        ParentColor = False
        BorderStyle = bsSingle
        CheckValue = True
        CaptionDim = 'лв'
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
      object DBTextRec13: TDBTextRec
        Left = 191
        Top = 22
        Width = 128
        Height = 20
        Alignment = taRightJustify
        Color = 15269887
        DataField = 'Suma_Prod'
        DataSource = DtSPortfeil
        ParentColor = False
        BorderStyle = bsSingle
        CheckValue = True
        CaptionDim = 'лв'
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
      object Label13: TLabel
        Left = 130
        Top = 3
        Width = 58
        Height = 16
        Alignment = taRightJustify
        Caption = 'От лихви:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label19: TLabel
        Left = 11
        Top = 25
        Width = 177
        Height = 16
        Alignment = taRightJustify
        Caption = 'Капиталова печалба /загуба/:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label22: TLabel
        Left = 148
        Top = 46
        Width = 40
        Height = 16
        Alignment = taRightJustify
        Caption = 'Общо:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object LabelRec3: TLabelRec
        Left = 191
        Top = 43
        Width = 128
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0.00'
        CaptionDim = 'лв'
        Color = 15269887
        DimBuffer = 23
        Font.Charset = DEFAULT_CHARSET
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
    end
  end
  object CBoxInvSpisuk: TComboBox
    Left = 427
    Top = 206
    Width = 334
    Height = 24
    Style = csDropDownList
    DropDownCount = 12
    ItemHeight = 16
    TabOrder = 1
    OnChange = CBoxInvSpisukChange
  end
  object ChartsCeni: TGoldChart3
    Left = 0
    Top = 193
    Width = 417
    Height = 235
    HintValue = False
    AxisX.Font.Charset = DEFAULT_CHARSET
    AxisX.Font.Color = clWindowText
    AxisX.Font.Height = -11
    AxisX.Font.Name = 'MS Sans Serif'
    AxisX.Font.Style = []
    AxisX.Format = 'dd/mm/yyyy'
    AxisX.MoveValue = 5
    AxisX.Pen.Width = 3
    AxisX.TypeAxis = taDate
    AxisX.AutomaticMax = True
    AxisX.AutomaticMin = True
    AxisX.MoveEnable = False
    AxisY.Font.Charset = DEFAULT_CHARSET
    AxisY.Font.Color = clWindowText
    AxisY.Font.Height = -11
    AxisY.Font.Name = 'MS Sans Serif'
    AxisY.Font.Style = []
    AxisY.Format = '# ### ##0.#0'
    AxisY.MoveValue = 5
    AxisY.TypeAxis = taValue
    AxisY.AutomaticMax = True
    AxisY.AutomaticMin = False
    AxisY.MoveEnable = True
    AxisY.MovePercent = 1.07
    BaseBrush.Color = clWindow
    LayoutBase.AutoMoveBottom = True
    LayoutBase.AutoMoveLeft = True
    LayoutBase.AutoMoveRight = True
    LayoutBase.MoveLeft = 37
    LayoutBase.MoveTop = 20
    LayoutBase.MoveRight = 32
    LayoutBase.MoveBottom = 21
    GridStyle.Pen.Color = clSilver
    GridStyle.Pen.Style = psDot
    GridStyle.AutoCol = False
    GridStyle.AutoRow = False
    GridStyle.Row = 5
    GridStyle.Col = 4
    object BtnIndex: TButton
      Left = 387
      Top = 18
      Width = 25
      Height = 23
      BiDiMode = bdLeftToRight
      Caption = 'И'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      OnClick = BtnIndexClick
    end
  end
  object ChartIndex: TGoldChart3
    Left = 0
    Top = 2
    Width = 417
    Height = 190
    HintValue = False
    AxisX.Font.Charset = DEFAULT_CHARSET
    AxisX.Font.Color = clWindowText
    AxisX.Font.Height = -11
    AxisX.Font.Name = 'MS Sans Serif'
    AxisX.Font.Style = []
    AxisX.Format = 'dd/mm/yyyy'
    AxisX.MoveValue = 5
    AxisX.Pen.Width = 3
    AxisX.TypeAxis = taDate
    AxisX.AutomaticMax = True
    AxisX.AutomaticMin = True
    AxisX.MoveEnable = False
    AxisY.Font.Charset = DEFAULT_CHARSET
    AxisY.Font.Color = clWindowText
    AxisY.Font.Height = -11
    AxisY.Font.Name = 'MS Sans Serif'
    AxisY.Font.Style = []
    AxisY.Format = '# ### ##0.#0'
    AxisY.MoveValue = 5
    AxisY.TypeAxis = taValue
    AxisY.AutomaticMax = True
    AxisY.AutomaticMin = False
    AxisY.MoveEnable = True
    AxisY.MovePercent = 1.05
    BaseBrush.Color = clWindow
    LayoutBase.AutoMoveBottom = True
    LayoutBase.AutoMoveLeft = True
    LayoutBase.AutoMoveRight = True
    LayoutBase.MoveLeft = 37
    LayoutBase.MoveTop = 20
    LayoutBase.MoveRight = 32
    LayoutBase.MoveBottom = 21
    GridStyle.Pen.Color = clSilver
    GridStyle.Pen.Style = psDot
    GridStyle.AutoCol = False
    GridStyle.AutoRow = False
    GridStyle.Row = 5
    GridStyle.Col = 4
    Visible = False
  end
  object QryPortfeil: TQuery
    DatabaseName = 'Portfeil'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM PortData'
      ''
      '')
    UniDirectional = True
    Left = 115
    Top = 303
    object QryPortfeilID_Inv: TSmallintField
      FieldName = 'ID_Inv'
    end
    object QryPortfeilData_Inv: TDateField
      FieldName = 'Data_Inv'
    end
    object QryPortfeilChifur: TStringField
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
    object QryPortfeilPazar_Cena: TFloatField
      FieldName = 'Pazar_Cena'
    end
    object QryPortfeilPazar_Stoin: TFloatField
      FieldName = 'Pazar_Stoin'
    end
    object QryPortfeilPurvo_Broi: TIntegerField
      FieldName = 'Purvo_Broi'
    end
    object QryPortfeilPurvo_Cena: TFloatField
      FieldName = 'Purvo_Cena'
    end
    object QryPortfeilPurvo_Stoi: TFloatField
      Alignment = taCenter
      FieldName = 'Purvo_Stoi'
      DisplayFormat = '# ### ##0.#0'
    end
    object QryPortfeilPurvo_Razhod: TFloatField
      FieldName = 'Purvo_Razhod'
      DisplayFormat = '# ### ##0.#0'
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
    object QryPortfeilInv_Stoi: TFloatField
      FieldName = 'Inv_Stoi'
      DisplayFormat = '# ### ##0.#0'
    end
    object QryPortfeilAlternativa: TFloatField
      FieldName = 'Alternativa'
      DisplayFormat = '# ### ##0.#0'
    end
    object QryPortfeilSuma_Div: TFloatField
      FieldName = 'Suma_Div'
      DisplayFormat = '# ### ##0.#0'
    end
    object QryPortfeilSuma_Prod: TFloatField
      FieldName = 'Suma_Prod'
      DisplayFormat = '# ### ##0.#0'
    end
    object QryPortfeilVuzv_Obtcha: TFloatField
      FieldName = 'Vuzv_Obtcha'
      DisplayFormat = '# ### ##0.#0'
    end
    object QryPortfeilInv_File: TStringField
      FieldName = 'Inv_File'
      Size = 8
    end
    object QryPortfeilMemo: TBlobField
      FieldName = 'Memo'
      BlobType = ftBlob
      Size = 240
    end
    object QryPortfeilVuzv_God: TFloatField
      FieldName = 'Vuzv_God'
    end
    object QryPortfeilKapLihva: TFloatField
      FieldName = 'KapLihva'
      DisplayFormat = '# ### ##0.#0'
    end
    object QryPortfeilInv_Stoi_Alternat: TFloatField
      FieldName = 'Inv_Stoi_Alternat'
    end
  end
  object DtSPortfeil: TDataSource
    DataSet = QryPortfeil
    Left = 116
    Top = 352
  end
  object QryKarton: TQuery
    DatabaseName = 'Portfeil'
    SQL.Strings = (
      'SELECT Sum(Razhodi), Sum(Bezpl_Akcii)'
      'FROM DivProd')
    Left = 193
    Top = 307
    object QryKartonSUMofRazhodi: TFloatField
      FieldName = 'SUM of Razhodi'
      DisplayFormat = '# ### ##0.#0'
    end
    object QryKartonSUMofBezpl_Akcii: TFloatField
      FieldName = 'SUM of Bezpl_Akcii'
      DisplayFormat = '# ### ##0'
    end
  end
  object DtSKarton: TDataSource
    DataSet = QryKarton
    Left = 193
    Top = 355
  end
  object MenuKartoteka: TMainMenu
    Left = 84
    Top = 233
    object N2: TMenuItem
      Caption = 'Избор'
      object N3: TMenuItem
        Caption = 'Портфейл...'
        ShortCut = 16454
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = 'Управление...'
        ShortCut = 16469
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object N1: TMenuItem
        Caption = 'Изход'
        ShortCut = 32883
        OnClick = N1Click
      end
    end
    object N6: TMenuItem
      Caption = 'Печат'
      object N8: TMenuItem
        Caption = 'Картон...'
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = 'Графики...'
        OnClick = N9Click
      end
    end
    object N7: TMenuItem
      Caption = 'Изтриване'
      OnClick = N7Click
    end
  end
end
