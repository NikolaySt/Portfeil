object Form1: TForm1
  Left = 226
  Top = 107
  Width = 711
  Height = 570
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Courier New'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 14
  object DBStatusLabel1: TDBStatusLabel
    Left = 1
    Top = 252
    Width = 114
    Height = 14
    DataSource = DataSource1
    Captions.Strings = (
      'dsInactive'
      'dsBrowse'
      'dsEdit'
      'dsInsert'
      'dsSetKey'
      'dsCalcFields')
    CalcRecCount = True
    OnGetDataName = DBStatusLabel1GetDataName
  end
  object Label1: TLabel
    Left = 11
    Top = 297
    Width = 56
    Height = 14
    Caption = 'Filename'
  end
  object Label2: TLabel
    Left = 15
    Top = 272
    Width = 56
    Height = 14
    Caption = 'Password'
  end
  object Label3: TLabel
    Left = 12
    Top = 325
    Width = 70
    Height = 14
    Caption = 'Local Info'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 250
    Height = 248
    TextRow = 2
    EnableInsertRec = False
    ColMoving = False
    BGMessage = True
    Ctl3D = True
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'MasterTable1Field3'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MasterTable1Field4'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MMCalc'
        Visible = True
      end>
  end
  object Button2: TButton
    Left = 325
    Top = 265
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 406
    Top = 265
    Width = 75
    Height = 25
    Caption = 'Load'
    TabOrder = 2
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 217
    Top = 265
    Width = 101
    Height = 25
    Caption = 'Sec Add'
    TabOrder = 3
    OnClick = Button5Click
  end
  object DBRichEdit1: TDBRichEdit
    Left = 560
    Top = 2
    Width = 134
    Height = 147
    DataField = 'MasterTable1Field3'
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object Edit1: TEdit
    Left = 78
    Top = 293
    Width = 121
    Height = 22
    TabOrder = 5
    Text = 'test_01.txt'
  end
  object DBGrid2: TDBGrid
    Left = 253
    Top = 0
    Width = 301
    Height = 249
    TextRow = 2
    DataSource = DataSource2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Courier New'
    TitleFont.Style = [fsBold]
  end
  object CheckBox1: TCheckBox
    Left = 562
    Top = 154
    Width = 97
    Height = 17
    Caption = 'Blob load'
    TabOrder = 7
  end
  object EdtPass: TEdit
    Left = 77
    Top = 269
    Width = 121
    Height = 22
    TabOrder = 8
  end
  object Button9: TButton
    Left = 486
    Top = 265
    Width = 75
    Height = 25
    Caption = 'Close 1'
    TabOrder = 9
    OnClick = Button9Click
  end
  object Memo1: TMemo
    Left = 10
    Top = 341
    Width = 386
    Height = 139
    Lines.Strings = (
      'Memo1')
    TabOrder = 10
  end
  object Button1: TButton
    Left = 220
    Top = 298
    Width = 75
    Height = 25
    Caption = 'NEW'
    TabOrder = 11
    OnClick = Button1Click
  end
  object ChCompress: TCheckBox
    Left = 408
    Top = 344
    Width = 97
    Height = 17
    Caption = 'Compress'
    TabOrder = 12
  end
  object ChCoding: TCheckBox
    Left = 407
    Top = 368
    Width = 97
    Height = 17
    Caption = 'Coding'
    TabOrder = 13
  end
  object DataSource1: TDataSource
    DataSet = MasterTable1
    OnDataChange = DataSource1DataChange
    Left = 152
    Top = 161
  end
  object MasterTable1: TMasterTable
    Capacity = 60
    Filtered = True
    FieldDefs = <
      item
        Name = 'MasterTable1Field3'
        DataType = ftBlob
      end
      item
        Name = 'MasterTable1Field4'
        DataType = ftString
        Size = 20
      end>
    AfterOpen = MasterTable1AfterOpen
    OnCalcFields = MasterTable1CalcFields
    OnFilterRecord = MasterTable1FilterRecord
    Compress = True
    Coding = True
    Operations = <
      item
        Name = 'DataO1'
        FieldOperation = foSUM
      end
      item
        Name = 'DataO2'
        FieldOperation = foSUM
      end
      item
        Name = 'DataO3'
        FieldOperation = foSUM
      end>
    TableName = 
      'E:\Arhives\My Computer\Projects\Projects\Projects 32\PORTFEIL\Fi' +
      'leStream\test_01.txt'
    Left = 77
    Top = 161
    object MasterTable1MasterTable1Field3: TBlobField
      FieldName = 'MasterTable1Field3'
    end
    object MasterTable1MasterTable1Field4: TStringField
      FieldName = 'MasterTable1Field4'
    end
    object MasterTable1MMCalc: TWordField
      FieldKind = fkCalculated
      FieldName = 'MMCalc'
      Calculated = True
    end
  end
  object DataSource2: TDataSource
    DataSet = MasterTable2
    Left = 310
    Top = 126
  end
  object MasterTable2: TMasterTable
    FieldDefs = <>
    AfterPost = MasterTable2AfterPost
    Compress = False
    Coding = False
    Operations = <>
    Left = 383
    Top = 124
  end
  object RxMemoryData1: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxMemoryData1Field1'
        DataType = ftBlob
      end
      item
        Name = 'RxMemoryData1Field2'
        DataType = ftSmallint
      end>
    Left = 542
    Top = 382
    object RxMemoryData1RxMemoryData1Field1: TBlobField
      FieldName = 'RxMemoryData1Field1'
    end
    object RxMemoryData1RxMemoryData1Field2: TSmallintField
      FieldName = 'RxMemoryData1Field2'
    end
    object RxMemoryData1MMCalc: TWordField
      FieldKind = fkCalculated
      FieldName = 'MMCalc'
      Calculated = True
    end
  end
  object MasterTable3: TMasterTable
    FieldDefs = <
      item
        Name = 'MasterTable3Field1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MasterTable3Field2'
        DataType = ftWord
      end>
    Active = True
    Compress = False
    Coding = False
    Operations = <>
    Left = 541
    Top = 441
    object MasterTable3MasterTable3Field1: TStringField
      FieldName = 'MasterTable3Field1'
    end
    object MasterTable3MasterTable3Field2: TWordField
      FieldName = 'MasterTable3Field2'
    end
    object MasterTable3Master: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Master'
      Calculated = True
    end
  end
end
