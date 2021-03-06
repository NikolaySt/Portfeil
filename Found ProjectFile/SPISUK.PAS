unit Spisuk;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, ExtCtrls, Buttons, DBiProcs, BevelNew, ComCtrls, MyConst,
  DBTextRegDim, LabelRegDim;

type
  TDlgSpisuk = class(TForm)
    DtSPortfeil: TDataSource;
    MenuSpisuk: TMainMenu;
    N1: TMenuItem;
    QryPortfeil: TQuery;
    QryPortfeilID_Inv: TSmallintField;
    QryPortfeilChifur: TStringField;
    QryPortfeilDrugestvo: TStringField;
    QryPortfeilMemo: TBlobField;
    QryPortfeilData_Inv: TDateField;
    QryPortfeilPurvo_Broi: TIntegerField;
    QryPortfeilPurvo_Cena: TFloatField;
    QryPortfeilPurvo_Stoi: TFloatField;
    QryPortfeilPurvo_Razhod: TFloatField;
    QryPortfeilValid_Padeg: TDateField;
    QryPortfeilProd_Pokupka: TIntegerField;
    QryPortfeilN_F_D_Cena: TFloatField;
    QryPortfeilKup_Lihva: TFloatField;
    Panel1: TPanel;
    LblObcho: TLabelRec;
    LblStoinost: TLabelRec;
    Bevel2: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBTextRec1: TDBTextRec;
    DBTextRec2: TDBTextRec;
    DBTextRec3: TDBTextRec;
    DLblRazhod: TDBTextRec;
    LblAlign: TLabel;
    BtnSave: TSpeedButton;
    BtnCancel: TSpeedButton;
    LblVidInv: TPanel;
    QryPortfeilInv_File: TStringField;
    QryPortfeilStoinost: TFloatField;
    QryPortfeilOtn_dial: TFloatField;
    QryPortfeilVuzv_Obtcha: TFloatField;
    QryPortfeilKapLihva: TFloatField;
    QryPortfeilBroi: TIntegerField;
    QryPortfeilEdin_Cena: TFloatField;
    QryPortfeilPazar_Cena: TFloatField;
    QryPortfeilPazar_Stoin: TFloatField;
    QryPortfeilInv_Stoi: TFloatField;
    QryPortfeilAlternativa: TFloatField;
    QryPortfeilSuma_Div: TFloatField;
    QryPortfeilSuma_Prod: TFloatField;
    QrySumaPurvStoi: TQuery;
    PnlAlign: TPanel;
    LblAlign2: TLabel;
    QrySumaPurvStoiSUMofPurvo_Stoi: TFloatField;
    Label4: TLabel;
    Bevel7: TBevel;
    N2: TMenuItem;
    N3: TMenuItem;
    LblAlign5: TLabel;
    N7: TMenuItem;
    N6: TMenuItem;
    N5: TMenuItem;
    N4: TMenuItem;
    QryPortfeilVuzv_God: TFloatField;
    QryPortfeilInv_Stoi_Alternat: TFloatField;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Info: TBevelNew;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    LblAlign1: TLabel;
    DataPages: TNotebook;
    LblPage11: TLabel;
    LblPage12: TLabel;
    LblPage13: TLabel;
    LblPage21: TLabel;
    LblPage22: TLabel;
    LblPage23: TLabel;
    LblPage31: TLabel;
    LblPage32: TLabel;
    EdtPage13: TDBTextRec;
    EdtPage12: TDBTextRec;
    EdtPage11: TDBTextRec;
    EdtPage23: TDBTextRec;
    EdtPage22: TDBTextRec;
    EdtPage21: TDBTextRec;
    EdtPage32: TDBTextRec;
    EdtPage31: TDBTextRec;
    LblPage3Dim1: TLabel;
    BevelNew1: TBevelNew;
    BevelNew2: TBevelNew;
    N11: TMenuItem;
    DBMemo1: TDBMemo;
    LblSumaPurvoStoi: TLabelRec;
    QryPortfeilPeriod: TIntegerField;
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DtSPortfeilDataChange(Sender: TObject; Field: TField);
    procedure QryPortfeilBeforeEdit(DataSet: TDataset);
    procedure QryPortfeilAfterPost(DataSet: TDataset);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PMenuChangeClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PnlAlignResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  	CheckChangeInv: Boolean;
    InfoInv: TInfoInv;

    ArangePage: Integer; //страница
    ArangeSelect: Integer; //селектор
    iInv: Integer;
    FSortPort: Integer;
    FSumaPurvStoi: Real;
    
    Procedure VidInvestPages;
    Procedure SelectPagesArange;

  	Procedure SortSpisuk(S: String; Const I: Integer);
    Procedure ChangeLabel;

    Procedure PrintSingle;
    Procedure PrintTable;

    Procedure DataToInfoInv;
    Procedure CheckDBMenuSave;
    Function CheckRegKarton: Boolean;

    Procedure UpdateSumaStoi;
  public
    { Public declarations }
  end;

