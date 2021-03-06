unit Dohod;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, ExtCtrls, Menus, Grids, DBGrids,
  StdCtrls, DBCtrls, BevelNew, DBTextRegDim;

type
  TDlgDohod = class(TForm)
    QryDohod: TQuery;
    DtSDohod: TDataSource;
    QryDohodRedNom: TSmallintField;
    QryDohodData: TDateField;
    QryDohodGodina: TSmallintField;
    QryDohodPrih_Div: TFloatField;
    QryDohodBezpl_Akcii: TIntegerField;
    QrySpravka: TQuery;
    DtSSpravka: TDataSource;
    QrySpravkaGodina: TSmallintField;
    QrySpravkaSUMofProd_Cena: TFloatField;
    DohodMenu: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    QryDohodBroi: TIntegerField;
    QryPortfeil: TQuery;
    CBoxSpisuk: TComboBox;
    QryPortfeilID_Inv: TSmallintField;
    QryPortfeilData_Inv: TDateField;
    QryPortfeilChifur: TStringField;
    QryPortfeilBroi: TIntegerField;
    QryPortfeilEdin_Cena: TFloatField;
    QryPortfeilStoinost: TFloatField;
    QryPortfeilOtn_dial: TFloatField;
    QryPortfeilInv_File: TStringField;
    QryPortfeilDrugestvo: TStringField;
    QryDohodProd_Cena: TFloatField;
    QryDohodDoh_Prih: TStringField;
    QrySpravkaSUMofKap_Vuzv: TFloatField;
    QryDohodKap_Vuzv: TFloatField;
    DtSPortfeil: TDataSource;
    QryPortfeilVuzv_Obtcha: TFloatField;
    QryPortfeilSuma_Div: TFloatField;
    QryPortfeilSuma_Prod: TFloatField;
    QryPortfeilPazar_Stoin: TFloatField;
    QryPortfeilPurvo_Stoi: TFloatField;
    QryPortfeilPazar_Cena: TFloatField;
    QryPortfeilInv_Stoi: TFloatField;
    LblAlign: TLabel;
    N4: TMenuItem;
    QryPortfeilPurvo_Broi: TIntegerField;
    QryPortfeilPurvo_Cena: TFloatField;
    QryPortfeilPurvo_Razhod: TFloatField;
    QryPortfeilValid_Padeg: TDateField;
    QryPortfeilProd_Pokupka: TIntegerField;
    QryPortfeilN_F_D_Cena: TFloatField;
    QryPortfeilKup_Lihva: TFloatField;
    QryPortfeilAlternativa: TFloatField;
    QryPortfeilMemo: TBlobField;
    QryPortfeilKapLihva: TFloatField;
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    QryPortfeilVuzv_God: TFloatField;
    QryPortfeilInv_Stoi_Alternat: TFloatField;
    N10: TMenuItem;
    BevelNew4: TBevelNew;
    DBTextRec7: TDBTextRec;
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
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Splitter1: TSplitter;
    BevelNew2: TBevelNew;
    QryPortfeilPeriod: TIntegerField;
    procedure N3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N2Click(Sender: TObject);
    procedure CBoxSpisukChange(Sender: TObject);
    procedure NewDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PMenuDeleteClick(Sender: TObject);
    procedure PMenuChangeClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Procedure Print;
    Procedure PrintAkcii;
    Procedure PrintObligacii;
  	Procedure UpDateAfterChange;
  public

  end;

var
  DlgDohod: TDlgDohod;

implementation

Uses PrihDoh, MyConst, SetupReg, Calculat, PrtDohod, DlgMess, ConstMessage;

{$R *.DFM}

procedure TDlgDohod.UpdateAfterChange;
begin
  With QryDohod DO Begin
  	Try
  		DisableControls;
      Close; Open;
    Finally
    	EnableControls;
    End;
  End;
  If QryDohod.FieldByName('RedNom').AsInteger = 0 Then Begin
    N5.Enabled := False;
    N10.Enabled := False;
  End
  Else Begin
    N5.Enabled := True;
    N10.Enabled := True;
  End;
	QrySpravka.DataSource := DtSDohod;
  QrySpravka.DataSource := Nil;
end;

Procedure TDlgDohod.Print;
Var
	Shifur: String;
Begin
 	Shifur := QryPortfeil.FieldByName('Chifur').AsString;

	If (Shifur = 'КОбл')Or
    	(Shifur = 'ККОбл')Or
      (Shifur =  'ДОбл')Or
      (Shifur = 'ОбОбл')Or
      (Shifur = 'ИпОбл')Or
      (Shifur = 'ПрОбл')Or
      (Shifur =  'Обл')Or
      (Shifur = 'ДСерт')Or
      (Shifur = 'ГДРоб') Then

    PrintObligacii

  Else

  	PrintAkcii;

