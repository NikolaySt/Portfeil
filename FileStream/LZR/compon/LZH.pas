{$A+}{ word align }
{$O+}{ ?? ?? }

unit Lzh;
(*
   * LZHUF.C English Version 1.0
   * Based on Japanese Version 29 - NOV - 1988
   * LZSS coded BY Haruhiko OKUMURA
   * Adaptive Huffman Coding coded BY Haruyasu YOSHIZAKI
   * Edited and translated to English BY Kenji RIKITAKE
   * translated from C to Turbo Pascal BY Douglas Webb 2 / 18 / 91
   * Update and bug correction of TP Version 4 / 29 / 91(Sorry!!)
   * Added Delphi Exception handling may 09 1996 Danny Heijl
   * Danny.Heijl @cevi.be
   *)

{
This unit allows the user to compress data using a combination of
LZSS compression and adaptive Huffman coding, or conversely to decompress
data that was previously compressed by this unit.

There are a number of options as to where the data being compressed/
decompressed is coming from/going to.

In fact it requires that you pass the "LZHPack" procedure 2 procedural
parameter of type 'GetProcType' and 'PutProcType' (declared below) which
will accept 3 parameters and act in every way like a 'BlockRead'/
'BlockWrite' procedure call. Your 'GetBytesProc' procedure should return
the data to be compressed, and Your 'PutBytesProc' procedure should do
something with the compressed data (ie., put it in a file).  In case you
need to know (and you do if you want to decompress this data again) the
number of bytes in the compressed data (original, not compressed size)
is returned in 'Bytes_Written'.

GetBytesProc = PROCEDURE(VAR DTA; NBytes:WORD; VAR Bytes_Got : WORD);

DTA is the start of a memory location where the information returned
should be.  NBytes is the number of bytes requested.  The actual number
of bytes returned must be passed in Bytes_Got (if there is no more data
then 0 should be returned).

PutBytesProc = PROCEDURE(VAR DTA; NBytes:WORD; VAR Bytes_Got : WORD);

As above except instead of asking for data the procedure is dumping out
compressed data, do somthing with it.

"LZHUnPack" is basically the same thing in reverse.  It requires
procedural parameters of type 'PutProcType'/'GetProcType' which
will act as above.  'GetProcType' must retrieve data compressed using
"LZHPack" (above) and feed it to the unpacking routine as requested.
'PutProcType' must accept the decompressed data and do something
withit.  You must also pass in the original size of the decompressed data,
failure to do so will have adverse results.

Don't forget that as procedural parameters the 'GetProcType'/'PutProcType'
procedures must be compiled in the 'F+' state to avoid a catastrophe.

}

{ Note: All the large data structures for these routines are allocated when
needed from the heap, and deallocated when finished.  So when not in use
memory requirements are minimal.  However, this unit uses about 34K of
heap space, and 400 bytes of stack when in use. }

{$R-}{ NO range checking !! }

interface

uses SysUtils;

  {$IFDEF WIN32}
type Int16 = SmallInt;
  {$ELSE}
type Int16 = Integer;
  {$ENDIF}

  {.$DEFINE DEBUG}
  {$IFDEF DEBUG}
  {$D+}
  {$ENDIF}

type

  ElzhException = class(Exception);

  TWriteProc = procedure(var DTA; nBytes: Word; var Bytes_Put: Word) of object;

  PutBytesProc = TWriteProc;
{
  Your 'PutBytesProc' procedure should do something with the compressed
  data (ie., put it in a file).

  DTA is the start of a memory location where the information returned
  should be.  NBytes is the number of bytes requested.  The actual number
  of bytes put should be returned in Bytes_Got.

  Don't forget that as procedural parameters the 'GetProcType'/'PutProcType'
  procedures must be compiled in the 'F+' state to avoid a catastrophe.
  }

  TreadProc = procedure(var DTA; nBytes: Word; var Bytes_Got: Word) of object;
  GetBytesProc = TreadProc;
{
  Your 'GetBytesProc' procedure should return the data to be compressed.
  In case you need to know (and you do if you want to decompress this
  data again) the number of bytes in the compressed data (original, not
  compressed size) is returned in 'Bytes_Written'.

  DTA is the start of a memory location where the information returned
  should be.  NBytes is the number of bytes requested.  The actual number
  of bytes returned must be passed in Bytes_Got (if there is no more data
  then 0 should be returned).

  Don't forget that as procedural parameters the 'GetProcType'/'PutProcType'
  procedures must be compiled in the 'F+' state to avoid a catastrophe.
  }

