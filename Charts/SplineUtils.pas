unit SplineUtils;

interface

type
  TArrSpline = array[1..2000] of Double;
//  TArrSpline_ext = array[1..1000] of Double;

function Sen(n: Integer; u: Double; x, y: TArrSpline; var b, c, d: TArrSpline): Double;
function DSen(n: Integer; u: Double; x, y: TArrSpline; var b, c, d: TArrSpline): Double;
procedure ThreeDiagLineSystem(n: Integer; a, b, c, d: TArrSpline; var x: TArrSpline);
procedure spnn(n: Integer; var x, y: TArrSpline; var b, c, d: TArrSpline);
procedure SplineUniversal(SplineType, n: Integer; var x, y: TArrSpline;
  var b, c, d: TArrSpline; StartAngle, EndAngle: Double);
procedure MakeSplineUniversalPoints(SplineType, n: Integer; var x, y: TArrSpline;
  nn: Integer; var xx, yy: TArrSpline; StartAngle, EndAngle: Double);

implementation

uses Windows;

function Sen(n: Integer; u: Double; x, y: TArrSpline; var b, c, d: TArrSpline): Double;
var
  i: Integer;
  diff: Double;
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

function DSen(n: Integer; u: Double; x, y: TArrSpline; var b, c, d: TArrSpline): Double;
var
  i: Integer;
  diff: Double;
begin
  i := n - 1;
  repeat;
    diff := u - x[i];
    if diff >= 0 then
    begin
      Result := b[i] + diff*(2*c[i]+diff*3*d[i]);
//      Result := y[i] + Diff * (b[i] + diff * (c[i] + diff * d[i]));
      i := 0; 
    end
    else
      i := i - 1;
  until i < 1;  
end;

procedure ThreeDiagLineSystem(n: Integer; a, b, c, d: TArrSpline;
  var x: TArrSpline);
var
  Ratio: Double;
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

procedure spnn(n: Integer; var x, y: TArrSpline;
  var b, c, d: TArrSpline);
var
  z, a, h, del: TArrSpline;
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

  ThreeDiagLineSystem(n, a, b, c, d, z);

  for i := 1 to n - 1 do
  begin
    b[i] := -h[i] * (z[i + 1]/6 + z[i]/3) + del[i];
    c[i] := z[i]/2;
    d[i] := (z[i + 1] - z[i])/(6*h[i]);
  end;
end;

procedure spbb(n: Integer; var x, y: TArrSpline;
  var b, c, d: TArrSpline; alfa, beta: Double);
var
  z, a, h, del: TArrSpline;
  i: Integer;
  alfar, betar: Double; 
begin
  alfar := alfa * ( Pi/180 );
  betar := beta * ( Pi/180 );

  for i := 1 to n - 1 do
  begin
    h[i] := x[i+1] - x[i];
    del[i] := (y[i+1] - y[i])/h[i];
  end;

  d[1] := h[1]/3;
  c[1] := h[1]/6;
  b[1] := del[1] - sin(alfar)/cos(alfar);

  for i := 2 to n - 1 do
  begin
    a[i - 1] := h[i - 1];
    d[i] := 2 * (h[i - 1] + h[i]);
    c[i] := h[i];
    b[i] := 6 * (del[i] - del[i - i]);
  end;

  d[n] := h[n-1]/3;
  a[n-1] := h[n-1]/6;
  b[n] := -del[n-1] + sin(betar)/cos(betar);

  ThreeDiagLineSystem(n, a, b, c, d, z);

  for i := 1 to n - 1 do
  begin
    b[i] := -h[i] * (z[i + 1]/6 + z[i]/3) + del[i];
    c[i] := z[i]/2;
    d[i] := (z[i + 1] - z[i])/(6*h[i]);
  end;
end;

procedure spnb(n: Integer; var x, y: TArrSpline;
  var b, c, d: TArrSpline; beta: Double);
var
  z, a, h, del: TArrSpline;
  i: Integer;
  betar: Double; 
begin
  betar := beta * ( Pi/180 );

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

  d[n] := h[n-1]/3;
  a[n-1] := h[n-1]/6;
  b[n] := -del[n-1] + sin(betar)/cos(betar);

  ThreeDiagLineSystem(n, a, b, c, d, z);

  for i := 1 to n - 1 do
  begin
    b[i] := (-h[i]) * (z[i + 1]/6 + z[i]/3) + del[i];
    c[i] := z[i]/2;
    d[i] := (z[i + 1] - z[i])/(6*h[i]);
  end;
end;

procedure spbn(n: Integer; var x, y: TArrSpline;
  var b, c, d: TArrSpline; alfa: Double);
var
  z, a, h, del: TArrSpline;
  i: Integer;
  alfar: Double;
begin
  alfar := alfa * ( Pi/180 );

  for i := 1 to n - 1 do
  begin
    h[i] := x[i+1] - x[i];
    del[i] := (y[i+1] - y[i])/h[i];
  end;

  d[1] := h[1]/3;
  c[1] := h[1]/6;
  b[1] := del[1] - sin(alfar)/cos(alfar);

  for i := 2 to n - 1 do
  begin
    a[i - 1] := h[i - 1];
    d[i] := 2 * (h[i - 1] + h[i]);
    c[i] := h[i];
    b[i] := 6 * (del[i] - del[i - i]);
  end;

  a[n - 1] := 0; b[n] := 0; d[n] := 1;

  ThreeDiagLineSystem(n, a, b, c, d, z);

  for i := 1 to n - 1 do
  begin
    b[i] := (-h[i]) * (z[i + 1]/6 + z[i]/3) + del[i];
    c[i] := z[i]/2;
    d[i] := (z[i + 1] - z[i])/(6*h[i]);
  end;
end;

procedure SplineUniversal(SplineType, n: Integer; var x, y: TArrSpline;
  var b, c, d: TArrSpline; StartAngle, EndAngle: Double);
begin
  case SplineType of
    0: spnn(n, x, y, b, c, d);
    1: spbb(n, x, y, b, c, d, StartAngle, EndAngle);
    2: spnb(n, x, y, b, c, d, EndAngle);
    3: spbn(n, x, y, b, c, d, StartAngle);
  end;
end;

procedure MakeSplineUniversalPoints(SplineType, n: Integer; var x, y: TArrSpline;
  nn: Integer; var xx, yy: TArrSpline; StartAngle, EndAngle: Double);
var
  b, c, d: TArrSpline;
  step: Double;
  i: Integer;
begin
  SplineUniversal(SplineType, n, x, y, b, c, d, StartAngle, EndAngle);
  Step := (x[n] - x[1])/(nn - 1);
  for i := 1 to nn do
  begin
    xx[i] := x[1] + (i - 1) * Step; 
    yy[i] := sen(n, xx[i], x, y, b, c, d);
  end;
end;

end.
