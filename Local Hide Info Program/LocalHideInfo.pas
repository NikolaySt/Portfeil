unit LocalHideInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    EdtFileName: TEdit;
    LblFileName: TLabel;
    Label1: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

Uses CodePassword;

{$R *.DFM}

procedure TForm2.Button1Click(Sender: TObject);
Var
	F: TextFile;
  n, i, Len: Integer;
  Code: TCustomCodeCrypt;
  TmpStr: String;
begin
	AssignFile(F, ExtractFileDir(ParamStr(0))+'\'+EdtFileName.Text);
  Rewrite(F);
  Code := TCustomCodeCrypt.Create;
  Try
	  For i := 0 To Memo1.Lines.Count - 1 Do Begin
  		Code.Password := Memo1.Lines.Strings[i];
  		Code.EncodePassword;
      If Code.Result = C_NotError Then Begin
	      TmpStr := '';
  	    For n := Low(Code.EncodePass) To High(Code.EncodePass) Do
    	  	TmpStr := TmpStr +', '+ IntToStr(Code.EncodePass[n]);
          
        Len := Code.RealLen;
        If Len Mod 4 <> 0 Then Len := (Len Div 4 + 1)*4;

        TmpStr := IntToStr(Len)+','+ IntToStr(Code.RealLen)+'#'+TmpStr;
	  		WriteLn(F, TmpStr);
      End;
  	End;
  Finally
  	Code.Free;
	  CloseFile(F);
  End;
end;

end.
