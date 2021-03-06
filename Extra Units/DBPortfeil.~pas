unit DBPortfeil;

interface

Uses DBCustomPortfeil, DBTables;

Const
 	MaxSize = 3;

Type

  PPeriodLine = ^TPeriodLine;
  TPeriodLine = Record
  	ID:        Integer;
    Shifur:    TStrShifur;
    Drugestvo: TStrDrug;
    Promiana:  Real;
    Kriteri_2: Boolean;
    Next:      PPeriodLine;
  End;

  PPeriodGroup = ^TPeriodGroup;
  TPeriodGroup = Record
  	i:         Integer;
  	FirstDate: TDateTime;
    LastDate:  TDateTime;
    Akcii:     Real;
    Index:     Real;
    Line:      PPeriodLine;
  End;

  TPeriodsGroup = Array[0..MaxSize] Of PPeriodGroup;

	TCustomDBUpravlenie = Class(TCustomDBPortfeil)
  Private
  	FListPeriods: TPeriodsGroup;
    FCountInvToUpr: Integer;
    Function CheckShifur(Shifur: TStrShifur): Boolean;
    function GetPeriods(i: Integer): PPeriodGroup;
    Procedure InternalCreatePeriod(Var PeriodGroup: PPeriodGroup);
    Procedure InternalSecondMeasure(Var PPerLine, CurrPer: PPeriodLine);
  Public
  	Constructor Create; Override;
    Destructor Destroy; Override;
    Procedure AddInv(ID: Integer; Shifur: TStrShifur; Drugestvo: TStrDrug;
		  Data_Pokup: TDateTime;  Cena_Pokup: Real; Position: Integer); Override;
    Procedure Clear; Override;
    Procedure ClearPeriods;
    Procedure DeleteInv(ID: Integer); Override;
    Procedure DeletePeriod(i: Integer);
    Procedure ListPeriod(i: Integer; Tbl: TDBDataSet);
    Function LastDateInv(Var Data: TDateTime): Boolean;
    Procedure Period(i: Integer; FirstDate, LastDate: TDateTime);
    Procedure SecondMeasure(i: Integer); Virtual;
    Procedure UpdatePeriods;

    Property Periods[i: Integer]: PPeriodGroup Read GetPeriods;
    Property CountInvToUpr: Integer Read FCountInvToUpr;
  End;

  TDBPortfeil = Class(TCustomDBUpravlenie);

implementation

Uses MyConst;

Procedure DestroyLine(Var Line: PPeriodLine);
Begin
	If Line <> Nil Then Begin
  	DestroyLine(Line^.Next);
    Dispose(Line);
    Line := Nil;
  End;
End;

Procedure DestroyGroup(Var ListPeriods: TPeriodsGroup);
Var
	i: Integer;
  Tmp: PPeriodGroup;
Begin
	For i := 0 To MaxSize Do Begin
  	Tmp := ListPeriods[i];
    If Tmp <> Nil Then Begin
	  	DestroyLine(Tmp^.Line);
  	  Dispose(ListPeriods[i]);
			ListPeriods[i] := Nil;
  	End;
  End;
End;

Procedure PushLine(Var Line, NewPoint: PPeriodLine);
Var
	Tmp, Buff: PPeriodLine;
  ChExit: Boolean;
Begin
	If Line = Nil Then Line := NewPoint
  Else Begin
		Tmp := Line;
    Buff := Nil;
    ChExit := False;
    While (Tmp <> Nil)And(Not ChExit) Do
    	If NewPoint^.Promiana > Tmp^.Promiana Then ChExit := True
      Else Begin
        Buff := Tmp;
        Tmp  := Tmp^.Next;
      End;

    If ChExit Then Begin
    	NewPoint^.Next := Tmp;
      If Buff <> Nil Then Buff^.Next := NewPoint
      Else Line := NewPoint;
    End
    Else Buff^.Next := NewPoint;
  End;//If Line = Nil Then L.....
End;

{ TCustomDBUpravlenie }

procedure TCustomDBUpravlenie.AddInv(ID: Integer; Shifur: TStrShifur;
  Drugestvo: TStrDrug; Data_Pokup: TDateTime; Cena_Pokup: Real;
  Position: Integer);
