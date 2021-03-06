unit CreatTbl;

interface

Uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Controls,
  Forms, Dialogs, DBTables, DB, ExtCtrls, BDE;
  
Type
	TCreateDataBase = Class
  Private
	  hCur: hDbiDb;
		TblDesc: CRTblDesc;
    Function CreateFileName(i: LongInt): String;
   	Procedure CreateTblIndex;
    Procedure CreateTblLihva;
    Procedure CreateTblDataUpra;
    Procedure CreateTblPazrCena;
    Procedure CreateTblPortData;
  Public
  	Function CreateKarton(i: LongInt): String;
  	Procedure FindTable;
  End;

Var
	CreateDB: TCreateDataBase;

implementation

Uses MyConst, Invest;

Function CreateFields(FieldName: String; FieldType: Word; Len: Word): FLDDesc;
Begin
	FillChar(Result, SizeOf(Result), 0);
	With Result Do Begin
    StrPCopy(szName, FieldName);
    iFldType    :=  FieldType;
    iSubType    :=  FieldType;
    iUnits1     :=  Len;
  End;
End;

Function CreateTblDesc(TblName: String; FieldCount: Word;
	pfldDsc: pfldDesc): CRTblDesc;
Begin
  FillChar(Result, SizeOf(Result), 0);

  With Result Do Begin
    StrPCopy(szTblName, TblName);
    StrPCopy(szTblType, szParadox);
    StrPCopy(szUserName, DBPassword);
    StrPCopy(szPassword, DBPassword);
    bProtected := True;
    iFldCount := FieldCount;
    pfldDesc := pfldDsc;
  End;

End;

Procedure TCreateDataBase.FindTable;

	Function FindTmp(TblFile: String): Integer;
  Var
	  SearchRec: TSearchRec;
  Begin
  	Try
			Result := FindFirst(DlgInvest.DBPath+TblFile, faAnyFile, SearchRec);
    Finally
    	SysUtils.FindClose(SearchRec);
    End;
  End;

Begin
  If FindTmp(C_FileIndex)    <> 0 Then CreateTblIndex;
  If FindTmp(C_FileLihva)    <> 0 Then CreateTblLihva;
  If FindTmp(C_FileDataUpra) <> 0 Then CreateTblDataUpra;
  If FindTmp(C_FilePazrCena) <> 0 Then CreateTblPazrCena;
  If FindTmp(C_FilePortData) <> 0 Then CreateTblPortData;
End;

Procedure TCreateDataBase.CreateTblIndex;
Var
  AFieldDesc: Array[0..1] of FLDDesc;
Begin
  AFieldDesc[0] := CreateFields('Data', fldPDXDATE, 0);
  AFieldDesc[1] := CreateFields('BorIndex', fldPDXNUM, 0);;

  TblDesc :=
  	CreateTblDesc(C_FileIndex, High(AFieldDesc)+1, @AFieldDesc);

  hCur := DlgInvest.DBaseInv.Handle;
	Check( DbiCreateTable(hCur, False, TblDesc) );
End;

Procedure TCreateDataBase.CreateTblLihva;
Var
  AFieldDesc: Array[0..1] of FLDDesc;
Begin
  AFieldDesc[0] := CreateFields('Data', fldPDXDATE, 0);
  AFieldDesc[1] := CreateFields('Lihva', fldPDXNUM, 0);;

  TblDesc :=
  	CreateTblDesc(C_FileLihva, High(AFieldDesc)+1, Pointer(Addr(AFieldDesc)) );

  hCur := DlgInvest.DBaseInv.Handle;
	Check( DbiCreateTable(hCur, False, TblDesc) );
End;

Procedure TCreateDataBase.CreateTblDataUpra;
Var
  AFieldDesc: Array[0..2] of FLDDesc;
Begin
  AFieldDesc[0] := CreateFields('Trimesec', fldPDXCHAR, 1);
  AFieldDesc[1] := CreateFields('Data1', fldPDXDATE, 0);
  AFieldDesc[2] := CreateFields('Data2', fldPDXDATE, 0);

  TblDesc :=
  	CreateTblDesc(C_FileDataUpra, High(AFieldDesc)+1, Pointer(Addr(AFieldDesc)) );

  hCur := DlgInvest.DBaseInv.Handle;
	Check( DbiCreateTable(hCur, False, TblDesc) );
End;

Procedure TCreateDataBase.CreateTblPazrCena;
Var
  AFieldDesc: Array[0..2] of FLDDesc;
Begin
  AFieldDesc[0] := CreateFields('ID_INV', fldPDXSHORT, 0);
  AFieldDesc[1] := CreateFields('Data', fldPDXDATE, 0);
  AFieldDesc[2] := CreateFields('Pazar_Cena', fldPDXNUM, 0);

  TblDesc :=
  	CreateTblDesc(C_FilePazrCena, High(AFieldDesc)+1, Pointer(Addr(AFieldDesc)) );

  hCur := DlgInvest.DBaseInv.Handle;
	Check( DbiCreateTable(hCur, False, TblDesc) );
End;

Procedure TCreateDataBase.CreateTblPortData;
Var
  AFieldDesc: Array[0..28] of FLDDesc;
