unit SplineExt;

interface

type
  ArrSpline = array[0..100] of Real;

function Sen(n: Integer; u: Real; x, y: ArrSpline; var b, c, d: ArrSpline): Real;
procedure ThreeDiagLineSystem(n: Integer; a, d, c, b: ArrSpline; var x: ArrSpline);
procedure spnn(n: Integer; var x, y: ArrSpline; var b, c, d: ArrSpline);
procedure SplineUnuversal(SplineType, n: Integer; var x, y: ArrSpline;
  var b, c, d: ArrSpline; StartAngle, EndAngle: Real);
procedure MakeSplineUniversalPoints(SplineType, n: Integer; var x, y: ArrSpline;
  nn: Integer; var xx, yy: ArrSpline; StartAngle, EndAngle: Real);

implementation

function Sen(n: Integer; u: Real; x, y: ArrSpline; var b, c, d: ArrSpline): Real;
var
  i: Integer;
  diff: Real;
begin
  i := n - 1;
  Result := 0;
  repeat;
    diff := u - x[i];
    if diff >= 0 then
    begin
      Result := y[i] + Diff * (b[i] + diff * (c[i] + diff * d[i]));
      i := 0; 
    end
    else
      i := i - 1;
  until i < 1;  
end;

procedure ThreeDiagLineSystem(n: Integer; a, d, c, b: ArrSpline;
  var x: ArrSpline);
var
  Ratio: Real;
  i: Integer;
begin
  for i := 2 to n do
  begin
    Ratio := a[i - 1]/d[i - 1];
    d[i] := d[i] - Ratio * c[i - 1];
    b[i] := b[i] - Ratio * b[i - 1];
  end;
  x[n] := b[n]/d[n];
  for i := n - 1 downto 1 do
    x[i] := (b[i] - c[i] * x[i + 1])/d[i]
end;

procedure spnn(n: Integer; var x, y: ArrSpline;
  var b, c, d: ArrSpline);
var
  z, a, h, del: ArrSpline;
  i: Integer;
begin
  for i := 1 to n - 1 do
  begin
    h[i] := x[i+1] - x[i];
    del[i] := (y[i+1] - y[i])/h[i];
  end;

  b[1] := 0; c[1] := 0; d[1] := 1;

  for i := 2 to n - 1 do
  begin
    a[i - 1] := h[i - 1];
    d[i] := 2 * (h[i - 1] + h[i]);
    c[i] := h[i];
    b[i] := 6 * (del[i] - del[i - i]);
  end;

  a[n - 1] := 1; b[n] := 0; d[n] := 1;

  ThreeDiagLineSystem(n, a, d, c, b, z);

  for i := 1 to n - 1 do
  begin
    b[i] := -h[i] * (z[i + 1]/6 + z[i]/3) + del[i];
    c[i] := z[i]/2;
    d[i] := (z[i + 1] - z[i])/(6*h[i]);
  end;  
end;

procedure SplineUnuversal(SplineType, n: Integer; var x, y: ArrSpline;
  var b, c, d: ArrSpline; StartAngle, EndAngle: Real);
begin
  case SplineType of
    0: spnn(n, x, y, b, c, d);
    1:;
    2:;
    3:;
  end;
end;

procedure MakeSplineUniversalPoints(SplineType, n: Integer; var x, y: ArrSpline;
  nn: Integer; var xx, yy: ArrSpline; StartAngle, EndAngle: Real);
var
  b, c, d: ArrSpline;
  step: Real;
  i: Integer;
begin
  SplineUnuversal(SplineType, n, x, y, b, c, d, StartAngle, EndAngle);
  Step := (x[n] - x[1])/(nn - 1);
  for i := 1 to nn do
  begin
    xx[i] := x[1] + (i - 1) * Step; 
    yy[i] := sen(n, xx[i], x, y, b, c, d);
  end;
end;

end.
