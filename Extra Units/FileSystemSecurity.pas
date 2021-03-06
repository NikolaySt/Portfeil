unit FileSystemSecurity;

interface

Const
	cHideFile1: String = 'Vbxtda32.386';
	cHideFile2: String = 'Ccapia32.dll';
  cHideFile3: String = 'Icvida32.dll';

  Function CreateSecFiles: Boolean;
  Function DeleteSecFiles: Boolean;
  Function FindSecFiles: Boolean;

implementation

Uses Classes, Windows, SysUtils, FileCtrl, Dialogs;

Const
	cFindCompare1 = 'Gdi32.dll';
  cFindCompare2 = 'Krnl386.exe';
  SystemTime: TSYSTEMTIME =
  	(
    wYear: 1997;
    wMonth: 11;
    wDayOfWeek: 1;
    wDay: 10;
    wHour: 01;
    wMinute: 01;
    wSecond: 01;
    wMilliseconds: 01;
    );

Function FindTmp(fFile: String; Var Search: TSearchRec): Integer;
Begin
	Try
		Result := FindFirst(fFile, faAnyFile, Search);
  Finally
  	SysUtils.FindClose(Search);
  End;
End;

Function CreateSecFiles: Boolean;
Var
	Path: String;
  A: Array[0..255] Of Char;
  SearchRec: TSearchRec;
  
  Procedure InternalCreateFile(fFile: String);
  Const
  	cBuff = 100;
  Var
  	StrFile: TFileStream;
    Buff: Array[0..cBuff-1] Of Byte;
    i, n: Integer;

    FileTime: TFILETIME;
		FH: THandle;
	  Tf: OFSTRUCT;
  Begin
  	StrFile := TFileStream.Create(fFile, fmCreate);
    Try
      Randomize;
      For i := 0 To 100 Do Begin
      	For n := 0 To cBuff - 1 Do Buff[n] := Random(255);
      	StrFile.WriteBuffer(Buff, cBuff);
      End;
    Finally
    	StrFile.Free;
    End;
    FH := OpenFile(PChar(fFile), Tf, OF_WRITE	);
		If FH <> 0 Then
    	Try
	      If SystemTimeToFileTime(SystemTime, FileTime) Then Begin
	  	    SetFileTime(FH, @FileTime, @FileTime, @FileTime);
        End;
      Finally
	      _lclose(FH);
      End
  End;
    
Begin
	Result := False;
  If GetSystemDirectory(A, MAX_PATH) = 0 Then Exit;
  Path := StrPas(A);
  If DirectoryExists(Path) Then Begin
  	Path := Path + '\';
    Try
	    If FindTmp(Path + cHideFile1, SearchRec) <> 0 Then
  	  	InternalCreateFile(Path + cHideFile1);

    	If FindTmp(Path + cHideFile2, SearchRec) <> 0 Then
    		InternalCreateFile(Path + cHideFile2);

	    If FindTmp(Path + cHideFile3, SearchRec) <> 0 Then
  	  	InternalCreateFile(Path + cHideFile3);

      Result := True;
    Except
    	Result := False;
    End;
  End;
End;

Function DeleteSecFiles: Boolean;
Var
	Path: String;
  A: Array[0..255] Of Char;
Begin
	Result := False;
  If GetSystemDirectory(A, MAX_PATH) = 0 Then Exit;
  Path := StrPas(A);
  If DirectoryExists(Path) Then Begin
  	Path := Path + '\';
    Try
	    DeleteFile(PChar(Path + cHideFile1));
      DeleteFile(PChar(Path + cHideFile2));
      DeleteFile(PChar(Path + cHideFile3));
      Result := True;
    Except
    	Result := False;
    End;
  End;	
End;

Function FindSecFiles: Boolean;
Var
	Path: String;
  A: Array[0..255] Of Char;
  SearchRec: TSearchRec;
Begin
	Result := False;
  If GetSystemDirectory(A, MAX_PATH) = 0 Then Exit;
  Path := StrPas(A);
  If DirectoryExists(Path) Then Begin
  	Path := Path + '\';
    Try
	    If (FindTmp(Path + cHideFile1, SearchRec) = 0) And
      	(FindTmp(Path + cHideFile2, SearchRec) = 0) And
        (FindTmp(Path + cHideFile3, SearchRec) = 0)  Then Result := True;
    Except
    	Result := False;
    End;
  End;
End;

end.
