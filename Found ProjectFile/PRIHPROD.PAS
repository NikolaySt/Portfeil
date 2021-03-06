unit Prihprod;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Edtvalue, Mask, Calculat,
  BitBtn;

type
  TDlgPrihProd = class(TForm)
    Bevel1: TBevel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    EdtData: TMaskEdit;
    EdtBroi: TValueEdit;
    EdtCena: TValueEdit;
    EdtRazhod: TValueEdit;
    Label1: TLabel;
    BtnCancel: TButton;
    BtnOK: TButton;
    procedure FormShow(Sender: TObject);
    procedure EdtDataKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  	MaxBroi: LongInt;
    Prod: TProd;
    PokupkaData: TDateTime;
		Procedure SelectArange;
  public
  	Function Execute(Var InvProd: TProd;
    	Const ValueMaxBroi: LongInt; Const ValuePokupkaData: TDateTime): Boolean;
  end;

var
  DlgPrihProd: TDlgPrihProd;

implementation

Uses DlgMess, MyConst, ConstMessage;

{$R *.DFM}

Procedure TDlgPrihProd.SelectArange;
	Procedure EmptyEdit;
	Begin
	  EdtData.Text := '  /  /    ';
	  EdtBroi.Text := '';
	  EdtCena.Text := '';
 		EdtRazhod.Text := '';
	End;

	Procedure AddValueToEdit;
	Begin
		With Prod Do Begin
  		EdtData.Text := DateToStr(Data);
  	  EdtBroi.AsInteger := Broi;
  	  EdtCena.AsFloat := Cena;
  	  EdtRazhod.AsFloat := Razhod;
  	End;
	End;
  
Begin
  If Prod.Change_Prod Then Begin
  	AddValueToEdit;
    Caption := 'Промяна';
    BtnOK.Caption := 'Промяна';
    BtnOk.Enabled := True;
  End
	Else Begin
  	EmptyEdit;
    Caption := 'Продажби';
    BtnOK.Caption := 'Добави';
    BtnOk.Enabled := False;
  End;
End;

Function TDlgPrihProd.Execute(Var InvProd: TProd;
	Const ValueMaxBroi: LongInt; Const ValuePokupkaData: TDateTime): Boolean;
Begin
	Prod := InvProd;

  If Prod.Change_Prod Then MaxBroi := ValueMaxBroi + Prod.Broi
  Else MaxBroi := ValueMaxBroi;

  PokupkaData := ValuePokupkaData;
  
	SelectArange;
  
	If ShowModal = mrOK Then Begin
		InvProd := Prod;
  	Result := True;
  End
  Else Result := False;
End;

procedure TDlgPrihProd.FormShow(Sender: TObject);
begin
	EdtData.SetFocus;
end;

procedure TDlgPrihProd.EdtDataKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If (EdtData.Text <> '  /  /    ')And
  	( (EdtBroi.AsInteger > 0)And(EdtBroi.AsInteger <= MaxBroi) )And
    (EdtCena.AsFloat > 0) Then BtnOk.Enabled := True
  Else BtnOk.Enabled := False;
end;

procedure TDlgPrihProd.BtnOKClick(Sender: TObject);
begin
  Try
  	Prod.Data := StrToDate(EdtData.Text);
  Except
  	MessageDlg1(C_Mess_ErroDate, mtInformation, [mbOK], 0);
    EdtData.SetFocus;
		Exit;
  End;
	If Prod.Data < PokupkaData Then Begin
  	MessageDlg1(C_Mess_ProdDatePred, mtWarning, [mbOK], 0);
    EdtData.SetFocus;
		Exit;  
  End;
 	If Prod.Data > CurrentDate Then Begin
  	MessageDlg1(C_Mess_DateCledCurr, mtWarning, [mbOK], 0);
    EdtData.SetFocus;
		Exit;  
  End;

  Prod.Broi := EdtBroi.AsInteger;
  Prod.Cena := EdtCena.AsFloat;
  Prod.Razhod := EdtRazhod.AsFloat;

  ModalResult := mrOK;
end;

procedure TDlgPrihProd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = 27 Then Close;
end;

end.