var
  DlgSpisuk: TDlgSpisuk;

implementation

Uses SetupReg, Calculat, SpisChan, PrtSpis, DlgMess, CreatTbl, ConstMessage;

{$R *.DFM}

Procedure TDlgSpisuk.UpdateSumaStoi;
Begin
	LblSumaPurvoStoi.Caption :=	FormatFloat('# ### ### ##0.#0', FSumaPurvStoi);
End;

Procedure TDlgSpisuk.CheckDBMenuSave;
Begin
	If QryPortfeil.Active Then Begin
 		If QryPortfeil.State = dsEdit Then Begin
			If MessageDlg1(C_Mess_SaveCorect,
    		mtConfirmation, [mbYes, mbNO], 0) = mrYes Then QryPortfeil.Post
      Else QryPortfeil.Cancel;
    End;
 	End;
End;

Procedure TDlgSpisuk.PrintTable;
Begin
	With DlgPrintSpisuk Do Begin
  	QrySpisuk.Close;
  	QrySpisuk.SQL.Strings[2] := QryPortfeil.SQL.Strings[2];
    Try
    	QrySpisuk.Open;
      LblBroiInv.Caption    := StatusBar1.Panels[0].Text;
      LblSort.Caption       := StatusBar1.Panels[1].Text;
			LblSpisTitle.Caption  := 'СПИСЪК НА ИНВЕСТИЦИИТЕ КЪМ ' + FormatDateTime('dd/mm/yyyy', CurrentDate);
    	LblObtchaStoi.Caption := LblSumaPurvoStoi.Caption;
    	PrintPage2.Refresh;
      PrintPage2.Print;
    Finally
    	QrySpisuk.Close;
    End;
  End;
End;

Procedure TDlgSpisuk.PrintSingle;
Var
	i: Integer;
Begin
	With DlgPrintSpisuk Do Begin
		LblDrugestvo.Caption  := QryPortfeil.FieldByName('Drugestvo').AsString;
    LblNo.Caption         := 'Инвестиция No: ' + QryPortfeil.FieldByName('ID_INV').AsString;
		LblData.Caption       := QryPortfeil.FieldByName('Data_Inv').AsString;
		LblLongName.Caption   := LblVidInv.Caption;

    PrintLabel10.Caption  := Label6.Caption;
    LblBroi.Caption       := DBTextRec2.Text;

    LblCenaNaBroi.Caption := DBTextRec3.Text;
    LblStoi.Caption       := LblStoinost.Caption;
    LblRazhod.Caption     := DLblRazhod.Text;
    LblObtcho.Caption     := LblObcho.Caption;

    Belegki.Lines.Assign(DBMemo1.Lines);

    {-------------------------------------------}
		PrintFigure5.Caption  := Info.Caption; 
		{-------------------------------------------}
    i := DataPages.PageIndex;
		LblDataPadeg.Visible:= True;
    LblPravo.Visible    := True;
    LblLihva.Visible    := True;
    PrintLabel4.Visible := True;
    PrintLabel7.Visible := True;
    PrintLabel8.Visible := True;
    Case i Of
    	0:Begin
		    LblDataPadeg.Caption:= EdtPage11.Text;
    		LblPravo.Caption    := EdtPage12.Text;
        LblPravo.CaptionDim := EdtPage12.CaptionDim;
		    LblLihva.Caption    := EdtPage13.Text;
				LblLihva.CaptionDim := EdtPage13.CaptionDim;
				PrintLabel4.Caption := LblPage11.Caption;
				PrintLabel7.Caption := LblPage12.Caption;
				PrintLabel8.Caption := LblPage13.Caption;
      End;
      1:Begin
		    LblDataPadeg.Caption:= EdtPage21.Text;
    		LblPravo.Caption    := EdtPage22.Text;
        LblPravo.CaptionDim := EdtPage22.CaptionDim;
		    LblLihva.Caption    := EdtPage23.Text;
				LblLihva.CaptionDim := EdtPage23.CaptionDim;
				PrintLabel4.Caption := LblPage21.Caption;
				PrintLabel7.Caption := LblPage22.Caption;
				PrintLabel8.Caption := LblPage23.Caption;      
      End;      
      2:Begin
		    LblDataPadeg.Caption:= EdtPage31.Text;
    		LblPravo.Caption    := EdtPage32.Text;
        LblPravo.CaptionDim := EdtPage32.CaptionDim;
				PrintLabel4.Caption := LblPage31.Caption;
				PrintLabel7.Caption := LblPage32.Caption;

        LblDataPadeg.Visible:= EdtPage31.Visible;
 		    LblLihva.Visible    := False;
        PrintLabel4.Visible := LblPage31.Visible;
        PrintLabel8.Visible := False;
      End;
      3:Begin
				LblDataPadeg.Visible:= False;
        LblPravo.Visible    := False;
        LblLihva.Visible    := False;
        PrintLabel4.Visible := False;
        PrintLabel7.Visible := False;
        PrintLabel8.Visible := False;
      End;
   	End;
    PrintPage1.Print;
  End;
