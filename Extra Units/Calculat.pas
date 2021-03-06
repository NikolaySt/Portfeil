unit Calculat;

interface

Uses 
  SysUtils, WinTypes, WinProcs, Messages, Classes, Controls,
  Forms, Dialogs, DBTables, DB, ExtCtrls, DBiProcs, MyConst;

Type
	TProd = Record
  	No: LongInt;
		Data: TDateTime;
    Broi: LongInt;
    Cena: Real;
    Razhod: Real;

    FileKarton: String[10];

    Del_Prod: Boolean;
    Change_Prod: Boolean;
  End;

  TDohod = Record
  	No: LongInt;
  	Data: TDateTime;
  	Broi: LongInt;
    Mes: String;
    God: LongInt;
    Suma: Real;
    BezplAkcii: LongInt;

    FileKarton: String[10];

    Del_Doh: Boolean;
    Change_Doh: Boolean;
  End;

	TCustomCalc = Class
  Private
  	FQrySuma: TQuery;
	  FQryPortfeil: TQuery;
    FTbl: TTable;
    FKarton: TQuery;
    FProd: TProd;
    FDoh: TDohod;
    FInfo : TInfoInv;
  Protected
		Procedure CalcDial_Vuzv_KapLihva;

		Procedure AddProdToKarton;
		Procedure AddDohodToKarton;

		Procedure Prod_FullRecalcKarton;
    Procedure Dohod_FullRecalcKarton;
    Procedure FullRecalcKarton;

    Function DeleteSecInvest: Boolean;
  Public
  	Constructor CalcCreate; Virtual;
   	Destructor Destroy; Override;

		Procedure RegProdagba(TDB: TDBDataSet; Prod: TProd);
    Procedure RegDohod(TDB: TDBDataSet; Doh: TDohod);
    Procedure DeleteInvest(TDB: TDBDataSet);
    Function AddNewInvest(TDB: TDBDataSet; Var Info: TInfoInv;
    	ChNewInv: Boolean): Boolean;
  End;

Var
	MyCalc: TCustomCalc;

implementation

Uses Upravlen, Portfeil, Invest, CreatTbl, DlgMess, ConstMessage;

Constructor TCustomCalc.CalcCreate;
Begin
	Inherited;
  
	FQrySuma := TQuery.Create(nil);
  With FQrySuma Do Begin
  	DataBaseName := DBaseName;
  	SQL.Add('');
  End;

  FKarton := TQuery.Create(nil);
  With FKarton Do Begin
  	DataBaseName := DBaseName;
  	SQL.Add('');
   	RequestLive := True;
   	UniDirectional := True;
  End;

  FTbl := TTable.Create(nil);
  With FTbl Do Begin
		DataBaseName := DBaseName;
  End;
End;

Destructor TCustomCalc.Destroy;
Begin
	FQrySuma.Free;
  FKarton.Free;
  FTbl.Free;
  Inherited Destroy;
End;

Function TCustomCalc.DeleteSecInvest: Boolean;
Var
  FileName: String;
  QryDelete: TQuery;
  i: String;
begin
	Result := False;
  If Not FQryPortfeil.Active Then Exit;
  QryDelete := TQuery.Create(nil);
  Screen.Cursor := crHourGlass;
	Try
  	Result := True;
    With QryDelete Do Begin
    	DataBaseName := DBaseName;
      SQL.Add('DELETE');
      SQL.Add('');
      SQL.Add('');
    End;      

  	FileName := FQryPortfeil.FieldByName('Inv_File').AsString+'.DB';
    i := FQryPortfeil.FieldByName('ID_Inv').AsString;
    
  	{�������� �������}
  	DeleteFile(PChar(DlgInvest.DBPath+FileName));
  Finally
  	Try
	   	{������� �� ������������ �� ���������}
    	QryDelete.SQL[1] := 'FROM "PortData.DB"';
  		QryDelete.SQL[2] := 'WHERE ID_Inv = ' + i;
  		QryDelete.ExecSQL;
    	FQryPortfeil.Close;
    	FQryPortfeil.Open;
    Finally

      Try
	  		{������� ��������� ���� �� ������������}
    		QryDelete.SQL[1] := 'FROM "PazrCena.DB"';
  			QryDelete.SQL[2] := 'WHERE ID_Inv = ' + i;
  			QryDelete.ExecSQL;
      Finally

      	Try
		      If FQryPortfeil.RecordCount = 0 Then Begin
    				{������� ������ �� ���������}
  					QryDelete.SQL[1] := 'FROM "Dataupra.DB"';
  					QryDelete.SQL[2] := '';
  					QryDelete.ExecSQL;
      		End;
        Finally
	        QryDelete.Free;
        End;

    	End;

   	End;
    
  End;{Try ... Finally}
end;


Procedure TCustomCalc.CalcDial_Vuzv_KapLihva;
{ ������������ ��� }
Var
  Sum, Dial: Real;
  SBMark: TBookMark;
Begin
	With FQrySuma Do Begin
		SQL[0] := 'Select Sum(Stoinost) From PORTDATA';
  	Open;
    Try
			Sum := Fields[0].AsFloat;
    Finally
  		Close;
		End;
	End;
  SBMark := nil;
  With FQryPortfeil Do Begin
  	Try
 	 	  SBMark := GetBookMark;
      DisableControls;

    	First;
      While Not(Eof) Do Begin
      	If Sum = 0 Then Dial := 0
        Else Dial := (FieldByName('Stoinost').AsFloat/Sum)*100;
        Edit;
        FieldByName('Otn_Dial').AsFloat := Dial;
      	Next;
      End;
	  Finally
      GotoBookMark(SBMark);
      FreeBookMark(SBMark);    	
  		EnableControls;
  	End;
	End;{With FQryPortfeil}
