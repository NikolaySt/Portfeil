unit TVExt;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, ComCtrls;

type
  TTVExt = class(TTreeView)
  private
    { Private declarations }
  protected
    procedure DestroyWnd; override;
  public
    destructor Destroy; override;
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Stndrd', [TTVExt]);
end;

{ TTVExt }

destructor TTVExt.Destroy;
begin
  inherited;
end;

procedure TTVExt.DestroyWnd;
begin
  inherited;
end;

end.