procedure LZHPack(var Bytes_Written: Longint; GetBytes: GetBytesProc;
  PutBytes: PutBytesProc);
{#XLZHUnPack}
{
This procedure allows the user to compress data using a combination of
LZSS compression and adaptive Huffman coding.

There are a number of options as to where the data being compressed
is coming from.

In fact it requires that you pass the "LZHPack" procedure 2 procedural
parameter of type 'GetProcType' and 'PutProcType' (declared below) which
will accept 3 parameters and act in every way like a 'BlockRead'/
'BlockWrite' procedure call. Your 'GetBytesProc' procedure should return
the data to be compressed, and Your 'PutBytesProc' procedure should do
something with the compressed data (ie., put it in a file).  In case you
need to know (and you do if you want to decompress this data again) the
number of bytes in the compressed data (original, not compressed size)
is returned in 'Bytes_Written'.

DTA is the start of a memory location where the information returned
should be.  NBytes is the number of bytes requested.  The actual number
of bytes returned must be passed in Bytes_Got (if there is no more data
then 0 should be returned).

As above except instead of asking for data the procedure is dumping out
compressed data, do somthing with it.

}

procedure LZHUnPack(TextSize: Longint; GetBytes: GetBytesProc;
  PutBytes: PutBytesProc);
{#X LZHPack}
{
"LZHUnPack" is basically the same as LZHPack in reverse.  It requires
procedural parameters of type 'PutProcType'/'GetProcType' which
will act as above.  'GetProcType' must retrieve data compressed using
"LZHPack" (above) and feed it to the unpacking routine as requested.
'PutProcType' must accept the decompressed data and do something
withit.  You must also pass in the original size of the decompressed data,
failure to do so will have adverse results.
}

implementation

const
  EXIT_OK = 0;
  EXIT_FAILED = 1;
{ LZSS Parameters }
  N = 4096; { Size of string buffer }
  F = 60; { Size of look-ahead buffer }
  Threshold = 2;
  NUL = N; { End of tree's node  }

{ Huffman coding parameters }
  N_CHAR = (256 - Threshold + F);
{ character code (:= 0..N_CHAR-1) }
  T = (N_CHAR * 2 - 1); { Size of table }
  R = (T - 1); { root position }
  MAX_FREQ = $8000;
{ update when cumulative frequency }
{ reaches to this value }
{
  * Tables FOR encoding/decoding upper 6 bits of
  * sliding dictionary pointer
  }
{ encoder table }
  p_len: array[0..63] of Byte =
  ($03, $04, $04, $04, $05, $05, $05, $05,
    $05, $05, $05, $05, $06, $06, $06, $06,
    $06, $06, $06, $06, $06, $06, $06, $06,
    $07, $07, $07, $07, $07, $07, $07, $07,
    $07, $07, $07, $07, $07, $07, $07, $07,
    $07, $07, $07, $07, $07, $07, $07, $07,
    $08, $08, $08, $08, $08, $08, $08, $08,
    $08, $08, $08, $08, $08, $08, $08, $08);

  p_code: array[0..63] of Byte =
  ($00, $20, $30, $40, $50, $58, $60, $68,
    $70, $78, $80, $88, $90, $94, $98, $9C,
    $A0, $A4, $A8, $AC, $B0, $B4, $B8, $BC,
    $C0, $C2, $C4, $C6, $C8, $CA, $CC, $CE,
    $D0, $D2, $D4, $D6, $D8, $DA, $DC, $DE,
    $E0, $E2, $E4, $E6, $E8, $EA, $EC, $EE,
    $F0, $F1, $F2, $F3, $F4, $F5, $F6, $F7,
    $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF);

{ decoder table }
  d_code: array[0..255] of Byte =
  ($00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00,
    $01, $01, $01, $01, $01, $01, $01, $01,
    $01, $01, $01, $01, $01, $01, $01, $01,
    $02, $02, $02, $02, $02, $02, $02, $02,
    $02, $02, $02, $02, $02, $02, $02, $02,
    $03, $03, $03, $03, $03, $03, $03, $03,
    $03, $03, $03, $03, $03, $03, $03, $03,
    $04, $04, $04, $04, $04, $04, $04, $04,
    $05, $05, $05, $05, $05, $05, $05, $05,
    $06, $06, $06, $06, $06, $06, $06, $06,
    $07, $07, $07, $07, $07, $07, $07, $07,
    $08, $08, $08, $08, $08, $08, $08, $08,
    $09, $09, $09, $09, $09, $09, $09, $09,
    $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A,
    $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B,
    $0C, $0C, $0C, $0C, $0D, $0D, $0D, $0D,
    $0E, $0E, $0E, $0E, $0F, $0F, $0F, $0F,
    $10, $10, $10, $10, $11, $11, $11, $11,
    $12, $12, $12, $12, $13, $13, $13, $13,
    $14, $14, $14, $14, $15, $15, $15, $15,
    $16, $16, $16, $16, $17, $17, $17, $17,
    $18, $18, $19, $19, $1A, $1A, $1B, $1B,
    $1C, $1C, $1D, $1D, $1E, $1E, $1F, $1F,
    $20, $20, $21, $21, $22, $22, $23, $23,
    $24, $24, $25, $25, $26, $26, $27, $27,
    $28, $28, $29, $29, $2A, $2A, $2B, $2B,
    $2C, $2C, $2D, $2D, $2E, $2E, $2F, $2F,
    $30, $31, $32, $33, $34, $35, $36, $37,
    $38, $39, $3A, $3B, $3C, $3D, $3E, $3F);

  d_len: array[0..255] of Byte =
  ($03, $03, $03, $03, $03, $03, $03, $03,
    $03, $03, $03, $03, $03, $03, $03, $03,
    $03, $03, $03, $03, $03, $03, $03, $03,
    $03, $03, $03, $03, $03, $03, $03, $03,
    $04, $04, $04, $04, $04, $04, $04, $04,
    $04, $04, $04, $04, $04, $04, $04, $04,
    $04, $04, $04, $04, $04, $04, $04, $04,
    $04, $04, $04, $04, $04, $04, $04, $04,
    $04, $04, $04, $04, $04, $04, $04, $04,
    $04, $04, $04, $04, $04, $04, $04, $04,
    $05, $05, $05, $05, $05, $05, $05, $05,
    $05, $05, $05, $05, $05, $05, $05, $05,
    $05, $05, $05, $05, $05, $05, $05, $05,
    $05, $05, $05, $05, $05, $05, $05, $05,
    $05, $05, $05, $05, $05, $05, $05, $05,
    $05, $05, $05, $05, $05, $05, $05, $05,
    $05, $05, $05, $05, $05, $05, $05, $05,
    $05, $05, $05, $05, $05, $05, $05, $05,
    $06, $06, $06, $06, $06, $06, $06, $06,
    $06, $06, $06, $06, $06, $06, $06, $06,
    $06, $06, $06, $06, $06, $06, $06, $06,
    $06, $06, $06, $06, $06, $06, $06, $06,
    $06, $06, $06, $06, $06, $06, $06, $06,
    $06, $06, $06, $06, $06, $06, $06, $06,
    $07, $07, $07, $07, $07, $07, $07, $07,
    $07, $07, $07, $07, $07, $07, $07, $07,
    $07, $07, $07, $07, $07, $07, $07, $07,
    $07, $07, $07, $07, $07, $07, $07, $07,
    $07, $07, $07, $07, $07, $07, $07, $07,
    $07, $07, $07, $07, $07, $07, $07, $07,
    $08, $08, $08, $08, $08, $08, $08, $08,
    $08, $08, $08, $08, $08, $08, $08, $08);

type
  Freqtype = array[0..T] of Word;
  FreqPtr = ^Freqtype;
  PntrType = array[0..Pred(T + N_CHAR)] of Int16;
  pntrPtr = ^PntrType;
  SonType = array[0..Pred(T)] of Int16;
  SonPtr = ^SonType;

  TextBufType = array[0..N + F - 2] of Byte;
  TBufPtr = ^TextBufType;
  WordRay = array[0..N] of Int16;
  WordRayPtr = ^WordRay;
  BWordRay = array[0..N + 256] of Int16;
  BWordRayPtr = ^BWordRay;

var

  getbuf: Word;
  getlen: Byte;
  putlen: Byte;
  putbuf: Word;
  TextSize: Longint;
  codesize: Longint;
  printcount: Longint;
  match_position: Int16;
  match_length: Int16;

  text_buf: TBufPtr;
  lson, dad: WordRayPtr;
  rson: BWordRayPtr;
  freq: FreqPtr; { cumulative freq table }

{
  * pointing parent nodes.
  * area [T..(T + N_CHAR - 1)] are pointers FOR leaves
  }
  prnt: pntrPtr;

{ pointing children nodes (son[], son[] + 1)}
  son: SonPtr;

procedure InitTree; { Initializing tree }

var
  i: Int16;
begin
  for i := N + 1 to N + 256 do rson^[i] := NUL; { root }
  for i := 0 to N do dad^[i] := NUL; { node }
end;

procedure InsertNode(R: Int16); { Inserting node to the tree }

var
  Tmp, i, p, CMP: Int16;
  Key: TBufPtr;
  C: Word;

begin
  CMP := 1;
  Key := @text_buf^[R];
  p := Succ(N) + Key^[0];
  rson^[R] := NUL;
  lson^[R] := NUL;
  match_length := 0;
  while match_length < F do begin
    if (CMP >= 0) then begin
      if (rson^[p] <> NUL) then begin
        p := rson^[p]
      end
      else begin
        rson^[p] := R;
        dad^[R] := p;
        Exit;
      end;
    end
    else begin
      if (lson^[p] <> NUL) then begin
        p := lson^[p]
      end
      else begin
        lson^[p] := R;
        dad^[R] := p;
        Exit;
      end;
    end;
    i := 0;
    CMP := 0;
    while (i < F) and (CMP = 0) do begin
      Inc(i);
      CMP := Key^[i] - text_buf^[p + i];
    end;
    if (i > Threshold) then begin
      Tmp := Pred((R - p) and Pred(N));
      if (i > match_length) then begin
        match_position := Tmp;
        match_length := i;
      end;
      if (match_length < F) and (i = match_length) then begin
        C := Tmp;
        if (C < match_position) then begin
          match_position := C;
        end;
      end;
    end; { if i > threshold }
  end; { WHILE match_length < F }
  dad^[R] := dad^[p];
  lson^[R] := lson^[p];
  rson^[R] := rson^[p];
  dad^[lson^[p]] := R;
  dad^[rson^[p]] := R;
  if (rson^[dad^[p]] = p) then begin
    rson^[dad^[p]] := R;
  end
  else begin
    lson^[dad^[p]] := R;
  end;
  dad^[p] := NUL; { remove p }
end;

procedure DeleteNode(p: Int16); { Deleting node from the tree }

var
  q: Int16;

begin
  if (dad^[p] = NUL) then Exit; { unregistered }

  if (rson^[p] = NUL) then begin
    q := lson^[p];
  end
  else begin
    if (lson^[p] = NUL) then begin
      q := rson^[p];
    end
    else begin
      q := lson^[p];
      if (rson^[q] <> NUL) then begin
        repeat
          q := rson^[q];
        until (rson^[q] = NUL);
        rson^[dad^[q]] := lson^[q];
        dad^[lson^[q]] := dad^[q];
        lson^[q] := lson^[p];
        dad^[lson^[p]] := q;
      end;
      rson^[q] := rson^[p];
      dad^[rson^[p]] := q;
    end;
  end;
  dad^[q] := dad^[p];

  if (rson^[dad^[p]] = p) then
    rson^[dad^[p]] := q
  else
    lson^[dad^[p]] := q;

  dad^[p] := NUL;

end;

{ Huffman coding parameters }

function GetBit(GetBytes: GetBytesProc): Int16; { get one bit }
var
  i: Byte;
  I2: Int16;
  Wresult: Word;

begin
  while (getlen <= 8) do begin
    GetBytes(i, 1, Wresult);
    if Wresult = 1 then
      I2 := i
    else
      I2 := 0;

    getbuf := getbuf or (I2 shl (8 - getlen));
    Inc(getlen, 8);
  end;
  I2 := getbuf;
  getbuf := getbuf shl 1;
  Dec(getlen);
  GetBit := Int16((I2 < 0));

end;

function GetByte(GetBytes: GetBytesProc): Int16; { get a byte }

var
  j: Byte;
  i, Wresult: Word;
begin
  while (getlen <= 8) do begin
    GetBytes(j, 1, Wresult);
    if Wresult = 1 then
      i := j
    else
      i := 0;

    getbuf := getbuf or (i shl (8 - getlen));
    Inc(getlen, 8);
  end;
  i := getbuf;
  getbuf := getbuf shl 8;
  Dec(getlen, 8);
  GetByte := Int16(i shr 8);
end;

procedure Putcode(l: Int16; C: Word; PutBytes: PutBytesProc); { output c bits }
var
  Temp: Byte;
  Got: Word;
begin
  putbuf := putbuf or (C shr putlen);
  Inc(putlen, l);
  if (putlen >= 8) then begin
    Temp := putbuf shr 8;
    PutBytes(Temp, 1, Got);
    Dec(putlen, 8);
    if (putlen >= 8) then begin
      Temp := Lo(putbuf);
      PutBytes(Temp, 1, Got);
      Inc(codesize, 2);
      Dec(putlen, 8);
      putbuf := C shl (l - putlen);
    end
    else begin
      putbuf := putbuf shl 8;
      Inc(codesize);
    end;
  end;
end;

{ initialize freq tree }

procedure StartHuff;
var
  i, j: Int16;
begin
  for i := 0 to Pred(N_CHAR) do begin
    freq^[i] := 1;
    son^[i] := i + T;
    prnt^[i + T] := i;
  end;
  i := 0;
  j := N_CHAR;
  while (j <= R) do begin
    freq^[j] := freq^[i] + freq^[i + 1];
    son^[j] := i;
    prnt^[i] := j;
    prnt^[i + 1] := j;
    Inc(i, 2);
    Inc(j);
  end;
  freq^[T] := $ffff;
  prnt^[R] := 0;
end;

{ reconstruct freq tree }

procedure reconst;
var
  i, j, K, Tmp: Int16;
  F, l: Word;
begin
{ halven cumulative freq FOR leaf nodes }
  j := 0;
  for i := 0 to Pred(T) do begin
    if (son^[i] >= T) then begin
      freq^[j] := Succ(freq^[i]) div 2; {@@ Bug Fix MOD -> DIV @@}
      son^[j] := son^[i];
      Inc(j);
    end;
  end;
{ make a tree : first, connect children nodes }
  i := 0;
  j := N_CHAR;
  while (j < T) do begin
    K := Succ(i);
    F := freq^[i] + freq^[K];
    freq^[j] := F;
    K := Pred(j);
    while F < freq^[K] do Dec(K);
    Inc(K);
    l := (j - K) shl 1;
    Tmp := Succ(K);
    Move(freq^[K], freq^[Tmp], l);
    freq^[K] := F;
    Move(son^[K], son^[Tmp], l);
    son^[K] := i;
    Inc(i, 2);
    Inc(j);
  end;
{ connect parent nodes }
  for i := 0 to Pred(T) do begin
    K := son^[i];
    if (K >= T) then begin
      prnt^[K] := i;
    end
    else begin
      prnt^[K] := i;
      prnt^[Succ(K)] := i;
    end;
  end;

end;

{ update freq tree }

procedure Update(C: Int16);
var
  i, j, K, l: Int16;
begin
  if (freq^[R] = MAX_FREQ) then begin
    reconst;
  end;
  C := prnt^[C + T];
  repeat
    Inc(freq^[C]);
    K := freq^[C];

  { swap nodes to keep the tree freq-ordered }
    l := Succ(C);
    if (K > freq^[l]) then begin
      while (K > freq^[l]) do Inc(l);
      Dec(l);
      freq^[C] := freq^[l];
      freq^[l] := K;

      i := son^[C];
      prnt^[i] := l;
      if (i < T) then prnt^[Succ(i)] := l;

      j := son^[l];
      son^[l] := i;

      prnt^[j] := C;
      if (j < T) then prnt^[Succ(j)] := C;
      son^[C] := j;

      C := l;
    end;
    C := prnt^[C];
  until (C = 0); { REPEAT it until reaching the root }
end;

var
  Code, Len: Word;

procedure EncodeChar(C: Word; PutBytes: PutBytesProc);
var
  i: Word;
  j, K: Int16;
begin
  i := 0;
  j := 0;
  K := prnt^[C + T];

{ search connections from leaf node to the root }
  repeat
    i := i shr 1;

  {
    IF node's address is odd, output 1
    ELSE output 0
    }
    if Boolean(K and 1) then Inc(i, $8000);
    Inc(j);
    K := prnt^[K];
  until (K = R);
  Putcode(j, i, PutBytes);
  Code := i;
  Len := j;
  Update(C);
end;

procedure EncodePosition(C: Word; PutBytes: PutBytesProc);
var
  i, j: Word;
begin
{ output upper 6 bits with encoding }
  i := C shr 6;
  j := p_code[i];
  Putcode(p_len[i], j shl 8, PutBytes);

{ output lower 6 bits directly }
  Putcode(6, (C and $3f) shl 10, PutBytes);
end;

procedure EncodeEnd(PutBytes: PutBytesProc);
var
  Temp: Byte;
  Got: Word;
begin
  if Boolean(putlen) then begin
    Temp := Lo(putbuf shr 8);
    PutBytes(Temp, 1, Got);
    Inc(codesize);
  end;
end;

function DecodeChar(GetBytes: GetBytesProc): Int16;
var
  C: Word;
begin
  C := son^[R];

{
  * start searching tree from the root to leaves.
  * choose node #(son[]) IF input bit = 0
  * ELSE choose #(son[]+1) (input bit = 1)
  }
  while (C < T) do begin
    C := C + GetBit(GetBytes);
    C := son^[C];
  end;
  C := C - T;
  Update(C);
  DecodeChar := Int16(C);
end;

function DecodePosition(GetBytes: GetBytesProc): Word;
var
  i, j, C: Word;
begin
{ decode upper 6 bits from given table }
  i := GetByte(GetBytes);
  C := Word(d_code[i] shl 6);
  j := d_len[i];

{ input lower 6 bits directly }
  Dec(j, 2);
  while j <> 0 do begin
    i := (i shl 1) + GetBit(GetBytes);
    Dec(j);
  end;
  DecodePosition := C or i and $3f;
end;

{ Compression }

procedure InitLZH;
begin
  getbuf := 0;
  getlen := 0;
  putlen := 0;
  putbuf := 0;
  TextSize := 0;
  codesize := 0;
  printcount := 0;
  match_position := 0;
  match_length := 0;
  try
    New(lson);
    New(dad);
    New(rson);
    New(text_buf);
    New(freq);
    New(prnt);
    New(son);
  except
    raise ElzhException.Create('LZH : Cannot get memory for dictionary tables');
  end;
end;

procedure EndLZH;

begin
  try
    Dispose(son);
    Dispose(prnt);
    Dispose(freq);
    Dispose(text_buf);
    Dispose(rson);
    Dispose(dad);
    Dispose(lson);
  except
    raise ElzhException.Create('LZH : Error freeing memory for dictionary tables');
  end;
end;

procedure LZHPack(var Bytes_Written: Longint; GetBytes: GetBytesProc; PutBytes: PutBytesProc);
var
  ct: Byte;
  i, Len, R, s, last_match_length: Int16;
  Got: Word;
begin

  InitLZH;

  try
    TextSize := 0; { rewind and rescan }
    StartHuff;
    InitTree;
    s := 0;
    R := N - F;
    FillChar(text_buf^[0], R, ' ');
    Len := 0;
    Got := 1;
    while (Len < F) and (Got <> 0) do begin
      GetBytes(ct, 1, Got);
      if Got <> 0 then begin
        text_buf^[R + Len] := ct;
        Inc(Len);
      end;
    end;
    TextSize := Len;
    for i := 1 to F do begin
      InsertNode(R - i);
    end;
    InsertNode(R);
    repeat
      if (match_length > Len) then begin
        match_length := Len;
      end;
      if (match_length <= Threshold) then begin
        match_length := 1;
        EncodeChar(text_buf^[R], PutBytes);
      end
      else begin
        EncodeChar(255 - Threshold + match_length, PutBytes);
        EncodePosition(match_position, PutBytes);
      end;
      last_match_length := match_length;
      i := 0;
      Got := 1;
      while (i < last_match_length) and (Got <> 0) do begin
        GetBytes(ct, 1, Got);
        if Got <> 0 then begin
          DeleteNode(s);
          text_buf^[s] := ct;
          if (s < Pred(F)) then begin
            text_buf^[s + N] := ct;
          end;
          s := Succ(s) and Pred(N);
          R := Succ(R) and Pred(N);
          InsertNode(R);
          Inc(i);
        end;
      end; { endwhile }
      Inc(TextSize, i);
      while (i < last_match_length) do begin
        Inc(i);
        DeleteNode(s);
        s := Succ(s) and Pred(N);
        R := Succ(R) and Pred(N);
        Dec(Len);
        if Boolean(Len) then InsertNode(R);
      end; { endwhile }
    until (Len <= 0); { end repeat }
    EncodeEnd(PutBytes);

  finally
    EndLZH;
  end;

  Bytes_Written := TextSize;

end;

procedure LZHUnPack(TextSize: Longint; GetBytes: GetBytesProc; PutBytes: PutBytesProc);
var
  C, i, j, K, R: Int16;
  C2: Byte;
  Count: Longint;
  Put: Word;

begin

  InitLZH;

  try
    StartHuff;
    R := N - F;
    FillChar(text_buf^[0], R, ' ');
    Count := 0;
    while Count < TextSize do begin
      C := DecodeChar(GetBytes);
      if (C < 256) then begin
        C2 := Lo(C);
        PutBytes(C2, 1, Put);
        text_buf^[R] := C;
        Inc(R);
        R := R and Pred(N);
        Inc(Count);
      end
      else begin{c >= 256 }
        i := (R - Succ(DecodePosition(GetBytes))) and Pred(N);
        j := C - 255 + Threshold;
        for K := 0 to Pred(j) do begin
          C := text_buf^[(i + K) and Pred(N)];
          C2 := Lo(C);
          PutBytes(C2, 1, Put);
          text_buf^[R] := C;
          Inc(R);
          R := R and Pred(N);
          Inc(Count);
        end; { for }
      end; { if c < 256 }
    end; {endwhile count < textsize }

  finally
    EndLZH;
  end;

end;

end.
