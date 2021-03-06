unit Kartotek;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, DBCtrls, DB, DBTables, Mask, Menus,
  BevelNew, Buttons, DBTextRegDim, LabelRegDim, CustomGoldChart3;

type
  TDlgKartoteka = class(TForm)
    DBTextRec1: TDBTextRec;
    DBTextRec2: TDBTextRec;
    DBTextRec5: TDBTextRec;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label11: TLabel;
    DBTextRec6: TDBTextRec;
    Label2: TLabel;
    QryPortfeil: TQuery;
    DtSPortfeil: TDataSource;
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
    LabelRec1: TLabelRec;
    DBTextRec9: TDBTextRec;
    QryKarton: TQuery;
    DtSKarton: TDataSource;
    DBTextRec10: TDBTextRec;
    QryKartonSUMofRazhodi: TFloatField;
    Dohod: TNotebook;
    MenuKartoteka: TMainMenu;
    N1: TMenuItem;
    DBTextRec3: TDBTextRec;
    DBTextRec4: TDBTextRec;
    Label4: TLabel;
    Label5: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    DBTextRec8: TDBTextRec;
    QryKartonSUMofBezpl_Akcii: TFloatField;
    LabelRec2: TLabelRec;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    LblResultData: TLabelRec;
    QryPortfeilVuzv_God: TFloatField;
    QryPortfeilInv_Stoi_Alternat: TFloatField;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Label14: TLabel;
    DBTextRec11: TDBTextRec;
    DBTextRec12: TDBTextRec;
    DBTextRec13: TDBTextRec;
    Label13: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    LabelRec3: TLabelRec;
    BevelNew1: TBevelNew;
    BevelNew2: TBevelNew;
    BevelNew3: TBevelNew;
    BevelNew4: TBevelNew;
    DBTextRec7: TDBTextRec;
    DBTextRec14: TDBTextRec;
    DBTextRec15: TDBTextRec;
    DBTextRec16: TDBTextRec;
    DBTextRec17: TDBTextRec;
    DBTextRec18: TDBTextRec;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Bevel1: TBevel;
    Label50: TLabel;
    DBTextRec19: TDBTextRec;
    CBoxInvSpisuk: TComboBox;
    Label26: TLabel;
    ChartsCeni: TGoldChart3;
    BevelNew5: TBevelNew;
    ChartIndex: TGoldChart3;
    BtnIndex: TButton;
    QryPortfeilPeriod: TIntegerField;
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBoxInvSpisukChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure BtnIndexClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Procedure SelectInvKarton;
		Procedure SelectInvVid_Labels;
    Procedure AddChartIndex;

    Procedure RecalcSuma;
    Procedure DisableMenu(Check: Boolean);

    Procedure PrintAkcii;
    Procedure PrintObligacii;
    Procedure PrintValuta;

    Procedure PrintKarton;
    Procedure PrintGrafiki;
  public
    { Public declarations }
  end;

var
  DlgKartoteka: TDlgKartoteka;

implementation

{$R *.DFM}

Uses MyConst, SetupReg, Calculat, PrtKarto, DlgMess, Upravlen, Portfeil,
	ConstMessage;

Procedure TDlgKartoteka.PrintGrafiki;
Var
	Index: Integer;
Begin
	With DlgPrintKartoteka Do Begin
 	  Index := VidInves.IndexOf(QryPortfeil.FieldByName('Chifur').AsString);
    PrintLabel8.Caption := QryPortfeil.FieldByName('Drugestvo').AsString;
  	PrintLabel13.Caption := QryPortfeil.FieldByName('Chifur').AsString;
    PrintLabel10.Caption := 'Инвестиция No: '+QryPortfeil.FieldByName('ID_INV').AsString;

    If Index in [19..27] Then Begin
    	PrtChartIndexSingle.Visible := False;
      PrintLabel4.Visible := False;
    End
    Else Begin
    	PrtChartIndexSingle.Visible := True;
      PrintLabel4.Visible := True;
      PrtChartIndexSingle.AssignCharts(ChartIndex)
    End;
    PrtChartCenaSingle.AssignCharts(ChartsCeni);

    PrintPage2.Refresh;
		PrintPage2.Print    
  End;
End;

Procedure TDlgKartoteka.PrintKarton;
Var
	Index: Integer;
