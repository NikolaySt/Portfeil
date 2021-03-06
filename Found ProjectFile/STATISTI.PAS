unit Statisti;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, Grids,  StdCtrls, Menus, DBCtrls,
  Clipbrd, ExtCtrls, DBGrids;

type
  TDlgCenaStatistica = class(TForm)
    QryPazarCena: TQuery;
    DtSPazarCena: TDataSource;
    QryPazarCenaID_Inv: TSmallintField;
    QryPazarCenaData: TDateField;
    QryPazarCenaPazar_Cena: TFloatField;
    MenuStatistic: TMainMenu;
    N3: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    PnlDrug: TPanel;
    DBGridStatistic: TDBGrid;
    LblAlign3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N3Click(Sender: TObject);
    procedure QryPazarCenaBeforePost(DataSet: TDataset);
    procedure NewDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure QryPazarCenaBeforeDelete(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QryPazarCenaBeforeEdit(DataSet: TDataSet);
    procedure QryPazarCenaAfterCancel(DataSet: TDataSet);
    procedure FormDeactivate(Sender: TObject);
  private
  	FID_INV: Integer;
  	FChCenaEdit: Boolean;
    FDataEdit: TDateTime;
    Procedure AddPriceToTable;
    Procedure AddPriceToClipBoard;
    procedure CheckEditTable;
  public
  	Property ID_INV: Integer Read FID_INV Write FID_INV; 
  end;

var
  DlgCenaStatistica: TDlgCenaStatistica;

implementation

{$R *.DFM}

Uses MyConst, SetupReg, Portfeil, DelPCeni, Upravlen, DlgMess, ConstMessage;

Procedure TDlgCenaStatistica.AddPriceToTable;
Var
  S: String;
  i: Integer;
  C: LongInt;
  CheckNew, Error: Boolean;
  D1: TDateTime;
  P1: Real;
  SBMark: TBookMark;
  No: LongInt;
	P: PChar;
  MyHandle: THandle;
Begin
  MyHandle := Clipboard.GetAsHandle(CF_TEXT);
  If MyHandle = 0 Then Exit;
  P := GlobalLock(MyHandle);

  SBMark := Nil;
  QryPazarCena.BeforePost := Nil;
	With QryPazarCena Do
  	Try
      No := ID_INV;

      DisableControls;
      SBMark := GetBookMark;

    	S := '';
      C := 0;
      CheckNew := True;
      Error := False;
      P1 := 0;
      D1 := 0;
			For i := 0 To StrLen(P) - 1 Do Begin

      	If Not((P[i] = #13)Or(P[i] = #10)) Then Begin

      		If Ord(P[i]) <> VK_TAB Then Begin
          	S := S + P[i]
          End
          Else Begin
            If C = 0 Then Begin
            	C := 1;
              Try
	              D1 := StrToDate(S);
              Except
              	Error := True;
              End;
            End;
            S := '';
            CheckNew := True;
          End;
        End
        Else Begin
          C := 0;
          If CheckNew Then Begin
            Try
            	P1 := StrToFloat(S);
            Except
            	Error := True;
            End;

            If (P1 > 0)And(D1 < CurrentDate)And(Not Error)And(D1 > 2) Then
            	If Not DlgPortfeil.DBPortfeil.ExistsCena(No, D1) Then Begin
	              AppendRecord([No, D1, P1]);
  	            DlgPortfeil.DBPortfeil.AddCena(No, D1, P1);
							End;
            Error := False;
          	CheckNew := False;
          End;
          S := '';
        End;

      End;{For i := 0 To }
	  Finally
		  QryPazarCena.BeforePost := QryPazarCenaBeforePost;
		  GlobalUnlock(MyHandle);    	
  		GotoBookMark(SBMark);
      FreeBookMark(SBMark);
	  	EnableControls;
	  End;
End;

Procedure TDlgCenaStatistica.AddPriceToClipBoard;
Var
  P: String;
  i, F: LongInt;
  S, Drug: String;
	QryCopy: TQuery;
begin
  Drug := PnlDrug.Caption;
  QryCopy := TQuery.Create(nil);
  Try
    With QryCopy Do Begin
			DataBaseName := DBaseName;
      SQL.Add('SELECT * FROM PAZRCENA WHERE ID_INV = '+IntToStr(ID_INV));
      Open;
     	P := Drug+#13+#10+'Дата'+Char(VK_TAB)+'Цена'+#13+#10;
      F := 1;
    	While Not(Eof) Do Begin
      	For i := 0 To F Do Begin
        	Case i Of
          	0: S := FieldByName('Data').AsString;
            1: S := FormatFloat('#0.####', FieldByName('Pazar_Cena').AsFloat);
          End;
					P := P + S;
          If i <> F Then P := P + Char(VK_TAB)
          Else P := P + #13+#10;
        End;{For i := 0 To F}
      	Next;
      End;
  	End;
		ClipBoard.SetTextBuf(PChar(P));
  Finally
  	QryCopy.Free;
  End;
end;

Procedure TDlgCenaStatistica.CheckEditTable;
Begin
	If QryPazarCena.Active Then Begin
 		If (QryPazarCena.State = dsEdit) Or (QryPazarCena.State = dsInsert) Then Begin
			If MessageDlg1(C_Mess_SaveCorect,
    		mtConfirmation, [mbYes, mbNO], 0) = mrYes Then Begin
          Try
        		QryPazarCena.Post
          Except
     	    	DBGridStatistic.SetFocus;
            DBGridStatistic.SelectedIndex := 0;
            Raise;
          End;
      End
      Else QryPazarCena.Cancel;
    End;
 	End;
End;

procedure TDlgCenaStatistica.FormShow(Sender: TObject);
begin
	FChCenaEdit := False;
  QryPazarCena.Active := True;
end;

procedure TDlgCenaStatistica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	CheckEditTable;
	QryPazarCena.Active := False;
end;

procedure TDlgCenaStatistica.N3Click(Sender: TObject);
begin
	Close
end;

procedure TDlgCenaStatistica.QryPazarCenaBeforePost(DataSet: TDataset);
begin
  With QryPazarCena Do Begin

		FieldByName('ID_Inv').AsInteger := ID_INV;

 		If FieldByName('Data').AsDateTime >= CurrentDate  Then Begin
    	DBGridStatistic.SetFocus;
    	DBGridStatistic.SelectedIndex := 0;
    	Raise	Exception.Create('Данните, които въвеждате не са за минал период!');
    End;

    If FieldByName('Pazar_Cena').AsString = '' Then  Begin
    	DBGridStatistic.SetFocus;
    	DBGridStatistic.SelectedIndex := 1;
    	Raise Exception.Create('Въведете стойност.');
    End;

 		If FieldByName('Pazar_Cena').AsFloat <= 0  Then Begin
    	DBGridStatistic.SetFocus;
    	DBGridStatistic.SelectedIndex := 1;
    	Raise Exception.Create('Не може да въвеждате стойности по-малки или равни на 0.');
		End;

    If FieldByName('Data').AsString = '' Then Begin
    	DBGridStatistic.SetFocus;
    	DBGridStatistic.SelectedIndex := 0;
    	Raise	Exception.Create('Въведете дата.');    
    End;

    If FieldByName('Data').AsDateTime < 2 Then Begin
    	DBGridStatistic.SetFocus;
    	DBGridStatistic.SelectedIndex := 0;
    	Raise	Exception.Create('Не може да въвеждате дата преди 01/01/1900.');    
    End;

		If FChCenaEdit Then Begin
    	If FieldByName('Data').AsDateTime <> FDataEdit Then Begin
		   	If DlgPortfeil.DBPortfeil.ExistsCena(ID_INV,
        	FieldByName('Data').AsDateTime) Then Begin
          DBGridStatistic.SetFocus;
          DBGridStatistic.SelectedIndex := 0;
	      	Raise Exception.Create('На '+FieldByName('Data').AsString + ' има въведена стойност!');
				End;          
      End;
    	DlgPortfeil.DBPortfeil.UpdateCena(
      	ID_INV,
      	FDataEdit, FieldByName('Data').AsDateTime,
      	FieldByName('Pazar_Cena').AsFloat);
      FChCenaEdit := False;
    End
    Else Begin
    	If DlgPortfeil.DBPortfeil.ExistsCena(ID_INV,
      	FieldByName('Data').AsDateTime) Then Begin
  	  	DBGridStatistic.SetFocus;
	    	DBGridStatistic.SelectedIndex := 0;
      	Raise Exception.Create('На '+FieldByName('Data').AsString + ' има въведена стойност!');
			End;        
			DlgPortfeil.DBPortfeil.AddCena(
        	ID_INV,
		    	FieldByName('Data').AsDateTime,
          FieldByName('Pazar_Cena').AsFloat);
  	End;
	End;
end;

procedure TDlgCenaStatistica.NewDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If (Key = 13)And(QryPazarCena.State In [dsInsert, dsEdit]) Then Begin
    If DBGridStatistic.SelectedField.FieldNo = 3 Then
    	QryPazarCena.Post
    Else Key := 39;
  End;
end;

procedure TDlgCenaStatistica.N2Click(Sender: TObject);
begin
	CheckEditTable;
  AddPriceToTable;
end;

procedure TDlgCenaStatistica.N4Click(Sender: TObject);
Var
	Data1, Data2: TDateTime;
  TypeDel: TDelRecord;
  QryDel: TQuery;
begin
	CheckEditTable;

  If Not Assigned(DlgDelPazarCena) Then
  	Application.CreateForm(TDlgDelPazarCena, DlgDelPazarCena);

  TypeDel := DlgDelPazarCena.Execute(Data1, Data2);

  QryDel := TQuery.Create(nil);
  QryDel.DataBaseName := DBaseName;
  Try
    Case TypeDel Of
      drCurrent: QryPazarCena.Delete;
      drDataToData:
      	With QryDel Do Begin
        	SQL.ADD('DELETE FROM PAZRCENA WHERE Data >= :Data1 '+
          	'AND Data <= :Data2 AND Data <> :CurrData AND ID_INV = :ID');

          ParamByName('Data1').DataType := ftDate;
          ParamByName('Data2').DataType := ftDate;
                      
          ParamByName('Data1').Value := Data1;
          ParamByName('Data2').Value := Data2;
          ParamByName('CurrData').Value := CurrentDate;
          ParamByName('ID').Value := ID_INV;
          ExecSQL;
          DlgPortfeil.DBPortfeil.DeleteCena(ID_INV, Data1, Data2);
      	End;
    	drAll: Begin
        	QryDel.SQL.ADD('DELETE FROM PAZRCENA WHERE '+
          	'Data <> :CurrData AND ID_Inv = :ID');
          QryDel.ParamByName('CurrData').Value := CurrentDate;
          QryDel.ParamByName('ID').Value := ID_INV;
					QryDel.ExecSQL;
          DlgPortfeil.DBPortfeil.DeleteCena(ID_INV, 0, 50000);
    		End;
		End;
	  QryPazarCena.Refresh;
  Finally
  	QryDel.Free;
  End;
end;

procedure TDlgCenaStatistica.N5Click(Sender: TObject);
begin
	CheckEditTable;
	AddPriceToClipBoard;
end;

procedure TDlgCenaStatistica.QryPazarCenaBeforeDelete(DataSet: TDataSet);
Var
	Data: TDateTime;
begin
	Data := QryPazarCena.FieldByName('Data').AsDateTime;
	DlgPortfeil.DBPortfeil.DeleteCena(ID_INV, Data, Data);
end;

procedure TDlgCenaStatistica.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If (Shift = [ssCtrl])And(Key = 9) Then Begin
  	If DlgPortfeil.WindowState = wsMinimized Then
    	DlgPortfeil.WindowState := wsNormal;
  	DlgPortfeil.SetFocus;
  End;
end;

procedure TDlgCenaStatistica.QryPazarCenaBeforeEdit(DataSet: TDataSet);
begin
	FChCenaEdit  := True;
  FDataEdit    := QryPazarCena.FieldByName('Data').AsDateTime;
end;

procedure TDlgCenaStatistica.QryPazarCenaAfterCancel(DataSet: TDataSet);
begin
	FChCenaEdit := False;
end;

procedure TDlgCenaStatistica.FormDeactivate(Sender: TObject);
begin
	CheckEditTable;
end;

end.
