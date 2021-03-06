unit Statinde;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, Grids, StdCtrls, Menus, DBCtrls,
  Clipbrd, ExtCtrls, DBGrids;

type
  TDlgBorsovIndex = class(TForm)
    QryIndex: TQuery;
    DtSPazarCena: TDataSource;
    MenuStatistic: TMainMenu;
    N3: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    QryIndexData: TDateField;
    QryIndexBorIndex: TFloatField;
    DBGridStatistic: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N3Click(Sender: TObject);
    procedure QryIndexBeforePost(DataSet: TDataset);
    procedure NewDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure QryIndexBeforeDelete(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QryIndexBeforeEdit(DataSet: TDataSet);
    procedure QryIndexAfterCancel(DataSet: TDataSet);
    procedure QryIndexAfterPost(DataSet: TDataSet);
    procedure QryIndexAfterDelete(DataSet: TDataSet);
    procedure QryIndexAfterInsert(DataSet: TDataSet);
    procedure FormDeactivate(Sender: TObject);
  private
  	CheckEdit: Boolean;
  	FDataEdit: TDateTime;
  	FChIndexEdit: Boolean;
    
    Procedure AddPriceToTable(P: PChar);
    Procedure AddPriceToClipBoard;
    procedure CheckEditTable;
  public
  end;

var
  DlgBorsovIndex: TDlgBorsovIndex;

implementation

{$R *.DFM}

Uses MyConst, Portfeil, DelPCeni, DlgMess, Statisti, ConstMessage;

Procedure TDlgBorsovIndex.AddPriceToTable(P: PChar);
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
  QryIndex.BeforePost := Nil;
	With QryIndex Do
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

            If (P1 > 0)And(D1 < CurrentDate)And(Not Error)And(D1 > 2) Then
	    	    	If Not DlgPortfeil.DBIndex.Exists(D1) Then Begin
              	AppendRecord([D1, P1]);
	            	DlgPortfeil.DBIndex.Add(D1, P1);
              End;
            Error := False;
          	CheckNew := False;
          End;
          S := '';
        End;

      End;{For i := 0 To }
	  Finally
    	QryIndex.BeforePost := QryIndexBeforePost;
  		GotoBookMark(SBMark);
      FreeBookMark(SBMark);
	  	EnableControls;
	  End;
End;

Procedure TDlgBorsovIndex.AddPriceToClipBoard;
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
      SQL.Add('SELECT Data, AVG(BorIndex) BorIndex FROM "BIndex.DB" GROUP BY DATA ORDER BY DATA');
      Open;
     	P := 'Дата'+Char(VK_TAB)+'Борсов индекс'+#13+#10;
      F := 1;
    	While Not(Eof) Do Begin
      	For i := 0 To F Do Begin
        	Case i Of
          	0: S := FieldByName('Data').AsString;
            1: S := FormatFloat('#0.#0', FieldByName('BorIndex').AsFloat);
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

Procedure TDlgBorsovIndex.CheckEditTable;
Begin
	With QryIndex Do
		If Active Then Begin
 	 		If (State = dsEdit) Or (State = dsInsert) Then Begin
				If MessageDlg1(C_Mess_SaveCorect,
      		mtConfirmation, [mbYes, mbNO], 0) = mrYes Then Begin
          Try
        		Post
          Except
     	    	DBGridStatistic.SetFocus;
            DBGridStatistic.SelectedIndex := 0;
            Cancel;
            Raise;
          End;
        End
      	Else Cancel;
      End;
 	 	End;
End;


procedure TDlgBorsovIndex.FormShow(Sender: TObject);
begin
  CheckEdit := False;
	FChIndexEdit := False;
  With QryIndex Do Begin
		Params[0].Value := CurrentDate;
  	Open;
  End;
end;

procedure TDlgBorsovIndex.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CheckEditTable;
	QryIndex.Close;
  If CheckEdit Then Begin
  	If DlgPortfeil.DBIndex.Count = 0 Then
		  DlgPortfeil.EdtIndex.Text := ''    
    Else
		  DlgPortfeil.EdtIndex.Text := FormatFloat('#0.#0',
  			DlgPortfeil.DBIndex.LastValue);
 	End;
end;

procedure TDlgBorsovIndex.N3Click(Sender: TObject);
begin
	Close
end;

procedure TDlgBorsovIndex.QryIndexBeforePost(DataSet: TDataset);
begin
  With QryIndex Do Begin
 		If FieldByName('Data').AsDateTime >= CurrentDate  Then Begin
    	DBGridStatistic.SetFocus;
    	DBGridStatistic.SelectedIndex := 0;
    	Raise	Exception.Create('Данните, които въвеждате не са за минал период!');
    End;

    If FieldByName('BorIndex').AsString = '' Then Begin
    	DBGridStatistic.SetFocus;
    	DBGridStatistic.SelectedIndex := 1;
    	Raise Exception.Create('Въведете стойност.');
    End;

 		If FieldByName('BorIndex').AsFloat <= 0  Then Begin
    	DBGridStatistic.SetFocus;
    	DBGridStatistic.SelectedIndex := 1;
    	Raise	Exception.Create('Не може да въвеждате стойности '+
      	'по-малки или равни на 0.');
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

		If FChIndexEdit Then Begin
	   	If FDataEdit <> FieldByName('Data').AsDateTime Then Begin
		   	If DlgPortfeil.DBIndex.Exists(FieldByName('Data').AsDateTime) Then Begin
          DBGridStatistic.SetFocus;
          DBGridStatistic.SelectedIndex := 0;
    	  	Raise Exception.Create('На '+FieldByName('Data').AsString + ' има въведена стойност!');
				End;          
      End;
    	DlgPortfeil.DBIndex.Update(FDataEdit, FieldByName('Data').AsDateTime,
      	FieldByName('BorIndex').AsFloat);
      FChIndexEdit := False;
    End
    Else Begin
	   	If DlgPortfeil.DBIndex.Exists(FieldByName('Data').AsDateTime) Then Begin
        DBGridStatistic.SetFocus;
        DBGridStatistic.SelectedIndex := 0;
      	Raise Exception.Create('На '+FieldByName('Data').AsString + ' има въведена стойност!');
      End;
			DlgPortfeil.DBIndex.Add(
		    	FieldByName('Data').AsDateTime,  FieldByName('BorIndex').AsFloat);
    End;
	End;
end;

procedure TDlgBorsovIndex.NewDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If (Key = 13)And(QryIndex.State In [dsInsert, dsEdit]) Then Begin
    If DBGridStatistic.SelectedField.FieldNo = 2 Then	QryIndex.Post
    Else Key := 39;
  End;
end;

procedure TDlgBorsovIndex.N2Click(Sender: TObject);
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

procedure TDlgBorsovIndex.N4Click(Sender: TObject);
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
	Try
    QryDel.DataBaseName := DBaseName;
    Case TypeDel Of
      drCurrent: QryIndex.Delete;
      drDataToData:
      	With QryDel Do Begin
      		SQL.ADD('DELETE FROM "BIndex.DB" WHERE Data >= :Data1 '+
          	'AND Data <= :Data2 AND Data <> :CurrData' );

          ParamByName('Data1').DataType := ftDate;
          ParamByName('Data2').DataType := ftDate;
                      
          ParamByName('Data1').Value := Data1;
          ParamByName('Data2').Value := Data2;
          ParamByName('CurrData').Value := CurrentDate;
          ExecSQL;
          DlgPortfeil.DBIndex.Delete(Data1, Data2);
      	End;
    	drAll: Begin
        	QryDel.SQL.ADD('DELETE FROM "BIndex.DB" WHERE Data <> :CurrData');
          QryDel.Params[0].Value := CurrentDate;
          QryDel.ExecSQL;
          DlgPortfeil.DBIndex.Delete(0, CurrentDate);
    		End;
    	Else Exit;
		End;
    QryIndex.Refresh;
  Finally
  	QryDel.Free;
  End;
  CheckEdit := True;
end;

procedure TDlgBorsovIndex.N5Click(Sender: TObject);
begin
	CheckEditTable;
	AddPriceToClipBoard;
end;

procedure TDlgBorsovIndex.QryIndexBeforeDelete(DataSet: TDataSet);
Var
	Data: TDateTime;
begin
	Data := QryIndex.FieldByName('Data').AsDateTime;
	DlgPortfeil.DBIndex.Delete(Data, Data);
end;

procedure TDlgBorsovIndex.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If (Shift = [ssCtrl])And(Key = 9) Then Begin
  	If DlgCenaStatistica.Visible Then	Begin
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

procedure TDlgBorsovIndex.QryIndexBeforeEdit(DataSet: TDataSet);
begin
	FChIndexEdit := True;
  FDataEdit    := QryIndex.FieldByName('Data').AsDateTime;
end;

procedure TDlgBorsovIndex.QryIndexAfterCancel(DataSet: TDataSet);
begin
	FChIndexEdit := False;
end;

procedure TDlgBorsovIndex.QryIndexAfterPost(DataSet: TDataSet);
begin
	CheckEdit := True;
end;

procedure TDlgBorsovIndex.QryIndexAfterDelete(DataSet: TDataSet);
begin
	CheckEdit := True;
end;

procedure TDlgBorsovIndex.QryIndexAfterInsert(DataSet: TDataSet);
begin
	CheckEdit := True;
end;

procedure TDlgBorsovIndex.FormDeactivate(Sender: TObject);
begin
	CheckEditTable;
end;

end.
