unit DeleteFiles;

interface

Function DeletePathFiles(Path: String; Ext: String): Boolean;
Function BackPath(Path: String): String;

implementation

Uses Windows, Classes, SysUtils, FileCtrl;

Procedure LocalFindFiles(DelFiles: String; Var Files: TStringList); Forward;

Function DeletePathFiles(Path: String; Ext: String): Boolean;
Var
	Files: TStringList;
  i: Integer;
Begin
	Try
		Files := TStringList.Create;
  	Try
			LocalFindFiles(Path+'\'+Ext, Files);
	   	For i := 0 To Files.Count - 1 Do
      	DeleteFile(PChar(Path+'\'+Files.Strings[i]));
	  Finally
		  Files.Free;
		End;
    Result := True;
	Except
  	Result := False;
  End;
End;

Function BackPath(Path: String): String;
Var
	i, f: Integer;
begin
	F := 0;
	For i := Length(Path) DownTo 1 Do
  	If Path[i] = '\' Then Begin
    	F := i;
    	Break;
  	End;
  Result := Copy(Path, 0, F-1);
end;

Procedure LocalFindFiles(DelFiles: String; Var Files: TStringList);
Var
	FindData: TWIN32FINDDATA;
  Found: Thandle;
  B: Boolean;
  F: String;
Begin
	Found := FindFirstFile(PChar(DelFiles), FindData);
  Try
  	F := StrPas(FindData.cFileName);
	  If (F <> '')And(F <> '.')And(F <> '..') Then Files.Add(F);

    If Found <> 0 Then B := True
    Else B := False;

    While B Do Begin
      FillChar(FindData, SizeOf(FindData), 0);
    	B := FindNextFile(Found, FindData);

    	F := StrPas(FindData.cFileName);
    	If (F <> '')And(F <> '.')And(F <> '..') Then Files.Add(F);
            
    End;
  Finally
  	Windows.FindClose(Found);
  End;
End;


end.