End;

Procedure TDlgSpisuk.SortSpisuk(S: String; Const I: Integer);
Begin
	CheckDBMenuSave;
	FSortPort := i;
	Case i of
  	0: StatusBar1.Panels[1].Text := 'Подреден';
    1: StatusBar1.Panels[1].Text := 'Сортиран - по шифър';
    2: StatusBar1.Panels[1].Text := 'Сортиран - по дружество';
  End;
  N7.Checked := (0 = i);
  N5.Checked := (1 = i);
  N6.Checked := (2 = i);

  Try
    With QryPortfeil Do Begin
    	If (SQL.Strings[2] = S)And(Active) Then Exit;
    	DisableControls;
			SQL.Strings[2] := S;
      Open;
      First;
    	EnableControls;
		End;
	Except
  	Raise;
    StatusBar1.Panels[1].Text := '';
  End;
End;

Procedure TDlgSpisuk.ChangeLabel;
Begin
	If (LongName <> Nil)And(iInv <> - 1) Then
		LblVidInv.Caption := LongName.Strings[iInv]
  Else
  	LblVidInv.Caption := '';
End;

Function TDlgSpisuk.CheckRegKarton: Boolean;
Var
	Tbl: TTable;
  FileName: String;
Begin
	Result := False;
 	Tbl := TTable.Create(Self);  
  Try
    Tbl.DataBaseName := DBaseName;
    Tbl.TableName := QryPortfeil.FieldByName('Inv_File').AsString+'.DB';
    Try
    	Tbl.Open;
    Except
    	If MessageDlg1(C_Mess_CreateKarton, mtConfirmation,
      	[mbYes, mbNo], 0) = mrYes Then
      Begin
        With QryPortfeil Do Begin
 	      	FileName := CreateDB.CreateKarton(FieldByName('ID_INV').AsInteger);
          Edit;
        	QryPortfeil.FieldByName('Inv_File').AsString := FileName;
          Post;
      	End;
        InfoInv.FileName := FileName;
  		  Tbl.TableName := FileName +'.DB';
	    	Tbl.Open;
      End
     	Else Begin
      	Result := True;
        Exit;
      End;
    End;
    If Tbl.Fields[0].AsString <> '' Then Begin
    	MessageDlg1(C_Mess_RegKarton, mtInformation, [mbOK], 0);
    	Result := True;
    End; 
  Finally
  	Tbl.Close;
  	Tbl.Free;
  End;
End;

procedure TDlgSpisuk.N1Click(Sender: TObject);
begin
	Close;
end;

procedure TDlgSpisuk.FormShow(Sender: TObject);
	Procedure DisableMenu(Check: Boolean);
  Begin
  	N4.Enabled := Check;
    N2.Enabled := Check;
    N8.Enabled := Check;
  End;
Var
	Count: Integer;
