object DlgSpisuk: TDlgSpisuk
  Left = 33
  Top = 23
  Width = 659
  Height = 511
  HelpContext = 200
  Caption = 'Списък на инвестициите'
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
    0000000000000000000000000000000890000000000000899000000000000009
    000000000000009009000000000000090FFFFFFFFFFFF0900090000000000000
    0000000000FFF09000090000000000FFFFFFFFFFFF0FF00000009000000000F8
    F8F8F8F8FF0FF0FFF0000900000000FFFFFFFFFFFF0FF0FF000000000000000F
    8F8F8F8F8FF0F0FF000000000000000F8FFFFFFFFFF0F0F0F00000000000000F
    FF70FFF70FF00000FFF0000000000090F80FFF80FFFF090D0F00000000000900
    00070000700090D9000000000000090F870F8870F880909D0000000000000090
    00070000700009090000000000000000F80FFF80FFFF0000F000000000000000
    FF70FFF70FFF0F0FFF00000000000000FFFFFFFFFFFF0F000000000000000000
    F8888888F8FF00FFFFFFFFFFFFFF0000FFFFFFFFFFF0FFFFFFFFFFFFFFFF0000
    F888888FFFFF0008FFFFFFFFFFFF0000FFFFFFFFFF000FF0FFFFFFFFFFFF0000
    F8888888FF0F0880FFFFFFFFFF000000FFFFFFFFFF0FF00FFFFFFFFF00000000
    000000000000FFFFF0FFFFF0000000000000000000000FF00FF0FFF000000000
    000000000000000FFF0F0F000000000000000000000FFFFF00F0FF0000000000
    00000000000000000F00F00000000000000000000000000FF00F000000000000
    0000000000000FF000F00000000000000000000000000000000000000000E7FF
    C7FFC3FF83FFC00001FFC00008FF80000C7F8000023F8000031F8000003FC000
    07FFC000007F800000FF000001FF000003FF0000007F000007FF800003FFE000
    01FFE0000000E0000000E0000000E0000000E0000000E0000000E0000003F000
    000FFFFF000FFFFE001FFFFC001FFFFC003FFFFF807FFFFF00FFFFFF19FF}
  Menu = MenuSpisuk
  OldCreateOrder = True
  PrintScale = poNone
  Scaled = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object LblAlign1: TLabel
    Left = 314
    Top = 0
    Width = 2
    Height = 443
    Align = alRight
    AutoSize = False
    Transparent = True
  end
  object Panel1: TPanel
    Left = 316
    Top = 0
    Width = 335
    Height = 443
    Align = alRight
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object LblAlign: TLabel
      Left = 0
      Top = 0
      Width = 335
      Height = 307
      Align = alTop
      AutoSize = False
      Transparent = True
    end
    object BevelNew2: TBevelNew
      Left = 2
      Top = -2
      Width = 331
      Height = 184
      Caption = 'Инвестиция'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Shape = bsFrame
    end
    object Info: TBevelNew
      Left = 2
      Top = 181
      Width = 331
      Height = 89
      Caption = 'Допълнителни данни'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Shape = bsFrame
    end
    object LblObcho: TLabelRec
      Left = 196
      Top = 156
      Width = 128
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = bsNone
      Caption = '0.00'
      CaptionDim = 'лв.'
      Color = 15269887
      DimBuffer = 23
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FontDim.Charset = RUSSIAN_CHARSET
      FontDim.Color = clBlack
      FontDim.Height = -12
      FontDim.Name = 'Tahoma'
      FontDim.Style = []
      Freese = True
      FreeseWidth = 2
      ParentFont = False
      ParentColor = False
      Redraw = False
    end
    object LblStoinost: TLabelRec
      Left = 196
      Top = 105
      Width = 128
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = bsNone
      Caption = '0.00'
      CaptionDim = 'лв.'
      Color = 15269887
      DimBuffer = 23
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FontDim.Charset = RUSSIAN_CHARSET
      FontDim.Color = clBlack
      FontDim.Height = -12
      FontDim.Name = 'Tahoma'
      FontDim.Style = []
      Freese = True
      FreeseWidth = 2
      ParentFont = False
      ParentColor = False
      Redraw = False
    end
    object Bevel2: TBevel
      Left = 20
      Top = 149
      Width = 304
      Height = 3
      Shape = bsTopLine
    end
    object Label2: TLabel
      Left = 153
      Top = 158
      Width = 40
      Height = 16
      Alignment = taRightJustify
      Caption = 'Общо:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 161
      Top = 46
      Width = 32
      Height = 16
      Alignment = taRightJustify
      Caption = 'Дата:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 107
      Top = 67
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
    object Label6: TLabel
      Left = 25
      Top = 87
      Width = 168
      Height = 16
      Alignment = taRightJustify
      Caption = 'Покупна цена за един брой:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 14
      Top = 108
      Width = 179
      Height = 16
      Alignment = taRightJustify
      Caption = 'Стойност на инвестицията:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 65
      Top = 129
      Width = 128
      Height = 16
      Alignment = taRightJustify
      Caption = 'Разход за покупката:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object DBTextRec1: TDBTextRec
      Left = 196
      Top = 42
      Width = 128
      Height = 20
      Alignment = taRightJustify
      Color = 15269887
      DataField = 'Data_Inv'
      DataSource = DtSPortfeil
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      BorderStyle = bsNone
      CheckValue = False
      FontDim.Charset = RUSSIAN_CHARSET
      FontDim.Color = clBlack
      FontDim.Height = -12
      FontDim.Name = 'Tahoma'
      FontDim.Style = []
      DimBuffer = 23
      Freese = True
      FreeseWidth = 2
      IsValue = 1
      Redraw = False
      ZeroType = ztInteger
    end
    object DBTextRec2: TDBTextRec
      Left = 196
      Top = 63
      Width = 128
      Height = 20
      Alignment = taRightJustify
      Color = 15269887
      DataField = 'Purvo_Broi'
      DataSource = DtSPortfeil
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      BorderStyle = bsNone
      CheckValue = True
      FontDim.Charset = RUSSIAN_CHARSET
      FontDim.Color = clBlack
      FontDim.Height = -12
      FontDim.Name = 'Tahoma'
      FontDim.Style = []
      DimBuffer = 23
      Freese = True
      FreeseWidth = 2
      IsValue = 1
      Redraw = False
      ZeroCheck = True
      ZeroType = ztInteger
    end
    object DBTextRec3: TDBTextRec
      Left = 196
      Top = 84
      Width = 128
      Height = 20
      Alignment = taRightJustify
      Color = 15269887
      DataField = 'Purvo_Cena'
      DataSource = DtSPortfeil
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      BorderStyle = bsNone
      CheckValue = True
      CaptionDim = 'лв.'
      FontDim.Charset = RUSSIAN_CHARSET
      FontDim.Color = clBlack
      FontDim.Height = -12
      FontDim.Name = 'Tahoma'
      FontDim.Style = []
      DimBuffer = 23
      Freese = True
      FreeseWidth = 2
      IsValue = 1
      Redraw = False
      ZeroCheck = True
      ZeroType = ztFloat
    end
    object DLblRazhod: TDBTextRec
      Left = 196
      Top = 126
      Width = 128
      Height = 20
      Alignment = taRightJustify
      Color = 15269887
      DataField = 'Purvo_Razhod'
      DataSource = DtSPortfeil
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      BorderStyle = bsNone
      CheckValue = True
      CaptionDim = 'лв.'
      FontDim.Charset = RUSSIAN_CHARSET
      FontDim.Color = clBlack
      FontDim.Height = -12
      FontDim.Name = 'Tahoma'
      FontDim.Style = []
      DimBuffer = 23
      Freese = True
      FreeseWidth = 2
      IsValue = 1
      Redraw = False
      ZeroCheck = True
      ZeroType = ztFloat
    end
    object BtnSave: TSpeedButton
      Left = 282
      Top = 281
      Width = 24
      Height = 22
      Hint = 'Запис'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76060000424D7606000000000000360400002800000021000000100000000100
        0800000000004002000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
        030303030303030303030303030303FF03030303030303030303030000000303
        030304040303030303030303030303030303F8F8FF0303030303030303030303
        000003030304020204030303030303030303030303F80303F8FF030303030303
        030303030000030304020202020403030303030303030303F803030303F8FF03
        030303030303030300000304020202020202040303030303030303F803030303
        0303F8FF03030303030303F8000004020202FA0202020204030303030303F8FF
        0303F8FF030303F8FF030303030303030000020202FA03FA0202020403030303
        0303F8FF03F803F8FF0303F8FF030303030303030000FA02FA030303FA020202
        040303030303F8FFF8030303F8FF0303F8FF0303030303FF000003FA03030303
        03FA020202040303030303F80303030303F8FF0303F8FF030303030300000303
        030303030303FA020202040303030303030303030303F8FF0303F8FF03030303
        0000030303030303030303FA020202040303030303030303030303F8FF0303F8
        FF030302000003030303030303030303FA020202040303030303030303030303
        F8FF0303F8FF03FA00000303030303030303030303FA02020204030303030303
        0303030303F8FF0303F8FF030000030303030303030303030303FA0202040303
        03030303030303030303F8FF03F8FF03000003030303030303030303030303FA
        020203030303030303030303030303F8FFF80303000003030303030303030303
        03030303FA030303030303030303030303030303F80303030000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnSaveClick
    end
    object BtnCancel: TSpeedButton
      Left = 309
      Top = 281
      Width = 25
      Height = 22
      Hint = 'Отказ'
      Enabled = False
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        0800000000000002000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0003F8F8030303
        0303030303030303030303030303FF0303030303030303030303F90101F80303
        030303F9F80303030303030303F8F8FF030303030303FF030303F9010101F803
        0303F90101F8030303030303F8FF03F8FF030303FFF8F8FF0303F901010101F8
        03F901010101F80303030303F8FF0303F8FF03FFF80303F8FF0303F901010101
        F80101010101F80303030303F8FF030303F8FFF803030303F8FF0303F9010101
        0101010101F803030303030303F8FF030303F803030303FFF803030303F90101
        01010101F8030303030303030303F8FF030303030303FFF80303030303030101
        010101F80303030303030303030303F8FF0303030303F803030303030303F901
        010101F8030303030303030303030303F8FF030303F803030303030303F90101
        010101F8030303030303030303030303F803030303F8FF0303030303F9010101
        F8010101F803030303030303030303F80303030303F8FF03030303F9010101F8
        03F9010101F80303030303030303F8030303F8FF0303F8FF030303F90101F803
        0303F9010101F8030303030303F8FF0303F803F8FF0303F8FF030303F9010303
        030303F9010101030303030303F8FFFFF8030303F8FF0303F8FF030303030303
        03030303F901F903030303030303F8F80303030303F8FFFFFFF8030303030303
        03030303030303030303030303030303030303030303F8F8F803}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnCancelClick
    end
    object LblAlign5: TLabel
      Left = 0
      Top = 307
      Width = 1
      Height = 136
      Align = alLeft
      AutoSize = False
      Transparent = True
    end
    object BevelNew1: TBevelNew
      Left = 3
      Top = 274
      Width = 275
      Height = 21
      Caption = 'Бележки'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Shape = bsTopLine
    end
    object LblVidInv: TPanel
      Left = 8
      Top = 16
      Width = 318
      Height = 20
      BevelOuter = bvLowered
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = True
      ParentFont = False
      TabOrder = 0
    end
    object DataPages: TNotebook
      Left = 12
      Top = 197
      Width = 316
      Height = 69
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      PageIndex = 2
      ParentFont = False
      TabOrder = 1
      object TPage
        Left = 0
        Top = 0
        Caption = 'Page1'
        object LblPage11: TLabel
          Left = 106
          Top = 7
          Width = 75
          Height = 16
          Alignment = taRightJustify
          Caption = 'Валидни до:'
          Transparent = True
        end
        object LblPage12: TLabel
          Left = 19
          Top = 27
          Width = 162
          Height = 16
          Alignment = taRightJustify
          Caption = 'Договорена цена на акция:'
          Transparent = True
        end
        object LblPage13: TLabel
          Left = 16
          Top = 48
          Width = 165
          Height = 16
          Alignment = taRightJustify
          Caption = 'Право за покупка на акции:'
          Transparent = True
        end
        object EdtPage13: TDBTextRec
          Left = 184
          Top = 46
          Width = 128
          Height = 20
          Alignment = taRightJustify
          Color = 15269887
          DataField = 'Prod_Pokupka'
          DataSource = DtSPortfeil
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          BorderStyle = bsNone
          CheckValue = False
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
          ZeroType = ztInteger
        end
        object EdtPage12: TDBTextRec
          Left = 184
          Top = 25
          Width = 128
          Height = 20
          Alignment = taRightJustify
          Color = 15269887
          DataField = 'N_F_D_Cena'
          DataSource = DtSPortfeil
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          BorderStyle = bsNone
          CheckValue = False
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
          ZeroType = ztInteger
        end
        object EdtPage11: TDBTextRec
          Left = 184
          Top = 4
          Width = 128
          Height = 20
          Alignment = taRightJustify
          Color = 15269887
          DataField = 'Valid_Padeg'
          DataSource = DtSPortfeil
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          BorderStyle = bsNone
          CheckValue = False
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
          ZeroType = ztInteger
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Page2'
        object EdtPage21: TDBTextRec
          Left = 184
          Top = 4
          Width = 128
          Height = 20
          Alignment = taRightJustify
          Color = 15269887
          DataField = 'Valid_Padeg'
          DataSource = DtSPortfeil
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          BorderStyle = bsNone
          CheckValue = False
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
          ZeroType = ztInteger
        end
        object LblPage21: TLabel
          Left = 137
          Top = 6
          Width = 44
          Height = 16
          Alignment = taRightJustify
          Caption = 'Падеж:'
          Transparent = True
        end
        object LblPage22: TLabel
          Left = 124
          Top = 27
          Width = 57
          Height = 16
          Alignment = taRightJustify
          Caption = 'Номинал:'
          Transparent = True
        end
        object LblPage23: TLabel
          Left = 25
          Top = 48
          Width = 156
          Height = 16
          Alignment = taRightJustify
          Caption = 'Годищен лихвен процент:'
          Transparent = True
        end
        object EdtPage23: TDBTextRec
          Left = 184
          Top = 46
          Width = 128
          Height = 20
          Alignment = taRightJustify
          Color = 15269887
          DataField = 'Kup_Lihva'
          DataSource = DtSPortfeil
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          BorderStyle = bsNone
          CheckValue = False
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
          ZeroType = ztInteger
        end
        object EdtPage22: TDBTextRec
          Left = 184
          Top = 25
          Width = 128
          Height = 20
          Alignment = taRightJustify
          Color = 15269887
          DataField = 'N_F_D_Cena'
          DataSource = DtSPortfeil
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          BorderStyle = bsNone
          CheckValue = False
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
          ZeroType = ztInteger
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Page3'
        object LblPage31: TLabel
          Left = 137
          Top = 7
          Width = 44
          Height = 16
          Alignment = taRightJustify
          Caption = 'Падеж:'
          Transparent = True
        end
        object LblPage32: TLabel
          Left = 124
          Top = 27
          Width = 57
          Height = 16
          Alignment = taRightJustify
          Caption = 'Номинал:'
          Transparent = True
        end
        object EdtPage32: TDBTextRec
          Left = 184
          Top = 25
          Width = 128
          Height = 20
          Alignment = taRightJustify
          Color = 15269887
          DataField = 'N_F_D_Cena'
          DataSource = DtSPortfeil
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          BorderStyle = bsNone
          CheckValue = False
          CaptionDim = 'лв.'
          FontDim.Charset = RUSSIAN_CHARSET
          FontDim.Color = clBlack
          FontDim.Height = -12
          FontDim.Name = 'Tahoma'
          FontDim.Style = []
          DimBuffer = 23
          Freese = True
          FreeseWidth = 2
          IsValue = 1
          Redraw = False
          ZeroType = ztInteger
        end
        object EdtPage31: TDBTextRec
          Left = 184
          Top = 4
          Width = 128
          Height = 20
          Alignment = taRightJustify
          Color = 15269887
          DataField = 'Valid_Padeg'
          DataSource = DtSPortfeil
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          BorderStyle = bsNone
          CheckValue = False
          FontDim.Charset = RUSSIAN_CHARSET
          FontDim.Color = clBlack
          FontDim.Height = -12
          FontDim.Name = 'Tahoma'
          FontDim.Style = []
          DimBuffer = 23
          Freese = True
          FreeseWidth = 2
          IsValue = 1
          Redraw = False
          ZeroType = ztInteger
        end
        object LblPage3Dim1: TLabel
          Left = 350
          Top = 34
          Width = 19
          Height = 16
          Caption = 'лв.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Page4'
      end
    end
    object DBMemo1: TDBMemo
      Left = 1
      Top = 307
      Width = 334
      Height = 136
      Align = alClient
      DataField = 'Memo'
      DataSource = DtSPortfeil
      MaxLength = 1000
      ScrollBars = ssVertical
      TabOrder = 2
      OnExit = DBMemo1Exit
      OnKeyDown = DBMemo1KeyDown
      OnKeyPress = DBMemo1KeyPress
    end
  end
  object PnlAlign: TPanel
    Left = 0
    Top = 0
    Width = 314
    Height = 443
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    OnResize = PnlAlignResize
    object LblAlign2: TLabel
      Left = 0
      Top = 0
      Width = 314
      Height = 52
      Align = alTop
      AutoSize = False
      Transparent = True
    end
    object Bevel7: TBevel
      Left = 1
      Top = 5
      Width = 311
      Height = 42
      Shape = bsFrame
    end
    object Label4: TLabel
      Left = 6
      Top = 11
      Width = 143
      Height = 31
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Обща стойност на инвестициите:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object LblSumaPurvoStoi: TLabelRec
      Left = 156
      Top = 17
      Width = 128
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      CaptionDim = 'лв.'
      Color = 15269887
      DimBuffer = 23
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      Freese = True
      FreeseWidth = 2
      ParentFont = False
      ParentColor = False
      Redraw = True
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 52
      Width = 314
      Height = 391
      Align = alClient
      DataSource = DtSPortfeil
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -13
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      OnDblClick = PMenuChangeClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_Inv'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Color = clAqua
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Chifur'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Color = clAqua
          Width = 62
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'Drugestvo'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Color = clAqua
          Width = 183
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 443
    Width = 651
    Height = 19
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Panels = <
      item
        Text = 'Брой инвестиции - 0'
        Width = 150
      end
      item
        Width = 160
      end
      item
        Width = 50
      end>
    SimplePanel = False
    UseSystemFont = False
  end
  object DtSPortfeil: TDataSource
    DataSet = QryPortfeil
    OnDataChange = DtSPortfeilDataChange
    Left = 162
    Top = 317
  end
  object MenuSpisuk: TMainMenu
    Left = 94
    Top = 262
    object N4: TMenuItem
      Caption = 'Сортиране'
      object N5: TMenuItem
        Caption = 'Шифър'
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = 'Дружество'
        OnClick = N6Click
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object N7: TMenuItem
        Caption = 'Подреден'
        OnClick = N7Click
      end
    end
    object N2: TMenuItem
      Caption = 'Редактиране'
      object N3: TMenuItem
        Caption = 'Корекции...'
        OnClick = PMenuChangeClick
      end
    end
    object N8: TMenuItem
      Caption = 'Печат'
      object N9: TMenuItem
        Caption = 'В таблица...'
        OnClick = N9Click
      end
      object N10: TMenuItem
        Caption = 'По дружества...'
        OnClick = N10Click
      end
    end
    object N1: TMenuItem
      Caption = 'Изход'
      OnClick = N1Click
    end
  end
  object QryPortfeil: TQuery
    BeforeEdit = QryPortfeilBeforeEdit
    AfterPost = QryPortfeilAfterPost
    AfterCancel = QryPortfeilAfterPost
    DatabaseName = 'Portfeil'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM PORTDATA'
      '')
    UniDirectional = True
    Left = 162
    Top = 262
    object QryPortfeilID_Inv: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'No'
      DisplayWidth = 4
      FieldName = 'ID_Inv'
    end
    object QryPortfeilChifur: TStringField
      Alignment = taCenter
      DisplayLabel = 'Шифър'
      DisplayWidth = 8
      FieldName = 'Chifur'
      Size = 6
    end
    object QryPortfeilDrugestvo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Дружество (Емитент, издател...)'
      DisplayWidth = 26
      FieldName = 'Drugestvo'
      Size = 50
    end
    object QryPortfeilMemo: TBlobField
      FieldName = 'Memo'
      Visible = False
      BlobType = ftBlob
      Size = 240
    end
    object QryPortfeilData_Inv: TDateField
      DisplayLabel = 'Дата'
      FieldName = 'Data_Inv'
      Visible = False
    end
    object QryPortfeilPurvo_Broi: TIntegerField
      FieldName = 'Purvo_Broi'
      Visible = False
      DisplayFormat = '# ### ##0'
    end
    object QryPortfeilPurvo_Cena: TFloatField
      FieldName = 'Purvo_Cena'
      Visible = False
      DisplayFormat = '# ### ##0.#0##'
    end
    object QryPortfeilPurvo_Stoi: TFloatField
      FieldName = 'Purvo_Stoi'
      Visible = False
      DisplayFormat = '# ### ##0.#0'
    end
    object QryPortfeilPurvo_Razhod: TFloatField
      FieldName = 'Purvo_Razhod'
      Visible = False
      DisplayFormat = '# ### ##0.#0'
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
      DisplayFormat = '# ### ##0.#0'
    end
    object QryPortfeilKup_Lihva: TFloatField
      FieldName = 'Kup_Lihva'
      Visible = False
      DisplayFormat = '# ### ##0.#0'
    end
    object QryPortfeilInv_File: TStringField
      FieldName = 'Inv_File'
      Visible = False
      Size = 8
    end
    object QryPortfeilStoinost: TFloatField
      FieldName = 'Stoinost'
      Visible = False
    end
    object QryPortfeilOtn_dial: TFloatField
      FieldName = 'Otn_dial'
      Visible = False
    end
    object QryPortfeilVuzv_Obtcha: TFloatField
      FieldName = 'Vuzv_Obtcha'
      Visible = False
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
    object QryPortfeilBroi: TIntegerField
      FieldName = 'Broi'
      Visible = False
    end
    object QryPortfeilEdin_Cena: TFloatField
      FieldName = 'Edin_Cena'
      Visible = False
    end
    object QryPortfeilPazar_Cena: TFloatField
      FieldName = 'Pazar_Cena'
      Visible = False
    end
    object QryPortfeilPazar_Stoin: TFloatField
      FieldName = 'Pazar_Stoin'
      Visible = False
    end
    object QryPortfeilPeriod: TIntegerField
      FieldName = 'Period'
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
  end
  object QrySumaPurvStoi: TQuery
    DatabaseName = 'Portfeil'
    SQL.Strings = (
      'SELECT SUM(Purvo_Stoi)'
      'FROM "PortData.DB"')
    Left = 237
    Top = 261
    object QrySumaPurvStoiSUMofPurvo_Stoi: TFloatField
      Alignment = taLeftJustify
      FieldName = 'SUM of Purvo_Stoi'
      DisplayFormat = '# ### ##0.#0'
    end
  end
end
