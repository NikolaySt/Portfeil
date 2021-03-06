unit MyConst;

interface

Uses Classes, SysUtils, Windows, SecurityPrograms;

Type
  TSIntNames = 0..29;

  TOptionWin = (owPortfeil, owKartoteka, owUpravlenie, owNone);

  TInfoInv = Record
  	No       : Integer;
  	VidInv   : String;
		Drugestvo: String;
    Data     : TDateTime;
    Broi     : LongInt;
    Cena     : Real;
    Razhod   : Real;
    //-----------------
    AData    : TDateTime; //Дата   /падеж
    B        : Real; //за лв   / номинал
    C        : Real; //за процент  / купонен лихвен процент
    CC       : Integer; //за Бройки
    //------------------
    FileName : String[8];
  End;

Const
  C_khRoot 	        = HKEY_CURRENT_USER;
    C_Procduct      = 'Software\Ariadna\Portfeil\1.0';
    	C_Help        = C_Procduct+'\Help\';
      C_Database    = C_Procduct+'\Database\';
    	C_Windows     = C_Procduct+'\Windows\';
      C_Arhiv       = C_Procduct+'\Arhiv';
      C_Tables      = C_Procduct+'\Tables\';
      C_Registry    = C_Procduct+'\Register\';

	cSerialPos   = $E5D0 + 1;
  cInfoPos     = cSerialPos + 36;
  cPassPos     = cInfoPos + 32;
  cHDDRegister    = $01;
  cFloppyRegister = $AD;
  cNoRegister     = $00;
  
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

  cSecRegistry = 'run /x %1 %2';
  cFileLIb     = 'ArdSinfo.dll_none';
  cSetupFile   = '_install.dll_none';
  cResourceName= 'TDlgShowDrive';

	cNoPassword       = #91+'|'+'%'+#92+'$'#93;
  cDBAliasName      = 'DBasePort 1.0';

	DBaseName         = 'Portfeil';

  DBPassword: String = 'nick';

  C_HelpFile        = 'Portfeil.hlp';

  C_FileIndex       = 'BIndex.DB';
  C_FileLihva       = 'BLihva.DB';
  C_FileDataUpra    = 'DataUpra.DB';
  C_FilePazrCena    = 'PazrCena.DB';
  C_FilePortData    = 'PortData.DB';
  C_FileUpravlen    = 'Upravlen.DB';

  //Съкращенията са до 6 знака
  AShortNames: Array[TSIntNames] of PChar = (
  { 0} 'ОбА',
  { 1} 'ПрА',
  { 2} 'КПрА',

  { 3} 'КОбл',
  { 4} 'ККОбл',
  { 5} 'ДОбл',
  { 6} 'ОбОбл',
  { 7} 'ИпОбл',
  { 8} 'ПрОбл',
  { 9} 'Обл',

  {10} 'СБон',

  {11} 'ДСерт',

  {12} 'ГДРоб',
  {13} 'ГДРа',

  {14} 'КрЗап',//
  {15} 'КнБон',//

  {16} 'КолОп',
  {17} 'ПутОп',

  {18} 'Варт',

  {19} 'Права',

  {20} 'USD',
  {21} 'DEM',
  {22} 'EUR',
  {23} 'FRF',
  {24} 'CHF',
  {25} 'GBP',
  {26} 'Валута',

  {27} 'НумЦ',
  {28} 'Бжт',
  {29} 'Изкст');


  ALongNames: Array[TSIntNames] of PChar = (
  { 0}  'Обикновени акции',
  { 1}  'Привилегировани акции',
  { 2}  'Конвертируеми привилегировани акции',
  { 3}  'Корпоративни облигации',
  { 4}  'Конвертируеми корпоративни облигации',
  { 5}  'Държавни облигации',
  { 6}  'Общински облигации',
  { 7}  'Ипотечни облигации',
  { 8}  'Прехвърлящи облигации',
  { 9}  'Облигации',
  {10}  'Съкровищни бонове',
  {11}  'Депозитни сертификати',
  {12}  'Глобални депозитарни разписки(за облиг.)',
  {13}  'Глобални депозитарни разписки(за акции)',
  {14}  'Компенсаторни записи',{New}
  {15}  'Компенсационни бонове',{New}
  {16}  'Кол опции',
  {17}  'Пут опции',
  {18}  'Варанти',
  {19}  'Права',
  {20}  'Твърда валута - щатски долар',
  {21}  'Твърда валута - герм. марка',
  {22}  'Твърда валута - евро',
  {23}  'Твърда валута - френски франк',
  {24}  'Твърда валута - швейц. франк',
	{25}	'Твърда валута - английска лира',
  {26}  'Валута',{New}
  {27}  'Предмети с нумизматична ценност',
  {28}  'Бижута',
  {29}  'Произведения на изкуствата');


	LocalHideInfo1: Array[0..68] Of Byte =
		(66, 42, 66, 191, 157, 34, 95, 187, 125, 50, 92, 176, 143, 43, 87,
    171, 150, 204, 163, 95, 109, 194, 119, 95, 181, 7, 96, 146, 182, 16,
    120, 154, 174, 15, 121, 159, 189, 12, 99, 95, 188, 0, 96, 142, 184, 19,
    124, 146, 175, 2, 127, 95, 125, 50, 82, 93, 149, 47, 86, 191, 157, 44,
    178, 93, 147, 226, 188, 187, 93);
	LocalHideInfo2: Array[0..52] Of Byte =
		(50, 12, 98, 176, 185, 16, 120, 140, 167, 7, 178, 141, 125, 27, 114,
    152, 181, 15, 119, 141, 125, 194, 124, 144, 154, 12, 120, 159, 176, 5,
    178, 159, 189, 0, 114, 95, 175, 19, 98, 145, 183, 12, 96, 145, 125, 2,
    98, 144, 191, 226, 188, 145, 93);

Var
	VidInves: TStringList;
  LongName: TStringList;
  StartWindow: TOptionWin;

  G_V_SavePath: String = '';
  G_V_StartDate: TDateTime;
  G_V_Serial: String = '';

Procedure CreateVidList;
Procedure DestroyVidList;
Function CurrentDate: TDateTime;

implementation

Function CurrentDate: TDateTime;
Begin
	Result := G_V_StartDate;
End;

Procedure CreateVidList;
Var
	n: Byte;
Begin
	LongName := TStringList.Create;
  VidInves := TStringList.Create;

  For n := Low(TSIntNames) To High(TSIntNames) Do Begin
  	VidInves.Add(StrPas(AShortNames[n]));
  	LongName.Add(StrPas(ALongNames[n]));
  End;
End;

Procedure DestroyVidList;
Begin
	LongName.Free;
  VidInves.Free;
End;

Initialization
Begin
	G_V_StartDate := Date;
End;

end.
