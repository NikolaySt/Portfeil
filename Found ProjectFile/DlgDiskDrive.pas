unit DlgDiskDrive;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, FileCtrl;

type
  TDlgDrive = class(TForm)
    DriveBox1: TDriveComboBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
		Function Execute(Var Drv: Char): Boolean;
  end;

var
  DlgDrive: TDlgDrive;

implementation

{$R *.DFM}

{ TForm2 }

function TDlgDrive.Execute(Var Drv: Char): Boolean;
begin
	If ShowModal = mrOK Then Result := True
 	Else Result := False;
 	Drv := DriveBox1.Drive;
end;

procedure TDlgDrive.FormCreate(Sender: TObject);
begin
	DriveBox1.Drive := 'A';
end;

end.