End;

Procedure TCustomCalc.RegProdagba(TDB: TDBDataSet; Prod: TProd);
Var
  ABroi: LongInt;
	SumKap_Pech: Real;
  CheckRecKarton: Boolean;
Begin
  FProd := Prod;
	FQryPortfeil := TQuery(TDB);

  {�������� �� �������� �� ������}
  With FKarton, FProd Do Begin
  	Close;
  	If Del_Prod Then Begin
    	{��� ��������� �� ��������}
    	SQL[0] := 'DELETE FROM "'+FileKarton+'.DB" WHERE '+
          'RedNom = '+IntToStr(No) +' AND Doh_Prih = "P"';
      ExecSQL;

      {���������� � ������ �������������� �� �������}
      CheckRecKarton := True;
    End
    Else Begin
    	{��� �������� � ���� ��������}
      If Change_Prod Then Begin
    		{��� ��������� �� �������� (����� �� ������ ������������ ��������)}
    		SQL[0] := 'DELETE FROM "'+FileKarton+'.DB" WHERE '+
            'RedNom = '+IntToStr(No) +' AND Doh_Prih = "P"';
        ExecSQL;
      End;

    	SQL[0] := 'SELECT Count(Data) FROM "'+FileKarton+'.DB" WHERE Data > :D';
      Params[0].Value := Data;
			Open;
      Try
      	If Fields[0].AsInteger = 0 Then Begin
        	If Change_Prod Then CheckRecKarton := True
		      Else CheckRecKarton := False;
				End
				Else CheckRecKarton := True;
      Finally
      	Close;
      End;
    End;
  End;

  If CheckRecKarton Then
  	{������������ ����� ������ ������ ���� � �� ����� �� ����������.
    	(�� � ������� ������������) � ������ ���������� �� ������� �����
      ��� � �� �������� � ���� �������� (�� ��������� �� �������� ����
      ������������)}
  	Prod_FullRecalcKarton
  Else
    {������� ������� �� ����������}
  	AddProdToKarton;

  {�������� ������ �� ������������ �������}
  With FQrySuma Do Begin
 		SQL[0] := 'SELECT SUM(Kap_Pechalba) From "'+FProd.FileKarton+'" WHERE Doh_Prih = "P"';
    Open;
    Try
	    SumKap_Pech := Fields[0].AsFloat;
    Finally
	    Close;
    End;
  End;

  {�������������� �� ���������}
  With FQryPortfeil Do Begin
  	Edit;

    If CheckRecKarton Then
    	ABroi := FieldByName('Broi').AsInteger
    Else Begin
    	ABroi := FieldByName('Broi').AsInteger - FProd.Broi;
    	{����}
  		FieldByName('Broi').AsInteger := ABroi;
    End;

    {��������}
  	FieldByName('Stoinost').AsFloat := ABroi*FieldByName('Edin_Cena').AsFloat;

    {������� ��������}
		FieldByName('Pazar_Stoin').AsFloat :=	ABroi*FieldByName('Pazar_Cena').AsFloat;

  	{�� ������������ = ����(�����_���)+����(�����_������.)+
    	������� �������� - ���������(5) + �������������� ��������}
  	FieldByName('Inv_Stoi').AsFloat :=
    	FieldByName('Suma_Div').AsFloat + SumKap_Pech+
    	FieldByName('Pazar_Stoin').AsFloat - FieldByName('Stoinost').AsFloat+
      FieldByName('Purvo_Stoi').AsFloat;

   	FieldByName('Inv_Stoi_Alternat').AsFloat := FieldByName('Inv_Stoi').AsFloat-
    	FieldByName('Alternativa').AsFloat;

    {���� �����_��������}
    FieldByName('Suma_Prod').AsFloat := SumKap_Pech;

    {������������� �� ������� =
			[ ����(���_���) + ����(���_����)+
        (������� �������� - ��������(5)) ]/����. ��������}
    FieldByName('Vuzv_Obtcha').AsFloat :=
		 (	(FieldByName('Suma_Div').AsFloat + SumKap_Pech +
 			(FieldByName('Pazar_Stoin').AsFloat -
      FieldByName('Stoinost').AsFloat)) / FieldByName('Purvo_Stoi').AsFloat)*100;

    {������������� �� ������� �� ������� ����}
    If FieldByName('Period').AsInteger <> 0 Then
	    FieldByName('Vuzv_God').AsFloat :=
      	FieldByName('Vuzv_Obtcha').AsFloat*(365/FieldByName('Period').AsInteger);

    Post;

     { ������������ ��� }
    CalcDial_Vuzv_KapLihva;

  End;{With FQryPortfeil}
End;

Procedure TCustomCalc.AddProdToKarton;
{���������� ���������� � ������� ������ ������������ �� ������ � �������}
Var
  n: Integer;
  Period: LongInt;
