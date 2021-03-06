unit SetupReg;

interface

Uses Classes, Forms, SysUtils, Dialogs, DB, DBtables, Registry, Windows,
	DBgrids, SecurityPrograms, Controls;

Type
	TCustomOptions = Class
  Private
  	FSecProgram: TSecurityProgram;
    FReg: TRegistry;
    function GetDBPassword: String;
    procedure ErrorRunProgram;
    procedure RegisterProgram;
    procedure RunProgram;
  Public
  	Constructor Create;
    Destructor Destroy; Override;

    Procedure SaveTablesExt(Sender: TDBGrid; Name: ShortString);
    Procedure OpenTablesExt(Sender: TDBGrid; Name: ShortString);

    Procedure SaveWindowExt(Sender: TForm; Name: ShortString);
    Procedure OpenWindowExt(Sender: TForm; Name: ShortString);        

    Procedure DeleteTmpFile;

    Procedure SavePathArhive;
    Procedure OpenPathArhive;

    Procedure SaveProgramRegister(Name, Firma: String);
    Procedure OpenProgramRegister(Var Name, Firma: String);

    Procedure OpenHelpFile;

    Procedure StartProgram;

    //Скрита информация за програмата
    Procedure LocalHideInfoProgram;
    Function BackPath(Path: String): String;

  	Property SecProgram: TSecurityProgram Read FSecProgram;
    Property DBPassword: String Read GetDBPassword;
  End;

Var
  ProgOptions: TCustomOptions;

implementation

Uses Invest, Spisuk, Prodagbi, Dohod, Portfeil, Upravlen, Kartotek, MyConst,
	CodePassword, RegisterProgram, Password, DlgMess;

constructor TCustomOptions.Create;
begin
	Inherited;
  FReg := TRegistry.Create;
	FReg.RootKey := C_khRoot;
	FSecProgram := TSecurityProgram.Create;
end;

Destructor TCustomOptions.Destroy;
Begin
	FReg.Free;
	FSecProgram.Free;
	Inherited;
End;

procedure TCustomOptions.SaveWindowExt(Sender: TForm; Name: ShortString);
Var
	S: TWindowState;
begin
	With FReg Do Begin
    If KeyExists(C_Windows+Name) Then
    	OpenKey(C_Windows+Name, False)
    Else
    	OpenKey(C_Windows+Name, True);
    WriteInteger('Left', Sender.Left);
    WriteInteger('Top', Sender.Top);
    WriteInteger('Width', Sender.Width);
    WriteInteger('Height', Sender.Height);
    S := Sender.WindowState;
    Case S Of
    	wsNormal   : WriteInteger('State', 0);
      wsMinimized: WriteInteger('State', 1);
      wsMaximized: WriteInteger('State', 2);
    Else
    	WriteInteger('State', -1);
    End;
    CloseKey;
  End;
end;

Procedure TCustomOptions.OpenWindowExt(Sender: TForm; Name: ShortString);
Var
	i: Integer;
Begin
	With FReg Do Begin
    If Not KeyExists(C_Windows + Name) Then Exit;

    OpenKey(C_Windows+Name, False);

    i := ReadInteger('State');
    Case i Of
    	0:Begin
				Sender.Left  := ReadInteger('Left');
        Sender.Top   := ReadInteger('Top');
    		If Sender.Name <> 'DlgInvest' Then Begin
          Sender.Width := ReadInteger('Width');
          Sender.Height:= ReadInteger('Height');
        End;
      End;
      1: Sender.WindowState := wsMinimized;
      2: Sender.WindowState := wsMaximized;
    Else
			Sender.Left  := ReadInteger('Left');
      Sender.Top   := ReadInteger('Top');
    	If Sender.Name <> 'DlgInvest' Then Begin
        Sender.Width := ReadInteger('Width');
        Sender.Height:= ReadInteger('Height');
      End;
      Sender.WindowState := wsNormal;
    End;
    CloseKey;
	End;
End;

procedure TCustomOptions.DeleteTmpFile;
Var
	Path: String;
begin
	Path := ExtractFileDir(ParamStr(0));
  Path := Path + '\Pdoxusrs.lck';
  DeleteFile(PChar(Path));
end;

procedure TCustomOptions.OpenPathArhive;
begin
	With FReg Do Begin
		If Not KeyExists(C_Arhiv) Then Exit;
    OpenKey(C_Arhiv, False);
    Try
			G_V_SavePath := ReadString('Path');
    Finally
		  CloseKey;
    End;
  End;
end;

procedure TCustomOptions.SavePathArhive;
begin
	With FReg Do Begin
    If KeyExists(C_Arhiv) Then
    	OpenKey(C_Arhiv, False)
    Else
    	OpenKey(C_Arhiv, True);
    Try
		  WriteString('Path', G_V_SavePath);
    Finally
		  CloseKey;
    End;
	End;
end;

procedure TCustomOptions.OpenTablesExt(Sender: TDBGrid; Name: ShortString);
Var
	i, k: Integer;
  Count: Integer;
Begin
	With FReg Do Begin
    If Not KeyExists(C_Tables + Name) Then Exit;
    OpenKey(C_Tables+Name, False);
    Try
    	Count := Sender.Columns.Count;
    	For i := 0 To Count - 1 Do Begin
    		k := ReadInteger('Columns ' +IntToStr(i));
		    if k > 0 Then Sender.Columns.Items[i].Width := k;
    	End;
    Finally
		  CloseKey;
    End;
	End;
