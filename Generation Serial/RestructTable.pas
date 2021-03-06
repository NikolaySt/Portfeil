unit RestructTable;

interface

Uses
  SysUtils, Windows, Classes, Controls, DBTables, DB, BDE;

Type
	TRestructDataBase = Class
  Private
		TblDesc: CRTblDesc;
    FPassword: String;
  Public
  	Procedure RestructTable(Tbl: TTable);
    Property Password: String Read FPassword Write FPassword;
  End;

Var
	RestrDB: TRestructDataBase;

implementation

Procedure TRestructDataBase.RestructTable(Tbl: TTable);
Var
	Db: hDBIDb;	
Begin
	If Not Tbl.Active Then Tbl.Open;
  Db := Tbl.DBHandle;
  Tbl.Close;
  
  FillChar(TblDesc, SizeOf(CRTblDesc), 0);
  With TblDesc Do Begin
    StrPCopy(szTblName, Tbl.TableName);
    StrPCopy(szTblType, szParadox);
    StrPCopy(szUserName, Password);
    StrPCopy(szPassword, Password);
    bProtected := True;
    bPack := True;
  End;
  If Db <> Nil Then
	  Check( DbiDoRestructure(Db, 1, @TblDesc, nil, nil, nil, false) );
End;

end.


