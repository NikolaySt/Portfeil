object Form2: TForm2
  Left = 90
  Top = 149
  Width = 500
  Height = 291
  Caption = 'Create Hide Messages'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LblFileName: TLabel
    Left = 10
    Top = 210
    Width = 47
    Height = 13
    Caption = 'FileName:'
  end
  object Label1: TLabel
    Left = 10
    Top = 6
    Width = 24
    Height = 13
    Caption = 'Text:'
  end
  object Button1: TButton
    Left = 324
    Top = 235
    Width = 83
    Height = 25
    Caption = 'Save code...'
    TabOrder = 0
    OnClick = Button1Click
  end
  object EdtFileName: TEdit
    Left = 62
    Top = 207
    Width = 344
    Height = 21
    TabOrder = 1
    Text = 'CodeInfo.txt'
  end
  object Memo1: TMemo
    Left = 9
    Top = 23
    Width = 480
    Height = 176
    TabOrder = 2
    WordWrap = False
  end
end
