unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MemDB, Buttons, StdCtrls, DB, ComCtrls, DBCtrls, Grids, DBGrids,
  RXCtrls, RXDBCtrl, RxMemDS;

type
  TForm1 = class(TForm)
    DBStatusLabel1: TDBStatusLabel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    DBRichEdit1: TDBRichEdit;
    MasterTable1: TMasterTable;
    Edit1: TEdit;
    Label1: TLabel;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    MasterTable2: TMasterTable;
    CheckBox1: TCheckBox;
    EdtPass: TEdit;
    Label2: TLabel;
    Button9: TButton;
    Label3: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    ChCompress: TCheckBox;
    ChCoding: TCheckBox;
    MasterTable1MasterTable1Field3: TBlobField;
    MasterTable1MasterTable1Field4: TStringField;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1RxMemoryData1Field1: TBlobField;
    RxMemoryData1RxMemoryData1Field2: TSmallintField;
    RxMemoryData1MMCalc: TWordField;
    MasterTable3: TMasterTable;
    MasterTable3MasterTable3Field1: TStringField;
    MasterTable3MasterTable3Field2: TWordField;
    MasterTable3Master: TFloatField;
    MasterTable1MMCalc: TWordField;
    function DBStatusLabel1GetDataName(Sender: TObject): String;
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure MasterTable2AfterPost(DataSet: TDataSet);
    procedure Button9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MasterTable1AfterOpen(DataSet: TDataSet);
    procedure MasterTable1CalcFields(DataSet: TDataSet);
    procedure MasterTable1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    procedure AddInfoToMemo(LInfo: TDBLocalInfo);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
  c_dir = 'E:\Arhives\My Computer\Projects\Projects\Projects 32\PORTFEIL\FileStream\datatest\';

function TForm1.DBStatusLabel1GetDataName(Sender: TObject): String;
begin
  Result := 'NICK';
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  LInfo: TDBLocalInfo;
begin
  MasterTable1.TableName := Edit1.Text;
  LInfo := MasterTable1.DBLocalInfo;
  LInfo.Password := EdtPass.Text;
  LInfo.Owner := 'Nikolay Stoychev';
  LInfo.Date := Date;
  LInfo.FileName := Edit1.Text;
  LInfo.LocalInfo := 'Dekart ltd 2002';
  LInfo.OtherInfo := 'Инвестиционен портфейл 2001';

  MasterTable1.DBLocalInfo := LInfo;

  MasterTable1.Compress := ChCompress.Checked;
  MasterTable1.Coding := ChCoding.Checked;

  MasterTable1.SaveToFile;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  MasterTable1.Close;
  MasterTable1.TableName := Edit1.Text;
  MasterTable1.Open;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  i: Integer;
begin
  MasterTable1.DisableControls;
  try
    Randomize;
    for i := 0 to 4 do
      with MasterTable1 do
      begin
        Append;
        (Fields[0] as TBlobField).LoadFromFile(c_dir + 'childdb.txt'{'pass3.txt'});
        Fields[1].AsString := '1001.1001';
        Post;
      end;
  finally
    MasterTable1.EnableControls;
  end;
end;

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
var
  Stream: TmemoryStream;
begin
  if CheckBox1.Checked and MasterTable1.Active then
  begin
    Stream := TmemoryStream.Create;
    try
      MasterTable2.Close;
      MasterTable2.Fields.Clear;
      MasterTable2.FieldDefs.Clear;

      (MasterTable1.Fields[0] as TBlobField).SaveToStream(Stream);
      Stream.Position := 0;
      MasterTable2.LoadFromStream(Stream);
      MasterTable2.Open;
    finally
      Stream.Free;
    end;
  end;
end;

procedure TForm1.MasterTable2AfterPost(DataSet: TDataSet);
var
  Stream: TmemoryStream;
begin
  with MasterTable1 do
  begin
    CheckBox1.Checked := False;
    Stream := TmemoryStream.Create;

    try
      MasterTable2.SaveToStream(Stream);

      Edit;
      (Fields[0] as TBlobField).LoadFromStream(Stream);
      Post;
      
    finally
      Stream.Free;
    end;
    
  end;
  CheckBox1.Checked := True;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  MasterTable1.Close;
  MasterTable2.Close;
end;

procedure TForm1.AddInfoToMemo(LInfo: TDBLocalInfo);
var
  S: string;
begin
  S := '';
  with LInfo do
  begin
    S := S + 'Дата:' + FormatDateTime('dd/mm/yyyy', Date) + #13 + #10;
    S := S + 'Файл:' + FileName + #13 + #10;
    S := S + 'Собственик:' + Owner + #13 + #10;
    S := S + 'Инфо:' + LocalInfo + #13 + #10;
    S := S + 'Парола:' + Password + #13 + #10;
    S := S + 'Друго:' + OtherInfo + #13 + #10;
  end;
  Memo1.Lines.Text := S;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  MasterTable1.Active := True;
end;

procedure TForm1.MasterTable1AfterOpen(DataSet: TDataSet);
begin
  ChCompress.Checked := MasterTable1.Compress;
  ChCoding.Checked := MasterTable1.Coding;
  AddInfoToMemo(MasterTable1.DBLocalInfo);
end;

procedure TForm1.MasterTable1CalcFields(DataSet: TDataSet);
begin
  DataSet.Fields[2].AsInteger := 10*Random(10);
end;

procedure TForm1.MasterTable1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
{
  if DataSet.Fields[1].AsString = '1001.1001' then
    Accept := True
  else
    Accept := False;
}    
end;

end.
