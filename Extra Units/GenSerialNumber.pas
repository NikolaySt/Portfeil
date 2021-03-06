unit GenSerialNumber;

interface

Type
	TSerData = String[6];
  TGroup = String[3];
  
	TGenSerialNumber = Record
  	SerData1: TSerData;//Дата на програмата
    SerData2: TSerData;//Към коя гроупа е и типа на защитата
    SerData3: TSerData;//Паролата на базите данни
    SerData4: TSerData;//Уникален номер за всяка програма
    FullNumber: String;
  End;

	Function GenerateSerialNumber(Data: TDateTime; Group: TGroup;
		Security: Integer; Var NewGen: TGenSerialNumber): Boolean;  

implementation

Uses SysUtils;


Function GenUnicNum: TSerData;
Var
	S: String;
  I: Integer;
Begin
	Result := 'J063AF';
	Randomize;
  S := IntToHex(Random(255), 1) + IntToHex(Random(255), 1) + IntToStr(Random(99));
  While Length(S) < 6 Do Begin
    Repeat
      i := Random(160);
    Until (i >= 65)And(i <= 90);
    S := S + Chr(I);
  End;
  Result := S;
End;

Function GenProgNum: TSerData;
Var
	S: String;
  I: Integer;
Begin
	Result := 'AF630J';
  S := IntToHex(Random(255), 2) + IntToHex(Random(255), 1);
  While Length(S) < 6 Do Begin
    Repeat
      i := Random(160);
    Until (i >= 65)And(i <= 90);
    S := S + Chr(I);
  End;
  Result := S;	
End;


Function GenerateSerialNumber(Data: TDateTime; Group: TGroup;
	Security: Integer; Var NewGen: TGenSerialNumber): Boolean;
Begin
	Result := False;
 	With NewGen Do Begin
		SerData1   := IntToStr(Round(Data));
  	SerData2   := Group + IntToStr(Security);
		SerData3   := GenUnicNum;
  	SerData4   := GenProgNum;
  	FullNumber := SerData1+'-'+SerData2+'-'+SerData3+'-'+SerData4;
	End;
End;

end.
