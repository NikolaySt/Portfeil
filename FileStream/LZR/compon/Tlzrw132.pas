unit Tlzrw132;

interface

uses
  Classes,
  Lzrw1, Lzh, Lzrw1kh; { LZRW1 }

procedure Register;

implementation

{ Register our component. }
procedure Register;
begin
  RegisterComponents('Compon', [TLzrw1]);
end;

end.