Begin
 	Try
  	With FKarton Do Begin
			SQL[0] := 'SELECT * FROM "' +FProd.FileKarton+'.DB" WHERE Doh_Prih = "P"';
			Open;
  	End;

		With FKarton, FProd Do Begin
    	Last;
      n := FieldByName('RedNom').AsInteger + 1;
      Append;
			FieldByName('RedNom').AsInteger  := n; {����� �� ���}
      FieldByName('Data').AsDateTime   := Data;{����}
      FieldByName('Broi').AsInteger    := Broi;{���� ��������� �����}
      FieldByName('Prod_Cena').AsFloat := Cena;{�������� ����}
      FieldByName('Prih_Div').AsFloat  := Broi*Cena;{������ �� ����������}
      FieldByName('Razhodi').AsFloat   := Razhod;{������ �� ����������}
      FieldByName('Chist_Prih').AsFloat:= Broi*Cena - Razhod;{���� ������ �� ����������}
		 {K��������� ������� =
     	���� ������ �� ���������� - (���� ��������� * ���� �� �����������)}
			FieldByName('Kap_Pechalba').AsFloat :=
      	Broi*Cena - Razhod - (Broi*FQryPortfeil.FieldByName('Edin_Cena').AsFloat);

		{���������� ������������� =
    	[(K��������� �������/���� ��������� * ���� �� �����������)*
      	365/������� �� ����������]*100%}
	    Period := Round((Data - FQryPortfeil.FieldByName('Data_Inv').AsDateTime + 1));

			FieldByName('Kap_Vuzv').AsFloat :=
  	    	((FieldByName('Kap_Pechalba').AsFloat/
    	    	(Broi*FQryPortfeil.FieldByName('Edin_Cena').AsFloat))*365/Period)*100;

			FieldByName('Doh_Prih').AsString := 'P';
			Post;
  	End;{With FKarton}
  Finally
  	FKarton.Close;
  End;
End;

Procedure TCustomCalc.Prod_FullRecalcKarton;
  {���� ��� ������������ �� ��������}
{�������� ����� ������ ������ �� ��������
	(���� ����, ���������� ���� � ����������) �
  ������� ���������� �� ����������� �����}
  Procedure AddProd(n: Integer; Edin_Cena: Real; CheckAppend: Boolean);
  Var
  	Period: LongInt;
  Begin
  	With FKarton, FProd Do Begin

      If CheckAppend Then Append
      Else Insert;

			FieldByName('RedNom').AsInteger  := n; {����� �� ���}
      FieldByName('Data').AsDateTime   := Data;{����}
      FieldByName('Broi').AsInteger    := Broi;{���� ��������� �����}
      FieldByName('Prod_Cena').AsFloat := Cena;{�������� ����}
      FieldByName('Prih_Div').AsFloat  := Broi*Cena;{������ �� ����������}
      FieldByName('Razhodi').AsFloat   := Razhod;{������ �� ����������}
      FieldByName('Chist_Prih').AsFloat:= Broi*Cena - Razhod;{���� ������ �� ����������}
		{K��������� ������� = ���� ������ �� ���������� - (���� ��������� * �����. ����)}
			FieldByName('Kap_Pechalba').AsFloat := Broi*Cena - Razhod - (Broi*Edin_Cena);

		{���������� ������������� =
    	[(K��������� �������/���� ��������� * ���� �� �����������)*
      	365/������� �� ����������]*100%}
	    Period := Round((Data - FQryPortfeil.FieldByName('Data_Inv').AsDateTime + 1));

			FieldByName('Kap_Vuzv').AsFloat :=
  	    	((FieldByName('Kap_Pechalba').AsFloat/(Broi*Edin_Cena))*365/Period)*100;

			FieldByName('Doh_Prih').AsString := 'P';
			Post;
    End;{ With FKarton}
  End;
Var
	{�������� ���� ,���� � ��������� (������ �� �� �������������� ���������) �
  	������ ��� ������������ �� �������� ���� ������ �� �������� �
    [������ 3], [������ 4] � [������ 5]}
	CurBroi: LongInt;
  CurCena: Real;
  CurStoi: Real;
  {------------------------}
  KData: TDateTime;
  Bezpl_A: LongInt;
  Period: LongInt;
  Pr: String;
  n: Integer;
  CheckAdd: Boolean;
  CheckDohod: Boolean;
  CheckRegProd_Cena: Boolean;
  CheckAddCorect: Boolean;
