unit DBAddition;

interface

Uses Classes;

Type
	PLine = ^TLine;
  TLine = Record
  	Data:	 TDateTime;
    Value: Real;
    Next:  PLine;
  End;

	TCustomDBAddition = Class
  private
  	FCount: Integer;
    FRootLine: PLine;
  Public
  	Constructor Create; Virtual;
  	Destructor Destroy; Override;

   	Procedure Add(Data: TDateTime; Value: Double);
    Procedure Clear;
    Procedure Delete(Data1, Data2: TDateTime);
    Function Exists(Data: TDateTime): Boolean;
    Function LastValue: Real;
    Procedure List(L: TStringList);
    Procedure Update(OldData, NewData: TDateTime; Value: Real);

    Property Count: Integer Read FCount;
    Property RootLine: PLine Read FRootLine;
  End;
  
	TDBBankLihva = Class(TCustomDBAddition)
 	Public
  	Function Alternativa(PeriodInv: Integer; DataInv: TDateTime;
    	Purvo_St: Real; var KapLihva: Real): Real; Virtual;
  End;

  TDBIndex = Class(TCustomDBAddition)
  Public
  	Function Promiana(FirstDate, LastDate: TDateTime): Real;
  End;
  
  
implementation

Uses SysUtils, MyConst;

Procedure PushLine(Var RootLine: PLine; Var NewPoint: PLine);
Var
	Tmp: PLine;
  Buff: PLine;
  ChExit: Boolean;
Begin
	If RootLine = Nil Then RootLine := NewPoint
  Else Begin
		Tmp := RootLine;
    Buff := Nil;
    ChExit := False;
    While (Tmp <> Nil)And(Not ChExit) Do
    	If NewPoint^.Data < Tmp^.Data Then ChExit := True
      Else Begin
	     	Buff := Tmp;
	      Tmp := Tmp^.Next;
     	End;

    If ChExit Then Begin
    	NewPoint^.Next := Tmp;
      If Buff <> Nil Then	Buff^.Next := NewPoint
      Else RootLine := NewPoint;
    End
    Else Buff^.Next := NewPoint;
  End;//If RootLine = Nil Then
End;

Procedure DestroyLine(Var LRootLine: PLine);
Begin
	If LRootLine <> Nil Then Begin
  	DestroyLine(LRootLine^.Next);
    Dispose(LRootLine);
  End;
End;

{ TCustomDBAddition }

procedure TCustomDBAddition.Add(Data: TDateTime; Value: Double);
Var
	NewPoint: PLine;
begin
	New(NewPoint);
  NewPoint^.Data  := Data;
  NewPoint^.Value := Value;
  NewPoint^.Next  := Nil;
	PushLine(FRootLine, NewPoint);
  Inc(FCount)
end;

Procedure TCustomDBAddition.Clear;
Begin
	DestroyLine(FRootLine);
  FRootLine := Nil;
  FCount := 0;	
End;

constructor TCustomDBAddition.Create;
begin
	Inherited Create;
  FRootLine := Nil;
  FCount := 0;
end;

destructor TCustomDBAddition.Destroy;
begin
	DestroyLine(FRootLine);
	Inherited Destroy; 
end;

procedure TCustomDBAddition.Delete(Data1, Data2: TDateTime);
Var
  TmpData1, TmpData2, CurrDate: ^TDateTime;
  TmpLine, BuffLine, Buff: PLine;
begin
  New(TmpData1);
  New(TmpData2);
  New(CurrDate);
  Try
  	If Data1 < Data2 Then Begin
    	TmpData1^ := Data1;
    	TmpData2^ := Data2;
    End
    Else Begin
    	TmpData1^ := Data2;
    	TmpData2^ := Data1;
    End;

    CurrDate^:= CurrentDate;
    BuffLine := Nil;
    TmpLine  := FRootLine;
    
    While TmpLine <> Nil Do Begin
    	If(TmpLine^.Data >= TmpData1^)And
        (TmpLine^.Data <= TmpData2^)And
        (TmpLine^.Data <> CurrDate^) Then Begin
        If BuffLine = Nil Then Begin
        	TmpLine := TmpLine^.Next;
		      Buff := FRootLine;
         	FRootLine := TmpLine;
          Dispose(Buff);
        End
        Else Begin
        	BuffLine^.Next := TmpLine^.Next;
          Buff := TmpLine;
          TmpLine := TmpLine^.Next;
          Dispose(Buff);
        End;
        Dec(FCount);
      End
      Else Begin
	      BuffLine := TmpLine;
	     	TmpLine := TmpLine^.Next;
      End;
    End;//While TmpInvLine <> Nil Then Begin

  Finally
		Dispose(CurrDate);
    Dispose(TmpData1);
    Dispose(TmpData2);
  End;
end;

function TCustomDBAddition.Exists(Data: TDateTime): Boolean;
Var
	Tmp: PLine;
begin
	Tmp := FRootLine;
  Result := False;
  While Tmp <> Nil Do
  	If Tmp^.Data = Data Then Begin
    	Result := True;
      Tmp := Nil;
    End
    Else Begin
  		If Tmp^.Data > Data Then Tmp := Nil
      Else Tmp := Tmp^.Next;
    End;
end;

function TCustomDBAddition.LastValue: Real;
Var
	Tmp: PLine;
begin
	Tmp := FRootLine;
  Result := 0;
  While Tmp <> Nil Do
  	If Tmp^.Data <= CurrentDate Then Begin
    	Result := Tmp^.Value;
      Tmp := Tmp^.Next;
    End
    Else Tmp := Nil
