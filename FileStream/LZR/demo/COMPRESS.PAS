
{
Compress.pas

Small test program for my compression component "TLzrw1".

Author : Danny Heijl, may 10 1996.
         Danny.Heijl@cevi.be


 Feel free to use or give away this software as you see fit.
 Just leave the credits in place if you alter the source.

 This software is delivered to you "as is",
 no guarantees, it may blow up or trigger World War Three
 for all I know.

 If you find any bugs and let me know, I will try to fix them.

 I believe in programmers around the world helping each other
 out by distributing free source code.

}

unit Compress;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Lzrw1, StdCtrls, ExtCtrls, Spin;


type
  TForm1 = class(TForm)
    Compressor: Tlzrw1;
    Button1: TButton;
    InputFile: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    OutputFile: TEdit;
    Button2: TButton;
    RgrpComprMode: TRadioGroup;
    RBtnFast: TRadioButton;
    RBtnGood: TRadioButton;
    RBtnAuto: TRadioButton;
    Button3: TButton;
    Label3: TLabel;
    Threshold: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RBtnFastClick(Sender: TObject);
    procedure RBtnGoodClick(Sender: TObject);
    procedure RBtnAutoClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ThresholdExit(Sender: TObject);
  private
    { Private declarations }
    CompressionMode : TcompressMode;
    procedure Loaded; override;
    procedure DisableButtons;
    procedure EnableButtons;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.DFM}

procedure TForm1.DisableButtons;
begin
  Button1.Enabled := False;
  Button2.Enabled := False;
  Button3.Enabled := False;
  Update;
end;

procedure TForm1.EnableButtons;
begin;
  Button1.Enabled := True;
  Button2.Enabled := True;
  Button3.Enabled := True;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   DisableButtons;
   try
     Compressor.CompressMode := CompressionMode;
     Compressor.InputFile := InputFile.Text;
     Compressor.OutputFile := OutputFile.Text;
     Compressor.Compress;
   finally
     EnableButtons;
   end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   DisableButtons;
   try
     Compressor.CompressMode := CompressionMode;  { does autodetect, really }
     Compressor.InputFile := InputFile.Text;
     Compressor.OutputFile := OutputFile.Text;
     Compressor.DeCompress;
   finally
     EnableButtons;
   end;
end;

procedure TForm1.RBtnFastClick(Sender: TObject);
begin
  CompressionMode := Fast;
end;

procedure TForm1.RBtnGoodClick(Sender: TObject);
begin
  CompressionMode := Good;
end;

procedure Tform1.Loaded;
begin
  inherited Loaded;
  CompressionMode := Auto;
  RbtnAuto.Checked := True;     {    Fast }
end;

procedure TForm1.RBtnAutoClick(Sender: TObject);
begin
  CompressionMode := Auto;
end;

procedure TForm1.Button3Click(Sender: TObject);
var

  Cmode : TcompressMode;

begin
  DisableButtons;
  try
    Compressor.InputFile := InputFile.Text;
    if (Compressor.Inputfile <> '') then begin
      Cmode := Compressor.Advise;
      if (Cmode = Good) then begin
        RBtnGoodClick(Self);
        RBtnGood.Checked := True;
      end
      else begin
        RBtnFastClick(Self);
        RBtnFast.Checked := True;
      end;
    end
    else  begin
      ActiveControl := InputFile;
    end;
  finally
    EnableButtons;
  end;
end;


procedure TForm1.ThresholdExit(Sender: TObject);
begin
  if Length(Threshold.Text) = 0 then
    Threshold.Value := 40;
  Compressor.Threshold := Threshold.Value;
end;

end.
