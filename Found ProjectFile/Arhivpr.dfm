object DlgArhivProgres: TDlgArhivProgres
  Left = 179
  Top = 268
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = '  '
  ClientHeight = 46
  ClientWidth = 487
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'System'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object GProgress: TGauge
    Left = 4
    Top = 19
    Width = 480
    Height = 24
    Anchors = [akLeft, akTop, akRight, akBottom]
    ForeColor = clBlue
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Progress = 0
  end
  object LblFileName: TLabel
    Left = 4
    Top = 3
    Width = 159
    Height = 13
    Caption = 'C:\WINDOWS\PortData.DB'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 487
    Height = 46
    Align = alClient
  end
end