begin
  FSumaPurvStoi := 0;
  QryPortfeilMemo.ReadOnly := True;//Бележките
  iInv := -1;
  Count := 0;
  UpdateSumaStoi;
  DisableMenu(False);
  
	DBGrid1.SetFocus;
  VidInvestPages;
  Try
		SortSpisuk('', 0);
  	Count := QryPortfeil.RecordCount;
  Finally
	  If Count = 0 Then Begin
    	StatusBar1.Panels[0].Text := 'Брой инвестиции - 0';
      StatusBar1.Panels[1].Text := '';
   	End
 		Else StatusBar1.Panels[0].Text := 'Брой инвестиции - '+IntToStr(Count);
	End;
  
  Try
    If Count <> 0 Then Begin
    	QryPortfeilMemo.ReadOnly := False;
    	DisableMenu(True);
      Try
      	QrySumaPurvStoi.Open;
        FSumaPurvStoi := QrySumaPurvStoi.Fields[0].AsFloat;
      Finally
      	QrySumaPurvStoi.Close;
      End;    
    End;
  Finally
	  UpdateSumaStoi;
	End;
end;

procedure TDlgSpisuk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	QryPortfeil.Close;
end;

Procedure TDlgSpisuk.SelectPagesArange;
	Procedure SelectPage1_Arange(Select: Integer);
  Begin
  	DataPages.PageIndex := 0;
    Info.Caption := 'Допълнителни данни';
		Case Select Of
    	1:Begin     //КолОп
      		LblPage12.Caption := 'Договорена цена на акция:';
          LblPage13.Caption := 'Право за покупка на акции:';
        End;
      2:Begin    //ПутОп
      		LblPage12.Caption := 'Договорена цена на акция:';
          LblPage13.Caption := 'Право за продажба на акции:';
        End;
      3:Begin   //Варт
      		LblPage12.Caption := 'Фиксирана цена на акция:';
          LblPage13.Caption := 'Право за покупка на акции:';
        End;
      4:Begin   //Права
      		LblPage12.Caption := 'Покупна цена на акция:';
          LblPage13.Caption := 'Право за покупка на акции:';
        End;
    End;
  End;

	Procedure SelectPage2_Arange(Select: Integer);
  Begin
  	DataPages.PageIndex := 1;
    Info.Caption := 'Допълнителни данни';
    Case Select Of
    	1:Begin
     			//КОбл,ККОбл,ДОбл,ОбОбл,ИОбл,ПрОбл,Обл,ГДРобл
      		LblPage22.Caption := 'Номинал:';
          LblPage23.Caption := 'Купонен лихвен процент:';
      	End;
      2:Begin
      		//ДСерт
      		LblPage22.Caption := 'Стойност на депозита:';
          LblPage23.Caption := 'Годишен лихвен процент:';
      	End;
    End;
  End;

	Procedure SelectPage3_Arange(Select: Integer);
  Begin
  	DataPages.PageIndex := 2;
		Info.Caption := 'Допълнителни данни';
    Case Select Of
    	//ОбА,ПрА,КПрА,ГДРа
    	1:Begin
          LblPage31.Visible := False;
      		EdtPage31.Visible := False;
      	End;
      //СБон,КрЗап,КнБон,
      2:Begin
          LblPage31.Visible := True;
      		EdtPage31.Visible := True;
      	End;
    End;    
  End;

	Procedure SelectPage4_Arange(Select: Integer);
  Begin
  	Info.Caption := '';
  	DataPages.PageIndex := 3;
  End;
Begin
  Case ArangePage Of
  	1: SelectPage1_Arange(ArangeSelect);
    2: SelectPage2_Arange(ArangeSelect);
    3: SelectPage3_Arange(ArangeSelect);
    4: SelectPage4_Arange(ArangeSelect);
	End;
End;

Procedure TDlgSpisuk.VidInvestPages;
Begin
	Case iInv Of
  	//ОбА,ПрА,КПрА,ГДРа
  	0..2, 13: Begin ArangePage := 3; ArangeSelect := 1 End;
		//КОбл,ККОбл,ДОбл,ОбОбл,ИОбл,ПрОбл,Обл,ГДРобл
    3..9, 12: Begin ArangePage := 2; ArangeSelect := 1 End;
    //СБон,КрЗап,КнБон,
    10,14,15: Begin ArangePage := 3; ArangeSelect := 2 End;
    //ДСерт
    11:       Begin ArangePage := 2; ArangeSelect := 2 End;
    //КолОп
		16:       Begin ArangePage := 1; ArangeSelect := 1 End;
    //ПутОп
  	17:       Begin ArangePage := 1; ArangeSelect := 2 End;
    //Варт
  	18:       Begin ArangePage := 1; ArangeSelect := 3 End;
    //Права
  	19:       Begin ArangePage := 1; ArangeSelect := 4 End;
  Else
		ArangePage := 4; ArangeSelect := 0;
  End;

  SelectPagesArange;