End;

Procedure TDlgDohod.PrintAkcii;
Begin
	With DlgPrintDohod Do Begin
  	LblDrugestvo.Caption := QryPortfeil.FieldByName('Drugestvo').AsString;
    LblNo.Caption        := 'Инвестиция No: '+QryPortfeil.FieldByName('ID_INV').AsString;
    LblShifur.Caption    := QryPortfeil.FieldByName('Chifur').AsString;
    LblData.Caption      := QryPortfeil.FieldByName('Data_Inv').AsString;
    PrtTitle.Caption     := 'Доход от дивиденти';

    QryPrtDohod.FieldByName('Prih_Div').DisplayLabel := 'Попучен дивидент (лв)';
  	QryPrtSpravka.FieldByName('SUM of Prod_Cena').DisplayLabel := 'Дивидент на акция (лв)';
    QryPrtSpravka.FieldByName('SUM of Kap_Vuzv').DisplayLabel := 'Дивидентна възвращаемост (%)';

    Try
      With QryPrtDohod Do Begin
      	Close;
				FieldByName('Bezpl_Akcii').Visible := True;
        SQL.Assign(QryDohod.SQL);
        Open;
      End;

	  	With QryPrtSpravka Do Begin
      	Close;
        SQL.Assign(QrySpravka.SQL);
        Open;
      End;
      PrintPage1.Refresh;
  		PrintPage1.Print;
  	Finally
  		QryPrtSpravka.Close;
      QryPrtDohod.Close;
    End;
  End;
End;

Procedure TDlgDohod.PrintObligacii;
Begin
	With DlgPrintDohod Do Begin
  	LblDrugestvo.Caption := QryPortfeil.FieldByName('Drugestvo').AsString;
    LblNo.Caption        := 'Инвестиция No: '+QryPortfeil.FieldByName('ID_INV').AsString;
    LblShifur.Caption    := QryPortfeil.FieldByName('Chifur').AsString;
    LblData.Caption      := QryPortfeil.FieldByName('Data_Inv').AsString;
    PrtTitle.Caption     := 'Доход от лихви';

    QryPrtDohod.FieldByName('Prih_Div').DisplayLabel := 'Получена лихва ~(лв)';
		If LblShifur.Caption = 'ДСерт' Then
    	QryPrtSpravka.FieldByName('SUM of Prod_Cena').DisplayLabel :=
      	'~Лихва ~(лв)'
		Else
    	QryPrtSpravka.FieldByName('SUM of Prod_Cena').DisplayLabel :=
      	'Лихва на облигация (лв)';

  	QryPrtSpravka.FieldByName('SUM of Kap_Vuzv').DisplayLabel := '~Възвращаемост (%)';

    Try
      With QryPrtDohod Do Begin
      	Close;
				FieldByName('Bezpl_Akcii').Visible := False;
        SQL.Assign(QryDohod.SQL);
        Open;
      End;

	  	With QryPrtSpravka Do Begin
      	Close;
        SQL.Assign(QrySpravka.SQL);
        Open;
      End;
      PrintPage1.Refresh;
  		PrintPage1.Print;
  	Finally
  		QryPrtSpravka.Close;
      QryPrtDohod.Close;
    End;
  End;
End;


procedure TDlgDohod.N3Click(Sender: TObject);
begin
	Close;
end;

procedure TDlgDohod.FormShow(Sender: TObject);
	Procedure DisableMenu(Check: Boolean);
  Begin
    CBoxSpisuk.Enabled := Check;
    N1.Enabled := Check;
    N5.Enabled := Check;
    N10.Enabled := Check;
  End;
Var
  CheckFind: Boolean;
begin
  CBoxSpisuk.Clear;
  If CBoxSpisuk.Enabled Then CBoxSpisuk.SetFocus;
  CheckFind := False;
  Try
		QryPortfeil.Open;
    With QryPortfeil Do
      While Not(Eof) Do Begin
      	CheckFind := True;
    		CBoxSpisuk.Items.Add(FieldByName('ID_INV').AsString+'.  '+FieldByName('Data_Inv').AsString+'  '+
      		FieldByName('Drugestvo').AsString);
        Next;
      End;
  Finally
    If CheckFind Then Begin
    	DisableMenu(True);
      CBoxSpisuk.ItemIndex := 0;
		  CBoxSpisukChange(CBoxSpisuk);
    End
    Else DisableMenu(False);
	End;
end;

procedure TDlgDohod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	QryDohod.Close;
  QrySpravka.Close;
  QryPortfeil.Close;
end;