Begin
	With FKarton Do Begin
		SQL[0] := 'SELECT * FROM "'+FProd.FileKarton+'.DB"';
		Open;
	End;
  Try
		CurBroi := FQryPortfeil.FieldByName('Purvo_Broi').AsInteger;
    {Broi * Cena + Razhod = ������� ��������}
    CurStoi := FQryPortfeil.FieldByName('Purvo_Stoi').AsFloat;
		If CurBroi <> 0 Then CurCena := CurStoi/CurBroi
 	 	Else CurCena := 0;

    n := 1;
    CheckAdd := True;
    CheckDohod := True;
    CheckRegProd_Cena := False;
    CheckAddCorect := False;
		With FKarton, FProd Do Begin
			While Not(Eof) Do Begin
      	Bezpl_A := FieldByName('Bezpl_Akcii').AsInteger;
        Pr := FieldByName('Doh_Prih').AsString;
        KData := FieldByName('Data').AsDateTime;

      	If Pr = 'D' Then Begin

        	If (KData > Data)And(CheckDohod)And(CheckAdd)And(Not Del_Prod) Then Begin
          	{������ �� ���������� � �� ����� �� ������ �� ������� ���
             � ��� ��� ���������� �� � ��������}
            AddProd(n, CurCena, False);
 	 					CurBroi := CurBroi - Broi;
		      	CurStoi := CurBroi * CurCena;
            CheckDohod := False;
            n := n + 1;
            {�������� �� ���� ������ ����� �������� �� ����������
            ������ �� ���������� � ���� �������� }
            If Change_Prod Then CheckAddCorect := True;

          End
          Else Begin
          	If (Not(CheckDohod) Or Not(CheckAdd))And
            		(Bezpl_A > 0)And
            		(Not(CheckRegProd_Cena)) Then
            	{��� ������������ �� ���������� � ��������
              	���������� �� ��������� �����, ����.���� �� ������� => � ����������
                �������������� �� ��������������� �� ������� � ����������}
            	CheckRegProd_Cena := True;


            If (CheckRegProd_Cena)Or(Change_Prod)Or(Del_Prod) Then Begin
            	Edit;
              {����������� ������������� =
              	(�������� �� �����/���� �� �����������)*100}
            	FieldByName('Kap_Vuzv').AsFloat :=
              	( (FieldByName('Prih_Div').AsFloat/
                	FieldByName('Broi').AsFloat) /CurCena )*100;

              Post;
            End;

 	 					CurBroi := CurBroi + Bezpl_A;
		      	If CurBroi = 0 Then CurCena := 0
            Else CurCena := CurStoi / CurBroi;

          End;

        End
        Else Begin

          If Pr = 'P' Then Begin
            If (KData > Data)And(CheckAdd)And(CheckDohod)And(Not Del_Prod) Then Begin
            	AddProd(n, CurCena, False);
              CheckAdd := False;
            	{�������� �� ���� ������ ����� �������� �� ����������
            		������ �� ���������� � ���� �������� }
							If Change_Prod Then CheckAddCorect := True;

            End
            Else Begin
        	    Edit;
      	      FieldByName('RedNom').AsInteger  := n;
            	If (CheckRegProd_Cena)Or(Change_Prod)Or(Del_Prod) Then Begin

								FieldByName('Kap_Pechalba').AsFloat :=
                	FieldByName('Chist_Prih').AsFloat -
                  	(FieldByName('Broi').AsFloat * CurCena);

								{���������� ������������� =
      					[(K��������� �������/���� ��������� * ���� �� �����������)*
        					365/������� �� ����������]*100%}
		    				Period := Round((KData - FQryPortfeil.FieldByName('Data_Inv').AsDateTime+1));

								FieldByName('Kap_Vuzv').AsFloat :=
    	    				((FieldByName('Kap_Pechalba').AsFloat/
      	    			(FieldByName('Broi').AsFloat*CurCena))*365/Period)*100;

							End;
              Post;
            End;
 	 	    		CurBroi := CurBroi - FieldByName('Broi').AsInteger;
            CurStoi := CurBroi * CurCena;
            n := n + 1;
          End;

        End;

      	Next;

      End;{While Not(Eof) Do }

      If (Not CheckAddCorect)And(Not Del_Prod)And(Change_Prod) Then Begin
			 	{��������� �� ���� ������ ���������� �� � �������� (���� �� ��������) �
        ���� ����� ��������� �� ����������}
        AddProd(n, CurCena, True);
				CurBroi := CurBroi - FieldByName('Broi').AsInteger;
      End;

    End; {With FKarton, FProd Do }
  Finally
	  FKarton.Close;
  End;

  With FQryPortfeil Do Begin
  	Edit;
  	FieldByName('Broi').AsInteger := CurBroi;
  	FieldByName('Edin_Cena').AsFloat := CurCena;
  	FieldByName('Stoinost').AsFloat := CurBroi * CurCena;
    Post;
  End;
End;

Procedure TCustomCalc.RegDohod(TDB: TDBDataSet; Doh: TDohod);
{(TDB: TDBDataSet; Data: TDateTime;
	Broi: LongInt; Cena: Real; Razhod: Real): Boolean;}
Var
  SumDiv: Real;
  CheckRecKarton: Boolean;
  OldBroi: LongInt;
