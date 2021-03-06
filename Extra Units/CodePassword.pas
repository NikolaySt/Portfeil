unit CodePassword;

interface

Const
	C_NotError              = 0;//Няма гршка
	C_Error_NotFindFile     = 1;//Не е открит файла
  C_Error_NotActualFile   = 2;//Не е същия файл
  C_Error_Other           = 3;//Грешка от друго естиство
  C_Error_NotReadFile     = 4;//Не може да прочете файла
  C_Error_NotWriteFile    = 5;//Не може да запиже в файла
  C_Error_NotCompare      = 6;//Сравнението е невярно
  C_Error_NotRegister     = 7;//Файла не е рагистриран
  C_Error_NotFindResource = 8;//Не е открит ресурса
  C_Error_NotLoadResource = 9;//Не може да отвори ресурса
  C_Error_Encode          = 10;//Не може да кодира данните
  C_Error_Decode          = 11;//Не може да декодира данните
  C_Error_NotPassword     = 12;//Няма въведен стринг за обработка
	C_Error_AlreadyRegister = 13;//Програмата е била вече регистрирана(за флопито)
  C_Error_NotAccessToDisk = 14;//Диска е защитен от писане върху него

Type
  TPass = Array Of byte;

	TCustomCodeCrypt = Class
	Private
  	FPassword: String;
    FEncodePass: TPass;
    FDecodePass: TPass;
    FRealLen: Integer;
    FResult: Integer;
  Public
  	Procedure DecodePassword;
		Procedure EncodePassword;
		Procedure ComparePassowrd(ChEmpty: Boolean);
    Procedure SetEncodeLength(L: Integer);
    Procedure SetDecodeLength(L: Integer);    
	  Property Password: String Read FPassword Write FPassword;
    Property Result: Integer Read FResult Write FResult;
    Property EncodePass: TPass Read FEncodePass Write FEncodePass; 
    Property DecodePass: TPass Read FDecodePass Write FDecodePass;
    Property RealLen: Integer Read FRealLen Write FRealLen;
  End;

  TCustomSaveCode = Class(TCustomCodeCrypt)
	Private
  	FFileName: String;
    FPath: String;
  Public
    Procedure OpenFromFile(Pos: Integer); Virtual;
  	Procedure SaveToFile(Pos: Integer); Virtual;
    Procedure SetTimeToFile(AFileName: String);
    Property FileName: String Read FFileName Write FFileName;
 		Property Path: String Read FPath Write FPath;
	End;

  TCustomSaveResource = Class(TCustomSaveCode)
  private
    FResourceName: String;
  Public
  	Procedure FindFileResource; Virtual;
		Procedure OpenFromResource(Pos: Integer); Virtual;
		Property ResourceName: String Read FResourceName Write FResourceName;
  End;

  
implementation

Uses Windows, Classes, SysUtils, Dialogs;

const
	cMask1        = $FFCCAABB;
	cMask2        = $99876369;
  cMask3        = $C354622A;
	CFindFunction = 'ExportInfo';
  CInportFun    = $FF11;
  CExportFun    = $FF10;
  
  IntSystemTime: TSYSTEMTIME =
  	(
    wYear: 1999;
    wMonth: 04;
    wDayOfWeek: 4;
    wDay: 08;
    wHour: 01;
    wMinute: 01;
    wSecond: 01;
    wMilliseconds: 01;
    );
  
procedure ExtEncodeBytes(Var Pass: Array of Byte);
var
	Len, Step: Integer;
begin
	Len := High(Pass) + 1;
  Step := 0;
  Repeat
  	Asm
    	MOV EDX, Step
    	PUSH EAX
      PUSH EBX
      PUSH ECX
			MOV EBX, DWORD Ptr [Pass]
 			MOV EAX, DWORD Ptr [EBX+EDX]

      //Размяна на AH с AL
      MOV ECX, 02D
@M1:  MOV BL, AL
      MOV AL, AH
      MOV AH, BL
      ROR EAX, 16D
      LOOP @M1

      //Тройна маска с въртене преди маската
  	  ROL EAX, 10D
      XOR EAX, cMask1

  	  ROR EAX, 08D
      XOR EAX, cMask2

  	  ROL EAX, 06D
      XOR EAX, cMask3

      //Поставяне на EAX в масива
			MOV EBX, DWORD Ptr [Pass]
 			MOV DWORD Ptr [EBX+EDX], EAX

    	POP ECX
      POP EBX
      POP EAX
    End;
    Step := Step + 4;
  Until Step >= Len
end;

procedure ExtDecodeBytes(Var Pass: Array of Byte);
var
	Len, Step: Integer;