Begin
	With DlgPrintKartoteka Do Begin
    //Начални полета
		LblNo.Caption := 'Инвестиция No: ' + QryPortfeil.FieldByName('ID_INV').AsString;
    LblDrugestvo.Caption := QryPortfeil.FieldByName('Drugestvo').AsString;
    LblTitle.Caption := 'РЕЗУЛТАТ КЪМ '+FormatDateTime('dd/mm/yyyy', CurrentDate); 
    //Първоначални данни
	  LblBBroi.Caption       :=
  		FormatFloat('# ### ##0', QryPortfeil.FieldByName('Purvo_Broi').AsInteger);
  	
	  LblBData.Caption        :=
  		QryPortfeil.FieldByName('Data_Inv').AsString;
  	
	  LblBeginShifur.Caption :=
  		QryPortfeil.FieldByName('Chifur').AsString;
  	
	  LblBCenaNaBroi.Caption :=
  		FormatFloat('# ### ##0.#0##',	QryPortfeil.FieldByName('Purvo_Cena').AsFloat);

	  LblBStoi.Caption       :=
    	FormatFloat('# ### ##0.#0',
    	QryPortfeil.FieldByName('Purvo_Stoi').AsFloat -
      	QryPortfeil.FieldByName('Purvo_Razhod').AsFloat );
  	
	  LblBRazhod.Caption     :=
	  	FormatFloat('# ### ##0.#0', QryPortfeil.FieldByName('Purvo_Razhod').AsFloat);

	  LblBObtcho.Caption     :=
    	FormatFloat('# ### ##0.#0', QryPortfeil.FieldByName('Purvo_Stoi').AsFloat);
		//Портфейл
		LblPeriod.Caption     := DBTextRec18.Text;
		LblDial.Caption       := DBTextRec17.Text;
		LblStoi.Caption       := DBTextRec16.Text;
		LblCenaNaBroi.Caption := DBTextRec15.Text;
		LblBroi.Caption       := DBTextRec14.Text;
	  LblShifur.Caption     := DBTextRec7.Text;
		//Сравнение
    LblOtInvest.Caption   := DBTextRec2.Text;
    LblAlternativa.Caption:= DBTextRec1.Text;
    LblInvestVuzv.Caption := DBTextRec5.Text;
    LblLihva.Caption      := DBTextRec6.Text;
    //Разходи
  	LblRazhodPokupka.Caption:= DBTextRec9.Text;
		LblRazhodProdag.Caption := DBTextRec10.Text;
	  LblRazhodObtcho.Caption := LabelRec1.Caption;

    //Получен чист доход
 	  Index := VidInves.IndexOf(QryPortfeil.Fields[2].AsString);
    Case Index Of
    	{ОбА,ПрА,КПрА, ГДРа}
  		0..2, 13: PrintAkcii;
      {КОбл, ККОбл, ДОбл, ОбОбл, ИпОбл, ПрОбл, Дсерт, Обл, ГДРоб, КрЗап, КнБон}
    	3..9, 11, 12, 14, 15: PrintObligacii;
      {СБон,КолОп,ПутОп,Варт,Права,Валута, НумЦ, Бжт, Изкст}
      16..29:  PrintValuta;
  	End;

		{Графики}
    If Index in [19..27] Then Begin
    	PrtChartIndex.Visible := False;
      PrintLabel26.Visible := False;
    End
    Else Begin
    	PrtChartIndex.Visible := True;
      PrintLabel26.Visible := True;
      PrtChartIndex.AssignCharts(ChartIndex);
    End;

    PrtChartCeni.AssignCharts(ChartsCeni);

    PrintPage1.Refresh;
    PrintPage1.Print;
	End;
End;

Procedure TDlgKartoteka.PrintAkcii;
Begin
	With DlgPrintKartoteka Do Begin
  	LblDohod1.Visible := True;
  	LblDohod2.Visible := True;
  	LblDohod3.Visible := True;
  	LblDohod4.Visible := True;

    LblDohod1.Caption := 'От дивиденти:';
    LblDohod2.Caption := 'Капиталова печалба /загуба/:';
    LblDohod3.Caption := 'ОБЩО:';
    LblDohod4.Caption := 'Безплатни акции:'; 
    {-----------------------------------------}
    LblDohod11.Visible := True;
    LblDohod22.Visible := True;
    LblDohod33.Visible := True;
    LblDohod44.Visible := True;

		LblDohod11.Caption := DBTextRec3.Text;
    LblDohod22.Caption := DBTextRec4.Text;
    LblDohod33.Caption := LabelRec2.Caption;
    LblDohod44.Caption := DBTextRec8.Text;
  End
End;

Procedure TDlgKartoteka.PrintObligacii;
Begin
	With DlgPrintKartoteka Do Begin
  	LblDohod1.Visible := True;
  	LblDohod2.Visible := True;
  	LblDohod3.Visible := True;
  	LblDohod4.Visible := False;

    LblDohod1.Caption := 'От лихви:'; 
    LblDohod2.Caption := 'Капиталова печалба /загуба/:';
    LblDohod3.Caption := 'ОБЩО:';
    {-----------------------------------------}
    LblDohod11.Visible := True;
    LblDohod22.Visible := True;
    LblDohod33.Visible := True;
    LblDohod44.Visible := False;

		LblDohod11.Caption := DBTextRec12.Text;
    LblDohod22.Caption := DBTextRec13.Text;
    LblDohod33.Caption := LabelRec3.Caption;
  End
