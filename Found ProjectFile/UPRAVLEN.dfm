object DlgUpravlenie: TDlgUpravlenie
  Left = 203
  Top = 102
  Width = 640
  Height = 555
  HelpContext = 600
  Caption = 'Управление на портфейла'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    00000000000000000000000000000000000000000000000000000000000000FF
    00000000000000000000000FF00000FF7000000000000000000000FFF00000F0
    F70000000000000000000F80F00000F00F700000000000000000F800F00000F0
    00F7000000000000000F8000F00000F0000F70000000000000F80000F00000F0
    0000F700000000000F800000F00000F000000F7000000000F8000000F00000F0
    000000F70000000F80000000F00000F00000000F700000F800000000F00000F0
    00000000F7000F8000000000F00000F0000000000F70F80000000000F00000F7
    00000000000F80000000000FF0000000F700000000F8000000000F8000000000
    00F700000F80F700000F8000000000000000F700F8000F700F80000000000000
    0000000F8000000F8000000000000000000000F807000F800000000000000000
    00000F800000000077000000000000000000F800000000000F70000000000000
    000F80000000000000F700000000000000F8000000000000000F700000000000
    0F800000000000000000F70000000000F80000000000000000000F700000000F
    8000000000000000000000F7000000F800000000000000000000000F70000F80
    000000000000000000000000F7000FF800000000000000000000000FFF0000FF
    FFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000FFFF
    FFFFCFFFFFE787FFFFC383FFFF8381FFFF0380FFFE03887FFC238C3FF8638E1F
    F0E38F0FE1E38F87C3E38FC387E38FE10FE38FF01FE383F83F83C0F83E07F030
    181FFC01007FFF0381FFFF8103FFFF0381FFFE1FF0FFFC3FF87FF87FFC3FF0FF
    FE1FE1FFFF0FC3FFFF8787FFFFC30FFFFFE10000000180000003C0000007}
  KeyPreview = True
  Menu = MenuUpravlenie
  OldCreateOrder = True
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 0
    Top = 381
    Width = 632
    Height = 3
    Cursor = crVSplit
    Align = alTop
    AutoSnap = False
    Beveled = True
    ResizeStyle = rsLine
  end
  object Period1: TPeriod
    Left = 0
    Top = 384
    Width = 632
    Height = 122
    Align = alClient
    BrushBackGround.Color = clWindow
    BrushSelect.Color = clAqua
    BrushNoSelect.Color = clSilver
    FontDate.Charset = DEFAULT_CHARSET
    FontDate.Color = clBlack
    FontDate.Height = -13
    FontDate.Name = 'MS Sans Serif'
    FontDate.Style = []
    FontNoSelect.Charset = RUSSIAN_CHARSET
    FontNoSelect.Color = clBlack
    FontNoSelect.Height = -13
    FontNoSelect.Name = 'Arial'
    FontNoSelect.Style = [fsBold]
    FontSelect.Charset = RUSSIAN_CHARSET
    FontSelect.Color = clBlack
    FontSelect.Height = -13
    FontSelect.Name = 'Arial'
    FontSelect.Style = [fsBold]
    PenGrids.Color = clSilver
    PenGrids.Style = psDot
    PenArea.Width = 2
    MoveLeft = 10
    MoveTop = 10
    MoveRight = 10
    MoveBottom = 10
    TextPosition = tpCenter
    TextPlus = ' дни'
    TextPlusPosition = ppRight
    OnMouseUp = Period1MouseUp
  end
  object PnlAlignBase: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 381
    Align = alTop
    BevelOuter = bvNone
    Ctl3D = True
    ParentColor = True
    ParentCtl3D = False
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 351
      Top = 0
      Width = 3
      Height = 381
      Cursor = crHSplit
      AutoSnap = False
      Beveled = True
      ResizeStyle = rsLine
    end
    object Panel1: TPanel
      Left = 354
      Top = 0
      Width = 278
      Height = 381
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      OnResize = Panel1Resize
      object LblPeriods: TLabelRec
        Left = 0
        Top = 0
        Width = 278
        Height = 36
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        BorderStyle = bsNone
        Caption = 'Създаване на периоди:'
        Color = clWhite
        DimBuffer = 0
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
        Freese = False
        FreeseWidth = 0
        ParentFont = False
        ParentColor = False
        Redraw = False
        Transparent = True
      end
      object LBoxData: TListBoxExtHint
        Left = 0
        Top = 36
        Width = 278
        Height = 345
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        MultiSelect = True
        ParentFont = False
        TabOrder = 0
        OnSelectDate = LBoxDataSelectDate
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 351
      Height = 381
      Align = alLeft
      BevelOuter = bvNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      object Label9: TLabel
        Left = 0
        Top = 0
        Width = 351
        Height = 168
        Align = alTop
        AutoSize = False
        Transparent = True
      end
      object BevelNew2: TBevelNew
        Left = 2
        Top = 49
        Width = 345
        Height = 46
        Caption = 'Период'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Shape = bsFrame
      end
      object BevelNew1: TBevelNew
        Left = 2
        Top = 97
        Width = 345
        Height = 67
        Caption = 'Промяна'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Shape = bsFrame
      end
      object Label3: TLabel
        Left = 49
        Top = 69
        Width = 15
        Height = 16
        Caption = 'От'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label10: TLabel
        Left = 192
        Top = 69
        Width = 15
        Height = 16
        Caption = 'до'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label8: TLabel
        Left = 115
        Top = 116
        Width = 94
        Height = 16
        Alignment = taRightJustify
        Caption = 'Борсов индекс:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label7: TLabel
        Left = 169
        Top = 138
        Width = 40
        Height = 16
        Alignment = taRightJustify
        Caption = 'Акции:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object LblData1: TLabelRec
        Left = 71
        Top = 67
        Width = 96
        Height = 20
        Alignment = taCenter
        AutoSize = False
        Color = 15269887
        DimBuffer = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        FontDim.Charset = DEFAULT_CHARSET
        FontDim.Color = clWindowText
        FontDim.Height = -11
        FontDim.Name = 'MS Sans Serif'
        FontDim.Style = []
        Freese = False
        FreeseWidth = 0
        ParentFont = False
        ParentColor = False
        Redraw = False
      end
      object LblData2: TLabelRec
        Left = 214
        Top = 67
        Width = 96
        Height = 20
        Alignment = taCenter
        AutoSize = False
        Color = 15269887
        DimBuffer = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        FontDim.Charset = DEFAULT_CHARSET
        FontDim.Color = clWindowText
        FontDim.Height = -11
        FontDim.Name = 'MS Sans Serif'
        FontDim.Style = []
        Freese = False
        FreeseWidth = 0
        ParentFont = False
        ParentColor = False
        Redraw = False
      end
      object LblIndex: TLabelRec
        Left = 213
        Top = 113
        Width = 114
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        CaptionDim = '%'
        Color = 15269887
        DimBuffer = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        FontDim.Charset = DEFAULT_CHARSET
        FontDim.Color = clBlack
        FontDim.Height = -13
        FontDim.Name = 'MS Sans Serif'
        FontDim.Style = []
        Freese = True
        FreeseWidth = 2
        ParentFont = False
        ParentColor = False
        Redraw = False
      end
      object LblAkcii: TLabelRec
        Left = 213
        Top = 137
        Width = 114
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0.00'
        CaptionDim = '%'
        Color = 15269887
        DimBuffer = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        FontDim.Charset = DEFAULT_CHARSET
        FontDim.Color = clBlack
        FontDim.Height = -13
        FontDim.Name = 'MS Sans Serif'
        FontDim.Style = []
        Freese = True
        FreeseWidth = 2
        ParentFont = False
        ParentColor = False
        Redraw = False
      end
      object BevelNew3: TBevelNew
        Left = 2
        Top = 4
        Width = 345
        Height = 24
        Caption = 'Формат'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Shape = bsTopLine
      end
      object CBoxTriMesec: TComboBox
        Left = 2
        Top = 24
        Width = 345
        Height = 24
        Style = csDropDownList
        Ctl3D = True
        DropDownCount = 4
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ItemHeight = 16
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnChange = CBoxTriMesecChange
        Items.Strings = (
          '1-во тримесечие (януари - март)'
          '2-ро тримесечие (април - юни)'
          '3-то тримесечие (юли - септември)'
          '4-то тримесечие (октомври - декември)')
      end
      object DBGridUprav: TDBGrid
        Left = 0
        Top = 168
        Width = 351
        Height = 213
        Align = alClient
        DataSource = DtSMem
        DefaultDrawing = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Arial'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = DBGridUpravDrawColumnCell
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'IDINV'
            Title.Alignment = taCenter
            Title.Caption = 'No'
            Title.Color = clAqua
            Width = 26
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Shifur'
            Title.Alignment = taCenter
            Title.Caption = 'Шифър'
            Title.Color = clAqua
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Drugestvo'
            Title.Alignment = taCenter
            Title.Caption = 'Дружество (Емитент, издател...)'
            Title.Color = clAqua
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Promiana'
            Title.Alignment = taCenter
            Title.Caption = 'Промяна в %'
            Title.Color = clAqua
            Width = 82
            Visible = True
          end>
      end
    end
  end
  object MenuUpravlenie: TMainMenu
    Left = 32
    Top = 241
    object N2: TMenuItem
      Caption = 'Избор'
      object N3: TMenuItem
        Caption = 'Портфейл...'
        ShortCut = 16454
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = 'Картотека...'
        ShortCut = 16459
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object N1: TMenuItem
        Caption = 'Изход'
        ShortCut = 32883
        OnClick = N1Click
      end
    end
    object N6: TMenuItem
      Caption = 'Изтриване'
      Enabled = False
      Visible = False
      object N7: TMenuItem
        Caption = 'Текущт период'
      end
      object N8: TMenuItem
        Caption = 'Всички'
      end
    end
  end
  object DtSMem: TDataSource
    DataSet = TblMem
    Left = 212
    Top = 346
  end
  object TblMem: TAttachTable
    DatabaseName = 'Portfeil'
    TableName = 'MyTemp2'
    Left = 160
    Top = 345
    object TblMemIDINV: TIntegerField
      FieldName = 'IDINV'
    end
    object TblMemShifur: TStringField
      FieldName = 'Shifur'
      Size = 6
    end
    object TblMemDrugestvo: TStringField
      FieldName = 'Drugestvo'
      Size = 50
    end
    object TblMemPromiana: TFloatField
      DisplayWidth = 10
      FieldName = 'Promiana'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '#0.#0#'
    end
    object TblMemKriteri2: TBooleanField
      FieldName = 'Kriteri2'
    end
  end
  object TblDataTrims: TTable
    DatabaseName = 'Portfeil'
    Exclusive = True
    TableName = 'DataUpra.DB'
    Left = 161
    Top = 397
  end
end
