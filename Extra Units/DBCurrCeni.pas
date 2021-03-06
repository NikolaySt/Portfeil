unit DBCurrCeni;

interface

Uses Classes;

Type
	PLine = ^TLine;
  TLine = Record
  	ID   : Integer;
    Value: Real;//Пазарна цена за деня
    Check: Boolean;
    Next : PLine;
  End;

  //Клас за съхраняване на пазарните цени които ги има в базата данни
  //за текущата дата (датата при стартиране на програмата)
	TCustomDBCurrCeni = Class
  Private
  	FRootLine: PLine;
    FCount: Integer;
  Public
  	Constructor Create; Virtual;
  	Destructor Destroy; Override;

    Procedure Add(ID: Integer; Value: Real);
    Procedure Clear;
    Procedure Check(ID: Integer);
    Procedure Delete(ID: Integer);
    Function Exists(ID: Integer): Boolean;
    Function FindCena(ID: Integer; Var Value: Real): Boolean;
    Procedure List(L: TStringList);
    Function Update(ID: Integer; Value: Real): Boolean;
    Property Count: Integer Read FCount;
  End;

  TDBCurrCeni = Class(TCustomDBCurrCeni);

implementation

Uses SysUtils;

Procedure PushLine(Var RootLine: PLine; NewPoint: PLine);
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
    While (Tmp <> Nil)And(Not ChExit) Do Begin
    	If NewPoint^.ID < Tmp^.ID Then ChExit := True
      Else Begin
        Buff := Tmp;
        Tmp := Tmp^.Next;
      End;
    End;
    If ChExit Then Begin
    	NewPoint^.Next := Tmp;
      If Buff <> Nil Then Buff^.Next := NewPoint
      Else RootLine := NewPoint;
    End
    Else Buff^.Next := NewPoint;
  End;//If LRootLine = Nil Then L.....
End;

Procedure DestroyLine(Var RootLine: PLine);
Begin
	If RootLine <> Nil Then Begin
  	DestroyLine(RootLine^.Next);
    Dispose(RootLine);
    RootLine := Nil
  End;
End;

{ TCustomDBCurrCeni }

Procedure TCustomDBCurrCeni.Clear;
Begin
	DestroyLine(FRootLine);
  FRootLine := Nil;
  FCount := 0;
End;

constructor TCustomDBCurrCeni.Create;
begin
	Inherited Create;
  FRootLine := Nil;
  FCount := 0;
end;

destructor TCustomDBCurrCeni.Destroy;
begin
	DestroyLine(FRootLine);
	Inherited Destroy; 
end;

procedure TCustomDBCurrCeni.Delete(ID: Integer);
Var
  Tmp, Buff: PLine;
begin
  Buff := Nil;
  Tmp  := FRootLine;

  While Tmp <> Nil Do
  	If Tmp^.ID = ID Then Begin
      If Buff = Nil Then FRootLine := Tmp^.Next
      Else Buff^.Next := Tmp^.Next;
      Dispose(Tmp); Tmp := Nil;
      Dec(FCount);
    End
    Else Begin
	    Buff := Tmp;
	   	Tmp := Tmp^.Next;
    End;
	Dec(FCount)
end;

function TCustomDBCurrCeni.Exists(ID: Integer): Boolean;
Var
	Tmp: PLine;
begin
	Tmp := FRootLine;
  Result := False;
  While Tmp <> Nil Do
  	If Tmp^.ID <> ID Then Tmp := Tmp^.Next
   	Else Begin
    	Result := True;
      Tmp := Nil;
    End;
end;

procedure TCustomDBCurrCeni.Add(ID: Integer; Value: Real);
Var
	NewPoint: PLine;
begin
	New(NewPoint);
  NewPoint^.ID    := ID;
  NewPoint^.Value := Value;
  NewPoint^.Check := False;
  NewPoint^.Next  := Nil;
	PushLine(FRootLine, NewPoint);
  Inc(FCount);
end;

procedure TCustomDBCurrCeni.List(L: TStringList);
	Function CheckBool(Ch: Boolean): String;
  Begin
  	If Ch Then Result := 'True'
    Else Result := 'False';
  End;
Var
	Tmp: PLine;
begin
	If Not Assigned(L) Then Exit;
	Tmp := FRootLine;
  While Tmp <> Nil Do Begin
  	L.Add(IntToStr(Tmp^.ID)+'. '+FormatFloat('#0.#0##', Tmp^.Value) +
    	' ' + CheckBool(Tmp^.Check));
    Tmp := Tmp^.Next;
	End;
end;

Function TCustomDBCurrCeni.Update(ID: Integer; Value: Real): Boolean;
Var
	Tmp: PLine;
  ChExit, ChFind: Boolean;
Begin
	Result := False;
  ChExit := False;
  ChFind := False;
  Tmp := FRootLine;
  While (Tmp <> Nil)And(Not ChExit)And(Not ChFind) Do Begin
  	If ID < Tmp^.ID Then ChExit := True
    Else Begin
    	If ID = Tmp^.ID Then ChFind := True
      Else Tmp := Tmp^.Next;
    End;
  End;

  If ChFind Then Begin
    Tmp^.Value := Value;
    If Tmp^.Check Then Result := True
    Else Tmp^.Check := True;
  End
End;

function TCustomDBCurrCeni.FindCena(ID: Integer; var Value: Real): Boolean;
Var
	Tmp: PLine;
begin
	Tmp := FRootLine;
  Result := False;
  While (Tmp <> Nil)And(Not Result) Do
  	If Tmp^.ID <> ID Then Begin
    	If Tmp^.ID > ID Then Tmp := Nil
      Else Tmp := Tmp^.Next;
    End
   	Else Begin
    	Result := True;
      Value := Tmp^.Value;
    End;
end;

procedure TCustomDBCurrCeni.Check(ID: Integer);
Var
	Tmp: PLine;
  ChExit: Boolean;
begin
	Tmp := FRootLine;
  ChExit := False;
  While (Tmp <> Nil)And(Not ChExit) Do
  	If Tmp^.ID <> ID Then Begin
    	If Tmp^.ID > ID Then Tmp := Nil
      Else Tmp := Tmp^.Next;
    End
   	Else Begin
    	ChExit := True;
      Tmp^.Check := True;
    End;
end;

end.

