program _unindel;
uses
  SysUtils, Classes;

Type
	TSlow = Class(TThread)
  Private
  	Procedure DeleteSynch;
  Protected
	  Procedure Execute; Override;
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

Function Slow: Integer;
Var
	i, n, S: Integer;
begin
	S := 0;
	For i := 0 To 250 Do
  	For n := 0 To 103000 Do Inc(s);
  Result := S
end;

Var
	FileName, TmpPath: String;
  i: Integer;
  Th: TSlow;
  
{ TSlow }

Procedure TSlow.DeleteSynch;
Begin
	DeleteFile(PChar(FileName));
  TmpPath := ExtractFileDir(FileName);
	While TmpPath <> '' Do Begin
  	If RemoveDir(TmpPath) Then TmpPath := BackPath(TmpPath)
		Else TmpPath := '';
	End;  	
End;

procedure TSlow.Execute;
begin
	Slow; Slow;
  Synchronize(DeleteSynch);
end;

begin
  For i := 1 To ParamCount Do
    If i = 1 Then FileName := ParamStr(i)
  	Else FileName := FileName+ ' '+ ParamStr(i);
    
	If FileExists(FileName) Then Begin
  	Th := TSlow.Create(True);
    Try
    	Slow;
      Th.Resume;
		Finally
    	Th.Free;
    End;
  End;
end.
