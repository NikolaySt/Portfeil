unit Prihdoh;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Edtvalue, Mask, Calculat,
  BitBtn;

type
  TDlgPrihDohod = class(TForm)
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    LblBezpl: TLabel;
    Bevel1: TBevel;
    EdtData: TMaskEdit;
    EdtBroi: TValueEdit;
    EdtGodina: TValueEdit;
    EdtSuma: TValueEdit;
    EdtBezpl: TValueEdit;
    Label4: TLabel;
    BtnCancel: TButton;
    BtnOK: TButton;
    procedure FormShow(Sender: TObject);
    procedure EdtDataKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
 	  Doh: TDohod;
    Akcia_Oblig: Boolean;
    PokupkaData: TDateTime;
		Procedure SelectArang;
  public
  	Function Execute(Var InvDoh: TDohod;
    	Const AkciaOblig: Boolean; Const ValuePokupkaData: TDateTime): Boolean;
  end;

var
  DlgPrihDohod: TDlgPrihDohod;

implementation

Uses DlgMess, MyConst, ConstMessage;

{$R *.DFM}

Procedure TDlgPrihDohod.SelectArang;
	Procedure AddValueToEdit;
  Begin
		With Doh Do Begin
			EdtData.Text := DateToStr(Data);
	  	EdtBroi.AsInteger := Broi;
	  	EdtGodina.AsInteger := God;
	  	EdtSuma.AsFloat := Suma;

    	If Akcia_Oblig Then EdtBezpl.AsInteger := 0
	  	Else EdtBezpl.AsInteger := BezplAkcii;
		End;
  End;

	Procedure EmptyEdit;
	Begin
		EdtData.Text := '';
		EdtBroi.Text := '';
		EdtGodina.Text := '';
		EdtSuma.Text := '';
		EdtBezpl.Text := '';
	End;
  
Begin

  If Akcia_Oblig Then Begin
    Caption := 'Получени лихви';
    Label6.Caption := 'Получена лихва:';

    Label4.Visible := False;
    EdtBezpl.Visible := False;
    LblBezpl.Visible := False;
   End
  Else Begin
    Caption := 'Получени дивиденти';
    Label6.Caption := 'Получен дивидент:';

  	Label4.Visible := True;
    EdtBezpl.Visible := True;
    LblBezpl.Visible := True;
  End;
  If Doh.Change_Doh Then Begin
		AddValueToEdit;
    Caption := 'Промяна';
    BtnOK.Caption := 'Промяна';
	  BtnOk.Enabled := True;
  End
  Else Begin
		EmptyEdit;
    BtnOK.Caption := 'Добави';
	  BtnOk.Enabled := False;
  End;  
End;

Function TDlgPrihDohod.Execute(Var InvDoh: TDohod;
	Const AkciaOblig: Boolean; Const ValuePokupkaData: TDateTime): Boolean;
Begin
	Doh := InvDoh;
  Akcia_Oblig := AkciaOblig;
  PokupkaData := ValuePokupkaData;
  SelectArang;
	If ShowModal = mrOK Then Begin
  	InvDoh := Doh;
  	Result := True
  End
  Else	Result := False;
End;

procedure TDlgPrihDohod.FormShow(Sender: TObject);
begin
	EdtData.SetFocus;
end;

procedure TDlgPrihDohod.EdtDataKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If  (EdtBroi.AsInteger > 0)And
		 (EdtGodina.AsInteger >0)And
		 ((EdtSuma.AsFloat > 0)Or(EdtBezpl.AsInteger > 0 )) Then BtnOk.Enabled := True
  Else BtnOk.Enabled := False;
end;

procedure TDlgPrihDohod.BtnOKClick(Sender: TObject);
begin
	Try
		Doh.Data := StrToDate(EdtData.Text);
  Except
  	MessageDlg1(C_Mess_ErroDate, mtInformation, [mbOK], 0);
    EdtData.SetFocus;
    Exit;
  End;
	If Doh.Data < PokupkaData Then Begin
  	MessageDlg1(C_Mess_DohodDatePred, mtWarning, [mbOK], 0);
    EdtData.SetFocus;
		Exit;  
  End;
	If Doh.Data > CurrentDate Then Begin
  	MessageDlg1(C_Mess_DateCledCurr, mtWarning, [mbOK], 0);
    EdtData.SetFocus;
		Exit;  
  End;  
  
  Doh.Broi := EdtBroi.AsInteger;
	Doh.Mes := '';
  Doh.God := EdtGodina.AsInteger;
  Doh.Suma := EdtSuma.AsFloat;

  If Akcia_Oblig Then Doh.BezplAkcii := 0
  Else Doh.BezplAkcii := EdtBezpl.AsInteger;

  ModalResult := mrOK;
end;

procedure TDlgPrihDohod.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = 27 Then Close;
end;

end.