End;

Procedure TDlgKartoteka.PrintValuta;
Begin
	With DlgPrintKartoteka Do Begin
  	LblDohod1.Visible := True;
  	LblDohod2.Visible := False;
  	LblDohod3.Visible := False;
  	LblDohod4.Visible := False;
    LblDohod1.Caption := 'Капиталова печалба /загуба/:';
    {-----------------------------------------}
    LblDohod11.Visible := True;
    LblDohod22.Visible := False;
    LblDohod33.Visible := False;
    LblDohod44.Visible := False;

		LblDohod11.Caption := DBTextRec11.Text;
  End
End;

Procedure TDlgKartoteka.DisableMenu(Check: Boolean);
Begin
	CBoxInvSpisuk.Enabled := Check;
  N6.Enabled := Check;
  N7.Enabled := Check;
End;

Procedure TDlgKartoteka.RecalcSuma;
Var
	Razhod: Real;
  Dohod: Real;
Begin
	//Oбщо разходи
	Razhod := QryPortfeil.Fields[14].AsFloat + QryKarton.Fields[0].AsFloat;
	LabelRec1.Caption := FormatFloat('# ### ##0.#0', Razhod);
  //Общо (получен чист доход)
  Dohod := QryPortfeil.Fields[21].AsFloat + QryPortfeil.Fields[22].AsFloat;
  LabelRec2.Caption := FormatFloat('# ### ##0.#0', Dohod);
  LabelRec3.Caption := LabelRec2.Caption;
End;

Procedure TDlgKartoteka.SelectInvVid_Labels;
Var
	Index: Integer;
Begin
  If Not QryPortfeil.Active Then Exit;
	Index := VidInves.IndexOf(QryPortfeil.Fields[2].AsString);
  Case Index Of
  	{ОбА, ПрА, КПрА, ГДРа}
  	0..2, 13: If Dohod.PageIndex <> 0 Then Dohod.PageIndex := 0;

    {КОбл, ККОбл, ДОбл, ОбОбл, ИпОбл, ПрОбл, Дсерт, Обл, ГДРоб}
    3..9, 11, 12: If Dohod.PageIndex <> 2 Then Dohod.PageIndex := 2;

    {СБон, КрЗап, КнБон, КолОп, ПутОп, Варт, Права, Валута, НумЦ, Бжт, Изкст}
    10, 14, 15, 16..29: If Dohod.PageIndex <> 1 Then Dohod.PageIndex := 1;
  End;
End;

Procedure TDlgKartoteka.SelectInvKarton;
Begin
  If Not QryPortfeil.Active Then Exit;
  If QryPortfeil.RecordCount = 0 Then Exit;
  With QryKarton Do Begin
  	Close;
		SQL.Strings[1] := 'FROM "'+QryPortfeil.Fields[24].AsString+'.DB"';
   	Open;
  End;
End;

procedure TDlgKartoteka.N1Click(Sender: TObject);
begin
	Close;
end;

procedure TDlgKartoteka.FormShow(Sender: TObject);
begin
	If CBoxInvSpisuk.Enabled Then CBoxInvSpisuk.SetFocus;
	DisableMenu(False);
  AddChartIndex;
	QryPortfeil.Open;
  If DlgPortfeil.DBPortfeil.CountInv > 0 Then Begin
		DlgPortfeil.DBPortfeil.ListSortGroup(CBoxInvSpisuk.Items);
    CBoxInvSpisuk.ItemIndex := 0;
    DisableMenu(True);
    CBoxInvSpisukChange(Nil);
  End;
end;

procedure TDlgKartoteka.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	ChartsCeni.Clear;
  ChartIndex.Clear;
  ChartIndex.Visible := False;

  CBoxInvSpisuk.Clear;

	QryPortfeil.Close;
  QryKarton.Close;
end;

procedure TDlgKartoteka.CBoxInvSpisukChange(Sender: TObject);
Var
	St: Real;
begin
 	If CBoxInvSpisuk.ItemIndex = -1 Then Exit;
	Try
    Screen.Cursor := crHourGlass;

		With QryPortfeil Do Begin
    	Try
    		DisableControls;
    		First;
      	MoveBy(CBoxInvSpisuk.ItemIndex);
        St := FieldByName('Purvo_Cena').AsFLoat
      Finally
				EnableControls;
      End;
    End;

    With ChartsCeni, QryPortfeil, DlgPortfeil Do Begin
    	ChartsCeni.Clear;
      ChartsCeni.New;
      DBPortfeil.ExistsInv(FieldByName('ID_Inv').AsInteger);

  	  Series[0].Pen.Color := clBlue;

    	Series[0].InternalAdd(DBPortfeil.SelectInv^.Line);
      Series[0].Add(CurrentDate, FieldByName('Pazar_Cena').AsFLoat);

	    ChartsCeni.New;
      Series[1].FixLine := True;
  	  Series[1].Pen.Color := clRed;
    	Series[1].Add(Series[0].MaxValues.MinXValue, St);
	    Series[1].Add(Series[0].MaxValues.MaxXValue, St);
	    ChartsCeni.Refresh;
  	End;
	Finally
  	Try
			SelectInvVid_Labels;
    	SelectInvKarton;
			RecalcSuma;
    Finally
	  	Screen.Cursor := crDefault;
    End;
  End;
