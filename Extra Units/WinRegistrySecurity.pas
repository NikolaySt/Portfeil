unit WinRegistrySecurity;

interface

Uses Registry, Windows;

Const
	cHideKey: String = '\Config\0001\System\CurrentActiveSet\Control';
  cDelKey: String  = '\Config\0001\System\CurrentActiveSet';
  cValue: String   = 'AutoActiveOle';
  cRootKey = HKEY_LOCAL_MACHINE;

  Function FindSecValue(Value: String): Boolean;
  Function CreateSecKey(Value: String): Boolean;
  Function DeleteSecKey: Boolean;

implementation

Function FindSecValue(Value: String): Boolean;
Var
	Reg: TRegistry;
  Tmp: String;
Begin
	Try
		Reg := TRegistry.Create;
    Reg.RootKey := cRootKey;
    Try
    	If Not Reg.KeyExists(cHideKey) Then	Result := False
      Else Begin
      	Reg.OpenKey(cHideKey, False);
				Tmp := Reg.ReadString(cValue);
        If Tmp = Value Then Result := True
        Else Result := False;
    	End;
    Finally
      Reg.CloseKey;
      Reg.Free;
    End;
	Except
  	Result := False;
  End;
End;

Function CreateSecKey(Value: String): Boolean;
Var
	Reg: TRegistry;
Begin
	Try
		Reg := TRegistry.Create;
    Reg.RootKey := cRootKey;
    Try
    	Reg.OpenKey(cHideKey, True);
    	Reg.WriteString(cValue, Value);
      Result := True;
    Finally
      Reg.CloseKey;
      Reg.Free;
    End;
	Except
  	Result := False;
  End;
End;

Function DeleteSecKey: Boolean;
Var
	Reg: TRegistry;
Begin
	Try
		Reg := TRegistry.Create;
    Reg.RootKey := cRootKey;
    Try
    	If Reg.KeyExists(cDelKey) Then Begin
		    If Reg.DeleteKey(cDelKey) Then Result := True
        Else Result := False;
      End
      Else Result := True;
    Finally
      Reg.Free;
    End;
	Except
  	Result := False;
  End;
End;

end.
