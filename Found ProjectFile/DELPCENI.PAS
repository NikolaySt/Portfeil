unit DelPCeni;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, Mask, Buttons, BitBtn;

type
	TDelRecord = (drNo, drCurrent, drDataToData, drAll);

  TDlgDelPazarCena = class(TForm)
    EdtData1: TMaskEdit;
    EdtData2: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    BtnOK: TButton;
    BtnCancel: TButton;
    Bevel2: TBevel;
    ChBoxAll: TCheckBox;
    ChBoxCurr: TCheckBox;
    procedure BtnOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ChBoxAllClick(Sender: TObject);
    procedure ChBoxCurrClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  	FData1, FData2: TDateTime;
  public
  	Function Execute(Var Data1, Data2: TDateTime): TDelRecord;
  end;

var
  DlgDelPazarCena: TDlgDelPazarCena;

implementation

Uses DlgMess, ConstMessage;

{$R *.DFM}

Function TDlgDelPazarCena.Execute(Var Data1, Data2: TDateTime): TDelRecord;
Begin
	If ShowModal = mrOK Then Begin
  	If MessageDlg1(C_Mess_Delete,
    	mtInformation, [mbYES, mbNO], 0) = mrYES Then Begin
      Data1 := FData1;
      Data2 := FData2;
      If ChBoxAll.Checked Then Result := drAll
      Else If ChBoxCurr.Checked Then Result := drCurrent
      Else Result := drDataToData;
    End
    Else Result := drNo;
  End
  Else Result := drNo;
End;

procedure TDlgDelPazarCena.BtnOKClick(Sender: TObject);
begin
	If (Not ChBoxAll.Checked)And(Not ChBoxCurr.Checked) Then Begin
		Try
			FData1 := StrToDate(EdtData1.Text);
    Except
      MessageDlg1(C_Mess_ErroDate, mtInformation, [mbOK], 0);
      EdtData1.SetFocus;
      Exit;
    End;
    Try
			FData2 := StrToDate(EdtData2.Text);
    Except
      MessageDlg1(C_Mess_ErroDate, mtInformation, [mbOK], 0);
      EdtData2.SetFocus;
      Exit;
    End;
    If FData1 > FData2 Then Begin
    	MessageDlg1(C_Mess_RotatePeriod, mtInformation, [mbOK], 0);
      EdtData1.SetFocus;
      Exit;
    End;
  End;
	ModalResult := mrOK;
end;

procedure TDlgDelPazarCena.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = 27 Then Close;
end;

procedure TDlgDelPazarCena.ChBoxAllClick(Sender: TObject);
begin
	EdtData1.Enabled := Not (Sender As TCheckBox).Checked;
	EdtData2.Enabled := Not (Sender As TCheckBox).Checked;
  ChBoxCurr.Enabled := Not (Sender As TCheckBox).Checked;
end;

procedure TDlgDelPazarCena.ChBoxCurrClick(Sender: TObject);
begin
	EdtData1.Enabled := Not (Sender As TCheckBox).Checked;
	EdtData2.Enabled := Not (Sender As TCheckBox).Checked;
  ChBoxAll.Enabled := Not (Sender As TCheckBox).Checked;
end;

procedure TDlgDelPazarCena.FormShow(Sender: TObject);
begin
	If EdtData1.Enabled Then EdtData1.SetFocus;
end;

end.
