unit ConstMemSave;

interface

const
  c_coding: byte     = $A1;
  c_no_coding: byte  = $A2;
  c_compres: byte    = $A3;
  c_no_compres: byte = $A4;
  c_db_file: Word    = $AAA5;

  c_master_info = 'Ariadna ltd. <c> 2002';
  c_invalid_password = 'Invalid password';
  c_invalid_database = 'File is not Database';
  c_incorect_version = 'Other file version';
  c_crc_validate = 'Error CRC32';

implementation

end.
 