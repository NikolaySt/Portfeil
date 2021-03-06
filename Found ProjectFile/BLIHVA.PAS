unit Blihva;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, Grids, StdCtrls, Menus, DBCtrls,
  Clipbrd, ExtCtrls, DBGrids;

type
  TDlgBankLihva = class(TForm)
    QryPazarCena: TQuery;
    DtSPazarCena: TDataSource;
    MenuStatistic: TMainMenu;
    N3: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    QryPazarCenaData: TDateField;
    QryPazarCenaLihva: TFloatField;
    DBGridStatistic: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure QryPazarCenaBeforePost(DataSet: TDataset);
    procedure DBGridStatisticKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure QryPazarCenaAfterPost(DataSet: TDataset);
    procedure QryPazarCenaAfterDelete(DataSet: TDataset);
    procedure QryPazarCenaAfterInsert(DataSet: TDataset);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPazarCenaBeforeDelete(DataSet: TDataSet);
    procedure QryPazarCenaBeforeEdit(DataSet: TDataSet);
    procedure QryPazarCenaAfterCancel(DataSet: TDataSet);
    procedure FormDeactivate(Sender: TObject);
  private
  	CheckEdit: Boolean;
    FChLihvaEdit: Boolean;
		FDataEdit: TDateTime; 
		Procedure AddPriceToTable(P: PChar);
		Procedure AddPriceToClipBoard;
    procedure CheckEditTable;
  public
    { Public declarations }
  end;

var
  DlgBankLihva: TDlgBankLihva;

implementation

{$R *.DFM}

Uses MyConst, SetupReg, Portfeil, DelPCeni, Calculat, Statinde, Statisti,
	DlgMess, ConstMessage;

Procedure TDlgBankLihva.AddPriceToTable(P: PChar);
Var
  S: String;
  i: Integer;
  C: LongInt;
  CheckNew, Error: Boolean;
  D1: TDateTime;
  P1: Real;
  SBMark: TBookMark;
Begin
	SBMark := Nil;
  QryPazarCena.BeforePost := Nil;
	With QryPazarCena Do
  	Try
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

            If (P1 >= 0)And(D1 < CurrentDate)And(Not Error)And(D1 > 2) Then Begin
	    	    	If Not DlgPortfeil.DBLihva.Exists(D1) Then Begin
              	AppendRecord([D1, P1]);
	            	DlgPortfeil.DBLihva.Add(D1, P1);
              End;
            End;
            Error := False;
          	CheckNew := False;
          End;
          S := '';
        End;

      End;{For i := 0 To }
	  Finally
      QryPazarCena.BeforePost := QryPazarCenaBeforePost;
  		GotoBookMark(SBMark);
      FreeBookMark(SBMark);
	  	EnableControls;
	  End;
End;

Procedure TDlgBankLihva.AddPriceToClipBoard;
Var
  P: String;
  F, i: LongInt;
  S: ShortString;
	QryCopy: TQuery;
begin
	QryCopy := TQuery.Create(nil);
  Try
    With QryCopy Do Begin
			DataBaseName := DBaseName;
      SQL.Add('SELECT * FROM "BLihva.DB"');
      Open;
      P := 'Дата'+Char(VK_TAB)+'Основен лихвен процент'+#13+#10;
      F := 1;
    	While Not(Eof) Do Begin
      	For i := 0 To F Do Begin
        	Case i Of
          	0: S := FieldByName('Data').AsString;
            1: S := FormatFloat('#0.#0', FieldByName('Lihva').AsFloat);
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

Procedure TDlgBankLihva.CheckEditTable;
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

procedure TDlgBankLihva.FormShow(Sender: TObject);
begin
  CheckEdit := False;
  FChLihvaEdit := False;
  With QryPazarCena Do Begin
  	Params[0].Value := CurrentDate;
  	Open;
  End;
end;

procedure TDlgBankLihva.N3Click(Sender: TObject);
begin
	Close;
end;

