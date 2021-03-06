unit SpisChan;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBTables, Mask,
  Edtvalue, MyConst, BitBtn, BevelNew, ComCtrls, LabelRegDim;

type
  TDlgNewChange = class(TForm)
    BevelNew1: TBevelNew;
    LblObcho: TLabelRec;
    LblStoinost: TLabelRec;
    LblDrugestvo: TLabel;
    LblData: TLabel;
    LblBroi: TLabel;
    LblCena: TLabel;
    Label7: TLabel;
    Bevel4: TBevel;
    Label10: TLabel;
    Label12: TLabel;
    Label8: TLabel;
    Bevel2: TBevel;
    Label2: TLabel;
    Bevel5: TBevel;
    Info: TBevelNew;
    BtnOK: TButton;
    BtnCancel: TButton;
    EdtData: TMaskEdit;
    EdtCena: TValueEdit;
    EdtRazhod: TValueEdit;
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
    EdtDrugestvo: TEdit;
    procedure EdtBroiKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDataKeyPress(Sender: TObject; var Key: Char);
  private
		InfoInv: TInfoInv; //информация за новата инвестиция
    CheckChnage: Boolean;

    ArangePage: Integer; //страница
    ArangeSelect: Integer; //селектор

		Procedure VidInvestPages;
    Procedure SelectPagesArange;
    Procedure InfoInvToEdit;//От Инвестицията в полетата

    Procedure DataToInfoInv;//От полетата в инвестицията

    Procedure AddValueEdit;
  public
		Function Execute(Var Info: TInfoInv): Byte;
  end;

var
  DlgNewChange: TDlgNewChange;

implementation

Uses Portfeil, Calculat, DlgMess, ConstMessage;

{$R *.DFM}

Function TDlgNewChange.Execute(Var Info: TInfoInv): Byte;
Var
	Key: Word;
Begin
	Result := 10;
  InfoInv := Info;

  AddValueEdit;
  VidInvestPages;
  EdtBroiKeyUp(Nil, Key, [ssShift]);

	If ShowModal = mrOk Then Begin
  	If CheckChnage Then Result := 0 Else Result := 1;
    Info := InfoInv;
  End;
End;

Procedure TDlgNewChange.AddValueEdit;
Begin
	With InfoInv Do begin
		EdtDrugestvo.Text := Drugestvo;
 	 	EdtData.Text := DateToStr(Data);
 	 	EdtBroi.AsInteger := Broi;
 	 	EdtCena.AsFloat := Cena;
 	 	EdtRazhod.AsFloat := Razhod;
  End;
End;

Procedure TDlgNewChange.InfoInvToEdit;
Begin
	With InfoInv Do
    Case ArangePage Of
    	1:Begin
      		Try
      			If AData > 0 Then EdtPage11.Text := DateToStr(AData);
          Except
          	EdtPage11.Text := '';
          End;
          EdtPage12.AsFloat := B;
          EdtPage13.AsInteger := CC; 
      	End;
      2:Begin
      		Try
      			If AData > 0 Then EdtPage21.Text := DateToStr(AData);
          Except
          	EdtPage21.Text := '';
          End;
          EdtPage22.AsFloat := B;
          EdtPage23.AsFloat := C;
        End;
      3:Begin
      		Try
      			If AData > 0 Then EdtPage31.Text := DateToStr(AData);
          Except
          	EdtPage31.Text := '';
          End;
          EdtPage32.AsFloat := B;
        End;
    End;
End;

Procedure TDlgNewChange.SelectPagesArange;
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
Procedure TDlgNewChange.VidInvestPages;
Var
  i: Integer;
Begin
  i := VidInves.IndexOf(InfoInv.VidInv);

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
  InfoInvToEdit;
End;


procedure TDlgNewChange.EdtBroiKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	CheckChnage := True;
	LblStoinost.Caption :=
  	FormatFloat('# ### ### ##0.#0', EdtCena.AsFloat * EdtBroi.AsInteger);

  LblObcho.Caption :=
  	FormatFloat('# ### ### ##0.#0',EdtRazhod.AsFloat+
    	EdtCena.AsFloat*EdtBroi.AsInteger);    

  If (EdtDrugestvo.Text <> '')And
    (EdtBroi.AsInteger > 0)And
    (EdtCena.AsFloat > 0.00) Then

  	BtnOk.Enabled := True
  Else
  	BtnOk.Enabled := False;
end;

Procedure TDlgNewChange.DataToInfoInv;
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

procedure TDlgNewChange.BtnOKClick(Sender: TObject);
begin
	With InfoInv Do Begin
    Try
	    Data := StrToDate(EdtData.Text);
    Except
    	MessageDlg1(C_Mess_ErroDate, mtInformation, [mbOK], 0);
      Exit;
    End;

		If CurrentDate - Data < 0 Then Begin
    	MessageDlg1(C_Mess_DateCledCurr, mtInformation, [mbOK], 0);
      Exit;
    End;
		If Data < 2 Then Begin
    	MessageDlg1(C_Mess_CurrDateSmall, mtInformation, [mbOK], 0);
      Exit;
    End;    

		Drugestvo := EdtDrugestvo.Text;
    Broi := EdtBroi.AsInteger;
    Cena := EdtCena.AsFloat;
    Razhod := EdtRazhod.AsFloat;

    DataToInfoInv; //Добавя допълнителните данни за инвестицията
  End;{With InfoInv Do Begin}

  ModalResult := mrOK
end;

procedure TDlgNewChange.FormShow(Sender: TObject);
begin
	CheckChnage := False;
  EdtDrugestvo.SetFocus;
end;

procedure TDlgNewChange.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = 27 Then Close;
end;

procedure TDlgNewChange.EdtDataKeyPress(Sender: TObject; var Key: Char);
begin
	CheckChnage := True;
end;

end.