end;

procedure TCustomOptions.SaveTablesExt(Sender: TDBGrid; Name: ShortString);
Var
	k, i: Integer;
  Count: Integer;
Begin
	With FReg Do Begin
    If KeyExists(C_Tables + Name) Then
    	OpenKey(C_Tables+Name, False)
    Else
    	OpenKey(C_Tables+Name, True);
    Try
    	Count := Sender.Columns.Count;
    	For i := 0 To Count - 1 Do Begin
    		k := Sender.Columns.Items[i].Width;
		    WriteInteger('Columns ' +IntToStr(i), k);
    	End;
		Finally
		  CloseKey;
    End;
	End;
end;

procedure TCustomOptions.OpenHelpFile;
begin
	With FReg Do Begin

		If KeyExists(C_Procduct) Then	Begin
      OpenKey(C_Procduct, False);
      Try
				Application.HelpFile := ReadString('HelpFile')+'\'+C_HelpFile;
      Finally
			  CloseKey;
      End;
    End;

	End;
end;

procedure TCustomOptions.OpenProgramRegister(var Name, Firma: String);
begin
	With FReg Do Begin
   	OpenKey(C_Registry, True);
    Try
    	Name := ReadString('RegisteredOwner');
	    Firma := ReadString('RegisteredOrganization');
		Finally
		  CloseKey;
    End;
	End;
end;

procedure TCustomOptions.SaveProgramRegister(Name, Firma: String);
Begin
	With FReg Do Begin
   	OpenKey(C_Registry, True);
    Try
    	WriteString('RegisteredOwner', Name);
	    WriteString('RegisteredOrganization', Firma);
		Finally
		  CloseKey;
    End;
	End;
end;

function TCustomOptions.GetDBPassword: String;
Var
	Str1, Str2, Str3: String;
begin
	With SecProgram Do Begin
    ResourceName := cResourceName;
    OpenFromResource(2);
    DecodePassword;
  End;
  Result := SecProgram.Password;
  
  Delete(Result, 1, Pos('-', Result));
  Delete(Result, 1, Pos('-', Result));
  Result := Copy(Result, 1, Pos('-', Result) - 1);
  Str1 := Copy(Result, 1, 2);
  Str2 := Copy(Result, 3, 2);
  Str3 := Copy(Result, 5, 2);
  Result := Str2+Str3+Str1+'AP1';
end;

procedure TCustomOptions.StartProgram;
begin
	With SecProgram Do Begin
  	Path := ExtractFileDir(ParamStr(0));
    FileName := cFileLIb;
    ResourceName := cResourceName;
  	//IsRegisterFile(cSerialPos, cHDDRegister);
//TODO: Disable register
//-------- Трябва да се махне ----------
		RunProgram;
    Exit;
//--------
    Case Result Of
    	C_Error_NotRegister: RegisterProgram;
      C_Error_NotReadFile: ErrorRunProgram;
			C_NotError         : RunProgram;
    Else
    	DlgInvest.ActiveTimer := True;
    End;
  End;
	If DlgInvest.ActiveTimer Then DlgInvest.TimerOut.Enabled := True;
end;

Procedure TCustomOptions.RegisterProgram;
Begin
	If DlgRegProgram.ShowModal <> mrOK Then DlgInvest.ActiveTimer := True;
End;

Procedure TCustomOptions.ErrorRunProgram;
Begin                        
	DlgInvest.ActiveTimer := True; 	
End;

Procedure	TCustomOptions.RunProgram;
Begin
	With SecProgram Do Begin
{
		ComapreSerialProgramRun(cSerialPos);
	  If Result = C_NotError Then Begin
   		G_V_Serial := Password;
      CompareSecurity(cInfoPos);

      If Result = C_NotError Then Begin
}
     	 	Password := cNoPassword;
		 	 	IntComparePassword(cPassPos);
        Case Result Of
        	C_NotError: ;
          C_Error_NotCompare:
          	If Not DlgPass.Execute Then	DlgInvest.ActiveTimer := True;
        Else
					DlgInvest.ActiveTimer := True;
        End;
{
    	End
      Else DlgInvest.ActiveTimer := True;

    End
    Else DlgInvest.ActiveTimer := True;
}    
  End;
End;

procedure TCustomOptions.LocalHideInfoProgram;
Var
	TmpStr: String;
  Code: TCustomCodeCrypt;

	Procedure DecodeArray(Const LAInfo: Array of Byte);
  Var
  	n: Integer;
  Begin
    Code.RealLen := LAInfo[0];
    Code.SetEncodeLength(High(LAInfo));
    For n := 1 To High(LAInfo)  Do
    	Code.EncodePass[n - 1] := LAInfo[n];
    Code.DecodePassword;
    If Code.Result = C_NotError Then
	    TmpStr := TmpStr + Code.Password + #13;
  End;

begin
	TmpStr := '';
  Code := TCustomCodeCrypt.Create;
  Try
    DecodeArray(LocalHideInfo1);
    DecodeArray(LocalHideInfo2);
    MessageDlg1(TmpStr, mtCustom, [mbOK], 0);      
  Finally
  	Code.Free;
  End;
end;

function TCustomOptions.BackPath(Path: String): String;
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

Initialization
Begin
	ProgOptions := TCustomOptions.Create;
End;

end.
