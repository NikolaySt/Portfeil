unit ProtectData;

interface

uses CRC32, Windows, SysUtils, ConstArr;

procedure InternalEncode(Data: BufferPtr; Len: Integer; KeyMask: Longword = 0);
procedure InternalDecode(Data: BufferPtr; Len: Integer; KeyMask: Longword = 0);
function GenerationKeyMask(Password: string; Len: Integer): Longword;

implementation

const
	cMask1 = $FFCCAABB;
	cMask2 = $91191661;
  cMask3 = $C33C6226;

procedure InternalDecode(Data: BufferPtr; Len: Integer; KeyMask: Longword = 0);
var
	Step: Integer;
begin
  if Len <= 0 then Exit;
  Step := 0;
  repeat
  	asm
    	MOV EDX, Step
    	PUSH EAX
      PUSH EBX
      PUSH ECX
			MOV EBX, DWORD Ptr [Data]
 			MOV EAX, DWORD Ptr [EBX + EDX]

      XOR EAX, KeyMask
	    XOR EAX, cMask3
      XOR EAX, cMask2
      XOR EAX, cMask1

      //????????? ?? EAX ? ??????
			MOV EBX, DWORD Ptr [Data]
 			MOV DWORD Ptr [EBX + EDX], EAX

    	POP ECX
      POP EBX
      POP EAX
    end;
    Step := Step + 4;
  until Step >= Len
end;

procedure InternalEncode(Data: BufferPtr; Len: Integer; KeyMask: Longword = 0);
var
	Step: Integer;
begin
  if Len <= 0 then Exit;
  Step := 0;
  repeat
  	asm
    	MOV EDX, Step
    	PUSH EAX
      PUSH EBX
      PUSH ECX
			MOV EBX, DWORD Ptr [Data]
 			MOV EAX, DWORD Ptr [EBX + EDX]

      XOR EAX, cMask1
      XOR EAX, cMask2
      XOR EAX, cMask3
      XOR EAX, KeyMask

      //????????? ?? EAX ? ??????
			MOV EBX, DWORD Ptr [Data]
 			MOV DWORD Ptr [EBX + EDX], EAX

    	POP ECX
      POP EBX
      POP EAX
    end;
    Step := Step + 4;
  until Step >= Len
end;

function GenerationKeyMask(Password: string; Len: Integer): Longword;
begin
  Result := 0;
  if Len > 0 then CalcCRC32(@Password[1], Len, Result)
end;

end.
