unit DBCustomPortfeil;

interface

Uses Classes, DBCurrCeni, DBAddition;

Type
	TStrDrug   = String[50];
  TStrShifur = String[6];

	PRootGroup = ^TRootGroup;
  PLine = ^TLine;
  PSortGroup = ^TSortGroup; 

	TRootGroup = Record
  	ID:         Integer;
    Shifur:     TStrShifur;
    Drugestvo:  TStrDrug;
    Data_Pokup: TDateTime;//Датата на която е направена инвестицията
    Cena_Pokup: Real;     //Покупната цена на инвестицията
    Position:   Integer;  //Позиция в таблицата
    Prior:      PRootGroup;
    Next:       PRootGroup;
    Line:       PLine;     //Линия на пазарните цени
    Sort:       PSortGroup;//Връзка със сортирания списък по ID
  End;

  TSortGroup = Record
  	ID   : Integer; //Ключ по който се сортира
    Group: PRootGroup;
    Prior: PSortGroup;
  	Next : PSortGroup;
  End;

  TLine = Record
  	Data: TDateTime; //Дата на направена промяна на пазарната цена
    Cena: Real;     //Пазарна цена
    Next: PLine;
  End;

  TCustomDBPortfeil = Class
  Private
  	FRootGroup: PRootGroup;
    FRootSort:  PSortGroup;
    FSelectInv: PRootGroup;
    FCountInv: Integer;
    FCurrentCeni: TDBCurrCeni;
    FBorsovIndex: TDBIndex;
    procedure DeleteCurrentSort(Var TmpSort: PSortGroup);
    Function InternalSelectInv(ID: Integer): Boolean;
    Procedure UpdateInvPosition(RootSort: PSortGroup);
    procedure DeleteInternalInv(var TmpSort: PRootGroup);
  Public
  	Constructor Create; Virtual;
    Destructor Destroy; Override;

    Procedure AddInv(
    	ID: Integer;
      Shifur: TStrShifur;
      Drugestvo: TStrDrug;
		  Data_Pokup: TDateTime;
      Cena_Pokup: Real;
      Position: Integer); Virtual;
    Function AddCena(ID: Integer; Data: TDateTime; Cena: Real): Boolean;

    Procedure Clear; Virtual;

    Procedure DeleteInv(ID: Integer); Virtual;
    Procedure DeleteCena(ID: Integer; Data1, Data2: TDateTime);

    Function ExistsInv(ID: Integer): Boolean;
    Function ExistsCena(ID: Integer; Data: TDateTime): Boolean;

    Procedure Group(L: TStringList);

    Function FindCenaCurrentDate(ID: Integer; Var Cena: Real): Boolean;

    Procedure ListGroup(L: TStringList);
    procedure ListSortGroup(L: TStrings);
		Procedure ListCeni(ID: Integer; L: TStringList);

	  Procedure UpdateInv(ID: Integer; Drugestvo:TStrDrug;
    	Data_Pokup: TDateTime; Cena_Pokup: Real);
    Procedure UpdateCena(ID: Integer; OldData, NewData: TDateTime; Cena: Real);

    Property CountInv: Integer Read FCountInv; 
		Property SelectInv: PRootGroup Read FSelectInv Write FSelectInv;
    Property RootGroup: PRootGroup Read FRootGroup Write FRootGroup;
    Property RootSort:  PSortGroup Read FRootSort Write FRootSort;
    Property CurrentCeni: TDBCurrCeni Read FCurrentCeni Write FCurrentCeni;
		Property BorsovIndex: TDBIndex Read FBorsovIndex Write FBorsovIndex;
  End;

implementation

Uses SysUtils, MyConst;

Procedure DestroyLine(Var Line: PLine);
Begin
	If Line <> Nil Then Begin
  	DestroyLine(Line^.Next);
    Dispose(Line);
    Line := Nil;
  End;
End;

Procedure DestroySortGroup(Var RootSort: PSortGroup);
Begin
	If RootSort <> Nil Then Begin
  	DestroySortGroup(RootSort^.Next);
    Dispose(RootSort);
    RootSort := Nil;
  End;
End;

Procedure DestroyGroup(Var RootGroup: PRootGroup);
Begin
	If RootGroup <> Nil Then Begin
  	DestroyLine(RootGroup^.Line);
  	DestroyGroup(RootGroup^.Next);
    Dispose(RootGroup);
    RootGroup := Nil
  End;
End;

Procedure PushGroup(Var RootGroup, NewPoint: PRootGroup);
Var
	Tmp, Buff: PRootGroup;
  ChExit: Boolean;