begin
	Inherited;
	If CheckShifur(Shifur) Then Inc(FCountInvToUpr);
end;

function TCustomDBUpravlenie.CheckShifur(Shifur: TStrShifur): Boolean;
Begin
	If (Shifur = 'ОбА')Or(Shifur = 'ПрА')Or
  	 (Shifur = 'КПрА')Or(Shifur = 'ГДРа') Then Result := True
  Else Result := False;
End;

procedure TCustomDBUpravlenie.Clear;
begin
	Inherited;
  FCountInvToUpr := 0;
end;

procedure TCustomDBUpravlenie.ClearPeriods;
begin
	DestroyGroup(FListPeriods);
end;

constructor TCustomDBUpravlenie.Create;
begin
	Inherited;
  FCountInvToUpr := 0;
end;

procedure TCustomDBUpravlenie.DeleteInv(ID: Integer);
begin
	If ExistsInv(ID) Then
		If CheckShifur(SelectInv^.Shifur) Then Dec(FCountInvToUpr);
	Inherited;
end;

procedure TCustomDBUpravlenie.DeletePeriod(i: Integer);
begin
	If FListPeriods[i] = Nil Then Exit;                          
  DestroyLine(FListPeriods[i]^.Line);
	Dispose(FListPeriods[i]);
	FListPeriods[i] := Nil;
end;

destructor TCustomDBUpravlenie.Destroy;
begin
	DestroyGroup(FListPeriods);
	Inherited
end;

function TCustomDBUpravlenie.GetPeriods(i: Integer): PPeriodGroup;
begin
	Result := FListPeriods[i];
end;

procedure TCustomDBUpravlenie.InternalCreatePeriod(
  var PeriodGroup: PPeriodGroup);
Var
  Line: PLine;
  ChExit: Boolean;
  BeginInv: PRootGroup;
  NewPoint: PPeriodLine;
  FirstCena, LastCena, TmpCena: Real;
  FirstSuma, LastSuma: Real;
begin
  BeginInv := RootGroup;
  FirstSuma := 0;
  LastSuma := 0;
	While BeginInv <> Nil Do Begin
  	If CheckShifur(BeginInv^.Shifur) Then Begin
    	FirstCena := -1; LastCena := -1;
			If BeginInv^.Data_Pokup <= PeriodGroup^.FirstDate Then Begin
				FirstCena := BeginInv^.Cena_Pokup;
  	    LastCena  := BeginInv^.Cena_Pokup;
     	End;
      Line := BeginInv^.Line;
      ChExit := False;
      While (Line <> Nil)And(Not ChExit) Do Begin
      	If Line^.Data <= PeriodGroup^.FirstDate Then
					FirstCena := Line^.Cena;

      	If Line^.Data <= PeriodGroup^.LastDate Then
					LastCena := Line^.Cena
        Else
        	ChExit := True;
        Line := Line^.Next;
      End;
			If CurrentDate = PeriodGroup^.LastDate Then
      	If FindCenaCurrentDate(BeginInv^.ID, TmpCena) Then LastCena := TmpCena;

      If (FirstCena <> -1)And(LastCena <> -1) Then Begin
        New(NewPoint);
        With NewPoint^ Do Begin
        	ID := BeginInv^.ID;
          Shifur := BeginInv^.Shifur;
          Drugestvo := BeginInv^.Drugestvo;
     	 		If FirstCena <> 0 Then
	   	 	  	NewPoint^.Promiana := ( (LastCena - FirstCena)/FirstCena ) * 100
     	 		Else
        		NewPoint^.Promiana := 0;
          Kriteri_2 := False;
          NewPoint^.Next := Nil
        End;
        FirstSuma := FirstSuma + FirstCena;
        LastSuma := LastSuma + LastCena;

				PushLine(PeriodGroup^.Line, NewPoint);
    	End;
    End;
    BeginInv := BeginInv^.Next;
  End;
  If FirstSuma <> 0 Then
	  PeriodGroup^.Akcii := ( (LastSuma - FirstSuma)/FirstSuma )*100
  Else
  	PeriodGroup^.Akcii := LastSuma*100;
end;

procedure TCustomDBUpravlenie.InternalSecondMeasure(var PPerLine,
  CurrPer: PPeriodLine);
