unit SecurityPrograms;

interface

Uses CodePassword;

Type
	TSecDate = Record
  	Day: Integer;
    Month: Integer;
    Year: Integer;
  End;

  TCustomSerialProgram = Class(TCustomSaveResource)
  Public
   	Procedure CompareSerial(Pos: Integer);
		Procedure ComapreSerialProgramRun(Pos: Integer);
  End;

  TCustomRegisterProgram = Class(TCustomSerialProgram)
  private
    FDiskDrive: Char;
    Function GetFloppyInfo: String;
    Function GetSystemInfo: String;
  Protected
    Procedure AdditionalRegister(Pos: Integer);
  Public
  	Procedure IsRegisterFile(Pos: Integer; ARegister: Byte);
    Procedure GetSerialNumber(Pos: Integer);

    Procedure RegisterProgramToHDD(Pos: Integer; ARegister: Byte);
    Procedure RegisterProgramToFloppy(Pos: Integer; ARegister: Byte);

    Procedure CompareOriginalFloppy(APos, BPos: Integer);
    Procedure CompareSecurity(Pos: Integer);

  	Property DiskDrive: Char Read FDiskDrive Write FDiskDrive;
  End;

  TCustomPasswordProgram = Class(TCustomRegisterProgram)
  Public
		Procedure IntWritePassword(Pos: Integer);
		Procedure IntComparePassword(Pos: Integer);
  End;

  TCustomUnRegisterProgram = Class(TCustomPasswordProgram)
		Procedure RemoveProtectionToHDDDisk(Pos: Integer);
    Procedure RemoveProtectionToFloppyDisk(Pos: Integer; ARegister: Byte);
  End;

  TSecurityProgram = Class(TCustomUnRegisterProgram);

implementation

Uses Windows, Classes, Sysutils, LocalSystemInfo, WinRegistrySecurity,
	FileSystemSecurity, MyConst, Dialogs;

{ TCustomSerialProgram }

procedure TCustomSerialProgram.ComapreSerialProgramRun(Pos: Integer);
begin
	FindFileResource;
  If Result = C_NotError Then
    Try
			OpenFromResource(2);
      If Result = C_NotError Then Begin
      	DecodePassword;
        If Result = C_NotError Then Begin
					OpenFromFile(Pos);
          If Result = C_NotError Then ComparePassowrd(False);
      	End;
      End;
		Except
 	 		Result := C_Error_Other;
    End;
end;

Procedure TCustomSerialProgram.CompareSerial(Pos: Integer);
Begin
	FindFileResource;
  If Result = C_NotError Then
    Try
			OpenFromResource(2);
      If Result = C_NotError Then Begin
      	ComparePassowrd(False);
        If Result = C_NotError Then Begin
					OpenFromFile(Pos);
      		If Result = C_NotError Then ComparePassowrd(False)
      	End;
      End;
		Except
 	 		Result := C_Error_Other;
    End;
End;

{ TCustomRegisterProgram }

procedure TCustomRegisterProgram.AdditionalRegister(Pos: Integer);
begin
  Try
  	Password := GetSystemInfo;
    EncodePassword;
    If Result = C_NotError Then begin
    	SaveToFile(Pos);
      If Result = C_NotError Then Begin
				If CreateSecFiles And CreateSecKey(cSecRegistry) Then
        	Result := C_NotError
			  Else
        	Result := C_Error_Other;
      End;
		End;
	Except
  	Result := C_Error_Other;
  End;
end;

procedure TCustomRegisterProgram.CompareOriginalFloppy(APos, BPos: Integer);
Var
	FH: THandle;
  Tf: OFSTRUCT;
  CreationTime: TFILETIME;
  LastAccessTime: TFILETIME;
  LastWriteTime: TFILETIME;

  SystemTime: TSYSTEMTIME;
