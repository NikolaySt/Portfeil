unit Prodagbi;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, Grids, DBGrids, Menus, DBTables,
  StdCtrls, DBCtrls, DB, Buttons, BevelNew, DBTextRegDim;

type
  TDlgProdagbi = class(TForm)
    MenuProdagbi: TMainMenu;
    N1: TMenuItem;
    QryProdagbi: TQuery;
    DtSProdagbi: TDataSource;
    QryProdagbiRedNom: TSmallintField;
    QryProdagbiData: TDateField;
    QryProdagbiBroi: TIntegerField;
    QryProdagbiProd_Cena: TFloatField;
    QryProdagbiPrih_Div: TFloatField;
    QryProdagbiRazhodi: TFloatField;
    QryProdagbiKap_Pechalba: TFloatField;
    QryProdagbiKap_Vuzv: TFloatField;
    CBoxSpisuk: TComboBox;
    QryPortfeil: TQuery;
    QryPortfeilID_Inv: TSmallintField;
    QryPortfeilData_Inv: TDateField;
    QryPortfeilChifur: TStringField;
    QryPortfeilBroi: TIntegerField;
    QryPortfeilEdin_Cena: TFloatField;
    QryPortfeilStoinost: TFloatField;
    QryPortfeilOtn_dial: TFloatField;
    QryPortfeilDrugestvo: TStringField;
    QryPortfeilInv_File: TStringField;
    DtSPortfeil: TDataSource;
    N3: TMenuItem;
    QryPortfeilSuma_Div: TFloatField;
    QryPortfeilSuma_Prod: TFloatField;
    QryPortfeilVuzv_Obtcha: TFloatField;
    QryProdagbiDoh_Prih: TStringField;
    QryPortfeilPazar_Stoin: TFloatField;
    QryPortfeilPazar_Cena: TFloatField;
    QryPortfeilInv_Stoi: TFloatField;
    QryPortfeilPurvo_Stoi: TFloatField;
    QryPortfeilKapLihva: TFloatField;
    LblAlign: TLabel;
    QryPortfeilPurvo_Broi: TIntegerField;
    QryPortfeilPurvo_Cena: TFloatField;
    QryPortfeilPurvo_Razhod: TFloatField;
    QryPortfeilValid_Padeg: TDateField;
    QryPortfeilProd_Pokupka: TIntegerField;
    QryPortfeilN_F_D_Cena: TFloatField;
    QryPortfeilKup_Lihva: TFloatField;
    QryPortfeilAlternativa: TFloatField;
    QryPortfeilMemo: TBlobField;
    N2: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    QryPortfeilVuzv_God: TFloatField;
    QryPortfeilInv_Stoi_Alternat: TFloatField;
    QrySumaProd: TQuery;
    DtSSumaProd: TDataSource;
    DBTextRec7: TDBTextRec;
    DBTextRec8: TDBTextRec;
    QrySumaProdBroi: TFloatField;
    Label14: TLabel;
    Label15: TLabel;
    N8: TMenuItem;
    BevelNew4: TBevelNew;
    DBTextRec1: TDBTextRec;
    DBTextRec14: TDBTextRec;
    DBTextRec15: TDBTextRec;
    DBTextRec16: TDBTextRec;
    DBTextRec17: TDBTextRec;
    DBTextRec18: TDBTextRec;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    BevelNew1: TBevelNew;
    DBGrid1: TDBGrid;
    QrySumaProdNetenPrihod: TFloatField;
    Bevel1: TBevel;
    Label50: TLabel;
    DBTextRec19: TDBTextRec;
    BevelNew2: TBevelNew;
    QryPortfeilPeriod: TIntegerField;
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBoxSpisukChange(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure NewDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PMenuDeleteClick(Sender: TObject);
    procedure PMenuChangeClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
		Procedure Print;
		Procedure UpdateAfterChange;     
  public

  end;

var
  DlgProdagbi: TDlgProdagbi;

implementation

Uses NewInv, PrihProd, MyConst, SetupReg, Calculat, PrtProd, DlgMess,
  Portfeil, ConstMessage;

{$R *.DFM}

Procedure TDlgProdagbi.Print;
Begin
	With DlgPrintProdagbi Do Begin
  	LblDrugestvo.Caption := QryPortfeil.FieldByName('Drugestvo').AsString;
    LblNo.Caption := 'Инвестиция No: ' +QryPortfeil.FieldByName('ID_INV').AsString;
		PrintFigure2.Caption :=	'Продажби към ' + FormatDateTime('dd/mm/yyyy', CurrentDate);
    LblShifur.Caption:= DBTextRec1.Text;

		LblData.Caption  := QryPortfeil.FieldByName('Data_Inv').DisplayText;
    LblBroi.Caption  := QryPortfeil.FieldByName('Purvo_Broi').DisplayText;
    LblCena.Caption  :=	QryPortfeil.FieldByName('Purvo_Cena').DisplayText;
    LblObtcho.Caption:= QryPortfeil.FieldByName('Purvo_Stoi').DisplayText;

    LblSumaBroi.Caption   := DBTextRec7.Text;
    LblSumaPrihod.Caption := DBTextRec8.Text;

  	QryPrintProd.Close;
    QryPrintProd.SQL.Strings[12] := QryProdagbi.SQL.Strings[12];
    QryPrintProd.Open;

    PrintDesignPage1.Refresh;
    PrintDesignPage1.Print;
  End;
End;

Procedure TDlgProdagbi.UpdateAfterChange;
Begin
  With QryProdagbi Do
  	Try
  		DisableControls;
			Close; Open;
    Finally
    	EnableControls;
  	End;
    
  Application.ProcessMessages;
  With QrySumaProd Do Begin
		Close;
  	Open;
  End;
  Application.ProcessMessages;
	If QryProdagbi.FieldByName('RedNom').AsInteger = 0 Then Begin
    N2.Enabled := False;
	  N8.Enabled := False;
	End
  Else begin
    N2.Enabled := True;
	  N8.Enabled := True;
  End;
  
  If QryPortfeil.FieldByName('Broi').AsInteger = 0 Then Begin
  	N3.Enabled := False;
  	MessageDlg1(C_Mess_DeleteInv, mtInformation, [mbOK], 0);
	End
  Else N3.Enabled := True;  
End;

procedure TDlgProdagbi.N1Click(Sender: TObject);
begin
	Close;
end;

procedure TDlgProdagbi.FormShow(Sender: TObject);
	Procedure DisableMenu(Check: Boolean);
  Begin
  	CBoxSpisuk.Enabled := Check;
    N3.Enabled := Check;
    N2.Enabled := Check;
    N8.Enabled := Check;
  end;
begin
	CBoxSpisuk.Clear;
  If CBoxSpisuk.Enabled Then CBoxSpisuk.SetFocus;
  DisableMenu(False);
	QryPortfeil.Open;

  If DlgPortfeil.DBPortfeil.CountInv > 0 Then Begin
		DlgPortfeil.DBPortfeil.ListSortGroup(CBoxSpisuk.Items);
		CBoxSpisuk.ItemIndex := 0;
    DisableMenu(True);
		CBoxSpisukChange(Nil);
  End;
end;

procedure TDlgProdagbi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	QryPortfeil.Close;
	QryProdagbi.Close;
  QrySumaProd.Close;
end;

procedure TDlgProdagbi.CBoxSpisukChange(Sender: TObject);
	Procedure DisableMenu(Check: Boolean);
  Begin
    N2.Enabled := Check;
    N8.Enabled := Check;    
  end;
begin
  If CBoxSpisuk.ItemIndex = -1 Then Exit;

  Try
    QryPortfeil.DisableControls;
    QryPortfeil.First;
    QryPortfeil.MoveBy(CBoxSpisuk.ItemIndex);
		If QryPortfeil.FieldByName('Broi').AsInteger <= 0 Then
    	N3.Enabled := False
    Else
    	N3.Enabled := True;    

    QryProdagbi.DisableControls;
    QryProdagbi.Close;
    QryProdagbi.SQL.Strings[12] := '"'+QryPortfeil.FieldByName('Inv_File').AsString+'"';
    Try
 	 		QryProdagbi.Open;
    Except
    	DisableMenu(False);
    End;
  	If QryProdagbi.FieldByName('RedNom').AsInteger = 0 Then
    	DisableMenu(False)
	  Else
    	DisableMenu(True);
  Finally
    QryProdagbi.EnableControls;
    QryPortfeil.EnableControls;
  End;

  With QrySumaProd Do Begin
	  Close;
    SQL.Strings[4] := QryProdagbi.SQL.Strings[12];
    Open;
  End;
    
  If (Assigned(Sender))And(QryPortfeil.FieldByName('Broi').AsInteger <= 0) Then
	  MessageDlg1(C_Mess_DeleteInv, mtInformation, [mbOK], 0);
end;

procedure TDlgProdagbi.N3Click(Sender: TObject);
Var
  MaxBroi: LongInt;
  Prod: TProd;
  PokupkaData: TDateTime;
begin
	MaxBroi := QryPortfeil.FieldByName('Broi').AsInteger;
  PokupkaData := QryPortfeil.FieldByName('Data_Inv').AsDateTime;
  With Prod Do Begin
	  No := 0;
    Del_Prod := False;
    Change_Prod := False;
  End;
	If DlgPrihProd.Execute(Prod, MaxBroi, PokupkaData) Then Begin
  	Prod.FileKarton := QryPortfeil.FieldByName('Inv_File').AsString;
    Try
  		MyCalc.RegProdagba(QryPortfeil, Prod);
		Finally
			UpdateAfterChange;
    End;
	End
end;

procedure TDlgProdagbi.NewDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = 46 Then Key := 0;
end;

procedure TDlgProdagbi.PMenuDeleteClick(Sender: TObject);
Var
	Prod: TProd;
begin
  If QryProdagbi.FieldByName('RedNom').AsInteger = 0 Then Begin
  	MessageDlg1(C_Mess_NotRegProd, mtInformation, [mbOK], 0);
		Exit;
  End;

	If MessageDlg1(C_Mess_DeleteZapis,
  	mtConfirmation, [mbYes, mbNo], 0) = mrYes Then Begin

    With Prod Do Begin
	    No := QryProdagbi.FieldByName('RedNom').AsInteger;;
  	  Del_Prod := True;
      Change_Prod := False;
    	FileKarton := QryPortfeil.FieldByName('Inv_File').AsString;
    End;

    Try
  		MyCalc.RegProdagba(QryPortfeil, Prod);
    Finally
			UpdateAfterChange;
    End;
  End;
end;

procedure TDlgProdagbi.PMenuChangeClick(Sender: TObject);
Var
  MaxBroi: LongInt;
  Prod: TProd;
  PokupkaData: TDateTime;
begin
  If QryProdagbi.FieldByName('RedNom').AsInteger = 0 Then Begin
  	MessageDlg1(C_Mess_NotRegProd, mtInformation, [mbOK], 0);
		Exit;
  End;

	MaxBroi := QryPortfeil.FieldByName('Broi').AsInteger;
  PokupkaData := QryPortfeil.FieldByName('Data_Inv').AsDateTime;

  With Prod, QryProdagbi Do Begin
	  No := FieldByName('RedNom').AsInteger;
    If No = 0 Then Exit;
    Data := FieldByName('Data').AsDateTime;
    Broi := FieldByName('Broi').AsInteger;
    Cena := FieldByName('Prod_Cena').AsFloat;
    Razhod := FieldByName('Razhodi').AsFloat;
    Del_Prod := False;
    Change_Prod := True;
    Prod.FileKarton := QryPortfeil.FieldByName('Inv_File').AsString;
  End;

	If DlgPrihProd.Execute(Prod, MaxBroi, PokupkaData) Then Begin
  	Try
  		MyCalc.RegProdagba(QryPortfeil, Prod);
    Finally
			UpdateAfterChange;
    End;
	End
end;

procedure TDlgProdagbi.N8Click(Sender: TObject);
begin
	If MessageDlg1(C_Mess_PrinterReady, mtConfirmation,
  		[mbYes, mbNO], 0) = mrYes Then Begin
		If Not Assigned(DlgPrintProdagbi) Then Application.CreateForm(TDlgPrintProdagbi, DlgPrintProdagbi);
    Print;
  End;
end;

procedure TDlgProdagbi.FormCreate(Sender: TObject);
begin
  If Not Assigned(DlgPrihProd) Then
  	Application.CreateForm(TDlgPrihProd, DlgPrihProd);
    
  ProgOptions.OpenTablesExt(DBGrid1, 'Prodagbi');
  ProgOptions.OpenWindowExt(DlgProdagbi, 'Prodagbi');
end;

procedure TDlgProdagbi.FormDestroy(Sender: TObject);
begin
	ProgOptions.SaveTablesExt(DBGrid1, 'Prodagbi');
  ProgOptions.SaveWindowExt(DlgProdagbi, 'Prodagbi');
end;

end.
