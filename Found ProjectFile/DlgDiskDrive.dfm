object DlgDrive: TDlgDrive
  Left = 257
  Top = 220
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Изберете'
  ClientHeight = 145
  ClientWidth = 255
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel1: TBevel
    Left = 3
    Top = 4
    Width = 250
    Height = 138
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object Label1: TLabel
    Left = 16
    Top = 13
    Width = 221
    Height = 30
    Caption = '- Поставете Диск 1 от инсталациония пакет в устройството.'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object Label2: TLabel
    Left = 16
    Top = 44
    Width = 212
    Height = 15
    Caption = '- Изберете устройството от списъка.'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object DriveBox1: TDriveComboBox
    Left = 40
    Top = 71
    Width = 173
    Height = 22
    TabOrder = 0
  end
  object Button1: TButton
    Left = 42
    Top = 105
    Width = 75
    Height = 25
    Caption = 'ОК'
    Default = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
  end
  object Button2: TButton
    Left = 136
    Top = 105
    Width = 75
    Height = 25
    Caption = 'Изход'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 2
  end
end