Begin
  AFieldDesc[0] :=  CreateFields('ID_Inv'          , fldPDXSHORT, 0);
  AFieldDesc[1] :=  CreateFields('Data_Inv'        , fldPDXDATE, 0);
  AFieldDesc[2] :=  CreateFields('Chifur'          , fldPDXCHAR, 6);
  AFieldDesc[3] :=  CreateFields('Broi'            , fldPDXLONG, 0);
  AFieldDesc[4] :=  CreateFields('Edin_Cena'       , fldPDXNUM, 0);
  AFieldDesc[5] :=  CreateFields('Stoinost'        , fldPDXNUM, 0);
  AFieldDesc[6] :=  CreateFields('Otn_dial'        , fldPDXNUM, 0);
  AFieldDesc[7] :=  CreateFields('Drugestvo'       , fldPDXCHAR, 50);
  AFieldDesc[8] :=  CreateFields('Pazar_Cena'      , fldPDXNUM, 0);
  AFieldDesc[9] :=  CreateFields('Pazar_Stoin'     , fldPDXNUM, 0);
  AFieldDesc[10] := CreateFields('Period'          , fldPDXLONG, 0);
  AFieldDesc[11] := CreateFields('Purvo_Broi'      , fldPDXLONG, 0);
  AFieldDesc[12] := CreateFields('Purvo_Cena'      , fldPDXNUM, 0);
  AFieldDesc[13] := CreateFields('Purvo_Stoi'      , fldPDXNUM, 0);
  AFieldDesc[14] := CreateFields('Purvo_Razhod'    , fldPDXNUM, 0);
  AFieldDesc[15] := CreateFields('Valid_Padeg'     , fldPDXDATE, 0);
  AFieldDesc[16] := CreateFields('Prod_Pokupka'    , fldPDXLONG, 0);
  AFieldDesc[17] := CreateFields('N_F_D_Cena'      , fldPDXNUM, 0);
  AFieldDesc[18] := CreateFields('Kup_Lihva'       , fldPDXNUM, 0);
  AFieldDesc[19] := CreateFields('Inv_Stoi'        , fldPDXNUM, 0);
  AFieldDesc[20] := CreateFields('Alternativa'     , fldPDXNUM, 0);
  AFieldDesc[21] := CreateFields('Suma_Div'        , fldPDXNUM, 0);
  AFieldDesc[22] := CreateFields('Suma_Prod'       , fldPDXNUM, 0);
  AFieldDesc[23] := CreateFields('Vuzv_Obtcha'     , fldPDXNUM, 0);
  AFieldDesc[24] := CreateFields('Inv_File'        , fldPDXCHAR, 8);
  AFieldDesc[25] := CreateFields('Memo'            , fldPDXFMTMEMO, 240);
  AFieldDesc[26] := CreateFields('Vuzv_God'        , fldPDXNUM, 0);
  AFieldDesc[27] := CreateFields('KapLihva'        , fldPDXNUM, 0);
  AFieldDesc[28] := CreateFields('Inv_Stoi_Alternat',fldPDXNUM, 0);

	TblDesc :=
  	CreateTblDesc(C_FilePortData, High(AFieldDesc)+1, Pointer(Addr(AFieldDesc)) );

  hCur := DlgInvest.DBaseInv.Handle;
	Check( DbiCreateTable(hCur, False, TblDesc) );
End;

Function TCreateDataBase.CreateFileName(i: LongInt): String;
var
  SearchRec: TSearchRec;
  Path: String;
  F, S: Integer;
Begin
  Path := DlgInvest.DBPath;
 	Result := IntToStr(i)+'_'+IntToStr(Random(100))+'_'+IntToStr(Random(100));
	Result := Copy(Result, 1, 8);
  F := FindFirst(Path + Result+'.DB', faAnyFile, SearchRec);
  Try
  	S := 0;
    While (F = 0)And(Not S > 100) Do Begin
 	 		Result := IntToStr(i)+'_'+IntToStr(Random(100))+'_'+IntToStr(Random(100));
			Result := Copy(Result, 1, 8);
      SearchRec.Name := Path + Result+'.DB';
    	F := FindNext(SearchRec);
      Inc(S)
    End;
    If S > 100 Then Result := '';
  Finally
  	SysUtils.FindClose(SearchRec);
  End;
End;

Function TCreateDataBase.CreateKarton(i: LongInt): String;
Var
  FileName: String;
  AFieldDesc: Array[0..12] of FLDDesc;
Begin
	Result := '';
  FileName := CreateFileName(i);

  AFieldDesc[0]  :=  CreateFields('RedNom'      , fldPDXSHORT, 0);
  AFieldDesc[1]  :=  CreateFields('Data'        , fldPDXDATE , 0);
  AFieldDesc[2]  :=  CreateFields('Mesec'       , fldPDXCHAR , 6);
  AFieldDesc[3]  :=  CreateFields('Godina'      , fldPDXSHORT, 0);
  AFieldDesc[4]  :=  CreateFields('Broi'        , fldPDXLONG , 0);
  AFieldDesc[5]  :=  CreateFields('Prod_Cena'   , fldPDXNUM  , 0);
  AFieldDesc[6]  :=  CreateFields('Prih_Div'    , fldPDXNUM  , 0);
  AFieldDesc[7]  :=  CreateFields('Bezpl_Akcii' , fldPDXLONG , 0);
  AFieldDesc[8]  :=  CreateFields('Razhodi'     , fldPDXNUM  , 0);
  AFieldDesc[9]  :=  CreateFields('Chist_Prih'  , fldPDXNUM  , 0);
  AFieldDesc[10] :=  CreateFields('Kap_Pechalba', fldPDXNUM  , 0);
  AFieldDesc[11] :=  CreateFields('Kap_Vuzv'    , fldPDXNUM  , 0);
  AFieldDesc[12] :=  CreateFields('Doh_Prih'    , fldPDXCHAR , 1);

	TblDesc :=
  	CreateTblDesc(FileName+'.DB', High(AFieldDesc)+1, Pointer(Addr(AFieldDesc)) );

  hCur := DlgInvest.DBaseInv.Handle;
	Check( DbiCreateTable(hCur, False, TblDesc) );
  Result := FileName;
End;

end.