Begin
	FQryPortfeil := TQuery(TDB);
  FDoh := Doh;
  {�������� �� �������� �� ������}

  With FKarton, FDoh Do Begin
  	Close;
  	If Del_Doh Then Begin
    	{��� ��������� �� �����}
    	SQL[0] := 'DELETE FROM "'+FileKarton+'.DB" WHERE '+
          'RedNom = '+IntToStr(No) +' AND Doh_Prih = "D"';
      ExecSQL;

      {���������� � ������ �������������� �� �������}
      CheckRecKarton := True;
    End
    Else Begin
    	{��� �������� � ��� �����}
      If Change_Doh Then Begin
    		{������� �� ������ (����� �� ������ ����������� �����) ���� �� ������}
    		SQL[0] := 'DELETE FROM "'+FileKarton+'.DB" WHERE '+
            'RedNom = '+IntToStr(No) +' AND Doh_Prih = "D"';
        ExecSQL;
      End;

      SQL[0] := 'SELECT Count(Data) FROM "'+FileKarton+'.DB" WHERE Data > :D';
      Params[0].Value := Data;
			Open;
      Try
        If Fields[0].AsInteger = 0 Then Begin
          If Change_Doh Then CheckRecKarton := True
	        Else CheckRecKarton := False;
				End
				Else CheckRecKarton := True;
     	Finally
     		Close;
     	End;
    End;
  End;

  If CheckRecKarton Then
  	{������������ ����� ������ ������ ���� � �� ����� �� ����������.
    	(�� � ������� ������������) � ������ ������ �� �������� �����}
  	Dohod_FullRecalcKarton
  Else
    {������� ������� �� ����������}
	 	AddDohodToKarton;


  {������ ������ �� ���������}
  With FQrySuma, FDoh Do Begin
    SQL[0] := 'SELECT SUM(Prih_Div) From "'+FileKarton+'" WHERE Doh_Prih = "D"';
    Open;
    SumDiv := Fields[0].AsFloat;
		Close;
  End;

  {�������������� �� ���������}
  With FQryPortfeil, FDoh Do Begin
  	Edit;
    If (Not CheckRecKarton)And(BezplAkcii > 0) Then Begin
     	OldBroi := FieldByName('Broi').AsInteger;

      {���� �����}
    	FieldByName('Broi').AsInteger := OldBroi + BezplAkcii;

      {���� �� �����������}
    	FieldByName('Edin_Cena').AsFloat :=
      	FieldByName('Stoinost').AsFloat/(OldBroi + BezplAkcii);
		End;

    {������� �������� := ������ ������ * ��������� ����}
    FieldByName('Pazar_Stoin').AsFloat :=
     	FieldByName('Broi').AsInteger*FieldByname('Pazar_Cena').AsFloat;

    {���� ����������}
    FieldByName('Suma_Div').AsFloat := SumDiv;

		{�� ������������ := ����(�������)+����(��������)+������� ��������-
     ��������(5)}
    FieldByName('Inv_Stoi').AsFloat := SumDiv +
    	FieldByName('Suma_Prod').AsFloat + FieldByName('Pazar_Stoin').AsFloat -
      FieldByName('Stoinost').AsFloat + FieldByName('Purvo_Stoi').AsFloat;

   	FieldByName('Inv_Stoi_Alternat').AsFloat := FieldByName('Inv_Stoi').AsFloat-
    	FieldByName('Alternativa').AsFloat;      

    {������������� �� ������� =
		[����(��������) + ����(��������)+(�����. �������� - ��������)]/����. ��������}
    FieldByName('Vuzv_Obtcha').AsFloat :=
		 (	(SumDiv + FieldByName('Suma_Prod').AsFloat +
 			(FieldByName('Pazar_Stoin').AsFloat -
      FieldByName('Stoinost').AsFloat)) / FieldByName('Purvo_Stoi').AsFloat )*100;

    {������������� �� ������� �� ������� ����}
	    FieldByName('Vuzv_God').AsFloat :=
      	FieldByName('Vuzv_Obtcha').AsFloat*(365/FieldByName('Period').AsInteger);

    Post;
    	    { ������������ ��� }
    If CheckRecKarton Then CalcDial_Vuzv_KapLihva

  End;{With FQryPortfeil}
End;

Procedure TCustomCalc.AddDohodToKarton;
Var
  n: Integer;
Begin
 	Try
  	With FKarton, FDoh Do Begin
			SQL[0] := 'SELECT * FROM "'+FileKarton+'.DB" WHERE Doh_Prih = "D"';
			Active := True;
  	End;

		With FKarton, FDoh Do Begin
    	Last;
      n := FieldByName('RedNom').AsInteger + 1;
      Append;
      FieldByName('RedNom').AsInteger := n;
			FieldByName('Data').AsDateTime  := Data;
      FieldByName('Broi').AsInteger   := Broi;
      FieldByName('Mesec').AsString   := Mes;
      FieldByName('Godina').AsInteger := God;
      FieldByName('Prih_Div').AsFloat := Suma;

      {���������� �������������}
      FieldByName('Kap_Vuzv').AsFloat :=
      	((Suma/Broi)/FQryPortfeil.FieldByName('Edin_Cena').AsFloat)*100;

      If BezplAkcii > 0 Then
      	FieldByName('Bezpl_Akcii').AsInteger := BezplAkcii;

      {�������� �� �����}
      FieldByName('Prod_Cena').AsFloat := Suma/Broi;

			FieldByName('Doh_Prih').AsString := 'D';

			Post;
  	End;{With FKarton}
  Finally
  	FKarton.Close;
  End;
End;

Procedure TCustomCalc.Dohod_FullRecalcKarton;

	Procedure AddDohod(n: LongInt; Edin_Cena: Real; CheckAppend: Boolean);
  Begin
		With FKarton, FDoh Do Begin

      If CheckAppend Then Append
      Else Insert;

      FieldByName('RedNom').AsInteger := n;
			FieldByName('Data').AsDateTime  := Data;
      FieldByName('Broi').AsInteger   := Broi;
      FieldByName('Mesec').AsString   := Mes;
      FieldByName('Godina').AsInteger := God;
      FieldByName('Prih_Div').AsFloat := Suma;

      {���������� ������������� � �������}
      FieldByName('Kap_Vuzv').AsFloat := ( (Suma/Broi)/Edin_Cena )*100;

      If BezplAkcii > 0 Then
      	FieldByName('Bezpl_Akcii').AsInteger := BezplAkcii;

      {�������� �� �����}
      FieldByName('Prod_Cena').AsFloat := Suma/Broi;

			FieldByName('Doh_Prih').AsString := 'D';

			Post;
  	End;{With FKarton}		
  End;
Var
	{�������� ���� ,���� � ��������� (������ �� �� �������������� ���������) �
  	������ ��� ������������ �� �������� ���� ������ �� �������� �
    [������ 3], [������ 4] � [������ 5]}
	CurBroi: LongInt;
  CurCena: Real;
  CurStoi: Real;
  {------------------------}
  KData: TDateTime;
  Bezpl_A: LongInt;
  Period: LongInt;
  Pr: String;
  n: Integer;
  CheckAdd: Boolean;
  CheckDohod: Boolean;
  CheckRegProd_Cena: Boolean;
  CheckKapPechalb: Boolean;
  SumKap_Pech: Real;
  CheckAddCorect: Boolean;
