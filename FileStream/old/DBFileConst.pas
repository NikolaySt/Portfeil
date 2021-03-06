unit DBFileConst;

interface

{*******************************************************************************
  General Data  
*******************************************************************************}

const
  file_code_begin = $3523;
  file_ver = $0001;

  file_marker_begin = $AA00AA00;
  file_marker_end = $FF00FF00;

{*******************************************************************************
    Fields type
*******************************************************************************}
const
  file_ftString = $00000001;
  file_ftSmallint = $00000002;
  file_ftInteger = $00000003;
  file_ftWord = $00000004;
  file_ftBoolean = $00000005;
  file_ftFloat = $00000006;
  file_ftCurrency = $00000007;
  file_ftBCD = $00000008;
  file_ftDate = $00000009;
  file_ftTime = $0000000A;
  file_ftDateTime = $0000000B;
  file_ftBytes = $0000000C;
  file_ftVarBytes = $0000000D;
  file_ftAutoInc = $0000000E;
  file_ftADT = $0000000F;
  file_ftFixedChar = $00000010;
  file_ftWideString = $00000011;
  file_ftLargeint = $00000012;
  file_ftVariant = $00000013;
  file_ftGuid = $00000014;

  //BlobTypes
  file_ftBlob = $00000015;
  file_ftMemo = $00000016;
  file_ftGraphic = $00000017;
  file_ftFmtMemo = $00000018;
  file_ftParadoxOle = $00000019;
  file_ftDBaseOle = $0000001A;
  file_ftTypedBinary = $0000001B;
  file_ftOraBlob = $0000001C;
  file_ftOraClob = $0000001D;

implementation
  
end.
