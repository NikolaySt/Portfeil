unit Upravlen;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, StdCtrls, ExtCtrls, Menus, DB, BDE,
  DBTables, DBGrids, DBCtrls, Periods, BevelNew, LabelRegDim, DBTextRegDim,
  LBoxExtHint, DbComps;

type
  ThreadDataList = Class;

  TDlgUpravlenie = class(TForm)
    MenuUpravlenie: TMainMenu;
    N1: TMenuItem;
    Period1: TPeriod;
    PnlAlignBase: TPanel;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    CBoxTriMesec: TComboBox;
    Label9: TLabel;
    LblPeriods: TLabelRec;
    Splitter2: TSplitter;
    BevelNew1: TBevelNew;
    BevelNew2: TBevelNew;
    DBGridUprav: TDBGrid;
    DtSMem: TDataSource;
    TblMem: TAttachTable;
    TblMemIDINV: TIntegerField;
    TblMemShifur: TStringField;
    TblMemDrugestvo: TStringField;
    TblMemPromiana: TFloatField;
    TblMemKriteri2: TBooleanField;
    LblData1: TLabelRec;
    LblData2: TLabelRec;
    LblIndex: TLabelRec;
    LblAkcii: TLabelRec;
    TblDataTrims: TTable;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    BevelNew3: TBevelNew;
    LBoxData: TListBoxExtHint;
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBoxTriMesecChange(Sender: TObject);
    procedure Period1MouseUp(Sender: TObject; X, Y, Index: Integer);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBGridUpravDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Panel1Resize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LBoxDataSelectDate(Sender: TListBox; FirstDate,
      SecondDate: TDateTime);
    procedure FormDestroy(Sender: TObject);
  private
  	FOpenArhiv: Boolean;
    FActiveThread: Boolean;
    FTh3: ThreadDataList;
    FSaveData: TDateTime;
    procedure CreateTblMem;
    Procedure UpdateUpra;
		Procedure AddPeriods;//добавя периодите в графиката
    Procedure EmptyLabels;
  public
  	FChThReadExit: Boolean;
    Property OpenArhiv: Boolean Read FOpenArhiv Write FOpenArhiv;
    Property ActiveThread: Boolean Read FActiveThread Write FActiveThread;
    Property SaveData: TDateTime Read FSaveData Write FSaveData;  
  end;

  ThreadDataList = class(TThread)
  protected
    procedure Execute; override;
  end;

var
  DlgUpravlenie: TDlgUpravlenie;

implementation

Uses MyConst, SetupReg, Portfeil, Kartotek, DlgMess, ConstMessage;

{$R *.DFM}

Procedure ThreadDataList.Execute;
Var
  Data1, Data2: TDateTime;
  L: TStringList;
Begin
  With DlgUpravlenie Do Begin
    Data1 := CurrentDate - 456;
    Data2 := CurrentDate;
   	If Not DlgPortfeil.DBPortfeil.LastDateInv(Data1) Then Exit;
        
  	If SaveData <> -1 Then Begin
    	If SaveData = Data1 Then	If Not ActiveThread Then Exit;
    End;
    
    SaveData := Data1;

    If Data1 >= CurrentDate Then Exit;
    L := TStringList.Create;
    Try
    	LBoxData.Clear;
      While (Data2 >= Data1)And(Not FChThReadExit) Do
      	If Not FChThReadExit Then Begin
					L.Add(FormatDateTime('dd/mm/yyyy', Data1));
  		    Data1 := Data1 + 1;
      	End;
    	LBoxData.Items.Assign(L);
 		Finally
    	L.Free;
    	ActiveThread := False;
    End;
  End;//With DlgUpravlenie
End;

procedure TDlgUpravlenie.CreateTblMem;
	Function CreateFields(FieldName: String; FieldType: Word; Len: Word): FLDDesc;
  Begin
  	FillChar(Result, SizeOf(Result), 0);
  	With Result Do Begin
      StrPCopy(szName, FieldName);
      iFldType    :=  FieldType;
      iSubType    :=  FieldType;
      iUnits1     :=  Len;
      efldvVchk   :=  fldvNOCHECKS;
      efldrRights :=  fldrREADWRITE;
      bCalcField  :=  False;
    End;
  End;
Var
	hCursor: hDBICur;
	AD: Array[0..4] of FLDDesc;