Begin
	With FKarton Do Begin
		SQL[0] := 'SELECT * FROM "'+FQryPortfeil.FieldByName('Inv_File').AsString+'.DB"';
		Open;
	End;
  
  Try
		CurBroi := FQryPortfeil.FieldByName('Purvo_Broi').AsInteger;
    {Broi * Cena + Razhod = ������� ��������}
    CurStoi := FQryPortfeil.FieldByName('Purvo_Stoi').AsFloat;
		If CurBroi <> 0 Then CurCena := CurStoi/CurBroi
    Else CurCena := 0; 

    n := 1;
    CheckAdd := True;
    CheckDohod := True;
    CheckRegProd_Cena := False;
    CheckKapPechalb := False;
    CheckAddCorect := False;
		With FKarton, FDoh Do Begin
			While Not(Eof) Do Begin
      	Bezpl_A := FieldByName('Bezpl_Akcii').AsInteger;
        Pr := FieldByName('Doh_Prih').AsString;
        KData := FieldByName('Data').AsDateTime;

      	If Pr = 'D' Then Begin

        	If (KData > Data)And(CheckDohod)And(CheckAdd)And(Not Del_Doh) Then Begin
          	{������ �� ���������� � �� ����� �� ������ �� ������� ���
             � ��� ��� ���������� �� � �������� � �� � �������� ������� �� ���������}
            AddDohod(n, CurCena, False);
 	 					If BezplAkcii > 0 Then Begin
            	CheckRegProd_Cena := True;
 	 						CurBroi := CurBroi + BezplAkcii;
			      	If CurBroi = 0 Then CurCena := 0
              Else CurCena := CurStoi / CurBroi;
            End;
            CheckDohod := False;
            {�������� �� ���� ������ ����� �������� �� ������
            ������ �� ������ � ��� ������� }
            If Change_Doh Then CheckAddCorect := True;
          End
          Else Begin
           	Edit;
            If (CheckRegProd_Cena)Or(Change_Doh)Or(Del_Doh) Then Begin
            	FieldByName('Kap_Vuzv').AsFloat :=
              	( (FieldByName('Prih_Div').AsFloat/
                	FieldByName('Broi').AsFloat) /CurCena )*100;
            End;
            FieldByName('RedNom').AsInteger := n;
            Post;
						If Bezpl_A > 0 Then Begin
 	 						CurBroi := CurBroi + Bezpl_A;
		      		CurCena := CurStoi / CurBroi;
          	End;
          End;
          n := n + 1;
        End
        Else Begin

          If Pr = 'P' Then Begin
            If (KData > Data)And(CheckAdd)And(CheckDohod)And(Not Del_Doh) Then Begin
        	   	AddDohod(n, CurCena, False);
 	 				 		If BezplAkcii > 0 Then Begin
              	CheckRegProd_Cena := True;
 	 							CurBroi := CurBroi + BezplAkcii;
                If CurBroi = 0 Then CurCena := 0
                Else CurCena := CurStoi / CurBroi;
              End;
			        CheckAdd := False;
      	      n := n + 1;
            	{�������� �� ���� ������ ����� �������� �� ������,
            		������ �� ������ � ��� ������� }
            	If Change_Doh Then CheckAddCorect := True;
		        End
         		Else Begin
          		If (CheckRegProd_Cena)Or(Change_Doh)Or(Del_Doh) Then Begin
                Edit;

								FieldByName('Kap_Pechalba').AsFloat :=
              		FieldByName('Chist_Prih').AsFloat -
                	(FieldByName('Broi').AsFloat * CurCena);

								{���������� ������������� =
      					[(K��������� �������/���� ��������� * ���� �� �����������)*
        					365/������� �� ����������]*100%}
		    				Period := Round((KData - FQryPortfeil.FieldByName('Data_Inv').AsDateTime+1));

								FieldByName('Kap_Vuzv').AsFloat :=
    	    				((FieldByName('Kap_Pechalba').AsFloat/
      	    			(FieldByName('Broi').AsFloat*CurCena))*365/Period)*100;

                Post;
              	CheckKapPechalb := True;
							End;
 	 	    			CurBroi := CurBroi - FieldByName('Broi').AsInteger;
            	CurStoi := CurBroi * CurCena;
          	End; {if (KData > Data)And(CheckAdd)And(CheckDohod)}
        	End; {If Pr = 'P'}

        End;
      	Next;
      End;{While Not(Eof) Do }

      If (Not CheckAddCorect)And(Not Del_Doh)And(Change_Doh) Then Begin
			 	{��������� �� ���� ������ ������ �� � ������� (���� �� ��������) �
        ���� ����� ��������� �� ������}
        {�.� ������ � �������� � ���������}
        AddDohod(n, CurCena, True);

 	 			If BezplAkcii > 0 Then Begin
 	 				CurBroi := CurBroi + BezplAkcii;
          If CurBroi = 0 Then CurCena := 0
          Else CurCena := CurStoi / CurBroi;
        End;
      End;

    End; {With FKarton, FDoh Do begin}
  Finally
	  FKarton.Close;
  End;

  If CheckKapPechalb Then Begin
    {�������� ������ �� ������������ ������� ���� ��� ����� �� ����������
    � ���� � ������������� ���������� �������}
    With FQrySuma Do Begin
 	 		SQL[0] := 'SELECT SUM(Kap_Pechalba) From "' +
        	FQryPortfeil.FieldByName('Inv_File').AsString+'" WHERE Doh_Prih = "P"';
      Open;
      Try
	      SumKap_Pech := Fields[0].AsFloat;
      Finally
	      Close;
      End;
    End;
  End
  Else SumKap_Pech := 0;

  With FQryPortfeil Do Begin
  	Edit;
  	FieldByName('Broi').AsInteger := CurBroi;
  	FieldByName('Edin_Cena').AsFloat := CurCena;
  	FieldByName('Stoinost').AsFloat := CurBroi * CurCena;

    If CheckKapPechalb Then FieldByName('Suma_Prod').AsFloat := SumKap_Pech;

    Post;
  End;
