object DlgPrihDohod: TDlgPrihDohod
  Left = 259
  Top = 123
  HelpContext = 400
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Дивидент'
  ClientHeight = 155
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel1: TBevel
    Left = 5
    Top = 6
    Width = 288
    Height = 143
    Shape = bsFrame
  end
  object Label3: TLabel
    Left = 137
    Top = 19
    Width = 32
    Height = 16
    Alignment = taRightJustify
    Caption = 'Дата:'
  end
  object Label5: TLabel
    Left = 135
    Top = 44
    Width = 34
    Height = 16
    Alignment = taRightJustify
    Caption = 'Брой:'
  end
  object Label6: TLabel
    Left = 54
    Top = 95
    Width = 115
    Height = 16
    Alignment = taRightJustify
    Caption = 'Получен дивидент:'
  end
  object Label10: TLabel
    Left = 258
    Top = 96
    Width = 18
    Height = 16
    Caption = 'лв.'
  end
  object Label2: TLabel
    Left = 122
    Top = 70
    Width = 47
    Height = 16
    Alignment = taRightJustify
    Caption = 'Година:'
  end
  object LblBezpl: TLabel
    Left = 65
    Top = 122
    Width = 104
    Height = 16
    Alignment = taRightJustify
    Caption = 'Безплатни акции:'
  end
  object Label4: TLabel
    Left = 257
    Top = 122
    Width = 18
    Height = 16
    Caption = 'бр.'
  end
  object EdtData: TMaskEdit
    Left = 175
    Top = 14
    Width = 79
    Height = 24
    EditMask = '99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
    OnKeyUp = EdtDataKeyUp
  end
  object EdtBroi: TValueEdit
    Left = 175
    Top = 39
    Width = 79
    Height = 24
    MaxLength = 8
    TabOrder = 1
    OnKeyUp = EdtDataKeyUp
    Format = '#0.#0'
    TypeValue = tvReal
  end
  object EdtGodina: TValueEdit
    Left = 175
    Top = 65
    Width = 79
    Height = 24
    MaxLength = 4
    TabOrder = 2
    OnKeyUp = EdtDataKeyUp
    Format = '#0.#0'
    TypeValue = tvInteger
  end
  object EdtSuma: TValueEdit
    Left = 175
    Top = 91
    Width = 79
    Height = 24
    MaxLength = 8
    TabOrder = 3
    OnKeyUp = EdtDataKeyUp
    Format = '#0.#0'
    TypeValue = tvReal
  end
  object EdtBezpl: TValueEdit
    Left = 175
    Top = 117
    Width = 79
    Height = 24
    MaxLength = 8
    TabOrder = 4
    OnKeyUp = EdtDataKeyUp
    Format = '#0.#0'
    TypeValue = tvReal
  end
  object BtnCancel: TButton
    Left = 300
    Top = 37
    Width = 89
    Height = 25
    Caption = 'Изход'
    ModalResult = 2
    TabOrder = 5
  end
  object BtnOK: TButton
    Left = 300
    Top = 6
    Width = 89
    Height = 25
    Caption = 'Добави'
    Default = True
    TabOrder = 6
    OnClick = BtnOKClick
  end
end