End;

procedure TDlgSpisuk.DtSPortfeilDataChange(Sender: TObject; Field: TField);
Var
	Stoi: Real;
begin
 	iInv := -1;
	If QryPortfeil.Active Then
    With QryPortfeil Do
			If RecordCount = 0 Then Begin
				LblStoinost.Caption := '0.00';
		  	LblObcho.Caption := '0.00';
      End
      Else Begin
      	iInv := VidInves.IndexOf(FieldByName('Chifur').AsString);
      	Stoi := FieldByName('Purvo_Broi').AsInteger*FieldByName('Purvo_Cena').AsFloat;
    		LblStoinost.Caption := FormatFloat('# ### ### ##0.#0', Stoi);
    		LblObcho.Caption := FormatFloat('# ### ### ##0.#0', FieldByName('Purvo_Stoi').AsFloat);
      End
  Else Begin
  	LblStoinost.Caption := '0.00';
  	LblObcho.Caption := '0.00';
  End;
  ChangeLabel;
  VidInvestPages;
end;

procedure TDlgSpisuk.QryPortfeilBeforeEdit(DataSet: TDataset);
begin
	If Not CheckChangeInv Then Begin
		BtnSave.Enabled := True;
	  BtnCancel.Enabled := True;
  End;
end;

procedure TDlgSpisuk.QryPortfeilAfterPost(DataSet: TDataset);
begin
	If Not CheckChangeInv Then Begin
		BtnSave.Enabled := False;
  	BtnCancel.Enabled := False;
  End;
end;

procedure TDlgSpisuk.BtnCancelClick(Sender: TObject);
begin
	If QryPortfeil.State in [dsEdit]  Then QryPortfeil.Cancel;
end;

procedure TDlgSpisuk.BtnSaveClick(Sender: TObject);
begin
	If QryPortfeil.State in [dsEdit] Then QryPortfeil.Post;
end;

procedure TDlgSpisuk.FormCreate(Sender: TObject);
begin
  CheckChangeInv := False;
  ProgOptions.OpenTablesExt(DBGrid1, 'Spisuk');
  ProgOptions.OpenWindowExt(DlgSpisuk, 'Spisuk');
end;

Procedure TDlgSpisuk.DataToInfoInv;
Begin
	With InfoInv, QryPortfeil Do
    Case ArangePage Of
    	1:Begin
      		AData := FieldByName('Valid_Padeg').AsDateTime;
          B := FieldByName('N_F_D_Cena').AsFloat;
          C := 0;
          CC := FieldByName('Prod_Pokupka').AsInteger;
      	End;
      2:Begin
					AData := FieldByName('Valid_Padeg').AsDateTime;
          B := FieldByName('N_F_D_Cena').AsFloat;
          C := FieldByName('Kup_Lihva').AsFloat;
          CC := 0;
        End;
      3:Begin
      		AData := FieldByName('Valid_Padeg').AsDateTime;
          B := FieldByName('N_F_D_Cena').AsFloat;
          C := FieldByName('Kup_Lihva').AsFloat;
          CC := 0;
        End;
      4:Begin
        	Adata := 0;
          B := 0;
          C := 0;
          CC := 0;
      	End;
    End;
End;

procedure TDlgSpisuk.PMenuChangeClick(Sender: TObject);
Var
	InfoOld: TInfoInv;
  i: Byte;
