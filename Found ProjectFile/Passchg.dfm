object DlgChangePass: TDlgChangePass
  Left = 190
  Top = 230
  HelpContext = 900
  ActiveControl = EdtNewPass
  BorderStyle = bsDialog
  Caption = 'Въвеждане на парола'
  ClientHeight = 104
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
    Width = 289
    Height = 91
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 112
    Top = 16
    Width = 48
    Height = 16
    Alignment = taRightJustify
    Caption = 'Парола:'
  end
  object Label2: TLabel
    Left = 28
    Top = 44
    Width = 132
    Height = 16
    Alignment = taRightJustify
    Caption = 'Потвърдете паролата:'
  end
  object Bevel2: TBevel
    Left = 25
    Top = 67
    Width = 247
    Height = 4
    Shape = bsTopLine
  end
  object EdtNewPass: TEdit
    Left = 164
    Top = 12
    Width = 108
    Height = 24
    MaxLength = 20
    PasswordChar = '*'
    TabOrder = 0
  end
  object EdtConfirmPass: TEdit
    Left = 164
    Top = 40
    Width = 108
    Height = 24
    MaxLength = 20
    PasswordChar = '*'
    TabOrder = 1
  end
  object ChkBoxDisable: TCheckBox
    Left = 26
    Top = 74
    Width = 240
    Height = 17
    Caption = 'Изключване на паролата'
    TabOrder = 2
    OnClick = ChkBoxDisableClick
  end
  object BtnOK: TButton
    Left = 301
    Top = 6
    Width = 89
    Height = 25
    Caption = 'Запис'
    Default = True
    TabOrder = 3
    OnClick = BtnOKClick
  end
  object BtnCancel: TButton
    Left = 301
    Top = 38
    Width = 89
    Height = 25
    Caption = 'Изход'
    ModalResult = 2
    TabOrder = 4
  end
end
