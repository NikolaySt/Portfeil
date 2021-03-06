object DlgPrihProd: TDlgPrihProd
  Left = 259
  Top = 307
  HelpContext = 300
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Продажби'
  ClientHeight = 127
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
    Top = 5
    Width = 289
    Height = 116
    Shape = bsFrame
  end
  object Label3: TLabel
    Left = 143
    Top = 17
    Width = 32
    Height = 16
    Alignment = taRightJustify
    Caption = 'Дата:'
    Transparent = True
  end
  object Label5: TLabel
    Left = 141
    Top = 43
    Width = 34
    Height = 16
    Alignment = taRightJustify
    Caption = 'Брой:'
    Transparent = True
  end
  object Label6: TLabel
    Left = 78
    Top = 69
    Width = 97
    Height = 16
    Alignment = taRightJustify
    Caption = 'Продажна цена:'
    Transparent = True
  end
  object Label10: TLabel
    Left = 266
    Top = 68
    Width = 18
    Height = 16
    Caption = 'лв.'
    Transparent = True
  end
  object Label2: TLabel
    Left = 35
    Top = 96
    Width = 140
    Height = 16
    Alignment = taRightJustify
    Caption = 'Разход за продажбата:'
    Transparent = True
  end
  object Label1: TLabel
    Left = 266
    Top = 93
    Width = 18
    Height = 16
    Caption = 'лв.'
    Transparent = True
  end
  object EdtData: TMaskEdit
    Left = 182
    Top = 12
    Width = 80
    Height = 24
    EditMask = '99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
    OnKeyUp = EdtDataKeyUp
  end
  object EdtBroi: TValueEdit
    Left = 182
    Top = 38
    Width = 80
    Height = 24
    MaxLength = 8
    TabOrder = 1
    OnKeyUp = EdtDataKeyUp
    Format = '#0.#0'
    TypeValue = tvReal
  end
  object EdtCena: TValueEdit
    Left = 182
    Top = 64
    Width = 80
    Height = 24
    MaxLength = 8
    TabOrder = 2
    OnKeyUp = EdtDataKeyUp
    Format = '#0.####'
    TypeValue = tvReal
  end
  object EdtRazhod: TValueEdit
    Left = 182
    Top = 91
    Width = 80
    Height = 24
    MaxLength = 6
    TabOrder = 3
    OnKeyUp = EdtDataKeyUp
    Format = '#0.#0'
    TypeValue = tvReal
  end
  object BtnCancel: TButton
    Left = 301
    Top = 36
    Width = 89
    Height = 25
    Caption = 'Изход'
    ModalResult = 2
    TabOrder = 4
  end
  object BtnOK: TButton
    Left = 301
    Top = 5
    Width = 89
    Height = 25
    Caption = 'Добави'
    Default = True
    TabOrder = 5
    OnClick = BtnOKClick
  end
end
