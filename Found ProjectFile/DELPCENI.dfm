object DlgDelPazarCena: TDlgDelPazarCena
  Left = 245
  Top = 199
  ActiveControl = EdtData1
  BorderStyle = bsDialog
  Caption = 'Изтриване'
  ClientHeight = 121
  ClientWidth = 369
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
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
    Width = 262
    Height = 109
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 19
    Top = 23
    Width = 17
    Height = 16
    Alignment = taRightJustify
    Caption = 'От'
  end
  object Label2: TLabel
    Left = 128
    Top = 23
    Width = 17
    Height = 16
    Alignment = taRightJustify
    Caption = 'До'
  end
  object Bevel2: TBevel
    Left = 21
    Top = 50
    Width = 208
    Height = 5
    Shape = bsTopLine
  end
  object EdtData1: TMaskEdit
    Left = 40
    Top = 18
    Width = 77
    Height = 24
    EditMask = '99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
  end
  object EdtData2: TMaskEdit
    Left = 149
    Top = 18
    Width = 77
    Height = 24
    EditMask = '99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  object BtnOK: TButton
    Left = 274
    Top = 6
    Width = 89
    Height = 25
    Caption = 'Триене...'
    Default = True
    TabOrder = 4
    OnClick = BtnOKClick
  end
  object BtnCancel: TButton
    Left = 274
    Top = 36
    Width = 89
    Height = 25
    Caption = 'Изход'
    ModalResult = 2
    TabOrder = 5
  end
  object ChBoxAll: TCheckBox
    Left = 21
    Top = 63
    Width = 195
    Height = 17
    Caption = 'Всичко'
    TabOrder = 2
    OnClick = ChBoxAllClick
  end
  object ChBoxCurr: TCheckBox
    Left = 21
    Top = 88
    Width = 195
    Height = 17
    Caption = 'Текуща позиция'
    TabOrder = 3
    OnClick = ChBoxCurrClick
  end
end
