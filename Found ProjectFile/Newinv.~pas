unit NewInv;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBTables, Mask,
  MyConst, BevelNew, Edtvalue, LabelRegDim, ComCtrls, ComboBoxFind;

type

  TDlgNewInv = class(TForm)
    CBoxVidInvest: TComboBox;
    Label1: TLabel;
    BtnOK: TButton;
    BtnCancel: TButton;
    BevelNew1: TBevelNew;
    LblDrugestvo: TLabel;
    EdtData: TMaskEdit;
    LblData: TLabel;
    LblBroi: TLabel;
    LblCena: TLabel;
    EdtCena: TValueEdit;
    Label7: TLabel;
    Bevel4: TBevel;
    LblStoinost: TLabelRec;
    Label10: TLabel;
    Label12: TLabel;
    EdtRazhod: TValueEdit;
    Label8: TLabel;
    Bevel2: TBevel;
    Label2: TLabel;
    Bevel5: TBevel;
    LblObcho: TLabelRec;
    EdtBroi: TValueEdit;
    DataPages: TNotebook;
    LblPage11: TLabel;
    LblPage12: TLabel;
    LblPage13: TLabel;
    LblPage1Dim2: TLabel;
    LblPage1Dim1: TLabel;
    EdtPage11: TMaskEdit;
    EdtPage12: TValueEdit;
    EdtPage13: TValueEdit;
    LblPage21: TLabel;
    LblPage22: TLabel;
    LblPage23: TLabel;
    LblPage2Dim2: TLabel;
    LblPage2Dim1: TLabel;
    EdtPage21: TMaskEdit;
    EdtPage22: TValueEdit;
    EdtPage23: TValueEdit;
    LblPage31: TLabel;
    LblPage32: TLabel;
    LblPage3Dim1: TLabel;
    EdtPage31: TMaskEdit;
    EdtPage32: TValueEdit;
    Info: TBevelNew;
    QryPortfeil: TQuery;
    EdtDrugestvo: TComboBoxFind;
    procedure FormShow(Sender: TObject);
    procedure CBoxVidInvestChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtBroiKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtDrugestvoChange(Sender: TObject);
  private
    ArangePage: Integer; //страница
    ArangeSelect: Integer; //селектор
  	InfoInv: TInfoInv;
    FAddDrugestva: Boolean; //информация за новата инвестиция

    Procedure SelectPagesArange; // Аранжира страницата по зададения селектор
  	Procedure VidInvestPages; //Извбира страницата и селектора
    Procedure DataToInfoInv; //Добавя допълнителните данни за инвестицията
    
    Procedure EmptyEdit;
    Procedure AddingDrugestvo;
  public
  	Property AddDrugestva: Boolean Read FAddDrugestva Write FAddDrugestva;
  end;

var
  DlgNewInv: TDlgNewInv;

implementation

Uses Portfeil, Calculat, DlgMess, ConstMessage;

{$R *.DFM}

Procedure TDlgNewInv.EmptyEdit;
Begin
	EdtDrugestvo.Text := '';
 	EdtData.Text := '';
 	EdtBroi.Text := '';
 	EdtCena.Text := '';
 	EdtRazhod.Text := '';
  LblStoinost.Caption := '0.00';
  LblObcho.Caption := '0.00';

  //Допълнителни данни
  EdtPage11.Text := '';
  EdtPage12.Text := '';
  EdtPage13.Text := '';

  EdtPage21.Text := '';
  EdtPage22.Text := '';
  EdtPage23.Text := '';

  EdtPage31.Text := '';
  EdtPage32.Text := '';
  //
  BtnOk.Enabled := False;
End;

Procedure TDlgNewInv.AddingDrugestvo;
Var
	L: TStringList;
Begin
	If Not AddDrugestva Then Exit;
  L := TStringList.Create;
  Try
  	DlgPortfeil.DbPortfeil.Group(L);
    EdtDrugestvo.Sorted := False;
    EdtDrugestvo.Items.Assign(L);
    EdtDrugestvo.Sorted := True;
  	AddDrugestva := False;
	Finally
  	L.Free;
  End;
End;

Procedure TDlgNewInv.SelectPagesArange;
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

Procedure TDlgNewInv.VidInvestPages;
Var
	i: Integer;
Begin
	i := CBoxVidInvest.ItemIndex; 
	Case i Of
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

  Case i Of
  	//ОбА,ПрА,КПрА,КОбл,ККОбл,ГДРа,ГДРобл,Варт,Права
  	0..4, 12, 13, 18, 19: LblDrugestvo.Caption := 'Дружество:';
    //ДОбл,ОбОбл,ИОбл,ПрОбл,Обл,СБон;
   	5..10: LblDrugestvo.Caption := 'Емитент:';
    //ДСерт,КрЗап,КнБон,КолОп,ПутОп
    11, 14..17: LblDrugestvo.Caption := 'Издател:';
    //Валута
    20..26: LblDrugestvo.Caption := 'Валута:';
  Else
    LblDrugestvo.Caption := 'Описание:';
  End;
  
  SelectPagesArange;
End;