procedure TDlgDohod.N2Click(Sender: TObject);
Var
	Doh: TDohod;
  Akcia_Oblig: Boolean;
  PokupkaData: TDateTime;
begin
	Akcia_Oblig := False;

  With Doh Do Begin
  	No := 0;
    FileKarton := QryPortfeil.FieldByName('Inv_File').AsString;
  	Del_Doh := False;
  	Change_Doh := False;
  End;

  PokupkaData := QryPortfeil.FieldByName('Data_Inv').AsDateTime;

	If DlgPrihDohod.Execute(Doh, Akcia_Oblig, PokupkaData) Then Begin
  	Try
  		MyCalc.RegDohod(QryPortfeil, Doh);
    Finally
	    UpDateAfterChange;
    End;
  End;{If DlgPrihDohod.Execute}
end;

procedure TDlgDohod.CBoxSpisukChange(Sender: TObject);
	Procedure DisableMenu(Ch: Boolean);
  Begin
   	N5.Enabled := Ch;
 		N10.Enabled := Ch;
  End;
Var
	n: Integer;
  Shifur: String;
begin
	n := CBoxSpisuk.ItemIndex;
  If n =-1 Then Exit;
 
  Try
    QryDohod.DisableControls;
    QrySpravka.DisableControls;
    QryPortfeil.DisableControls;

		QryDohod.Close;
    QrySpravka.Close;

    QryPortfeil.First;
    QryPortfeil.MoveBy(n);

    QryDohod.SQL.Strings[11] := '"'+QryPortfeil.FieldByName('Inv_File').AsString+'"';
    QrySpravka.SQL.Strings[5] := '"'+QryPortfeil.FieldByName('Inv_File').AsString+'"';

    Shifur := QryPortfeil.FieldByName('Chifur').AsString;

		If (Shifur = 'КОбл')Or
    	(Shifur = 'ККОбл')Or
      (Shifur =  'ДОбл')Or
      (Shifur = 'ОбОбл')Or
      (Shifur = 'ИпОбл')Or
      (Shifur = 'ПрОбл')Or
      (Shifur =  'Обл')Or
      (Shifur = 'ДСерт')Or
      (Shifur = 'ГДРоб')
                       Then Begin
			If Shifur = 'ДСерт' Then Begin
	      N4.Enabled := True;
  	    N2.Enabled := False;
    	  DBGrid1.Columns[5].Visible := False;//Безплатни акций
      	QryDohod.FieldByName('Prih_Div').DisplayLabel := 'Получена лихва ~(лв)';
	      QrySpravka.FieldByName('SUM of Prod_Cena').DisplayLabel := '~Лихва ~(лв)';
  	   	QrySpravka.FieldByName('SUM of Kap_Vuzv').DisplayLabel := '~Възвращаемост (%)';
      End
      Else Begin
	      N4.Enabled := True;
  	    N2.Enabled := False;
    	  DBGrid1.Columns[5].Visible := False;//Безплатни акций
      	QryDohod.FieldByName('Prih_Div').DisplayLabel := 'Получена лихва ~(лв)';
	      QrySpravka.FieldByName('SUM of Prod_Cena').DisplayLabel := 'Лихва на облигация (лв)';
  	   	QrySpravka.FieldByName('SUM of Kap_Vuzv').DisplayLabel := '~Възвращаемост (%)';
      End;
     End
    Else Begin
      N4.Enabled := False;
      N2.Enabled := True;
      DBGrid1.Columns[5].Visible := True;//Безплатни акций      
      QryDohod.FieldByName('Prih_Div').DisplayLabel := 'Попучен дивидент (лв)';
			QrySpravka.FieldByName('SUM of Prod_Cena').DisplayLabel := 'Дивидент на акция (лв)';
      QrySpravka.FieldByName('SUM of Kap_Vuzv').DisplayLabel := 'Дивидентна възвращаемост (%)';
    End;
    Try
 	 		QryDohod.Open;
    Except
			DisableMenu(False)
	  End;
  	QrySpravka.Open;
    
  	If QryDohod.FieldByName('RedNom').AsInteger = 0 Then DisableMenu(False)
    Else DisableMenu(True);
	Finally
	  QryDohod.EnableControls;
  	QrySpravka.EnableControls;
    QryPortfeil.EnableControls;
  End;
end;

procedure TDlgDohod.NewDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = 46 Then Key := 0;
end;

procedure TDlgDohod.PMenuDeleteClick(Sender: TObject);
Var
	Doh: TDohod;