begin
	Len := High(Pass) + 1;
  Step := 0;
  Repeat
  	Asm
    	MOV EDX, Step
    	PUSH EAX
      PUSH EBX
      PUSH ECX
			MOV EBX, DWORD Ptr [Pass]
 			MOV EAX, DWORD Ptr [EBX+EDX]

      {------------------}
	    XOR EAX, cMask3
  	  ROR EAX, 06D

      XOR EAX, cMask2
  	  ROL EAX, 08D

      XOR EAX, cMask1
  	  ROR EAX, 10D
      {------------------}

      //Размяна на AH с AL
      MOV ECX, 02D
@M1:  MOV BL, AL
      MOV AL, AH
      MOV AH, BL
      ROR EAX, 16D
      LOOP @M1

      //Поставяне на EAX в масива
			MOV EBX, DWORD Ptr [Pass]
 			MOV DWORD Ptr [EBX+EDX], EAX

    	POP ECX
      POP EBX
      POP EAX
    End;
    Step := Step + 4;
  Until Step >= Len
end;

{ TCustomCodeCrypt }

procedure TCustomCodeCrypt.ComparePassowrd(ChEmpty: Boolean);
Var
	TmpPass: TPass;
	RealLen, Len, i: Integer;
  ChCorect, ChExit: Boolean;
begin
	RealLen := Length(FPassword);//Реална дължина на паролата
	Len := RealLen;//Допълвана дължина

  If Length(FEncodePass) = 0 Then Begin
  	//Няма въведена паролa. Сравнението се прескача
    If ChEmpty Then Result := C_NotError
    Else Result := C_Error_NotCompare;
    Exit;
  End;

  If RealLen = 0 Then Result := C_Error_NotPassword
  Else
  	Try
      If Len Mod 4 <> 0 Then Len := (Len Div 4 + 1)*4;//Допълване до кратно на 4//
			FillChar(TmpPass, SizeOf(TmpPass), 0);
			SetLength(TmpPass, Len);

      For i := 0 To RealLen - 1 Do TmpPass[i] := Byte(FPassword[i+1]);

      ExtEncodeBytes(TmpPass);

      i := 0;
      ChCorect := False;
      ChExit := False;

      If High(TmpPass) = High(FEncodePass) Then
			  Repeat
      		Try
          	If High(TmpPass) < i Then ChCorect := True
            Else Begin
      				If TmpPass[i] <> FEncodePass[i] Then ChExit := True
            	Else ChExit := False;
          	End;
			    Except
      	  	ChExit := True;
        	End;
					Inc(i);
      	Until ChExit Or ChCorect;
        
      If ChCorect Then Result := C_NotError
      Else Result := C_Error_NotCompare;
    Except
    	Result := C_Error_Other;
    End;
end;

procedure TCustomCodeCrypt.DecodePassword;
Var             
	i: Integer;   
begin           
	If Length(FEncodePass) = 0 Then Result := C_Error_NotPassword
  Else Begin    
		SetLength(FDecodePass, Length(FEncodePass));
  	For i := 0 To Length(FDecodePass) - 1 Do	FDecodePass[i] := FEncodePass[i];
    Try
	  	ExtDecodeBytes(FDecodePass);
   		FPassword := '';
		  For i := 0 To FRealLen - 1 Do	FPassword := FPassword + Chr(FDecodePass[i]);
      Result := C_NotError;
    Except
    	Result := C_Error_Decode;
    End;        
	End;        	
end;            
                
procedure TCustomCodeCrypt.EncodePassword;
Var
	i, Len: Integer;
begin
	FRealLen := Length(FPassword);//Реална дължина на паролата
  If FRealLen = 0 Then Result := C_Error_NotPassword
  Else Begin
 		Len := FRealLen;//Допълвана дължина
    If Len Mod 4 <> 0 Then Len := (Len Div 4 + 1)*4;//Допълване до кратно на 4//
		FillChar(FEncodePass, SizeOf(FEncodePass), 0);
		SetLength(FEncodePass, Len);
		For i := 0 To FRealLen - 1 Do FEncodePass[i] := Byte(FPassword[i+1]);
    Try
    	ExtEncodeBytes(FEncodePass);
      Result := C_NotError;
		Except
    	Result := C_Error_Encode;
    End;
  End;
end;

procedure TCustomCodeCrypt.SetDecodeLength(L: Integer);
begin
	FillChar(FDecodePass, SizeOf(FDecodePass), 0);
	SetLength(FDecodePass, L);
end;

procedure TCustomCodeCrypt.SetEncodeLength(L: Integer);
begin
	FillChar(FEncodePass, SizeOf(FEncodePass), 0);
	SetLength(FEncodePass, L);
end;

{ TCustomSaveCode }