begin
  AD[0] := CreateFields('IDINV', fldINT32, 0);
	AD[1] := CreateFields('Shifur', fldZSTRING, 6);
  AD[2] := CreateFields('Drugestvo', fldZSTRING, 50);
  AD[3] := CreateFields('Promiana', fldFLOAT, 0);
  AD[4] := CreateFields('Kriteri2', fldBool, 0);

	Check(
  	DbiCreateInMemTable(Nil, 'MyTemp2', High(AD)+1, @AD, hCursor)
    );
  TblMem.MakeFromExisting(hCursor);
	TblMem.Open;
end;

procedure TDlgUpravlenie.EmptyLabels;
begin
	LblData1.Caption := '';
	LblData2.Caption := '';
	LblIndex.Caption := '';
	LblAkcii.Caption := '0.00'; 
end;

Procedure TDlgUpravlenie.AddPeriods;
Var
	i: Integer;
Begin
  If DlgPortfeil.DbPortfeil.CountInvToUpr = 0 Then Begin
  	LBoxData.Clear;
    DlgPortfeil.DbPortfeil.ClearPeriods;
		Period1.Periods(0, CurrentDate, CurrentDate);
	  Period1.Periods(1, CurrentDate, CurrentDate);
  	Period1.Periods(2, CurrentDate, CurrentDate);
	  Period1.Periods(3, CurrentDate, CurrentDate);
  End
  Else Begin
 	 	If OpenArhiv Then Begin
		  FOpenArhiv := False;
    	ActiveThread := True;
    	With TblDataTrims Do
		  	Try
      		Open;
		      DlgPortfeil.DBPortfeil.ClearPeriods;
    			While Not Eof Do Begin
      	  	i := Fields[0].AsInteger;
        		If i In [0..3] Then Begin
          		Period1.Periods(
            		i, Fields[1].AsDateTime, Fields[2].AsDateTime);
              If Period1.PeriodInfo[i].PerDate1 < Period1.PeriodInfo[i].PerDate2 Then
              	DlgPortfeil.DBPortfeil.Period(i,
                	Period1.PeriodInfo[i].PerDate1,
                  Period1.PeriodInfo[i].PerDate2);
            End;
		      	Next;
			  	End;
    		Finally
    			Close;
			  End;
		End
    Else
			For i := 0 To 3 Do Begin
			 	If Period1.PeriodInfo[i].PerDate1 < Period1.PeriodInfo[i].PerDate2 Then
					DlgPortfeil.DBPortfeil.Period(i,
          	Period1.PeriodInfo[i].PerDate1,
			      Period1.PeriodInfo[i].PerDate2);
      End;
	End;  
End;

Procedure TDlgUpravlenie.UpdateUpra;
Var
	i: Integer;
Begin
  i := CBoxTriMesec.ItemIndex;
  Try
  	If TblMem.Active Then Begin
      If TblMem.RecordCount > 0 Then Begin
      	TblMem.DisableControls;
      	TblMem.Close;
      	CreateTblMem//Create TblMem
      End;
    End
    Else Begin
    	CreateTblMem//Create TblMem
    End;
   	DlgPortfeil.DBPortfeil.ListPeriod(i, TblMem);
  Finally
    TblMem.First;
    TblMem.EnableControls;
  End;

  With DlgPortfeil.DBPortfeil Do Begin
	  If Periods[i] <> Nil Then Begin
    	If Periods[i].Index = -123456789 Then LblIndex.Caption := ''
      Else LblIndex.Caption := FormatFloat('# ### ##0.#0', Periods[i].Index);
      LblData1.Caption := DateToStr(Periods[i].FirstDate);
      LblData2.Caption := DateToStr(Periods[i].LastDate);
      LblAkcii.Caption :=	FormatFloat('# ### ##0.#0', Periods[i].Akcii);
  	End
    Else EmptyLabels;
	End;
End;

procedure TDlgUpravlenie.N1Click(Sender: TObject);
begin
	Close;
end;

procedure TDlgUpravlenie.FormShow(Sender: TObject);
begin
	AddPeriods;
  Panel1Resize(Nil);
  CBoxTriMesec.ItemIndex := - 1;
  If CBoxTriMesec.Enabled Then CBoxTriMesec.SetFocus;

  Period1.Select(-1);

  FChThReadExit := False;
	FTh3 := ThreadDataList.Create(True);
  FTh3.Priority := tpIdle;
  FTh3.Resume;
end;

procedure TDlgUpravlenie.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
	i: Integer;
begin
	FChThReadExit := True;
  Try
    TblDataTrims.EmptyTable;
    For i := 0 To 3 Do
    	If DlgPortfeil.DBPortfeil.Periods[i] <> Nil Then Begin
      	If Not TblDataTrims.Active Then TblDataTrims.Open;
		  	TblDataTrims.AppendRecord([
        		i,
          	DlgPortfeil.DBPortfeil.Periods[i].FirstDate,
          	DlgPortfeil.DBPortfeil.Periods[i].LastDate]);
      End;
  Finally
  	TblDataTrims.Close;
    TblMem.Close;
		EmptyLabels;
    FTh3.Free;
  End; 