End;

Procedure TCustomCalc.DeleteInvest(TDB: TDBDataSet);
{��� ��������� �� ���������� �� �������}
Begin
	FQryPortfeil := TQuery(TDB);
  If DeleteSecInvest Then
   	If FQryPortfeil.RecordCount <> 0 Then CalcDial_Vuzv_KapLihva;
End;

Function TCustomCalc.AddNewInvest(TDB: TDBDataSet; Var Info: TInfoInv;
	ChNewInv: Boolean): Boolean;
Var
  KapLihva: Real;
  Val: Real;
Begin
	Result := False;
	FQryPortfeil := TQuery(TDB);
  FInfo := Info;
  With FQryPortfeil, FInfo Do
  	Try
  		DisableControls;
    	If ChNewInv Then Begin
      	Last;
	      No := FieldByName('ID_Inv').AsInteger + 1;
        Info.No := No;
        FileName := CreateDB.CreateKarton(No);
        Info.FileName := FileName;

   	    If FileName = '' Then Begin
        	MessageDlg1(C_Mess_NoCreateKarton, mtWarning, [mbOK], 0);
        	Exit;
        End;

     		Append;
       	FieldByName('Id_Inv').AsInteger := No;
      End
      Else Edit;

      Try
    		FieldByName('Data_Inv').AsDateTime := Data;
        FieldByName('Chifur').AsString     := VidInv;
        FieldByName('Broi').AsFloat        := Broi;
        FieldByName('Edin_Cena').AsFloat   := ((Broi*Cena)+Razhod)/Broi;
        FieldByName('Stoinost').AsFloat    := (Broi*Cena)+Razhod;
        FieldByName('Drugestvo').AsString  := Drugestvo;

				If ChNewInv Then Begin
          FieldByName('Pazar_Cena').AsFloat := Cena;
          FieldByName('Pazar_Stoin').AsFloat := Broi*Cena;
          FieldByName('Inv_Stoi').AsFloat := Broi*Cena;
        End
        Else Begin
        	FieldByName('Pazar_Stoin').AsFloat :=
          	Broi*FieldByName('Pazar_Cena').AsFloat;
          FieldByName('Inv_Stoi').AsFloat :=
          	Broi*FieldByName('Pazar_Cena').AsFloat;
        End;

        FieldByName('Period').AsInteger    := Round(CurrentDate - Data + 1);
        FieldByName('Purvo_Broi').AsFloat  := Broi;
        FieldByName('Purvo_Cena').AsFloat  := Cena;
        FieldByName('Purvo_Stoi').AsFloat  := (Broi*Cena)+Razhod;
        FieldByName('Purvo_Razhod').AsFloat:= Razhod;


	      If AData <> 0  Then FieldByName('Valid_Padeg').AsDateTime := AData;

  	    FieldByName('Prod_Pokupka').AsInteger := CC;
        FieldByName('N_F_D_Cena').AsFloat := B;
        FieldByName('Kup_Lihva').AsFloat := C;

	      If ChNewInv Then FieldByName('Inv_File').AsString := FileName;

				FieldByName('Vuzv_Obtcha').AsFloat :=
 				 (	(FieldByName('Pazar_Stoin').AsFloat -
    			FieldByName('Stoinost').AsFloat) / FieldByName('Purvo_Stoi').AsFloat )*100;

        {������������� �� ������� �� ������� ����}
      	FieldByName('Vuzv_God').AsFloat :=
        		FieldByName('Vuzv_Obtcha').AsFloat*(365/FieldByName('Period').AsInteger);

        FieldByName('Alternativa').AsFloat := FieldByName('Inv_Stoi').AsFloat;
        FieldByName('Inv_Stoi_Alternat').AsFloat := 0;
        FieldByName('KapLihva').AsFloat := 0;

  	  	Post;
			Except
      	Cancel;
        DeleteFile(PChar(DlgInvest.DBPath+FileName+'.DB'));
      	Raise;
      End;

		  Val := DlgPortfeil.DBLihva.Alternativa(
      												FieldByName('Period').AsInteger,
                              FieldByName('Data_Inv').AsDateTime,
	 	  												FieldByName('Purvo_Stoi').AsFloat,
                              KapLihva);
      Edit;
			FieldByName('Alternativa').AsFloat := Val;
			FieldByName('Inv_Stoi_Alternat').AsFloat := FieldByName('Inv_Stoi').AsFloat-Val;
	    FieldByName('KapLihva').AsFloat := KapLihva;
      Post;

  		If ChNewInv Then Begin
      	Try
      		DlgPortfeil.DBPortfeil.AddInv(
          	No, VidInv, Drugestvo, Data, Cena, RecordCount-1);
          DlgPortfeil.DBCurrCeni.Add(No, Cena);
      	Except
      	End;
      	CalcDial_Vuzv_KapLihva;
      End
			Else Begin
      	Try
      	 	DlgPortfeil.DBPortfeil.UpdateInv(No, Drugestvo, Data, Cena);
      	Except
      	End;
      	FullRecalcKarton;
      End;

  		Result := True;
		Finally
    	EnableControls
    End;
	{With FQryPortfeil, FInfo}