begin
	If FSortPort In [1..2] Then Begin
  	MessageDlg1(C_Mess_SortPodreden, mtInformation, [mbOK], 0);
    Exit;
  End;

  If Not QryPortfeil.Active Then Exit;
  
	If QryPortfeil.RecordCount = 0 Then Begin
  	MessageDlg1(C_Mess_NotRegInvest, mtInformation, [mbOK], 0);
    Exit;  	
  End;
	DBGrid1.SetFocus;

	With InfoInv, QryPortfeil Do Begin
  	No        := FieldByName('ID_Inv').AsInteger;
  	VidInv    := FieldByName('Chifur').AsString;
		Drugestvo := FieldByName('Drugestvo').AsString;
    Data      := FieldByName('Data_Inv').AsDateTime;
    Broi      := FieldByName('Purvo_Broi').AsInteger;
    Cena      := FieldByName('Purvo_Cena').AsFLoat;
    Razhod    := FieldByName('Purvo_Razhod').AsFLoat;
    {-----------------}
    FileName := FieldByName('Inv_File').AsString;
    {-----------------}
    AData := FieldByName('Valid_Padeg').AsFLoat;

    DataToInfoInv;
  End;

  InfoOld := InfoInv;

  If Not Assigned(DlgNewChange) Then
  	Application.CreateForm(TDlgNewChange, DlgNewChange);

  i := DlgNewChange.Execute(InfoInv);
  Self.Update;
  Case i Of
  	0:Try
    		Screen.Cursor := crHourGlass;
		  	CheckChangeInv := True;
       	If Not CheckRegKarton Then
        	Try
				  	MyCalc.AddNewInvest(QryPortfeil, InfoInv, False);
          Finally
		  	    FSumaPurvStoi := FSumaPurvStoi -
  	    	  	(InfoOld.Broi*InfoOld.Cena+InfoOld.Razhod)+
  		 	    	(InfoInv.Broi*InfoInv.Cena+InfoInv.Razhod);
      			UpdateSumaStoi;
        	End;
    	Finally
		  	Screen.Cursor := crDefault;
    		CheckChangeInv := False;
    	End;
    1:With QryPortfeil, InfoInv Do
      	Try
        	CheckChangeInv := True;
          Edit;
	    		If AData <> 0  Then FieldByName('Valid_Padeg').AsDateTime := AData;
  	  		FieldByName('Prod_Pokupka').AsInteger := CC;
      		FieldByName('N_F_D_Cena').AsFloat := B;
      		FieldByName('Kup_Lihva').AsFloat := C;
      		Post;
        Finally
 	    		CheckChangeInv := False;
        End;
	End;//Case i Of
end;

procedure TDlgSpisuk.N7Click(Sender: TObject);
begin
	SortSpisuk('', 0);
end;

procedure TDlgSpisuk.N5Click(Sender: TObject);
begin
	SortSpisuk('ORDER BY Chifur', 1)
end;

procedure TDlgSpisuk.N6Click(Sender: TObject);
begin
	SortSpisuk('ORDER BY Drugestvo', 2);
end;

procedure TDlgSpisuk.N10Click(Sender: TObject);
begin
	CheckDBMenuSave;
	If MessageDlg1(C_Mess_PrinterReady, mtConfirmation,
  	  [mbYes, mbNO], 0) = mrYes Then Begin

		If Not Assigned(DlgPrintSpisuk) Then
    	Application.CreateForm(TDlgPrintSpisuk, DlgPrintSpisuk);
    PrintSingle;

  End;
end;

procedure TDlgSpisuk.N9Click(Sender: TObject);
begin
  CheckDBMenuSave;
	If MessageDlg1(C_Mess_PrinterReady,
  	mtConfirmation, [mbYes, mbNO], 0) = mrYes Then Begin

		If Not Assigned(DlgPrintSpisuk) Then
    	Application.CreateForm(TDlgPrintSpisuk, DlgPrintSpisuk);
    PrintTable;
    
 	End;
end;

procedure TDlgSpisuk.DBMemo1Exit(Sender: TObject);
begin
	CheckDBMenuSave;
end;

procedure TDlgSpisuk.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	Try
		CheckDBMenuSave;
  Finally
  	CanClose := True;	
  End;
end;

procedure TDlgSpisuk.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
	If FSortPort In [1..2] Then
  	MessageDlg1(C_Mess_SortPodreden, mtInformation, [mbOK], 0);
end;

procedure TDlgSpisuk.DBMemo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Shift = [ssCtrl]	Then Begin
  	If QryPortfeil.Active Then
	  	If (Key = Ord('S'))Or(Key = Ord('s')) Then
      	If QryPortfeil.State = dsEdit Then QryPortfeil.Post;
	End;
  If Key = 27 Then Begin
  	If QryPortfeil.Active Then
      	If QryPortfeil.State = dsEdit Then QryPortfeil.Cancel;
  End;
end;

procedure TDlgSpisuk.PnlAlignResize(Sender: TObject);
begin
	Bevel7.Width := DBGrid1.Width - 4;
  LblSumaPurvoStoi.Left := Bevel7.Width - LblSumaPurvoStoi.Width - 10;
  Label4.Left := LblSumaPurvoStoi.Left - Label4.Width - 10;
end;

procedure TDlgSpisuk.FormDestroy(Sender: TObject);
begin
	ProgOptions.SaveTablesExt(DBGrid1, 'Spisuk');
  ProgOptions.SaveWindowExt(DlgSpisuk, 'Spisuk');
end;

end.