begin
  FindFileResource;
  If Result = C_NotError Then
    Try
			OpenFromFile(APos);
			If Result = C_NotError Then Begin

      	ComparePassowrd(False);
        If Result = C_NotError Then Begin
       		Password := GetFloppyInfo;
          OpenFromFile(BPos);
       		ComparePassowrd(False);
          If Result = C_NotError Then Begin

						FH := OpenFile(PChar(Path+'\'+FileName), Tf, OF_READ);
						If FH <> 0 Then
            	Try
              
							 If	GetFileTime(FH,
               			@CreationTime, @LastAccessTime,	@LastWriteTime) Then Begin
                                                
             			FileTimeToSystemTime(CreationTime, SystemTime);

              		If Not( (SystemTime.wDay = IntSystemTime.wDay) And
                		(SystemTime.wMonth = IntSystemTime.wMonth) And
                 		(SystemTime.wYear = IntSystemTime.wYear) ) Then

                  		Result := C_Error_NotCompare;
              	End
                Else Result := C_Error_NotReadFile;;
                    
              Finally
	              _lclose(FH);
              End
            Else Result := C_Error_NotReadFile;

          End;
        End;

      End;
		Except
			Result := C_Error_Other;
    End;
end;

procedure TCustomRegisterProgram.CompareSecurity(Pos: Integer);
begin
	FindFileResource;
  If Result = C_NotError Then
    Try
			OpenFromFile(Pos);
//TODO: Поглед на информацията за компютъра
			DecodePassword;
      Password := GetSystemInfo;
      ComparePassowrd(False);
			If Result = C_NotError Then Begin
      	If Not(FindSecValue(cSecRegistry) And FindSecFiles) Then
        	Result := C_Error_NotCompare; 
      End;
		Except
			Result := C_Error_Other;
    End;
End;

procedure TCustomRegisterProgram.IsRegisterFile(Pos: Integer;
	ARegister: Byte);
Var
	Stream: TFileStream;
  C: Integer;
  Buff: Byte;
Begin
  FindFileResource;
  If Result = C_NotError Then
    Try
			Stream :=
        	TFileStream.Create(Path + '\' + FileName, fmOpenRead);
      Try
      	C := 1;
      	Stream.Position := Pos - 1;
        Stream.ReadBuffer(Buff, C);
				If Buff =  ARegister Then Result := C_NotError
        Else Result := C_Error_NotRegister;
			Finally
      	Stream.Free;
      End;
		Except
     	Result := C_Error_NotReadFile;
    End;
end;

Function TCustomRegisterProgram.GetFloppyInfo: String;
Var
	Info: TDiskInfo;
  Str: String;
Begin
  GetDiskInfo(Info, DiskDrive);
  Try
  	Str := IntToHex(HiWord(Info.HDDNumber), 4)+'-'+IntToHex(LoWord(Info.HDDNumber), 4);
  	Str := Str+','+IntToStr(Info.HDDSize);
  	Result := Str;
	Except
  	Result := '';
  End;
End;

function TCustomRegisterProgram.GetSystemInfo: String;
Var
	Info: TDiskInfo;
  BDate: String;
  Str: String;
Begin
  GetDiskInfo(Info, 'C');
  BDate := BiosDate;
  Str := IntToHex(HiWord(Info.HDDNumber), 4)+'-'+IntToHex(LoWord(Info.HDDNumber), 4);
  Str := Str+','+IntToStr((Info.HDDSize Div 1024) Div 1024);
  Str := Str+','+BDate;
  Result := Str;
end;

procedure TCustomRegisterProgram.RegisterProgramToFloppy(Pos: Integer;
  ARegister: Byte);
Var
	Stream: TFileStream;
  C: Integer;
  Buff: Byte;
  i: Integer;
Begin
  FindFileResource;
  If Result = C_NotError Then
    Try
			Stream :=
        	TFileStream.Create(DiskDrive + ':\' + FileName, fmOpenReadWrite);
      Try
      	C := 1;
      	Stream.Position := Pos - 1;
        Stream.ReadBuffer(Buff, C);
				If Buff <> 0 Then Result := C_Error_AlreadyRegister
        Else Begin
	        Buff := ARegister;
  	      Stream.Position := Pos - 1;
    	    Stream.WriteBuffer(Buff, C);
      	  Result := C_NotError;
          Try
          	//Заблуждаващо записване на прозволни байтове
          	Stream.Position  := Pos + 150;
            Randomize;
            For i := 0 to 50 Do Begin
            	Buff := Random(255);
            	Stream.WriteBuffer(Buff, C);
            End;
          Except
          End;
      	End;
			Finally
      	Stream.Free;
      End;
      SetTimeToFile(DiskDrive + ':\' + FileName);
		Except
     	Result := C_Error_NotWriteFile;
    End;
end;

procedure TCustomRegisterProgram.RegisterProgramToHDD(Pos: Integer;
	ARegister: Byte);
Var
	Stream: TFileStream;
  C: Integer;
  Buff: Byte;
Begin
	FindFileResource;
	If Result = C_NotError Then
    Try
			Stream :=	TFileStream.Create(Path +'\'+ FileName, fmOpenReadWrite);
		  Try
      	C := 1;
    		Buff := ARegister;
		  	Stream.Position := Pos - 1;
     		Stream.WriteBuffer(Buff, C);
        Result := C_NotError;
			Finally
    		Stream.Free;
		  End;
      SetTimeToFile(Path +'\'+ FileName);
    	AdditionalRegister(Pos+36);
		Except
    	Result := C_Error_NotWriteFile
    End;  
End;

procedure TCustomRegisterProgram.GetSerialNumber(Pos: Integer);
begin
	FindFileResource;
  If Result = C_NotError Then
    Try
			OpenFromFile(Pos);
      If Result = C_NotError Then DecodePassword;
		Except
 	 		Result := C_Error_Other;
    End;
end;

{ TCustomPasswordProgram }

procedure TCustomPasswordProgram.IntComparePassword(Pos: Integer);
begin
	FindFileResource;
  If Result = C_NotError Then
    Try
    	OpenFromFile(Pos);
      If Result = C_NotError Then ComparePassowrd(True);
		Except
    	Result := C_Error_Other;
    End;
end;

procedure TCustomPasswordProgram.IntWritePassword(Pos: Integer);
begin
	FindFileResource;
  If Result = C_NotError Then
    Try
	    EncodePassword;
			If Result = C_NotError Then SaveToFile(Pos);
		Except
    	Result := C_Error_Other;
    End;
end;

{ TCustomUnRegisterProgram }

procedure TCustomUnRegisterProgram.RemoveProtectionToFloppyDisk(
  Pos: Integer; ARegister: Byte);
Var
	Stream: TFileStream;
  C: Integer;
  Buff: Byte;
  i: Integer;
Begin
	FindFileResource;
  If Result = C_NotError Then
  	Try
			Stream :=
      	TFileStream.Create(Path + '\'+FileName, fmOpenReadWrite);
			Try
      	Try
      		C := 1; Buff := ARegister;
        	Stream.Position := Pos - 1;
        	Stream.WriteBuffer(Buff, C);
        	Result := C_NotError;
        Except
        	Result := C_Error_NotAccessToDisk;
        End;
        Try
        	//Заблуждаващо записване на прозволни байтове
          C := 1;
        	Stream.Position  := Pos + 130;
          Randomize;
          For i := 0 to 70 Do Begin
          	Buff := Random(255);
          	Stream.WriteBuffer(Buff, C);
          End;
        Except
        End;
			Finally
    		Stream.Free;
    	End;
      SetTimeToFile(Path +'\'+ FileName);
		Except
    	Result := C_Error_NotWriteFile;
    End;
end;

procedure TCustomUnRegisterProgram.RemoveProtectionToHDDDisk(Pos: Integer);
begin
	FindFileResource;
  If Result = C_NotError Then 
    Try
    	Password :=
      	'#@$%#'+#0+#20+#20+#14+'$T$%'+#0+#20+#20+
      	#14+'^#$6'+#0+#20+#20+#14+'^#$D^X#RGEYER^';
      EncodePassword;
			SaveToFile(Pos);
      SetTimeToFile(Path +'\'+ FileName);
      If Result = C_NotError Then Begin
  	    DeleteSecKey;
	      DeleteSecFiles;
			End;			
		Except
    	Result := C_Error_Other;
    End;
end;

end.