Begin
	If RootGroup = Nil Then RootGroup := NewPoint
  Else Begin
		Tmp := RootGroup;
    Buff := Nil;
    ChExit := False;
    While (Tmp <> Nil)And(Not ChExit) Do
    	If NewPoint^.Data_Pokup < Tmp^.Data_Pokup Then ChExit := True
      Else Begin
        Buff := Tmp;
        Tmp  := Tmp^.Next;
      End;

    If ChExit Then Begin
    	NewPoint^.Next := Tmp;
      NewPoint^.Prior := Tmp^.Prior;
      If Tmp^.Prior = Nil Then RootGroup := NewPoint
      Else Tmp^.Prior^.Next := NewPoint;
      Tmp^.Prior := NewPoint;
    End
    Else Begin
    	Buff^.Next := NewPoint;
      NewPoint^.Prior := Buff;
    End;      
  End;//If RootGroup = Nil Then L.....
End;

Procedure PushSortGroup(Var RootLine, NewPoint: PSortGroup);
Var
	Tmp, Buff: PSortGroup;
  ChExit: Boolean;
Begin
	If RootLine = Nil Then RootLine := NewPoint
  Else Begin
		Tmp := RootLine;
    Buff:= Nil;
    ChExit := False;
    While (Tmp <> Nil)And(Not ChExit) Do
    	If NewPoint^.ID < Tmp^.ID Then ChExit := True
      Else Begin
      	Buff := Tmp;
      	Tmp  := Tmp^.Next;
      End;

    If ChExit Then Begin
    	NewPoint^.Next := Tmp;
      NewPoint^.Prior := Tmp^.Prior;
      If Tmp^.Prior = Nil Then RootLine := NewPoint
      Else Tmp^.Prior^.Next := NewPoint;
      Tmp^.Prior := NewPoint;
    End
    Else Begin
    	Buff^.Next := NewPoint;
      NewPoint^.Prior := Buff;
    End;
  End;//If LRootLine = Nil Then L.....
End;


Procedure PushLine(Var Line, NewPoint: PLine);
Var
	Tmp, Buff: PLine;
  ChExit: Boolean;
Begin
	If Line = Nil Then Line := NewPoint
  Else Begin
		Tmp := Line;
    Buff := Nil;
    ChExit := False;
    While (Tmp <> Nil)And(Not ChExit) Do
    	If NewPoint^.Data < Tmp^.Data Then ChExit := True
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

{ TCustomDBPortfeil }

Function TCustomDBPortfeil.AddCena(ID: Integer; Data: TDateTime;
  Cena: Real): Boolean;
Var
	NewPoint: PLine;
begin
	Result := False;
	If Not InternalSelectInv(ID) Then Exit;
	New(NewPoint);
  NewPoint^.Data := Data;
  NewPoint^.Cena := Cena;
  NewPoint^.Next := Nil;
  PushLine(FSelectInv^.Line, NewPoint);
  Result := True;
end;

procedure TCustomDBPortfeil.AddInv(
	ID: Integer; Shifur: TStrShifur; Drugestvo: TStrDrug;
  Data_Pokup: TDateTime; Cena_Pokup: Real; Position: Integer);
Var
	NewPoint: PRootGroup;
  NewSort: PSortGroup;
begin
	New(NewPoint);
  New(NewSort);

  NewPoint^.ID := ID;
  NewPoint^.Shifur := Shifur;
  NewPoint^.Drugestvo := Drugestvo;
  NewPoint^.Data_Pokup := Data_Pokup;
  NewPoint^.Cena_Pokup := Cena_Pokup;
  NewPoint^.Position := Position;
  NewPoint^.Prior:= Nil;
  NewPoint^.Next := Nil;
  NewPoint^.Line := Nil;
  NewPoint^.Sort := NewSort;

  PushGroup(FRootGroup, NewPoint);
  Inc(FCountInv);
  FSelectInv := NewPoint;
  
  NewSort^.ID   := ID;
  NewSort^.Group:= NewPoint;
  NewSort^.Prior:= Nil;
  NewSort^.Next := Nil;
  PushSortGroup(FRootSort, NewSort);
end;

procedure TCustomDBPortfeil.Clear;
begin
	DestroyGroup(FRootGroup);
  DestroySortGroup(FRootSort);
  FRootSort  := Nil;
  FRootGroup := Nil;
  FSelectInv := Nil;
  FCountInv := 0;
end;

