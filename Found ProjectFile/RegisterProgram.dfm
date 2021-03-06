object DlgRegProgram: TDlgRegProgram
  Left = 233
  Top = 210
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Регистрация'
  ClientHeight = 151
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BevelNew2: TBevelNew
    Left = 4
    Top = -1
    Width = 378
    Height = 109
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 81
    Top = 16
    Width = 25
    Height = 13
    Alignment = taRightJustify
    Caption = 'Име:'
  end
  object Label2: TLabel
    Left = 66
    Top = 48
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = 'Фирма:'
  end
  object Label3: TLabel
    Left = 49
    Top = 79
    Width = 57
    Height = 13
    Alignment = taRightJustify
    Caption = 'Сериен No:'
  end
  object Image1: TImage
    Left = 22
    Top = 24
    Width = 32
    Height = 32
    AutoSize = True
    Center = True
    Picture.Data = {
      055449636F6E0000010001002020040000000000E80200001600000028000000
      2000000040000000010004000000000000020000000000000000000000000000
      0000000000000000000080000080000000808000800000008000800080800000
      C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
      FFFFFF0000000000000000000000000000000000000000000007000000000000
      0000000000000000087770000000000000000000000000700878703333333333
      3333380000008777000870BBBBBBBBBBBBBB783000008787007870BBBBBBBBBB
      BBBB7380000000878F78707777777777777B783000000787087870BBBBBBBBBB
      BBBB73800008F7870008707777777777777B783000008787008870BBBBBBBBBB
      BBBB7380000000878F78707777777777777B7830000008878F7870BBBBBBBBBB
      BBBB73800008F7870878707777777777777B78300008F787087880BBBBBBBBBB
      BBBB7380000087878F7F807777777777777B783000008788F777770BBBBBBBBB
      BBBB73800008F78F77F7F780BBBBBBBBBBBF7830008F78F77F7F77780FFFFFFF
      FFF7738008F778F777F7F77808383838383838308F77F8F77F007F7803838383
      800383808F7778F77080077800383838373038308F77F8F77088077800333333
      373033008F77088F7700778030000000373000008F770888FFFF080B30000000
      3730000008F770078888083B3000000037300000008FFFF78000003B30000000
      37300000000888888008003B3000000037300000000000800080003B73000003
      B73000000000000000000003B73000077300000000000000000000003BB3337B
      300000000000000000000000033BBBB000000000000000000000000000033330
      00000000FFEFFFFFFFC7FFFFFD800003F8800001F0400000F0000000F8000000
      F0000000E0400000F0000000F8000000F0000000E0000000E0000000F0000000
      F0000000E0000000C00000008000000000000000001000010000000300003F0F
      00003F0F80003F0FC0343F0FE0643F0FF9CC1E0FFC1E001FFFFF003FFFFF807F
      FFFFE1FF}
    Transparent = True
  end
  object EdtName: TEdit
    Left = 113
    Top = 13
    Width = 248
    Height = 21
    MaxLength = 50
    TabOrder = 0
  end
  object EdtFirma: TEdit
    Left = 113
    Top = 44
    Width = 248
    Height = 21
    MaxLength = 50
    TabOrder = 1
  end
  object EdtSer1: TEdit
    Left = 113
    Top = 75
    Width = 56
    Height = 24
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Fixedsys'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 2
    OnChange = EdtSer1Change
    OnKeyPress = EdtSer1KeyPress
  end
  object EdtSer4: TEdit
    Left = 305
    Top = 75
    Width = 56
    Height = 24
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Fixedsys'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 5
    OnKeyPress = EdtSer1KeyPress
  end
  object EdtSer3: TEdit
    Left = 241
    Top = 75
    Width = 56
    Height = 24
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Fixedsys'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 4
    OnChange = EdtSer3Change
    OnKeyPress = EdtSer1KeyPress
  end
  object EdtSer2: TEdit
    Left = 177
    Top = 75
    Width = 56
    Height = 24
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Fixedsys'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 3
    OnChange = EdtSer2Change
    OnKeyPress = EdtSer1KeyPress
  end
  object BtnOK: TButton
    Left = 114
    Top = 118
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 6
    OnClick = BtnOKClick
  end
  object BtnCancel: TButton
    Left = 201
    Top = 118
    Width = 75
    Height = 25
    Caption = 'Изход'
    ModalResult = 2
    TabOrder = 7
  end
end