End;

Procedure TCustomCalc.FullRecalcKarton;
{������������ ���������� ���� ����� �� �������}
Var
	CurBroi, Bezpl_A, Period: LongInt;
  CurStoi, CurCena: Real;
  SumDiv, SumKap_Pech: Real;
  Pr: String;
Begin
	With FTbl Do Begin
		TableName := FInfo.FileName+'.DB';
		Open;
	End;

	Try
		CurBroi := FQryPortfeil.FieldByName('Purvo_Broi').AsInteger;
    {Broi * Cena + Razhod = ������� ��������}
    CurStoi := FQryPortfeil.FieldByName('Purvo_Stoi').AsFloat;
		If CurBroi <> 0 Then CurCena := CurStoi/CurBroi
    Else CurCena := 0;

		With FTbl Do Begin
    	SumKap_Pech := 0;
      SumDiv := 0;
			While Not(Eof) Do Begin

        Pr := FieldByName('Doh_Prih').AsString;
      	If Pr = 'D' Then Begin
        	Bezpl_A := FieldByName('Bezpl_Akcii').AsInteger;
          Edit;
         	FieldByName('Kap_Vuzv').AsFloat := {���������� �������������}
              	( (FieldByName('Prih_Div').AsFloat/
                	FieldByName('Broi').AsFloat) /CurCena )*100;
        	Post;
          If Bezpl_A > 0 Then Begin
          	CurBroi := CurBroi + Bezpl_A;
            If CurBroi <> 0  Then CurCena := CurStoi / CurBroi;
          End;
        End
        Else If Pr = 'P' Then Begin
					CurBroi := CurBroi - FieldByName('Broi').AsInteger;
					CurStoi := CurBroi * CurCena;

          Edit;
					FieldByName('Kap_Pechalba').AsFloat :=
          	FieldByName('Chist_Prih').AsFloat -
            	(FieldByName('Broi').AsFloat * CurCena);

					{���������� ������������� =
      			[(K��������� �������/���� ��������� * ���� �� �����������)*
        		365/������� �� ����������]*100%}
		    	Period := Round((FieldByName('Data').AsDateTime -
          	FQryPortfeil.FieldByName('Data_Inv').AsDateTime+1));

					FieldByName('Kap_Vuzv').AsFloat :=
    	    	((FieldByName('Kap_Pechalba').AsFloat/
      	    	(FieldByName('Broi').AsFloat*CurCena))*365/Period)*100;

          Post;
        End;
        If Pr = 'D' Then
        	//�������� ������ �� ���������
					SumDiv := SumDiv + FieldByName('Prih_Div').AsFloat
      	Else
        	//�������� ������ �� ������������ �������
		     	SumKap_Pech := SumKap_Pech + FieldByName('Kap_Pechalba').AsFloat;

        Next;
      End;{While Not(Eof) Do }
    End; {With FTbl, FProd Do }
	Finally
		FTbl.Close;
  End;

  {�������������� �� ���������}
  With FQryPortfeil Do Begin
  	Edit;

  	FieldByName('Broi').AsInteger := CurBroi;
  	FieldByName('Edin_Cena').AsFloat := CurCena;
  	FieldByName('Stoinost').AsFloat := CurBroi * CurCena;    

    {������� ��������}
		FieldByName('Pazar_Stoin').AsFloat :=
    	FieldByName('Broi').AsInteger*FieldByName('Pazar_Cena').AsFloat;

  	{�� ������������ = ����(�����_���)+����(�����_������.)+
    	�������� �������� - ����������(5) + �������������� ��������}
  	FieldByName('Inv_Stoi').AsFloat :=
    	SumDiv + SumKap_Pech+
    	FieldByName('Pazar_Stoin').AsFloat - FieldByName('Stoinost').AsFloat +
       + FieldByName('Purvo_Stoi').AsFloat;

    FieldByName('Inv_Stoi_Alternat').AsFloat := FieldByName('Inv_Stoi').AsFloat-
    	FieldByName('Alternativa').AsFloat;

    {���� �����_��������}
    FieldByName('Suma_Prod').AsFloat := SumKap_Pech;

    {���� ����������}
    FieldByName('Suma_Div').AsFloat := SumDiv;

    {������������� �� �������=
			[ ����(���_���) + ����(���_����)+
        (������� �������� - ��������(5)) ]/����. ��������}
    FieldByName('Vuzv_Obtcha').AsFloat :=
		 (	(SumDiv + SumKap_Pech +
 			(FieldByName('Pazar_Stoin').AsFloat -
      FieldByName('Stoinost').AsFloat)) / FieldByName('Purvo_Stoi').AsFloat )*100;

    {������������� �� ������� �� ������� ����}
    FieldByName('Vuzv_God').AsFloat :=
     	FieldByName('Vuzv_Obtcha').AsFloat*(365/FieldByName('Period').AsInteger);


    Post;

     { ������������ ��� }
    CalcDial_Vuzv_KapLihva;

  End;{With FQryPortfeil}
End;

end.

