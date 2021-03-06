unit ExportSerialNumber;

interface

Function ExportInfo(Code: Integer): Integer;

implementation

Const
	cResult = $FF10;
  cCodeSec = $FF11;
  //Ефективен сериен номер. Служи за заблуждение, той не се използва.//
	cNumber = '36613-AP1701-1CB73A-39B2CF';

Function ExportInfo(Code: Integer): Integer;
Begin
	If Code = cCodeSec Then Result := cResult
  Else Result := 0;
End;

end.