end;

procedure TDlgUpravlenie.CBoxTriMesecChange(Sender: TObject);
begin
	If Not CBoxTriMesec.ItemIndex In [0..3] Then Exit;
	Period1.Select(CBoxTriMesec.ItemIndex);
	UpdateUpra;
end;

procedure TDlgUpravlenie.Period1MouseUp(Sender: TObject; X, Y,
  Index: Integer);
begin
  If CBoxTriMesec.ItemIndex <> Index Then Begin
    CBoxTriMesec.ItemIndex := Index;
    UpDateUpra;
  End;
end;

procedure TDlgUpravlenie.DBGridUpravDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var
	R: TRect;
  FmtText: Integer;
  Pr: Real;
  F: TAlignment;
  S: String;
begin
  Pr := TblMem.FieldByName('Promiana').AsFloat;

  F := Column.Alignment;
  FmtText := DT_SINGLELINE + DT_VCENTER;
  Case F Of
  	taRightJustify:FmtText := FmtText + DT_RIGHT;
    taLeftJustify: FmtText := FmtText + DT_LEFT + DT_END_ELLIPSIS;
    taCenter:      FmtText := FmtText + DT_CENTER;
  End;

  With DBGridUprav.Canvas Do Begin
    Font := Column.Font;
    If (Pr < 0.00004) And (Pr > -0.00004) Then Font.Style := [fsBold]
    Else Font.Style := [];

	  If (Pr <= - 10)Or
  	  	(TblMem.FieldByName('Kriteri2').AsBoolean) Then
      	Font.Color := clRed;


    If Column.Field.FieldNo <> 4 Then S := Column.Field.DisplayText
    Else Begin
	    S := Column.Field.DisplayText;
      If S = '' Then S := '0.00';
    End;

    Brush.Color := Column.Color;
    Pen.Color := Brush.Color;
    Rectangle(Rect.Left, Rect.Top, Rect.Right, Rect.Bottom);
		R := Classes.Rect(Rect.Left+1, Rect.Top, Rect.Right-1, Rect.Bottom);
    DrawText(Handle, PChar(S), -1, R, FmtText);
  End;
end;

procedure TDlgUpravlenie.N3Click(Sender: TObject);
begin
	StartWindow := owPortfeil;
  Close;
end;

procedure TDlgUpravlenie.N4Click(Sender: TObject);
begin
	StartWindow := owKartoteka;
  Close;
end;

procedure TDlgUpravlenie.Panel1Resize(Sender: TObject);
Var
	S: Integer;
Begin
	If Not(csReading in ComponentState) Then
		If LBoxData.Width > 10 Then Begin
	   	S := LBoxData.Width;
  	  S := S Div (63 + 13);
    	If S = 1 Then LBoxData.Columns := 0
    	Else LBoxData.Columns := S;
    End
end;

procedure TDlgUpravlenie.FormCreate(Sender: TObject);
begin
	FOpenArhiv := True;
  FChThReadExit := False;
  Period1.Add(CurrentDate, CurrentDate);
  Period1.Add(CurrentDate, CurrentDate);
  Period1.Add(CurrentDate, CurrentDate);
  Period1.Add(CurrentDate, CurrentDate);
  ProgOptions.OpenTablesExt(DBGridUprav, 'Upravlenie');
  ProgOptions.OpenWindowExt(DlgUpravlenie, 'Upravlenie');
end;

procedure TDlgUpravlenie.LBoxDataSelectDate(Sender: TListBox; FirstDate,
  SecondDate: TDateTime);
begin
  If CBoxTriMesec.ItemIndex = -1 Then Begin
  	MessageDlg1(C_Mess_PeriodSelect, mtInformation, [mbOK], 0);
    Exit;
  End;

	DlgPortfeil.DBPortfeil.Period(
  	CBoxTriMesec.ItemIndex, FirstDate, SecondDate);

  Period1.Periods(CBoxTriMesec.ItemIndex, FirstDate, SecondDate);

	UpdateUpra;

  PostMessage(LBoxData.Handle, WM_KEYDOWN, VK_DOWN, 1);
end;

procedure TDlgUpravlenie.FormDestroy(Sender: TObject);
begin
	ProgOptions.SaveTablesExt(DBGridUprav, 'Upravlenie');
  ProgOptions.SaveWindowExt(DlgUpravlenie, 'Upravlenie');
end;

end.


