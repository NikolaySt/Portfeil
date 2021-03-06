unit DataAccessLock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDataLock = class(TDataModule)
    TblBIndex: TTable;
    TblBLihva: TTable;
    TblPazrCena: TTable;
    TblPortData: TTable;
    procedure DataLockCreate(Sender: TObject);
    procedure DataLockDestroy(Sender: TObject);
  public
  	Procedure OpenAll;
    Procedure CloseAll;
  end;

var
  DataLock: TDataLock;

implementation

{$R *.DFM}

{ TDataLock }

procedure TDataLock.CloseAll;
begin
 	TblBIndex.Close;
 	TblBLihva.Close;
  TblPazrCena.Close;
  TblPortData.Close;
end;

procedure TDataLock.OpenAll;
begin
	TblBIndex.Open;
  TblBLihva.Open;
  TblPazrCena.Open;
  TblPortData.Open;
end;

procedure TDataLock.DataLockCreate(Sender: TObject);
begin
	OpenAll;
end;

procedure TDataLock.DataLockDestroy(Sender: TObject);
begin
	CloseAll;
end;

end.
