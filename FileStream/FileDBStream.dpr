program FileDBStream;

{%File 'Interface.txt'}
{%File 'HeaderInfo.txt'}
{%File 'Operations.txt'}

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  MemDB in 'MemDB.pas',
  MemSave in 'MemSave.pas',
  Lzrw1kh in 'Lzrw1kh.pas',
  ProtectData in 'ProtectData.pas',
  ConstArr in 'ConstArr.pas',
  ConstMemSave in 'ConstMemSave.pas',
  ConstMemDB in 'ConstMemDB.pas';

{$R *.res}

begin
  Application.Initialize;
  DBMemSession.AddPassword('master');
  DBMemSession.AddPassword('Master');  
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
