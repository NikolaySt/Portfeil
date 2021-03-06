unit Portfeil;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, Grids, DB, DBTables, StdCtrls,
  Menus, DBCtrls, Buttons, Edtvalue, BevelNew, DBGrids, DBTextRegDim,
  LabelRegDim, ComCtrls, DBAddition, DBPortfeil, DBCurrCeni, Printers;

type
  TDlgPortfeil = class(TForm)
    LblTextRec1: TLabelRec;
    LblTextRec2: TLabelRec;
    LblTextRec3: TLabelRec;
    LblTextRec4: TLabelRec;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;            
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label11: TLabel;
    DtSPortfeil: TDataSource;
    QrySumaPort: TQuery;
    DtSQrySuma: TDataSource;
    QryPortfeil: TQuery;
    QryPortfeilID_Inv: TSmallintField;
    QryPortfeilData_Inv: TDateField;
    QryPortfeilChifur: TStringField;
    QryPortfeilBroi: TIntegerField;
    QryPortfeilEdin_Cena: TFloatField;
    QryPortfeilStoinost: TFloatField;
    QryPortfeilOtn_dial: TFloatField;
    QryPortfeilDrugestvo: TStringField;
    QryPortfeilPazar_Cena: TFloatField;
    QryPortfeilPazar_Stoin: TFloatField;
    QryPortfeilPurvo_Broi: TIntegerField;
    QryPortfeilPurvo_Cena: TFloatField;
    QryPortfeilPurvo_Stoi: TFloatField;
    QryPortfeilPurvo_Razhod: TFloatField;
    QryPortfeilValid_Padeg: TDateField;
    QryPortfeilProd_Pokupka: TIntegerField;
    QryPortfeilN_F_D_Cena: TFloatField;
    QryPortfeilKup_Lihva: TFloatField;
    QryPortfeilInv_Stoi: TFloatField;
    QryPortfeilAlternativa: TFloatField;
    QryPortfeilSuma_Div: TFloatField;
    QryPortfeilSuma_Prod: TFloatField;
    QryPortfeilVuzv_Obtcha: TFloatField;
    QryPortfeilInv_File: TStringField;
    QryPortfeilMemo: TBlobField;
    QryPortfeilKapLihva: TFloatField;
    QryPazrcenaUpDate: TQuery;
    LblTop: TLabelRec;
    MenuPortfeil: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    Label2: TLabel;
    LabelRec1: TLabelRec;
    QrySumaPortSumStoi: TFloatField;
    QrySumaPortSumPStoi: TFloatField;
    LabelRec2: TLabelRec;
    QrySumaPortInvStoi: TFloatField;
    QrySumaPortPurvoStoi: TFloatField;
    LabelRec3: TLabelRec;
    QrySumaPortAlternativa: TFloatField;
    QryIndexExt: TQuery;
    QryLihvaExt: TQuery;
    EdtLihva: TValueEdit;
    EdtIndex: TValueEdit;
    LblData: TLabelRec;
    N301: TMenuItem;
    N201: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    O1: TMenuItem;
    N051: TMenuItem;
    N5101: TMenuItem;
    N10151: TMenuItem;
    N15201: TMenuItem;
    N20251: TMenuItem;
    N251: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    QryPortfeilVuzv_God: TFloatField;
    QryPortfeilInv_Stoi_Alternat: TFloatField;
    N45: TMenuItem;
    BevelNew1: TBevelNew;
    BevelNew2: TBevelNew;
    BevelNew3: TBevelNew;
    Status: TStatusBar;
    DbGridPortfeil: TDBGrid;
    N44: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N50: TMenuItem;
    QryPortfeilPeriod: TIntegerField;
    QryPazrcenaInsert: TQuery;
    QryPortfeilCALC_CHANGE: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBGridPortfeilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QryPortfeilBeforePost(DataSet: TDataset);
    procedure QryPortfeilAfterPost(DataSet: TDataset);
    procedure N13Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure DtSPortfeilDataChange(Sender: TObject; Field: TField);
    procedure N23Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure EdtIndexKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLihvaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLihvaExit(Sender: TObject);
    procedure N45Click(Sender: TObject);
    Procedure SortPortfeil(Sender: TObject);
    procedure DbGridPortfeilKeyPress(Sender: TObject; var Key: Char);
    procedure DbGridPortfeilDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtLihvaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtIndexKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtIndexExit(Sender: TObject);
    procedure EdtIndexEnter(Sender: TObject);
    procedure EdtLihvaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtIndexKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure DbGridPortfeilExit(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure QryPortfeilCalcFields(DataSet: TDataSet);
  private
    InvStoi, Alternativa, SumStoi, SumPStoi, PurvoStoi: Real;
    FSortTable: Integer;
    FStatusText: String;

    FOldValue: String;

    FDBLihva: TDBBankLihva;
    FDBIndex: TDBIndex;

    FDBPortfeil: TDBPortfeil;
    FDBCurrCeni: TDBCurrCeni;

    procedure UpdateLabels;
    procedure UpdateSpavki_Filtur;
    procedure CheckEdit;
  public
	  procedure InicializeSuma;
    procedure ReacalcAlternativa;
    Procedure RecalcPortfeil;
		Property SortTable: Integer Read FSortTable Write FSortTable;

    Property DBIndex: TDBIndex Read FDBIndex;
    Property DBLihva: TDBBankLihva Read FDBLihva;
		Property DBCurrCeni: TDbCurrCeni Read FDBCurrCeni;
    
		Property DBPortfeil: TDBPortfeil Read FDBPortfeil;
  end;

var
  DlgPortfeil: TDlgPortfeil;

implementation

Uses SetupReg, Statisti, Statinde, BLihva, Calculat, Prtportf, DlgMess,
  MyConst, Invest, ConstMessage;

{$R *.DFM}

Procedure TDlgPortfeil.RecalcPortfeil;
Var
	Tbl: TTable;
  KapLihva: Real;

  PeriodInv: Integer;
  Val: Real;
  i: Integer;
  Data: TDateTime;
  ChMinusPeriod: Boolean;
begin
  FDBLihva.Clear;
  FDBIndex.Clear;
  FDBPortfeil.Clear;
  FDBCurrCeni.Clear;

  Tbl := TTable.Create(Self);
  ChMinusPeriod := False;
  Try
   Try
  	Tbl.DataBaseName := DBasename;
    Data := CurrentDate;
    With Tbl DO Begin
      TableName := 'BLihva.DB';
 			Open;
      Try
        While Not Eof Do Begin
        	If FieldByName('Data').AsFloat <= Data Then
						FDBLihva.Add(
  	        	FieldByName('Data').AsFloat, FieldByName('Lihva').AsFloat);
          Next;
        End;
      Finally
      	Close;
      End;
     	EdtLihva.Text := FormatFloat('#0.#0', FDBLihva.LastValue);
    End;

  	Tbl.DataBaseName := DBasename;
    With Tbl DO Begin
      TableName := 'BIndex.DB';
 			Open;
      Try
        While Not Eof Do Begin
					If FieldByName('Data').AsFloat <= Data Then
          	FDBIndex.Add(
	          	FieldByName('Data').AsFloat, FieldByName('BorIndex').AsFloat);
          Next;
        End;
      Finally
      	Close;
      End;
      If FDBIndex.Count = 0 Then
	     	EdtIndex.Text := ''      	
      Else
	     	EdtIndex.Text := FormatFloat('#0.#0', FDBIndex.LastValue);
    End;

    With Tbl Do Begin
     	Tablename := 'PortData.DB';
     	Open;
      i := 0;
      While Not(Eof) Do Begin


      	FDBPortfeil.AddInv(
        	FieldByName('ID_INV').AsInteger,
          FieldByName('Chifur').AsString,
          FieldByName('Drugestvo').AsString,
          FieldByName('Data_Inv').AsDateTime,
          FieldByName('Purvo_Cena').AsFloat,
          i);

       	Inc(i);

        PeriodInv := Round(CurrentDate - FieldByName('Data_Inv').AsDateTime + 1);

        If PeriodInv > 0 Then Begin
					FDBCurrCeni.Add(
              	FieldByName('ID_INV').AsInteger,
                FieldByName('Pazar_Cena').AsFloat);
        	Val := FDBLihva.Alternativa(
        									PeriodInv,
                          FieldByName('Data_Inv').AsDateTime,
    											FieldByName('Purvo_Stoi').AsFloat,
                          KapLihva);
      		Edit;
					FieldByName('Period').AsInteger := PeriodInv;
		 			FieldByName('Alternativa').AsFloat := Val;
      		FieldByName('KapLihva').AsFloat := KapLihva;
        	FieldByName('Inv_Stoi_Alternat').AsFloat :=
        		FieldByName('Inv_Stoi').AsFloat-Val;
          
		    	{Възвращаемост за периода на годишна база}
	    		FieldByName('Vuzv_God').AsFloat :=
          	FieldByName('Vuzv_Obtcha').AsFloat*(365/PeriodInv);
          Post;
        End
        Else ChMinusPeriod := True;
        Next;
      End;{While not(Eof)}
    End;{With Tbl}

    With Tbl Do Begin
    	Close;
      TableName := 'PazrCena.DB';
      Try
      	Open;
        While Not EOF Do Begin

        	If FieldByName('Data').AsDateTime < Data Then
					  FDBPortfeil.AddCena(
            	FieldByName('ID_INV').AsInteger,
              FieldByName('Data').AsDateTime,
            	FieldByName('Pazar_Cena').AsFloat)
					Else
        	  If FieldByName('Data').AsDateTime = Data Then
            	FDBCurrCeni.Check(FieldByName('ID_INV').AsInteger);
        	Next;
        End;
      Finally
	      Close;
      End;
    End;
   Finally
  	Tbl.Free;
   End;
	Except
  	DlgInvest.ActiveTimer := True;
  End;

  If ChMinusPeriod Then Begin
  	MessageDlg1(C_Mess_Portfeil_Date + FormatDateTime('dd/mm/yyyy', CurrentDate),
      	mtWarning, [mbOK], 0);
  	DlgInvest.ActiveTimer := True;
  End;
End;

Procedure TDlgPortfeil.ReacalcAlternativa;
Var
	TblPort: TTable;
  KapLihva, Val, TmpAlter: Real;
begin
	CheckEdit;
  TblPort := TTable.Create(nil);
  TmpAlter := 0;
  Try
    With TblPort Do Begin
     	DataBaseName := DBaseName;
     	Tablename := 'PortData.DB';
     	Open;
      While Not(Eof) Do Begin
        Val := FDBLihva.Alternativa(
        									FieldByName('Period').AsInteger,
                          FieldByName('Data_Inv').AsDateTime,
    											FieldByName('Purvo_Stoi').AsFloat,
                          KapLihva);
        TmpAlter := TmpAlter + Val;
        
        Edit;
		 		FieldByName('Alternativa').AsFloat := Val;
      	FieldByName('KapLihva').AsFloat := KapLihva;
        FieldByName('Inv_Stoi_Alternat').AsFloat :=
        	FieldByName('Inv_Stoi').AsFloat - Val;

        Post;Next;
      End;{While not(Eof)}
    End;{With TblPortfeil}
		Alternativa := TmpAlter;
		UpdateLabels;
    EdtLihva.Text := FormatFloat('#0.#0', FDBLihva.LastValue);
  Finally
    TblPort.Free;
  End;
  UpdateSpavki_Filtur;
End;

Procedure TDlgPortfeil.SortPortfeil(Sender: TObject);
	Procedure Sort(SortString: String);
  Begin
		With QryPortfeil Do
    	Try
		 		If (SQL.Strings[4] = SortString)And(Active) Then	Exit;

      	If SortString = '' Then
        	 //Пазарната цана
        	DbGridPortfeil.Columns[8].ReadOnly := False
        Else
     	    DbGridPortfeil.Columns[8].ReadOnly := True;

				DisableControls;
        Close;
        SQL.Strings[4] := SortString;

       	Open;
      Finally
    		EnableControls;
		  End;
	End;
Var
	i: Integer;
  S: String;
Begin
	CheckEdit;

	If Assigned(Sender) Then  Begin
  	I := (Sender As TComponent).Tag;
		S := AnsiLowerCase((Sender As TMenuItem).Caption);
    While Pos('&', S) > 0 Do Delete(S, Pos('&', S), 1);
  End
  Else Begin
  	I := 11;
    S := '';
  End;

	SortTable := i;

  Status.Panels[1].Text := '';
  Status.Panels[2].Text := '';
  Status.Panels[3].Text := '';
  DbGridPortfeil.DefaultDrawing := True;
	Case i Of 
  	11: Begin
      Status.Panels[1].Text := 'Подреден';
      FStatusText := Status.Panels[1].Text;
    End;
		12..111:  Begin
    	Status.Panels[1].Text := 'Сортиран - по ' + S;
      FStatusText := Status.Panels[1].Text;
    End;
    211..246, 2210: Begin
    	Status.Panels[2].Text := 'Филтър - ' + S;
      FStatusText := Status.Panels[2].Text;
    End;
    310..320: Begin
    	DbGridPortfeil.DefaultDrawing := False;
    	Status.Panels[3].Text := 'Справки - ' + S;
      FStatusText := Status.Panels[3].Text;
    End;
  End;
  
  Case i Of
		11:  Sort('');
    12:  Sort('ORDER BY Data_Inv');
    13:  Sort('ORDER BY Chifur');
    14:  Sort('ORDER BY Broi');
    15:  Sort('ORDER BY Edin_Cena');
    16:  Sort('ORDER BY Stoinost');
		17:  Sort('ORDER BY Otn_Dial');
		18:  Sort('ORDER BY Drugestvo');
		19:  Sort('ORDER BY Pazar_Cena');
		110: Sort('ORDER BY Pazar_Stoin');
		111: Sort('ORDER BY Period');

    211: Sort('WHERE Vuzv_God >= 30 ORDER BY Vuzv_God DESC');
    
    212: Sort('WHERE Vuzv_God < 30 AND Vuzv_God >= 20 ORDER BY Vuzv_God DESC');
    213: Sort('WHERE Vuzv_God > 0 AND Vuzv_God < 20 ORDER BY Vuzv_God DESC');
    214: Sort('WHERE Vuzv_God <= 0 ORDER BY Vuzv_God DESC');

    220: Sort('WHERE Chifur in ("ОбА","ПрА","КПрА")');
    221: Sort('WHERE Chifur in ("КОбл","ККОбл","ДОбл","ОбОбл","ИпОбл","ПрОбл","Обл")');
    222: Sort('WHERE Chifur = "СБон" ');
    223: Sort('WHERE Chifur = "ДСерт" ');
    224: Sort('WHERE Chifur in ("ГДРоб","ГДРа")');
    225: Sort('WHERE Chifur in ("КрЗап","КнБон")');
    226: Sort('WHERE Chifur in ("КолОп","ПутОп")');
    227: Sort('WHERE Chifur = "Варт" ');
    228: Sort('WHERE Chifur = "Права" ');
    229: Sort('WHERE Chifur in ("USD","DEM","EUR","FRF","CHF","GBP","Валута")');
    2210:Sort('WHERE Chifur in ("НумЦ","Бжт","Изкст")');

    231: Sort('WHERE Inv_Stoi_Alternat > 0 ORDER BY Inv_Stoi_Alternat DESC');
    232: Sort('WHERE Inv_Stoi_Alternat <= 0 ORDER BY Inv_Stoi_Alternat DESC');

    241: Sort('WHERE Otn_dial > 0 AND Otn_dial <= 5');
    242: Sort('WHERE Otn_dial > 5 AND Otn_dial <= 10');
    243: Sort('WHERE Otn_dial > 10 AND Otn_dial <= 15');
    244: Sort('WHERE Otn_dial > 15 AND Otn_dial <= 20');
    245: Sort('WHERE Otn_dial > 20 AND Otn_dial <= 25');
    246: Sort('WHERE Otn_dial > 25');

    310: Sort('ORDER BY Vuzv_God DESC');
    320: Sort('ORDER BY Inv_Stoi_Alternat DESC');
  End;
End;

procedure TDlgPortfeil.UpdateSpavki_Filtur;
Begin
	Case SortTable Of
  	231, 232, 320: Begin
    	Try
      	QryPortfeil.DisableControls;
    		QryPortfeil.Close;
      	QryPortfeil.Open;
      Finally
      	QryPortfeil.EnableControls;
      End;
    End;
	End;
End;

Procedure TDlgPortfeil.InicializeSuma;
Begin
  InvStoi    := 0;
  Alternativa:= 0;
  SumStoi    := 0;
  SumPStoi   := 0;
  PurvoStoi  := 0;
	With QrySumaPort Do Begin
    Try
    	Open;
			InvStoi    := FieldByName('InvStoi').AsFloat;
			Alternativa:= FieldByName('Alternativa').AsFloat;
			SumStoi    := FieldByName('SumStoi').AsFloat;
			SumPStoi   := FieldByName('SumPStoi').AsFloat;
			PurvoStoi  := FieldByName('PurvoStoi').AsFloat;
    Finally
    	UpdateLabels;
			Close;
    End;
  End;
End;

Procedure TDlgPortfeil.UpdateLabels;
Var
	V1, V2, V3: Double;
begin
	V1 := 0;
  V2 := 0;
  V3 := 0;
  	//Възвращаемост на портфейла 
  If SumStoi <> 0 Then V1 := (SumPStoi -SumStoi)/SumStoi;

	If PurvoStoi <> 0 Then Begin
   // Възвращаемост от Инвестициите
	 V2 := (InvStoi - PurvoStoi)/PurvoStoi;
   //	Ефективен лихвен рпоцент
	 V3 := (Alternativa - PurvoStoi)/PurvoStoi;
	End;

  LblTextRec1.Caption := FormatFloat('# ### ### ##0.#0', Alternativa);
  LblTextRec2.Caption := FormatFloat('# ### ### ##0.#0', InvStoi);
  LblTextRec3.Caption := FormatFloat('# ### ### ##0.#0', SumStoi);
  LblTextRec4.Caption := FormatFloat('# ### ### ##0.#0', SumPStoi);
  
	LabelRec1.Caption   := FormatFloat('# ### ### ##0.#0', V1*100);
	LabelRec2.Caption   := FormatFloat('# ### ### ##0.#0', V2*100);
	LabelRec3.Caption   := FormatFloat('# ### ### ##0.#0', V3*100);  
End;

procedure TDlgPortfeil.FormShow(Sender: TObject);
	Procedure DisableMenu(Check: Boolean);
  Begin
  	N17.Enabled := Check;
    N1.Enabled  := Check;
    N14.Enabled := Check;
    N40.Enabled := Check;
    N43.Enabled := Check;
  End;
Var
	i: Integer;
begin
	DisableMenu(False);
  DbGridPortfeil.SetFocus;
  DbGridPortfeil.SelectedIndex := 8;
  FStatusText := '';
 	Status.Panels[0].Text := 'Брой инвестиции - 0';
	With QryPortfeil Do Begin
	  i := 0;
    Try
			SortPortfeil(Nil);
  	  i := QryPortfeil.RecordCount;
    Finally
    	Try
    		InicializeSuma;
    	Finally
				If i > 0 Then Begin
        	DisableMenu(True);
          Status.Panels[0].Text := 'Брой инвестиции - '+IntToStr(i);
          DbGridPortfeil.Columns[8].ReadOnly := False;
        End
        Else Begin
          DbGridPortfeil.Columns[8].ReadOnly := True;
					Status.Panels[1].Text := '';
          Status.Panels[2].Text := '';
          Status.Panels[3].Text := '';
        End;      
      End;
      
    End;
  End;//With QryPortfeil
end;

procedure TDlgPortfeil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	CheckEdit;

	If DlgCenaStatistica.Visible Then DlgCenaStatistica.Close;
  If DlgBorsovIndex.Visible Then DlgBorsovIndex.Close;
  If DlgBankLihva.Visible Then DlgBankLihva.Close;
	QryPortfeil.Close;
end;

procedure TDlgPortfeil.FormCreate(Sender: TObject);
begin
  LblData.Caption :=
  	'Съдържание на портфейла към ' + FormatDateTime('dd/mm/yyyy', CurrentDate);
    
  FDBLihva := TDBBankLihva.Create;
  FDBIndex := TDBIndex.Create;
  FDBCurrCeni := TDBCurrCeni.Create;

  FDBPortfeil := TDBPortfeil.Create;
  FDBPortfeil.CurrentCeni := FDBCurrCeni;
  FDBPortfeil.BorsovIndex := FDBIndex;

  RecalcPortfeil;

	Application.CreateForm(TDlgCenaStatistica, DlgCenaStatistica);
  Application.CreateForm(TDlgBankLihva, DlgBankLihva);
  Application.CreateForm(TDlgBorsovIndex, DlgBorsovIndex);

  ProgOptions.OpenTablesExt(DbGridPortfeil, 'Portfeil');
  ProgOptions.OpenWindowExt(DlgPortfeil, 'Portfeil');
end;

procedure TDlgPortfeil.DBGridPortfeilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	If (Key = 13)And(QryPortfeil.State = dsEdit) Then Begin
  	QryPortfeil.Post;
    QryPortfeil.Next;
  End;
end;

procedure TDlgPortfeil.QryPortfeilBeforePost(DataSet: TDataset);
Var
	Sum: Real;
begin
	With QryPortfeil Do Begin
		If (FieldByName('Pazar_Cena').AsString = '') Or
    	(FieldByName('Pazar_Cena').AsFloat <= 0)  Then Begin
    	DbGridPortfeil.SetFocus;
    	DbGridPortfeil.SelectedIndex := 8;
      Cancel;
 	 		Raise	Exception.Create('Не може да въвеждате стойности '+
      		'по-малки или равни на 0.');
    End;

		InvStoi := InvStoi - FieldByName('Inv_Stoi').AsFloat;
		SumPStoi := SumPStoi - FieldByName('Pazar_Stoin').AsFloat;
		{Пазарна стойност = Брои * Пазарна цена}
		FieldByName('Pazar_Stoin').AsFloat :=
    	FieldByName('Broi').AsInteger*FieldByName('Pazar_Cena').AsFloat;
    {Стойност на инвестицията }
    Sum := FieldByName('Suma_Div').AsFloat +
      FieldByName('Suma_Prod').AsFloat+
    	FieldByName('Pazar_Stoin').AsFloat -
      FieldByName('Stoinost').AsFloat;

    FieldByName('Inv_Stoi').AsFloat := Sum + FieldByName('Purvo_Stoi').AsFloat;

    {Обща възвращаемост за периода на всяка инвестиция}
    FieldByName('Vuzv_Obtcha').AsFloat := (Sum/FieldByName('Purvo_Stoi').AsFloat)*100;

      {Възвращаемост за периода на годишна база}
    If FieldByName('Period').AsInteger <> 0 Then
	   	FieldByName('Vuzv_God').AsFloat :=
      	FieldByName('Vuzv_Obtcha').AsFloat*(365/FieldByName('Period').AsInteger);

    FieldByName('Inv_Stoi_Alternat').AsFloat :=
    	FieldByName('Inv_Stoi').AsFloat-FieldByName('Alternativa').AsFloat;


    If FDBCurrCeni.Update(FieldByName('ID_INV').AsInteger,
      		FieldByName('Pazar_Cena').AsFloat) Then

  		With QryPazrcenaUpDate Do Begin
       	Params[0].Value := QryPortfeil.FieldByName('Pazar_Cena').AsFloat;
        Params[1].Value := QryPortfeil.FieldByName('ID_INV').AsInteger;
        Params[2].Value := CurrentDate;
        ExecSQL;
   	 	End
   	Else
  		With QryPazrcenaInsert Do Begin
       	Params[0].Value := QryPortfeil.FieldByName('ID_INV').AsInteger;
        Params[1].Value := CurrentDate;
				Params[2].Value := QryPortfeil.FieldByName('Pazar_Cena').AsFloat;
        ExecSQL;
   	 	End;    
  End;
end;

procedure TDlgPortfeil.QryPortfeilAfterPost(DataSet: TDataset);
Begin
	InvStoi := InvStoi + QryPortfeil.FieldByName('Inv_Stoi').AsFloat;
	SumPStoi := SumPStoi + QryPortfeil.FieldByName('Pazar_Stoin').AsFloat;
  UpdateLabels;
end;

procedure TDlgPortfeil.N13Click(Sender: TObject);
begin
	Close;
end;

procedure TDlgPortfeil.DtSPortfeilDataChange(Sender: TObject;
  Field: TField);
begin
	If DlgCenaStatistica.Visible Then Begin
  	DlgCenaStatistica.ID_INV := QryPortfeil.FieldByName('ID_Inv').AsInteger;
  	With DlgCenaStatistica.QryPazarCena Do Begin
    	Try
        DBPortfeil.ExistsInv(DlgCenaStatistica.ID_INV);

    		DisableControls;
				Close;
        Params[0].Value := DlgCenaStatistica.ID_INV;
        Params[1].Value := CurrentDate;
        Open;
        
        DlgCenaStatistica.PnlDrug.Caption := ' '+
        	IntToStr(DlgCenaStatistica.ID_INV) +'.  '+
          	QryPortfeil.FieldByName('Drugestvo').AsString;
      Finally
      	EnableControls;
      End;
    End;
	End;
end;

procedure TDlgPortfeil.N23Click(Sender: TObject);
begin
	StartWindow := owKartoteka;
  Close;
end;

procedure TDlgPortfeil.N22Click(Sender: TObject);
begin
	StartWindow := owUpravlenie;
  Close;
end;

procedure TDlgPortfeil.N18Click(Sender: TObject);
begin
	DlgBorsovIndex.Show;
  If DlgBorsovIndex.WindowState = wsMinimized Then
  	DlgBorsovIndex.WindowState := wsNormal;
end;

procedure TDlgPortfeil.N19Click(Sender: TObject);
begin
	DlgBankLihva.Show;
  If DlgBankLihva.WindowState = wsMinimized Then
  	DlgBankLihva.WindowState := wsNormal;
end;

procedure TDlgPortfeil.N17Click(Sender: TObject);
begin
	If Not DlgCenaStatistica.Visible Then Begin
		DlgCenaStatistica.FormStyle := fsNormal;
		DlgCenaStatistica.FormStyle := fsStayOnTop;
  End;
  DlgCenaStatistica.Show;
  If DlgCenaStatistica.WindowState = wsMinimized Then
  	DlgCenaStatistica.WindowState := wsNormal;
  DtSPortfeilDataChange(Nil, Nil);
end;

procedure TDlgPortfeil.EdtIndexKeyPress(Sender: TObject; var Key: Char);
begin
	Label21.Font.Color := clActiveCaption;
end;

procedure TDlgPortfeil.EdtIndexKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If (Key = 13)And(Label21.Font.Color = clActiveCaption) Then Begin
  	If EdtIndex.Text = '' Then Begin
    	MessageDlg1(C_Mess_NotValue, mtWarning, [mbOK], 0);
      EdtIndex.Text := FOldValue;
      Label21.Font.Color := clBlack;    	
      Exit;
    End;  
  	If EdtIndex.AsFloat <= 0 Then Begin
    	MessageDlg1(C_Mess_NotNull, mtWarning, [mbOK], 0);
      EdtIndex.Text := FOldValue;
      Label21.Font.Color := clBlack;    	
      Exit;
    End;
		With QryIndexExt Do Begin
      SQL.Clear;

      If FDBIndex.Exists(CurrentDate) Then
        SQL.Add('UPDATE "BIndex.DB" Set BorIndex = :I WHERE Data = :D')
      Else
      	SQL.Add('INSERT INTO "BIndex.DB" (Data, BorIndex) Values(:D, :I)');

		  ParamByName('I').Value := EdtIndex.AsFloat;
      ParamByName('D').Value  := CurrentDate;

      ExecSQL;
      FDBIndex.Update(CurrentDate, CurrentDate, EdtIndex.AsFloat);
    End;
    
    EdtIndex.Text := FormatFloat('#0.#0', EdtIndex.AsFloat);
    FOldValue := FormatFloat('#0.#0', EdtIndex.AsFloat);
   	Label21.Font.Color := clBlack;
	End
  Else Begin
	  If (Key = 27)And(Label21.Font.Color = clActiveCaption) Then Begin
    	EdtIndex.Text := FOldValue;
    	Label21.Font.Color := clBlack;    	
    End;  
  End;
end;

procedure TDlgPortfeil.EdtIndexExit(Sender: TObject);
Var
	k: Word;
begin
	If Label21.Font.Color = clActiveCaption Then Begin
  	If MessageDlg1(C_Mess_SaveCorect,
      mtConfirmation, [mbYES, mbNO], 0) = mrYes Then Begin
      k := 13;
			EdtIndexKeyUp(Nil, k, [ssCtrl]);
    End
    Else Begin
    	EdtIndex.Text := FOldValue;
    	Label21.Font.Color := clBlack;
    End;
  End;
end;

procedure TDlgPortfeil.EdtLihvaKeyPress(Sender: TObject; var Key: Char);
begin
	Label18.Font.Color := clActiveCaption;
end;

procedure TDlgPortfeil.EdtLihvaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If (Key = 13)And(Label18.Font.Color = clActiveCaption) Then Begin
		With QryLihvaExt Do Begin
      SQL.Clear;

      If FDBLihva.Exists(CurrentDate) Then
        SQL.Add('UPDATE "BLihva.DB" Set Lihva = :L WHERE Data = :D')
      Else
      	SQL.Add('INSERT INTO "BLihva.DB" (Data, Lihva) Values(:D, :L)');

		  ParamByName('L').Value := EdtLihva.AsFloat;
      ParamByName('D').Value  := CurrentDate;
      ExecSQL;
      FDBLihva.Update(CurrentDate, CurrentDate, EdtLihva.AsFloat);
    End;

    EdtLihva.Text := FormatFloat('#0.#0', EdtLihva.AsFloat);
    FOldValue := FormatFloat('#0.#0', EdtLihva.AsFloat);
    
  	Label18.Font.Color := clBlack;
    ReacalcAlternativa;
	End
  Else Begin
	  If (Key = 27)And(Label18.Font.Color = clActiveCaption) Then Begin
    	EdtLihva.Text := FOldValue;
    	Label18.Font.Color := clBlack;    	
    End;
 	End;
end;

procedure TDlgPortfeil.EdtLihvaExit(Sender: TObject);
Var
	k: Word;
begin
	If Label18.Font.Color = clActiveCaption Then Begin
  	If MessageDlg1(C_Mess_SaveCorect, mtConfirmation,
    	  [mbYES, mbNO], 0) = mrYes Then Begin
      k := 13;
			EdtLihvaKeyUp(Nil, k, [ssCtrl]);
    End
    Else Begin
    	EdtLihva.Text := FOldValue;
    	Label18.Font.Color := clBlack;
    End;
  End;
end;

procedure TDlgPortfeil.N45Click(Sender: TObject);
Var
	Tmp: TPrinterOrientation;
begin
	CheckEdit;

	If MessageDlg1(C_Mess_PrinterReady,
  	mtConfirmation, [mbYes, mbNO], 0) = mrNo Then Exit;

  If Not Assigned(DlgPrintPortfeil) Then
  	Application.CreateForm(TDlgPrintPortfeil, DlgPrintPortfeil);

  Tmp := Printer.Orientation;
  Printer.Orientation := poLandscape;

	With DlgPrintPortfeil Do Begin
		LblInfoSort.Caption     := FStatusText;
    LblBroiInv.Caption	    := Status.Panels[0].Text;
    LblOtInvest.Caption     := LblTextRec2.Caption;
    LblAlternativa.Caption  := LblTextRec1.Caption;
    LblInvestVuzv.Caption   := LabelRec2.Caption;
    LblLihva.Caption        := LabelRec3.Caption;
    LblInvestStoi.Caption   := LblTextRec3.Caption;
    LblPazarStoi.Caption    := LblTextRec4.Caption;
    LblPortfeilVuzv.Caption := LabelRec1.Caption;
    LblOLP.Caption          := EdtLihva.Text;
    LblIndex.Caption        := EdtIndex.Text;

    LblTitle.Caption        := 'СЪДЪРЖАНИЕ НА ПОРТФЕЙЛА КЪМ ' + FormatDateTime('dd/mm/yyyy', CurrentDate);

  	QryPrnPortfeil.SQL.Assign(QryPortfeil.SQL);
		QryPrnPortfeil.Open;
    Try
    	PrintPage1.Refresh;
 			PrintPage1.Print;
    Finally
	   	QryPrnPortfeil.Close;
      Printer.Orientation := Tmp;
    End;
  End;
end;

procedure TDlgPortfeil.DbGridPortfeilKeyPress(Sender: TObject; var Key: Char);
begin
	If (QryPortfeil.SQL.Strings[4] <> '')And
  	(DbGridPortfeil.SelectedField.FieldName = 'Pazar_Cena') Then
  	MessageDlg1(C_Mess_SortPodreden, mtInformation, [mbOK], 0);
end;

procedure TDlgPortfeil.DbGridPortfeilDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
	R: TRect;
  FmtText: Integer;
  Pr: Real;
  F: TAlignment;
  S: String;
  ch_ext: Boolean;
begin

	If SortTable = 310 Then
    Pr := QryPortfeil.FieldByName('Vuzv_God').AsFloat
  Else If SortTable = 320 Then
    Pr := QryPortfeil.FieldByName('Inv_Stoi_Alternat').AsFloat
  Else if (Column.FieldName = 'CALC_CHANGE') or (Column.FieldName = 'Vuzv_Obtcha') then
  begin
    Pr := QryPortfeilVuzv_Obtcha.AsFloat;
    ch_ext := True;
    {
    QryPortfeilCALC_CHANGE.AsFloat :=
    QryPortfeilPazar_Stoin.AsFloat - QryPortfeilStoinost.AsFloat;
    }
  end
  else Exit;

  F := Column.Alignment;
  FmtText := DT_SINGLELINE + DT_VCENTER;
  Case F Of
  	taRightJustify:FmtText := FmtText + DT_RIGHT;
    taLeftJustify: FmtText := FmtText + DT_LEFT + DT_END_ELLIPSIS;
    taCenter:      FmtText := FmtText + DT_CENTER;
  End;

  With DbGridPortfeil.Canvas Do Begin
    Font := Column.Font;


    If (gdSelected In State) And DbGridPortfeil.Focused Then Font.Color := clWhite
    Else Begin
    	If SortTable = 310 Then Begin
	    	If Pr >= 30 Then Font.Color := clBlue
  	    Else If Pr >= 20 Then Font.Color := $000BAA0B
    	  Else If Pr > 0 Then Font.Color := clMaroon
      	Else Font.Color := clRed;
    	End
      Else Begin
        if ch_ext then
        begin
          If Pr > 0 Then Font.Color := clGreen
          Else Font.Color := clRed;
        end
        else begin
          If Pr > 0 Then Font.Color := clBlue
          Else Font.Color := clRed;
        end;
      End;
    End;

    S := Column.Field.DisplayText;

    FillRect(Rect);
		R := Classes.Rect(Rect.Left+1, Rect.Top, Rect.Right-1, Rect.Bottom);
    DrawText(Handle, PChar(S), Length(S), R, FmtText);
  End;
end;

procedure TDlgPortfeil.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If (Shift = [ssCtrl])And(Key = 9) Then Begin
  	If QryPortfeil.State = dsEdit Then QryPortfeil.Cancel;
    
    If DlgBankLihva.Visible Then Begin
    	If DlgBankLihva.WindowState = wsMinimized Then
      	DlgBankLihva.WindowState := wsNormal; 
    	DlgBankLihva.SetFocus
    End
    Else If DlgBorsovIndex.Visible Then Begin
    	If DlgBorsovIndex.WindowState = wsMinimized Then
      	DlgBorsovIndex.WindowState := wsNormal;
    	DlgBorsovIndex.SetFocus
    End
    Else If DlgCenaStatistica.Visible Then Begin
    	If DlgCenaStatistica.WindowState = wsMinimized Then
      	DlgCenaStatistica.WindowState := wsNormal;
    	DlgCenaStatistica.SetFocus
    End
    Else Begin
    	If DlgPortfeil.WindowState = wsMinimized Then
      	DlgPortfeil.WindowState := wsNormal;
    	DlgPortfeil.SetFocus;
    End;
 	End;
end;

procedure TDlgPortfeil.EdtIndexEnter(Sender: TObject);
begin
	FOldValue := (Sender As TValueEdit).Text
end;

procedure TDlgPortfeil.EdtLihvaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = VK_DELETE Then Label18.Font.Color := clActiveCaption;
end;

procedure TDlgPortfeil.EdtIndexKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = VK_DELETE Then Label21.Font.Color := clActiveCaption;
end;

procedure TDlgPortfeil.FormDestroy(Sender: TObject);
begin
	FDBLihva.Free;
  FDBIndex.Free;
  FDBPortfeil.Free;
  FDBCurrCeni.Free;
  ProgOptions.SaveTablesExt(DbGridPortfeil, 'Portfeil');
  ProgOptions.SaveWindowExt(DlgPortfeil, 'Portfeil');
end;

procedure TDlgPortfeil.DbGridPortfeilExit(Sender: TObject);
begin
	If QryPortfeil.State = dsEdit Then Begin
  	If MessageDlg1(C_Mess_SaveCorect, mtConfirmation,
    	  [mbYES, mbNO], 0) = mrYes Then Begin
    	Try
      	QryPortfeil.Post;
      Except
				QryPortfeil.Cancel;
      	DbGridPortfeil.SetFocus;
	    	DbGridPortfeil.SelectedIndex := 8;
        Raise;        
      End;
    End
    Else QryPortfeil.Cancel;
  End;
end;

procedure TDlgPortfeil.CheckEdit;
begin
	DbGridPortfeilExit(Nil);
	EdtLihvaExit(Nil);
  EdtIndexExit(Nil);
end;

procedure TDlgPortfeil.FormDeactivate(Sender: TObject);
begin
	CheckEdit;
end;

procedure TDlgPortfeil.QryPortfeilCalcFields(DataSet: TDataSet);
begin
    //
  QryPortfeilCALC_CHANGE.AsFloat :=
    QryPortfeilPazar_Stoin.AsFloat - QryPortfeilStoinost.AsFloat;
end;

end.