procedure TCustomSaveCode.OpenFromFile(Pos: Integer);
Var
	TmpFile: TFileStream;
  Len, i, R: Integer;
  Buff: Byte;
begin
	If FileExists(Path + '\'+FileName) Then
 	 	Try
   		TmpFile := TFileStream.Create(Path + '\'+FileName, fmOpenRead);
      Try
        TmpFile.Position := Pos;
				TmpFile.ReadBuffer(FRealLen, 1);

        If FRealLen Mod 4 <> 0 Then Len := (FRealLen Div 4 + 1)*4
        Else Len := FRealLen;

			  FillChar(FEncodePass, SizeOf(FEncodePass), 0);
				SetLength(FEncodePass, Len);

				R := 1;
        For i := 0 To Len - 1 Do Begin
        	TmpFile.ReadBuffer(Buff, R);
          FEncodePass[i] := Buff;
        End;
        Result := C_NotError;
    	Finally
      	TmpFile.Free;
      End;
    Except
    	Result := C_Error_NotReadFile;
  	End

  Else Result := C_Error_NotFindFile;
end;

procedure TCustomSaveCode.SaveToFile(Pos: Integer);
Var
	TmpFile: TFileStream;
  n, R: Integer;
  Buff: Byte;
begin
	If FileExists(Path + '\'+FileName) Then

  	Try
      Try
 	 	 		TmpFile := TFileStream.Create(Path + '\'+FileName, fmOpenReadWrite);
      Except
      	Result := C_Error_NotWriteFile;
        Exit;
      End;

      TmpFile.Position := Pos;
      Try
        TmpFile.WriteBuffer(Byte(FRealLen), 1);
				R := 1;
        For n := 0 To High(FEncodePass) Do Begin
        	Buff := FEncodePass[n];
        	TmpFile.WriteBuffer(Buff, R);
        End;
        Result := C_NotError;
      Finally
      	TmpFile.Free;
      End;
      
  	Except
    	Result := C_Error_Other; 
    End

  Else Result := C_Error_NotFindFile;
end;

procedure TCustomSaveCode.SetTimeToFile(AFileName: String);
Var
	FH: THandle;
	Tf: OFSTRUCT;
  
	FileTime: TFILETIME;
  CreationTime: TFILETIME;
  LastAccessTime: TFILETIME;
  LastWriteTime: TFILETIME;
begin
  FH := OpenFile( PChar(AFileName), Tf, OF_READWRITE );
	If FH <> 0 Then Begin
  	If GetFileTime(FH,	@CreationTime, @LastAccessTime,	@LastWriteTime) Then Begin
	    If SystemTimeToFileTime(IntSystemTime, FileTime) Then
		    SetFileTime(FH, @CreationTime, @FileTime, @FileTime);
  	End;
    _lclose(FH);
	End;
end;

{ TCustomSaveResource }

Procedure TCustomSaveResource.OpenFromResource(Pos: Integer);
Var
	Res, ResAcc: THandle;
  PArr: ^TPass;
  i, Len: Integer;
begin
  try
		Res := FindResource(HInstance, PChar(ResourceName), RT_RCDATA);
		if Res <> 0 Then Begin
			ResAcc := LoadResource(HInstance, Res);
      If ResAcc <> 0 Then Begin
        PArr := @ResAcc;
        FRealLen := PArr^[Pos - 1];

        If FRealLen Mod 4 <> 0 Then Len := (FRealLen Div 4 + 1)*4
        Else Len := FRealLen;

			  FillChar(FEncodePass, SizeOf(FEncodePass), 0);
				SetLength(FEncodePass, Len);
        For i := 0 To Len - 1 Do FEncodePass[i] := PArr^[Pos + i];

        Result := C_NotError;
      End
      Else Result := C_Error_NotLoadResource
    End
		Else Result := C_Error_NotFindResource
	except
  	Result := C_Error_Other;
  end;
end;

Procedure TCustomSaveResource.FindFileResource;
Type
	TCheckFun = Function (Code: Integer): Integer;
Var
  hLib: Thandle;
  Fun: TCheckFun;
  Tmp: TFARPROC;
Begin
  hLib := LoadLibrary(PChar(Path + '\'+FileName));
  Try
    If hLib <> 0 Then Begin
     	Try
		  	Tmp := GetProcAddress(hLib, cFindFunction);          
      	If Tmp <> Nil Then Begin                             
		  		Fun := Tmp;
    			If Fun(CInportFun) = CExportFun Then Result := C_NotError
          Else Result := C_Error_NotActualFile;
    		End
        Else Result := C_Error_NotActualFile
    	Finally
      	FreeLibrary(hLib);
      End;
		End
    Else Result := C_Error_NotFindFile;
	Except
  	Result := C_Error_Other;
  End;
end;

end.