Var
	TmpPerLine, TmpPerCurr: PPeriodLine;
 	ChExit: Boolean;
Begin
	TmpPerLine := PPerLine;
  While TmpPerLine <> Nil Do Begin
  	ChExit := False;
    TmpPerCurr := CurrPer;
    
  	While (TmpPerCurr <> Nil)And(Not ChExit) Do Begin

    	If TmpPerLine^.ID = TmpPerCurr^.ID Then Begin
      	If (TmpPerLine^.Promiana < 0)And(TmpPerCurr^.Promiana < 0 ) Then
          TmpPerCurr^.Kriteri_2 := True
        Else
        	TmpPerCurr^.Kriteri_2 := False;

      	ChExit := True;
      End;

    	TmpPerCurr := TmpPerCurr^.Next;
    End;

  	TmpPerLine := TmpPerLine^.Next;
  End;
end;

function TCustomDBUpravlenie.LastDateInv(var Data: TDateTime): Boolean;
Var
	Tmp: PRootGroup;
begin
	Result := False;
  Tmp := RootGroup;
  While (Tmp <> Nil)And(Not Result) Do Begin
  	If CheckShifur(Tmp^.Shifur) Then Begin
	  	If Tmp^.Data_Pokup > Data Then Data := Tmp^.Data_Pokup;
  		Result := True;
  	End;
    Tmp := Tmp^.Next;
  End;
end;

procedure TCustomDBUpravlenie.ListPeriod(i: Integer; Tbl: TDBDataSet);
Var
	Tmp: PPeriodLine; 
begin
	If FListPeriods[i] = Nil Then Exit;
	Tmp := FListPeriods[i]^.Line;
	While Tmp <> Nil Do Begin
  	With Tmp^ Do
    	Tbl.InsertRecord([ID, Shifur, Drugestvo, Promiana, Kriteri_2]);
  	Tmp := Tmp^.Next;
  End;
end;

procedure TCustomDBUpravlenie.Period(i: Integer; FirstDate,
  LastDate: TDateTime);
begin
  DeletePeriod(i);
  New(FListPeriods[i]);
  FListPeriods[i]^.i        := i;
  FListPeriods[i]^.FirstDate:= FirstDate;
  FListPeriods[i]^.LastDate := LastDate;
  FListPeriods[i]^.Akcii    := 0;
  FListPeriods[i]^.Index    := 0;
  FListPeriods[i]^.Line     := Nil;

  InternalCreatePeriod(FListPeriods[i]);

  If Assigned(BorsovIndex) Then
	  FListPeriods[i]^.Index := BorsovIndex.Promiana(FirstDate, LastDate);

  SecondMeasure(i);
end;

procedure TCustomDBUpravlenie.SecondMeasure(i: Integer);

	Procedure RefreshSinglePeriod(Var PPer: PPeriodLine);
	Var
		TmpPerLine: PPeriodLine;
	Begin
		TmpPerLine := PPer;
	  While TmpPerLine <> Nil Do Begin
			TmpPerLine^.Kriteri_2 := False;
  		TmpPerLine := TmpPerLine^.Next;
	  End;
	End;

Var
	PerNext: Integer;
  PerBack: Integer;
begin
	//    PerBack      ...       i      ...    FPerNext
	//Предходен период ... Текущ период ... Следващ период
	If i In [0..2] Then PerNext := i + 1
  Else PerNext := 0;
  If i In [1..3] Then PerBack := i - 1
  Else PerBack := 3;

  //Предходен период - Текущ период
  If Periods[PerBack] <> Nil Then//Прдеходен период
  	If Periods[PerBack].FirstDate < Periods[i].FirstDate Then
    	InternalSecondMeasure(Periods[PerBack].Line, Periods[i].Line);

  //Текущ период - Следващ период
  If Periods[PerNext] <> Nil Then Begin//Следващ период
  	If Periods[PerNext].FirstDate > Periods[i].FirstDate Then
    	InternalSecondMeasure(Periods[i].Line, Periods[PerNext].Line)
    Else
    	RefreshSinglePeriod(Periods[PerNext].Line);
	End
end;

procedure TCustomDBUpravlenie.UpdatePeriods;
begin

end;

end.
