// FileCheck of Directories for Controlling Computer Media
// efg, July/Aug 1999

program FileCheck;

uses
  Forms,
  ScreenFileCheck in 'ScreenFileCheck.pas' {FormFileList},
  FileListLibrary in 'FileListLibrary.pas',
  CRC32 in 'crc32.pas',
  Dbt_h in 'Dbt_h.pas',
  TokenLibrary in 'TokenLibrary.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormFileList, FormFileList);
  Application.Run
end.
