unit LocalSystemInfo;

interface

Type
  TDiskInfo = Record
		HDDNumber: Cardinal;
    HDDSize: Int64;
    HDDFree: Int64;
    HDDVolume: String;
  End;

Procedure GetDiskInfo(Var DiskInfo: TDiskInfo; Disk: Char);
Function BiosDate: String;

implementation

Uses Windows, SysUtils, Dialogs;

var
	aDriveToInt: array['A'..'F'] of integer = (1, 2, 3, 4, 5, 6);

Procedure GetDiskInfo(Var DiskInfo: TDiskInfo; Disk: Char);
Var
  VolumeHDD: Array[0..255] Of Char;
  NumberHDD: Cardinal;
  Len: Cardinal;
 	Flags: Cardinal;
  DiskStr: String;
  TmpDisk: Char;
  DiskID: Integer;

Begin
	Flags := FS_VOL_IS_COMPRESSED; Len := 256;
	GetVolumeInformation(
  	PChar(Disk+':\'), VolumeHDD, Len, @NumberHDD, Len, Flags, Nil, Len);
    
  DiskStr := Disk;
  DiskStr := UpperCase(DiskStr);
  TmpDisk := DiskStr[1];
  DiskID := aDriveToInt[TmpDisk];
  
  With DiskInfo Do Begin
    HDDNumber := NumberHDD;
    HDDSize   := DiskSize(DiskID);
    HDDFree   := DiskFree(DiskID);
    HDDVolume := StrPas(VolumeHDD);
  End;
End;

Function BiosDate: String;
Var
	B_Info: Array Of Byte;
  i: Integer;
Begin
	SetLength(B_Info, 8);
	Asm
  		XOR ECX, ECX
      MOV EBX, DWORD Ptr [B_Info]

@M1:  MOV EAX, DWord Ptr [000FFFF5H + ECX]
		  MOV DWORD Ptr [EBX + ECX], EAX
      ADD ECX, 04D
      CMP ECX, 08D
      JNE @M1
  End;

	Result := '';
  For i := Low(B_Info) To High(B_Info) Do Result := Result + Chr(B_Info[i]);
End;

end.
