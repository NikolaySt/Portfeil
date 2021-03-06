object DlgNewChange: TDlgNewChange
  Left = 156
  Top = 131
  HelpContext = 1100
  BorderStyle = bsDialog
  Caption = 'Промяна'
  ClientHeight = 345
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  PrintScale = poNone
  Scaled = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object BevelNew1: TBevelNew
    Left = 4
    Top = -1
    Width = 500
    Height = 205
    Caption = 'Основни данни'
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
    Top = 175
    Width = 150
    Height = 18
    Alignment = taRightJustify
    AutoSize = False
    BorderStyle = bsNone
    Caption = '0.00'
    CaptionDim = 'лв.'
    Color = clWhite
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
    FreeseWidth = 4
    ParentFont = False
    ParentColor = False
    Redraw = False
    Transparent = True
  end
  object LblStoinost: TLabelRec
    Left = 196
    Top = 121
    Width = 150
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    BorderStyle = bsNone
    Caption = '0.00'
    CaptionDim = 'лв.'
    Color = clWhite
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
    FreeseWidth = 4
    ParentFont = False
    ParentColor = False
    Redraw = False
    Transparent = True
  end
  object LblDrugestvo: TLabel
    Left = 125
    Top = 19
    Width = 69
    Height = 16
    Alignment = taRightJustify
    Caption = 'Дружество:'
    Transparent = True
  end
  object LblData: TLabel
    Left = 162
    Top = 45
    Width = 32
    Height = 16
    Alignment = taRightJustify
    Caption = 'Дата:'
    Transparent = True
  end
  object LblBroi: TLabel
    Left = 108
    Top = 70
    Width = 86
    Height = 16
    Alignment = taRightJustify
    Caption = 'Брой (Колич.):'
    Transparent = True
  end
  object LblCena: TLabel
    Left = 26
    Top = 95
    Width = 168
    Height = 16
    Alignment = taRightJustify
    Caption = 'Покупна цена за един брой:'
    Transparent = True
  end
  object Label7: TLabel
    Left = 15
    Top = 122
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
  object Bevel4: TBevel
    Left = 197
    Top = 117
    Width = 123
    Height = 24
    Visible = False
  end
  object Label10: TLabel
    Left = 323
    Top = 95
    Width = 18
    Height = 16
    Caption = 'лв.'
    Transparent = True
  end
  object Label12: TLabel
    Left = 323
    Top = 147
    Width = 18
    Height = 16
    Caption = 'лв.'
    Transparent = True
  end
  object Label8: TLabel
    Left = 66
    Top = 147
    Width = 128
    Height = 16
    Alignment = taRightJustify
    Caption = 'Разход за покупката:'
    Transparent = True
  end
  object Bevel2: TBevel
    Left = 20
    Top = 168
    Width = 319
    Height = 3
    Shape = bsTopLine
  end
  object Label2: TLabel
    Left = 154
    Top = 177
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
  object Bevel5: TBevel
    Left = 197
    Top = 172
    Width = 123
    Height = 24
    Visible = False
  end
  object Info: TBevelNew
    Left = 4
    Top = 206
    Width = 500
    Height = 101
    Caption = 'Допълнителни данни'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Shape = bsFrame
  end
  object EdtDrugestvo: TEdit
    Left = 197
    Top = 16
    Width = 298
    Height = 24
    TabOrder = 0
    OnKeyUp = EdtBroiKeyUp
  end
  object BtnOK: TButton
    Left = 318
    Top = 315
    Width = 89
    Height = 25
    Caption = 'Промяна'
    Default = True
    TabOrder = 6
    OnClick = BtnOKClick
  end
  object BtnCancel: TButton
    Left = 416
    Top = 315
    Width = 89
    Height = 25
    Caption = 'Изход'
    ModalResult = 2
    TabOrder = 7
  end
  object EdtData: TMaskEdit
    Left = 197
    Top = 41
    Width = 123
    Height = 24
    Ctl3D = True
    EditMask = '99/99/9999;1;_'
    MaxLength = 10
    ParentCtl3D = False
    TabOrder = 1
    Text = '  /  /    '
    OnKeyPress = EdtDataKeyPress
  end
  object EdtCena: TValueEdit
    Left = 197
    Top = 91
    Width = 123
    Height = 24
    MaxLength = 9
    TabOrder = 3
    OnKeyUp = EdtBroiKeyUp
    Format = '#0.####'
    TypeValue = tvReal
  end
  object EdtRazhod: TValueEdit
    Left = 197
    Top = 143
    Width = 123
    Height = 24
    MaxLength = 9
    TabOrder = 4
    OnKeyUp = EdtBroiKeyUp
    Format = '#0.#0'
    TypeValue = tvReal
  end
  object EdtBroi: TValueEdit
    Left = 197
    Top = 66
    Width = 123
    Height = 24
    MaxLength = 9
    TabOrder = 2
    OnKeyUp = EdtBroiKeyUp
    Format = '#0.#0'
    TypeValue = tvInteger
  end
  object DataPages: TNotebook
    Left = 8
    Top = 224
    Width = 358
    Height = 78
    PageIndex = 2
    TabOrder = 5
    object TPage
      Left = 0
      Top = 0
      Caption = 'Page1'
      object LblPage11: TLabel
        Left = 111
        Top = 5
        Width = 75
        Height = 16
        Alignment = taRightJustify
        Caption = 'Валидни до:'
        Transparent = True
      end
      object LblPage12: TLabel
        Left = 24
        Top = 31
        Width = 162
        Height = 16
        Alignment = taRightJustify
        Caption = 'Договорена цена на акция:'
        Transparent = True
      end
      object LblPage13: TLabel
        Left = 21
        Top = 56
        Width = 165
        Height = 16
        Alignment = taRightJustify
        Caption = 'Право за покупка на акций:'
        Transparent = True
      end
      object LblPage1Dim2: TLabel
        Left = 314
        Top = 56
        Width = 18
        Height = 16
        Caption = 'бр.'
        Transparent = True
      end
      object LblPage1Dim1: TLabel
        Left = 314
        Top = 32
        Width = 18
        Height = 16
        Caption = 'лв.'
        Transparent = True
      end
      object EdtPage11: TMaskEdit
        Left = 188
        Top = 2
        Width = 123
        Height = 24
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
      object EdtPage12: TValueEdit
        Left = 188
        Top = 27
        Width = 123
        Height = 24
        MaxLength = 9
        TabOrder = 1
        Format = '#0.#0'
        TypeValue = tvReal
      end
      object EdtPage13: TValueEdit
        Left = 188
        Top = 52
        Width = 123
        Height = 24
        MaxLength = 9
        TabOrder = 2
        Format = '#0.#0'
        TypeValue = tvReal
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Page2'
      object LblPage21: TLabel
        Left = 142
        Top = 6
        Width = 44
        Height = 16
        Alignment = taRightJustify
        Caption = 'Падеж:'
        Transparent = True
      end
      object LblPage22: TLabel
        Left = 129
        Top = 31
        Width = 57
        Height = 16
        Alignment = taRightJustify
        Caption = 'Номинал:'
        Transparent = True
      end
      object LblPage23: TLabel
        Left = 30
        Top = 56
        Width = 156
        Height = 16
        Alignment = taRightJustify
        Caption = 'Годищен лихвен процент:'
        Transparent = True
      end
      object LblPage2Dim2: TLabel
        Left = 314
        Top = 56
        Width = 12
        Height = 16
        Caption = '%'
        Transparent = True
      end
      object LblPage2Dim1: TLabel
        Left = 314
        Top = 31
        Width = 18
        Height = 16
        Caption = 'лв.'
        Transparent = True
      end
      object EdtPage21: TMaskEdit
        Left = 188
        Top = 2
        Width = 123
        Height = 24
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
      object EdtPage22: TValueEdit
        Left = 188
        Top = 27
        Width = 123
        Height = 24
        MaxLength = 9
        TabOrder = 1
        Format = '#0.#0'
        TypeValue = tvReal
      end
      object EdtPage23: TValueEdit
        Left = 188
        Top = 52
        Width = 123
        Height = 24
        MaxLength = 9
        TabOrder = 2
        Format = '#0.#0'
        TypeValue = tvReal
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Page3'
      object LblPage31: TLabel
        Left = 142
        Top = 5
        Width = 44
        Height = 16
        Alignment = taRightJustify
        Caption = 'Падеж:'
        Transparent = True
        Visible = False
      end
      object LblPage32: TLabel
        Left = 129
        Top = 31
        Width = 57
        Height = 16
        Alignment = taRightJustify
        Caption = 'Номинал:'
        Transparent = True
      end
      object LblPage3Dim1: TLabel
        Left = 314
        Top = 31
        Width = 18
        Height = 16
        Caption = 'лв.'
        Transparent = True
      end
      object EdtPage31: TMaskEdit
        Left = 188
        Top = 2
        Width = 123
        Height = 24
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        Visible = False
      end
      object EdtPage32: TValueEdit
        Left = 188
        Top = 27
        Width = 123
        Height = 24
        MaxLength = 9
        TabOrder = 1
        Format = '#0.#0'
        TypeValue = tvReal
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Page4'
    end
  end
end