end;

procedure TCustomDBAddition.List(L: TStringList);
Var
	Tmp: PLine;
begin
	If Not Assigned(L) Then Exit;
	Tmp := FRootLine;
  While Tmp <> Nil Do Begin
  	L.Add(DateToStr(Tmp^.Data)+'. '+FormatFloat('#0.#0', Tmp^.Value) );
    Tmp := Tmp^.Next;
	End;
end;

procedure TCustomDBAddition.Update(OldData, NewData: TDateTime;
  Value: Real);
Var
	Tmp, Buff: PLine;
  ChFound: Boolean;
begin
	Tmp := FRootLine;
  Buff := Nil;
  ChFound := False;
  While (Tmp <> Nil)And(Not ChFound) Do
  	If Tmp^.Data = OldData Then ChFound := True
    Else Begin
    	Buff := Tmp;
    	Tmp := Tmp^.Next;
    End;

 	If ChFound Then Begin
  	If Tmp^.Data = NewData Then Tmp^.Value := Value
    Else Begin
    	If Buff <> Nil Then	Buff^.Next := Tmp^.Next
      Else FRootLine := Tmp^.Next;
    	Dispose(Tmp);/////
      New(Buff);
      Buff^.Data := NewData;
			Buff^.Value := Value;
      Buff^.Next := Nil;
			PushLine(FRootLine, Buff);
  	End;
  End
  Else Begin
    New(Buff);
    Buff^.Data  := NewData;
		Buff^.Value := Value;
    Buff^.Next  := Nil;
		PushLine(FRootLine, Buff);
    Inc(FCount);
  End;
end;

{ TDBBankLihva }

function TDBBankLihva.Alternativa(PeriodInv: Integer; DataInv: TDateTime;
  Purvo_St: Real; var KapLihva: Real): Real;
Var
	TmpDBLihva: PLine;
  ChExit, ChFirstDate, ChPeriodMinusOne, ChCalcWhileData: Boolean;
  SredPretLihva: Real;
  Lihva: Real;
  TmpDateInv: TDateTime;
Begin
	TmpDBLihva := RootLine;
	If (CurrentDate < DataInv)Or(TmpDBLihva = Nil) Then Begin
  	Result := Purvo_St;
    KapLihva := 0;
  	Exit;
  End;

  If CurrentDate < TmpDBLihva^.Data Then Begin
  	Result := Purvo_St;
    KapLihva := 0;
  	Exit;  	
  End;
  
  ChExit := False;
  ChFirstDate := True;
  ChPeriodMinusOne := False;
  ChCalcWhileData := False;
  TmpDateInv := DataInv;
  SredPretLihva := 0;
  Lihva := TmpDBLihva^.Value;
  While (TmpDBLihva <> Nil)And(Not ChExit) Do Begin

  	If (TmpDateInv < TmpDBLihva^.Data)And(TmpDBLihva^.Data < CurrentDate) Then Begin
    	If ChFirstDate Then
      	SredPretLihva := SredPretLihva + (TmpDBLihva^.Data - TmpDateInv + 1)*Lihva
      Else Begin
      	ChPeriodMinusOne := True;
      	SredPretLihva := SredPretLihva + (TmpDBLihva^.Data - TmpDateInv)*Lihva;
      End;
      ChCalcWhileData := True;
      TmpDateInv := TmpDBLihva^.Data;
    End;

    ChFirstDate := False;

		Lihva := TmpDBLihva^.Value;
    TmpDBLihva := TmpDBLihva^.Next;
    
    If TmpDBLihva <> Nil Then
    	If TmpDBLihva^.Data >= CurrentDate Then ChExit := True;
    
  End;//While (TmpDBLihva <> Nil)And(Not ChExit)

  If CurrentDate - TmpDateInv >= 0 Then Begin
  	If ChPeriodMinusOne Then
	  	SredPretLihva := SredPretLihva + (CurrentDate - TmpDateInv + 1)*Lihva
    Else Begin
    	If ChCalcWhileData Then
	    	SredPretLihva := SredPretLihva + (CurrentDate - TmpDateInv)*Lihva
      Else
      	SredPretLihva := SredPretLihva + (CurrentDate - TmpDateInv + 1)*Lihva;
    End;
  End;

	Lihva    := (SredPretLihva/PeriodInv) * (1/100);
  KapLihva := (Exp( Ln(1+(Lihva/12) )*( PeriodInv/(365/12) ) ) - 1)*100;
 	Result   := Purvo_St * Exp( Ln(1+(Lihva/12) )*( PeriodInv/(365/12) ) );
end;

{ TDBIndex }

function TDBIndex.Promiana(FirstDate, LastDate: TDateTime): Real;
Var
	BeginLine: PLine;
  Index1, Index2: Real;
  ChExit: Boolean;
begin
	BeginLine := RootLine;
 	Index1 := 0; Index2 := 0;
  ChExit := False;
	While (BeginLine <> Nil)And(Not ChExit) Do Begin
    If BeginLine^.Data <= FirstDate Then Index1 := BeginLine^.Value;

    If BeginLine^.Data <= LastDate Then	Index2 := BeginLine^.Value
    Else ChExit := True;

  	BeginLine := BeginLine^.Next;
  End;
  If Index1 <> 0 Then Result := ((Index2 - Index1)/Index1)*100
  Else Result := -123456789;
end;

end.