procedure TDlgBankLihva.QryPazarCenaBeforePost(DataSet: TDataset);
begin
  With QryPazarCena Do Begin
 		If FieldByName('Data').AsDateTime >= CurrentDate  Then Begin
    	DBGridStatistic.SetFocus;
    	DBGridStatistic.SelectedIndex := 0;
    	Raise Exception.Create('Данните, които въвеждате не са за минал период');
    End;

    If FieldByName('Lihva').AsString = '' Then Begin
    	DBGridStatistic.SetFocus;
    	DBGridStatistic.SelectedIndex := 1;
    	Raise Exception.Create('Въведете стойност.');
    End;

 		If FieldByName('Lihva').AsFloat < 0  Then Begin
    	DBGridStatistic.SetFocus;
    	DBGridStatistic.SelectedIndex := 1;
    	Raise	Exception.Create('Не може да въвеждате стойности по-малки от 0.');
    End;

 		If FieldByName('Lihva').AsFloat > 200000  Then Begin
    	DBGridStatistic.SetFocus;
    	DBGridStatistic.SelectedIndex := 1;
    	Raise	Exception.Create('Не може да въвеждате стойности по-големи от 200000.');
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

		If FChLihvaEdit Then Begin
    	If FDataEdit <> FieldByName('Data').AsDateTime Then Begin
		    If DlgPortfeil.DBLihva.Exists(FieldByName('Data').AsDateTime) Then Begin
        	DBGridStatistic.SetFocus;
          DBGridStatistic.SelectedIndex := 0;
    	  	Raise Exception.Create('На '+FieldByName('Data').AsString + ' има въведена стойност');
				End;          
      End;
    	DlgPortfeil.DBLihva.Update(FDataEdit, FieldByName('Data').AsDateTime,
      	FieldByName('Lihva').AsFloat);
      FChLihvaEdit := False;
    End
    Else Begin
	    If DlgPortfeil.DBLihva.Exists(FieldByName('Data').AsDateTime) Then Begin
        DBGridStatistic.SetFocus;
        DBGridStatistic.SelectedIndex := 0;
      	Raise Exception.Create('На '+FieldByName('Data').AsString + ' има въведена стойност');
			End;            
	  	DlgPortfeil.DBLihva.Add(
  	  		FieldByName('Data').AsDateTime,	FieldByName('Lihva').AsFloat);
    End;
	End;
end;

procedure TDlgBankLihva.DBGridStatisticKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If (Key = 13)And(QryPazarCena.State In [dsInsert, dsEdit]) Then Begin
    If DBGridStatistic.SelectedField.FieldNo = 2 Then
    	QryPazarCena.Post
    Else Key := 39;
  End;
end;

procedure TDlgBankLihva.N2Click(Sender: TObject);
var
	MyHandle: THandle;
  TextTbl: PChar;
begin
	CheckEditTable;
  MyHandle := Clipboard.GetAsHandle(CF_TEXT);
  If MyHandle = 0 Then Exit;
  TextTbl := GlobalLock(MyHandle);

  AddPriceToTable(TextTbl);

  GlobalUnlock(MyHandle);
end;

procedure TDlgBankLihva.N4Click(Sender: TObject);
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
        	SQL.ADD('DELETE FROM "BLihva.DB" WHERE Data >= :Data1 '+
          	'AND Data <= :Data2 AND Data <> :CurrDate');
          ParamByName('Data1').DataType := ftDate;
          ParamByName('Data2').DataType := ftDate;
          
          ParamByName('Data1').Value := Data1;
          ParamByName('Data2').Value := Data2;
          
          ParamByName('CurrDate').Value := CurrentDate;
          ExecSQL;
          DlgPortfeil.DBLihva.Delete(Data1, Data2);
      	End;
    	drAll:
      	With QryDel Do Begin
        	SQL.ADD('DELETE FROM "BLihva.DB" WHERE Data <> :CurrData');
          Params[0].DataType := ftDate;
          Params[0].Value := CurrentDate;
          ExecSQL;
          DlgPortfeil.DBLihva.Delete(0, CurrentDate);
    		End;
		End;
    QryPazarCena.Refresh;
  Finally
  	QryDel.Free;
  End;
  CheckEdit := True;
end;

procedure TDlgBankLihva.N5Click(Sender: TObject);
begin
	CheckEditTable;
	AddPriceToClipBoard;
end;

procedure TDlgBankLihva.QryPazarCenaAfterPost(DataSet: TDataset);
begin
	CheckEdit := True;
end;

procedure TDlgBankLihva.QryPazarCenaAfterDelete(DataSet: TDataset);
begin
	CheckEdit := True;
end;

procedure TDlgBankLihva.QryPazarCenaAfterInsert(DataSet: TDataset);
begin
	CheckEdit := True;
end;

procedure TDlgBankLihva.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If (Shift = [ssCtrl])And(Key = 9) Then Begin
  	If DlgBorsovIndex.Visible Then Begin
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

procedure TDlgBankLihva.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	CheckEditTable;
	QryPazarCena.Close;
  If CheckEdit Then DlgPortfeil.ReacalcAlternativa;
End;

procedure TDlgBankLihva.QryPazarCenaBeforeDelete(DataSet: TDataSet);
Var
	Data: TDateTime;
begin
	Data := QryPazarCena.FieldByName('Data').AsDateTime;
	DlgPortfeil.DBLihva.Delete(Data, Data);
end;

procedure TDlgBankLihva.QryPazarCenaBeforeEdit(DataSet: TDataSet);
begin
	FChLihvaEdit := True;
  FDataEdit    := QryPazarCena.FieldByName('Data').AsDateTime;
end;

procedure TDlgBankLihva.QryPazarCenaAfterCancel(DataSet: TDataSet);
begin
	FChLihvaEdit := False;
end;

procedure TDlgBankLihva.FormDeactivate(Sender: TObject);
begin
	CheckEditTable;
end;

end.