procedure TDlgNewInv.FormShow(Sender: TObject);
begin
  CBoxVidInvest.SetFocus;
  AddingDrugestvo;
end;

procedure TDlgNewInv.CBoxVidInvestChange(Sender: TObject);
Var
	i: Integer;
begin
  EmptyEdit;//Изчиства всички полета от (Инвестицията)
  i := CBoxVidInvest.ItemIndex;
  Case i Of
  	//Валути
  	20: EdtDrugestvo.Text := 'Щатски долар';
  	21: EdtDrugestvo.Text := 'Герм. марка';
    22: EdtDrugestvo.Text := 'Евро';
    23: EdtDrugestvo.Text := 'Френски франк';
    24: EdtDrugestvo.Text := 'Швейц. франк';
    25: EdtDrugestvo.Text := 'Английска лира';
  End;
  If i = 11 Then 	EdtBroi.AsInteger := 1 //Депозитен сертификат
  Else EdtBroi.Text := '';//За Всички останали

  VidInvestPages;
end;

procedure TDlgNewInv.FormCreate(Sender: TObject);
begin
	AddDrugestva := True;
	CBoxVidInvest.Items.Assign(LongName);
  CBoxVidInvest.ItemIndex := 0;
	//Стратира с обикновенни акций
  ArangePage := 3; ArangeSelect := 1
end;

procedure TDlgNewInv.EdtBroiKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	LblStoinost.Caption :=
  	FormatFloat('# ### ### ### ##0.#0', EdtCena.AsFloat * EdtBroi.AsInteger);

  LblObcho.Caption :=
  	FormatFloat('# ### ### ### ##0.#0',EdtRazhod.AsFloat+
    	EdtCena.AsFloat*EdtBroi.AsInteger);    

  If (EdtDrugestvo.Text <> '')And
    (EdtBroi.AsInteger > 0)And
    (EdtCena.AsFloat > 0.00)And
    (CBoxVidInvest.ItemIndex <> -1) Then

  	BtnOk.Enabled := True
  Else
  	BtnOk.Enabled := False;
end;

Procedure TDlgNewInv.DataToInfoInv;
Begin
	With InfoInv Do 
    Case ArangePage Of
    	1:Begin
      		Try
      			AData := StrToDate(EdtPage11.Text);
          Except
          	AData := 0;
          End;
          B := EdtPage12.AsFloat;
          C := 0;
          CC := EdtPage13.AsInteger;
      	End;
      2:Begin
      		Try
      			AData := StrToDate(EdtPage21.Text);
          Except
          	AData := 0;
          End;
          B := EdtPage22.AsFloat;
          C := EdtPage23.AsFloat;
          CC := 0;          
        End;
      3:Begin
      		Try
      			AData := StrToDate(EdtPage31.Text);
          Except
          	AData := 0;
          End;
          B := EdtPage32.AsFloat;
          C := 0;
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

procedure TDlgNewInv.BtnOKClick(Sender: TObject);
begin
	With InfoInv Do Begin
    Try
	    Data := StrToDate(EdtData.Text);
    Except
    	EdtData.SetFocus;
    	MessageDlg1(C_Mess_ErroDate, mtInformation, [mbOK], 0);
      Exit;
    End;
		If CurrentDate - Data < 0 Then Begin
    	EdtData.SetFocus;
    	MessageDlg1(C_Mess_DateCledCurr, mtInformation, [mbOK], 0);
      Exit;
    End;
		If Data < 2 Then Begin
    	EdtData.SetFocus;
    	MessageDlg1(C_Mess_CurrDateSmall, mtInformation, [mbOK], 0);
      Exit;
    End;    

  	VidInv := StrPas(AShortNames[CBoxVidInvest.ItemIndex]);
		Drugestvo := EdtDrugestvo.Text;
    Broi := EdtBroi.AsInteger;
    Cena := EdtCena.AsFloat;
    Razhod := EdtRazhod.AsFloat;

    DataToInfoInv; //Добавя допълнителните данни за инвестицията
    
		Screen.Cursor := crHourGlass;    
    Try
      If Not QryPortfeil.Active Then QryPortfeil.Open;
			If MyCalc.AddNewInvest(QryPortfeil, InfoInv, True) Then Begin
        EmptyEdit;
        Application.ProcessMessages;
      	BtnOk.Enabled := False;
        If EdtDrugestvo.Items.IndexOf(Drugestvo) = -1 Then Begin
         	EdtDrugestvo.Items.Add(Drugestvo);
        End;
      End;
    Finally
    	Screen.Cursor := crDefault;
    End;
  End{With Info Do Begin}
end;

procedure TDlgNewInv.BtnCancelClick(Sender: TObject);
begin
	Close;
end;

procedure TDlgNewInv.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = 27 Then Close;
end;

procedure TDlgNewInv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	QryPortfeil.Close;
  EmptyEdit;
end;

procedure TDlgNewInv.EdtDrugestvoChange(Sender: TObject);
Var
	Shift: TShiftState;
  AKey: Word;
begin
	EdtBroiKeyUp(Nil, AKey, Shift);
end;

end.