begin
  If QryDohod.FieldByName('RedNom').AsInteger = 0 Then Begin
  	MessageDlg1(C_Mess_NotDohod, mtInformation, [mbOK], 0);
		Exit;
  End;
  
	If MessageDlg1(C_Mess_DeleteZapis,
  	mtConfirmation, [mbYes, mbNo], 0) = mrYes Then Begin

    With Doh Do Begin
	    No := QryDohod.FieldByName('RedNom').AsInteger;
  	  Del_Doh := True;
      Change_Doh := False;
    	FileKarton := QryPortfeil.FieldByName('Inv_File').AsString;
    End;
    Try
  		MyCalc.RegDohod(QryPortfeil, Doh);
    Finally
			UpDateAfterChange;
    End;
	End; {If MessageDlg}
end;

procedure TDlgDohod.PMenuChangeClick(Sender: TObject);
Var
	Doh: TDohod;
  Akcia_Oblig: Boolean;
  PokupkaData: TDateTime;
  Shifur: String;
begin
  If QryDohod.FieldByName('RedNom').AsInteger = 0 Then Begin
  	MessageDlg1(C_Mess_NotDohod, mtInformation, [mbOK], 0);
		Exit;
  End;

	Shifur := QryPortfeil.FieldByName('Chifur').AsString;
		If (Shifur = 'КОбл')Or
    	(Shifur = 'ККОбл')Or
      (Shifur =  'ДОбл')Or
      (Shifur = 'ОбОбл')Or
      (Shifur = 'ИОбл')Or
      (Shifur = 'ПрОбл')Or
      (Shifur =  'Обл')Or
      (Shifur = 'ДСерт')Or
      (Shifur = 'ГДРоб')
                       Then Akcia_Oblig := True
  Else Akcia_Oblig := False;

  With QryDohod, Doh Do Begin

  	No := FieldByName('RedNom').AsInteger;
    If No = 0 Then Exit;

  	Data := FieldByName('Data').AsDateTime;
  	Broi := FieldByName('Broi').AsInteger;
{    Mes := FieldByName('Mesec').AsString;}
    God := FieldByName('Godina').AsInteger;
    Suma := FieldByName('Prih_Div').AsFloat;
    BezplAkcii := FieldByName('Bezpl_Akcii').AsInteger;

    FileKarton := QryPortfeil.FieldByName('Inv_File').AsString;
  	Del_Doh := False;
  	Change_Doh := True;
  End;

  PokupkaData := QryPortfeil.FieldByName('Data_Inv').AsDateTime;

	If DlgPrihDohod.Execute(Doh, Akcia_Oblig, PokupkaData) Then Begin
  	Try
  		MyCalc.RegDohod(QryPortfeil, Doh);
    Finally
			UpDateAfterChange;
    End;
  End;{If DlgPrihDohod.Execute}
end;

procedure TDlgDohod.N4Click(Sender: TObject);
Var
	Doh: TDohod;
  Akcia_Oblig: Boolean;
  PokupkaData: TDateTime;
begin
	Akcia_Oblig := True;

  With Doh Do Begin
  	No := 0;
    FileKarton := QryPortfeil.FieldByName('Inv_File').AsString;
  	Del_Doh := False;
  	Change_Doh := False;
  End;

  PokupkaData := QryPortfeil.FieldByName('Data_Inv').AsDateTime;

	If DlgPrihDohod.Execute(Doh, Akcia_Oblig, PokupkaData) Then Begin
  	Try
  		MyCalc.RegDohod(QryPortfeil, Doh);
    Finally
			UpDateAfterChange;
    End;
  End;{If DlgPrihDohod.Execute}
end;

procedure TDlgDohod.N10Click(Sender: TObject);
begin
	If MessageDlg1(C_Mess_PrinterReady,
  	mtConfirmation, [mbYes, mbNO], 0) = mrYes Then Begin

		If Not Assigned(DlgPrintDohod) Then
    	Application.CreateForm(TDlgPrintDohod, DlgPrintDohod);
  	Print;
	End;
end;

procedure TDlgDohod.FormCreate(Sender: TObject);
begin
  If Not Assigned(DlgPrihDohod) Then
  	Application.CreateForm(TDlgPrihDohod, DlgPrihDohod);

  ProgOptions.OpenTablesExt(DBGrid1, 'Dodod_1');
  ProgOptions.OpenTablesExt(DBGrid2, 'Dodod_2');
  ProgOptions.OpenWindowExt(DlgDohod, 'Dohod');
end;

procedure TDlgDohod.FormDestroy(Sender: TObject);
begin
  ProgOptions.SaveTablesExt(DBGrid1, 'Dodod_1');
  ProgOptions.SaveTablesExt(DBGrid2, 'Dodod_2');
	ProgOptions.SaveWindowExt(DlgDohod, 'Dohod');
end;

end.