end;

procedure TDlgKartoteka.FormCreate(Sender: TObject);
begin
  LblResultData.Caption :=
  	'Резултат към '+FormatDateTime('dd/mm/yyyy', CurrentDate);
    
	ProgOptions.OpenWindowExt(DlgKartoteka, 'Kartoteka');
end;

procedure TDlgKartoteka.N7Click(Sender: TObject);
Var
	i: Integer;
  Shifur: String;
begin
	If MessageDlg1(C_Mess_ArchiveData,
  		mtConfirmation, [mbYes, mbNO], 0) = mrNO Then Exit;
	Try
    i := QryPortfeil.FieldByName('ID_INV').AsInteger;
    Shifur := QryPortfeil.FieldByName('Chifur').AsString;
    Try
			MyCalc.DeleteInvest(QryPortfeil)
    Finally
 	  	Screen.Cursor := crHourGlass;

      DlgPortfeil.DBPortfeil.DeleteInv(i);
      DlgPortfeil.DBCurrCeni.Delete(i);

    	i := CBoxInvSpisuk.ItemIndex;
		  CBoxInvSpisuk.Items.Delete(CBoxInvSpisuk.ItemIndex);
      If CBoxInvSpisuk.Items.Count > 0 Then Begin
      	If i <= CBoxInvSpisuk.Items.Count - 1 Then 
        	CBoxInvSpisuk.ItemIndex := i
        Else
        	CBoxInvSpisuk.ItemIndex := CBoxInvSpisuk.Items.Count - 1;
        CBoxInvSpisukChange(CBoxInvSpisuk);
      End
      Else Begin
      	CBoxInvSpisuk.ItemIndex := - 1;
        DisableMenu(False);
        ChartsCeni.Clear;
        ChartsCeni.Refresh;
        RecalcSuma;
      End;
    End;
  Finally
  	Screen.Cursor := crDefault;
  End;
end;

procedure TDlgKartoteka.N3Click(Sender: TObject);
begin
	StartWindow := owPortfeil;
  Close;
end;

procedure TDlgKartoteka.N4Click(Sender: TObject);
begin
	StartWindow := owUpravlenie;
  Close;
end;

procedure TDlgKartoteka.N8Click(Sender: TObject);
begin
	If MessageDlg1(C_Mess_PrinterReady,
  	mtConfirmation, [mbYes, mbNO], 0) = mrYes Then Begin

		If Not Assigned(DlgPrintKartoteka) Then
    	Application.CreateForm(TDlgPrintKartoteka, DlgPrintKartoteka);

		PrintKarton;
	End;
end;

procedure TDlgKartoteka.N9Click(Sender: TObject);
begin
	If MessageDlg1(C_Mess_PrinterReady,
  	mtConfirmation, [mbYes, mbNO], 0) = mrYes Then Begin

		If Not Assigned(DlgPrintKartoteka) Then
    	Application.CreateForm(TDlgPrintKartoteka, DlgPrintKartoteka);
      
		PrintGrafiki;
	End;
end;

procedure TDlgKartoteka.BtnIndexClick(Sender: TObject);
begin
	ChartIndex.Visible := Not ChartIndex.Visible;
end;

procedure TDlgKartoteka.FormResize(Sender: TObject);
begin
	If (Width >= 769)And(Height >= 474) Then Begin
   	VertScrollBar.Visible := False;
    HorzScrollBar.Visible := False;
	End
  Else Begin
   	VertScrollBar.Visible := True;
    HorzScrollBar.Visible := True;  	
  End;
end;

procedure TDlgKartoteka.AddChartIndex;
begin
	With ChartIndex Do Begin
  	Clear;
		New;
  	Series[0].Pen.Color := clBlue;
  	Series[0].InternalAdd(DlgPortfeil.DBIndex.RootLine);
    Series[0].Add(CurrentDate, DlgPortfeil.DBIndex.LastValue);
    Refresh;
  End;
end;

procedure TDlgKartoteka.FormDestroy(Sender: TObject);
begin
	ProgOptions.SaveWindowExt(DlgKartoteka, 'Kartoteka');
end;

end.