constructor TCustomDBPortfeil.Create;
begin
	Inherited;
  FCountInv := 0;
  FRootGroup := Nil;
  FRootSort  := Nil;
  FSelectInv := Nil;
end;

procedure TCustomDBPortfeil.DeleteCena(ID: Integer; Data1, Data2: TDateTime);
Var
	Tmp, Buff, BuffFree: PLine;
  Data_1, Data_2: TDateTime;
begin
	If Not InternalSelectInv(ID) Then Exit;

  If Data1 > Data2 Then Begin
  	Data_1 := Data2;
    Data_2 := Data1;
  End
  Else Begin
  	Data_1 := Data1;
    Data_2 := Data2;
 	End;
  
  Buff := Nil;
  Tmp := FSelectInv^.Line;
	While Tmp <> Nil Do
		If (Data_1 <= Tmp^.Data)And
    	 (Tmp^.Data <= Data_2)And(Tmp^.Data <> CurrentDate) Then Begin

      If Buff <> Nil Then Buff^.Next := Tmp^.Next
      Else FSelectInv^.Line := Tmp^.Next;
      
      BuffFree := Tmp;
      Tmp := Tmp^.Next;
      Dispose(BuffFree);
    End
		Else Begin
    	Buff := Tmp;
    	Tmp := Tmp^.Next;
      If Tmp <> Nil Then If Tmp^.Data > Data_2 Then Tmp := Nil;
    End;
end;

procedure TCustomDBPortfeil.DeleteCurrentSort(Var TmpSort: PSortGroup);
begin
  If TmpSort^.Prior <> Nil Then Begin
    TmpSort^.Prior^.Next := TmpSort^.Next;
		If TmpSort^.Next <> Nil Then TmpSort^.Next^.Prior := TmpSort^.Prior;
  End
  Else Begin
     FRootSort := TmpSort^.Next;
     If TmpSort^.Next <> Nil Then TmpSort^.Next^.Prior := Nil;
  End;
  Dispose(TmpSort);
  TmpSort := Nil;
end;

procedure TCustomDBPortfeil.DeleteInternalInv(Var TmpSort: PRootGroup);
begin
  If TmpSort^.Prior <> Nil Then Begin
    TmpSort^.Prior^.Next := TmpSort^.Next;
		If TmpSort^.Next <> Nil Then TmpSort^.Next^.Prior := TmpSort^.Prior;
  End
  Else Begin
     FRootGroup := TmpSort^.Next;
     If TmpSort^.Next <> Nil Then TmpSort^.Next^.Prior := Nil;
  End;
  Dispose(TmpSort);
  TmpSort := Nil;
  Dec(FCountInv);
end;

procedure TCustomDBPortfeil.DeleteInv(ID: Integer);
begin
	If Not InternalSelectInv(ID) Then Exit;

  DeleteCurrentSort(FSelectInv^.Sort);
  DestroyLine(FSelectInv^.Line);
  DeleteInternalInv(FSelectInv);
	UpDateInvPosition(FRootSort);
end;

destructor TCustomDBPortfeil.Destroy;
begin
	DestroyGroup(FRootGroup);
  DestroySortGroup(FRootSort);
	Inherited;
end;

function TCustomDBPortfeil.ExistsCena(ID: Integer;
  Data: TDateTime): Boolean;
Var
	Tmp: PLine;
begin
	Result := False;
  If Not InternalSelectInv(ID) Then Exit;

  Tmp := FSelectInv^.Line;

  While (Tmp <> Nil)And(Not Result) Do Begin
		If Tmp^.Data = Data Then Result := True
		Else Tmp := Tmp^.Next;
  End;
end;

function TCustomDBPortfeil.ExistsInv(ID: Integer): Boolean;
Var
	Tmp: PSortGroup;
begin
	Result := False;
  FSelectInv := Nil;
	Tmp := FRootSort;

  While (Tmp <> Nil)And(Not Result) Do
  	If Tmp^.ID = ID Then Begin
    	Result := True;
      FSelectInv := Tmp^.Group;
    End
    Else
    	If Tmp^.ID > ID Then Tmp := Nil
      Else Tmp := Tmp^.Next;

end;

function TCustomDBPortfeil.FindCenaCurrentDate(ID: Integer;
  var Cena: Real): Boolean;
begin
	Cena := -1;
	Result := False;
	If Assigned(FCurrentCeni) Then
		If FCurrentCeni.FindCena(ID, Cena) Then Result := True;
end;

