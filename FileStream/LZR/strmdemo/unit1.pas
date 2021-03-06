unit Unit1;

interface

uses
  WinTypes, Winprocs,  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Lzrw1;

type
  TForm1 = class(TForm)
    lzrw11: Tlzrw1;
    Memo1: TMemo;
    Button1: TButton;
    Memo2: TMemo;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var Input, Output: TMemoryStream;
begin

  Lzrw11.UseStream := True;

  { compress memo1 to outputstream }
  Input:=TMemoryStream.Create;
  Output:=TMemoryStream.Create;
  lzrw11.InputStream:=Input;
  lzrw11.OutputStream:=Output;
                         { copy memo1 to inputstream }
  if Memo1.Lines.Count = 0 then exit;
  Memo1.Lines.SaveToStream(Input);
  Input.Position := 0;   { rewind input }
  lzrw11.Compress;       { and compress Input to Output }

  { and now decompress outputstream again }
  Output.Position := 0;  { rewind output }
                         { reverse the direction }
  lzrw11.InputStream:=Output;
  lzrw11.OutputStream:=Input;
  Input.Clear;           { clear input stream ! }
  lzrw11.DeCompress;     { decompress Output to Input }
  input.Position := 0;   { rewind input  again }
                         { and copy to memo2 }
  Memo2.Lines.LoadFromStream(Input);
                         { clean up streams }
  Input.Free; Output.Free;
end;

end.