procedure TCustomDBPortfeil.Group(L: TStringList);
Var
	Tmp: PRootGroup;
  S: String;
begin
	If Not Assigned(L) Then Exit;
	Tmp := FRootGroup;
  While Tmp <> Nil Do Begin
  	S := Tmp^.Drugestvo;
    If L.IndexOf(S) = -1 Then L.Add(S);
    Tmp := Tmp^.Next;
	End;
end;

Function TCustomDBPortfeil.InternalSelectInv(ID: Integer): Boolean;
begin
	Result := False;

	If FSelectInv = Nil Then ExistsInv(ID)
	Else If FSelectInv^.ID <> ID Then ExistsInv(ID);

	If FSelectInv <> Nil Then Result := True;
end;

procedure TCustomDBPortfeil.ListCeni(ID: Integer; L: TStringList);
Var
	Tmp: PLine;
begin
	If Not Assigned(L) Then Exit;
  If Not InternalSelectInv(ID) Then Exit;

	Tmp := FSelectInv^.Line;
  While Tmp <> Nil Do Begin
		L.Add(
      FormatDateTime('dd/mm/yyyy', Tmp^.Data)+' '+
      FormatFloat('#0.####', Tmp^.Cena)
      );
  	Tmp := Tmp^.Next;
  End;
end;

procedure TCustomDBPortfeil.ListGroup(L: TStringList);
Var
	Tmp: PRootGroup;
begin
	If Not Assigned(L) Then Exit;
  Tmp := FRootGroup;
  While Tmp <> Nil Do Begin
		L.Add(
    	IntToStr(Tmp^.ID)+'. '+
      FormatDateTime('dd/mm/yyyy', Tmp^.Data_Pokup)+' '+
      IntToStr(Tmp^.Position)+' '+
      Tmp^.Shifur+' '+Tmp^.Drugestvo+' '+
      FormatFloat('#0.####', Tmp^.Cena_Pokup)
      );
  	Tmp := Tmp^.Next;
  End;
end;

Procedure TCustomDBPortfeil.ListSortGroup(L: TStrings);
Var
	Tmp: PSortGroup;
begin
	If Not Assigned(L) Then Exit;
  Tmp := FRootSort;
  While Tmp <> Nil Do Begin
		L.Add(
    	IntToStr(Tmp^.ID)+'. '+
      FormatDateTime('dd/mm/yyyy', Tmp^.Group^.Data_Pokup)+' '+
      Tmp^.Group^.Drugestvo );
  	Tmp := Tmp^.Next;
  End;
End;

procedure TCustomDBPortfeil.UpdateCena(ID: Integer; OldData,
  NewData: TDateTime; Cena: Real);
Var
	Tmp, Buff, NewPoint: PLine;
  ChFound: Boolean;
begin
	If Not InternalSelectInv(ID) Then Exit;
	Tmp := FSelectInv^.Line;
  Buff := Nil;
  ChFound := False;
  While (Tmp <> Nil)And(Not ChFound) Do Begin
  	If Tmp^.Data = OldData Then ChFound := True
  	Else Begin
    	Buff := Tmp;
    	Tmp := Tmp^.Next;
    End;
  End;

  If ChFound And(OldData = NewData) Then Begin
  	Tmp^.Cena := Cena;
    Exit; 
  End;

  If ChFound Then Begin
    If Buff <> Nil Then Buff^.Next := Tmp^.Next
    Else FSelectInv^.Line := Tmp^.Next;
    Dispose(Tmp);
  End;
	New(NewPoint);
  NewPoint^.Data := NewData;
  NewPoint^.Cena := Cena;
  NewPoint^.Next := Nil;
  PushLine(FSelectInv^.Line, NewPoint);
end;

procedure TCustomDBPortfeil.UpdateInv(ID: Integer; Drugestvo:TStrDrug;
	Data_Pokup: TDateTime; Cena_Pokup: Real);
begin
	If Not InternalSelectInv(ID) Then Exit;
  FSelectInv^.Drugestvo := Drugestvo;
  FSelectInv^.Data_Pokup := Data_Pokup; 
  FSelectInv^.Cena_Pokup := Cena_Pokup;
end;

procedure TCustomDBPortfeil.UpdateInvPosition(RootSort: PSortGroup);
Var
	Tmp: PSortGroup;
  I: Integer;
begin
	Tmp := RootSort;
  I := 0;
  While Tmp <> Nil Do Begin
  	Tmp^.Group^.Position := i; Inc(i);
  	Tmp := Tmp^.Next;
  End;
end;

end.
