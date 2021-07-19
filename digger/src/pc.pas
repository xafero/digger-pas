unit Pc;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, api, cgagrafx, alpha, dateutils;

type
  TPc = class(TInterfacedObject, IPc)
  private
  var
    dig:            IDigger;
  var
    mSource:        array of ISource;
  var
    mCurrentSource: ISource;
  var
    mPixels:        array of integer;
  var
    pal:            Byte3Array;
  var
    mWidth:         integer;
  var
    mHeight:        integer;
  var
    size:           integer;
  public
    procedure SetcurrentSource(Value: ISource);
    function GetcurrentSource: ISource;
    property currentSource: ISource Read GetcurrentSource Write SetcurrentSource;

    procedure Setsource(Value: SourceArray);
    function Getsource: SourceArray;
    property Source: SourceArray Read Getsource Write Setsource;

    procedure Setwidth(Value: integer);
    function Getwidth: integer;
    property Width: integer Read Getwidth Write Setwidth;

    procedure Setheight(Value: integer);
    function Getheight: integer;
    property Height: integer Read Getheight Write Setheight;

    procedure Setpixels(Value: IntegerArray);
    function Getpixels: IntegerArray;
    property pixels: IntegerArray Read Getpixels Write Setpixels;

    function GetPal: Byte3Array;

    constructor Create(d: IDigger);
    procedure gclear;
    function gethrt: int64;
    function getkips: integer;
    procedure ggeti(x: integer; y: integer; p: array of Int16; w: integer; h: integer);
    function ggetpix(x: integer; y: integer): integer;
    procedure ginit;
    procedure ginten(inten: integer);
    procedure gpal(mpal: integer);
    procedure gputi(x: integer; y: integer; p: array of Int16; w: integer; h: integer);
    procedure gputi(x: integer; y: integer; p: array of Int16;
      w: integer; h: integer; b: boolean);
    procedure gputim(x: integer; y: integer; ch: integer; w: integer; h: integer);
    procedure gtitle;
    procedure gwrite(x: integer; y: integer; ch: integer; c: integer);
    procedure gwrite(x: integer; y: integer; ch: integer; c: integer; upd: boolean);
  end;

implementation

constructor TPc.Create(d: IDigger);
begin
  dig := d;
  SetLength(mSource, 2);
  SetLength(mPixels, 65536);
  pal  := [[[0, byte(0), byte($AA), byte($AA)], [0, byte($AA), byte(0), byte($54)],
    [0, byte(0), byte(0), byte(0)]], [[0, byte($54), byte($FF), byte($FF)],
    [0, byte($FF), byte($54), byte($FF)], [0, byte($54), byte($54), byte($54)]]];
  Width := 320;
  Height := 200;
  size := Width * Height;
end;

function TPc.GetPal: Byte3Array;
begin
  exit(pal);
end;

procedure TPc.gclear;
var
  i: integer;
begin
  for i := 0 to (size - 1) do
    pixels[i] := 0;
  currentSource.newPixelsAll();
end;

function TPc.gethrt: int64;
begin
  exit(MilliSecondsBetween(Now, EncodeDateTime(1970, 1, 1, 0, 0, 0, 0)));
end;

function TPc.getkips: integer;
begin
  exit(0);
end;

procedure TPc.ggeti(x: integer; y: integer; p: array of Int16; w: integer; h: integer);
var
  src: integer;
  dest: integer;
  i: integer;
  d: integer;
  j: integer;
begin
  src  := 0;
  dest := (y * Width) + (x and $FFFC);
  for i := 0 to (h - 1) do
  begin
    d := dest;
    for j := 0 to (w - 1) do
    begin
      p[src] := ((((((pixels[d] shl 2) or pixels[d + 1]) shl 2) or
        pixels[d + 2]) shl 2) or pixels[d + 3]);
      Inc(src);
      d := d + 4;
      if src >= Length(p) then
      begin
        exit;
      end;
    end;
    dest := dest + Width;
  end;
end;

function TPc.ggetpix(x: integer; y: integer): integer;
var
  ofs: integer;
begin
  ofs := ((Width * y) + x) and $FFFC;
  exit((((((pixels[ofs] shl 2) or pixels[ofs + 1]) shl 2) or pixels[ofs + 2]) shl
    2) or pixels[ofs + 3]);
end;

procedure TPc.ginit;
begin
end;

procedure TPc.ginten(inten: integer);
begin
  currentSource := Source[inten and 1];
  currentSource.newPixelsAll();
end;

procedure TPc.gpal(mpal: integer);
begin
end;

procedure TPc.gputi(x: integer; y: integer; p: array of Int16; w: integer; h: integer);
begin
  gputi(x, y, p, w, h, True);
end;

procedure TPc.gputi(x: integer; y: integer; p: array of Int16; w: integer;
  h: integer; b: boolean);
var
  src: integer;
  dest: integer;
  i:  integer;
  d:  integer;
  j:  integer;
  px: Int16;
begin
  src  := 0;
  dest := (y * Width) + (x and $FFFC);
  for i := 0 to (h - 1) do
  begin
    d := dest;
    for j := 0 to (w - 1) do
    begin
      px := p[src];
      Inc(src);
      pixels[d + 3] := px and 3;
      px := px shr 2;
      pixels[d + 2] := px and 3;
      px := px shr 2;
      pixels[d + 1] := px and 3;
      px := px shr 2;
      pixels[d] := px and 3;
      d  := d + 4;
      if src = Length(p) then
      begin
        exit;
      end;
    end;
    dest := dest + Width;
  end;
end;

procedure TPc.gputim(x: integer; y: integer; ch: integer; w: integer; h: integer);
var
  spr: array of Int16;
  msk: array of Int16;
  src: integer;
  dest: integer;
  i:  integer;
  j:  integer;
  d:  integer;
  px: Int16;
  mx: Int16;
begin
  spr  := TCgaGrafx.cgatable[ch * 2];
  msk  := TCgaGrafx.cgatable[(ch * 2) + 1];
  src  := 0;
  dest := (y * Width) + (x and $FFFC);
  for i := 0 to (h - 1) do
  begin
    d := dest;
    for j := 0 to (w - 1) do
    begin
      px := spr[src];
      mx := msk[src];
      Inc(src);
      if (mx and 3) = 0 then
      begin
        pixels[d + 3] := px and 3;
      end;
      px := px shr 2;
      if (mx and (3 shl 2)) = 0 then
      begin
        pixels[d + 2] := px and 3;
      end;
      px := px shr 2;
      if (mx and (3 shl 4)) = 0 then
      begin
        pixels[d + 1] := px and 3;
      end;
      px := px shr 2;
      if (mx and (3 shl 6)) = 0 then
      begin
        pixels[d] := px and 3;
      end;
      d := d + 4;
      if (src = Length(spr)) or (src = Length(msk)) then
      begin
        exit;
      end;
    end;
    dest := dest + Width;
  end;
end;

procedure TPc.gtitle;
var
  src: integer;
  dest: integer;
  plus: integer;
  c:  integer;
  l:  integer;
  i:  integer;
  b:  integer;
  px: integer;
  adst: integer;
begin
  src  := 0;
  dest := 0;
  plus := 0;
  while (not TThread.CheckTerminated) do
  begin
    if src >= Length(TCgaGrafx.cgatitledat) then
    begin
      break;
    end;
    b := TCgaGrafx.cgatitledat[src];
    Inc(src);
    l := 0;
    c := 0;
    if b = $FE then
    begin
      l := TCgaGrafx.cgatitledat[src];
      Inc(src);
      if l = 0 then
      begin
        l := 256;
      end;
      c := TCgaGrafx.cgatitledat[src];
      Inc(src);
    end
    else
    begin
      l := 1;
      c := b;
    end;
    for i := 0 to (l - 1) do
    begin
      px := c;
      adst := 0;
      if dest < 32768 then
      begin
        adst := (trunc(dest / 320) * 640) + (dest mod 320);
      end
      else
      begin
        adst := 320 + (trunc(trunc(dest - 32768) / 320) * 640) +
          ((dest - 32768) mod 320);
      end;
      pixels[adst + 3] := px and 3;
      px := px shr 2;
      pixels[adst + 2] := px and 3;
      px := px shr 2;
      pixels[adst + 1] := px and 3;
      px := px shr 2;
      pixels[adst + 0] := px and 3;
      dest := dest + 4;
      if dest >= 65535 then
      begin
        break;
      end;
    end;
    if dest >= 65535 then
    begin
      break;
    end;
  end;
end;

procedure TPc.gwrite(x: integer; y: integer; ch: integer; c: integer);
begin
  gwrite(x, y, ch, c, False);
end;

procedure TPc.gwrite(x: integer; y: integer; ch: integer; c: integer; upd: boolean);
var
  dest: integer;
  ofs: integer;
  i:  integer;
  d:  integer;
  j:  integer;
  px: integer;
  color: integer;
  chartab: array of Int16;
begin
  dest := x + (y * Width);

  ofs := 0;
  color := c and 3;
  ch  := ch - 32;
  if (ch < 0) or (ch > $5F) then
  begin
    exit;
  end;
  chartab := TAlpha.ascii2cga[ch];
  if chartab = nil then
  begin
    exit;
  end;
  for i := 0 to (12 - 1) do
  begin
    d := dest;
    for j := 0 to (3 - 1) do
    begin
      px := chartab[ofs];
      Inc(ofs);
      pixels[d + 3] := px and color;
      px := px shr 2;
      pixels[d + 2] := px and color;
      px := px shr 2;
      pixels[d + 1] := px and color;
      px := px shr 2;
      pixels[d] := px and color;
      d  := d + 4;
    end;
    dest := dest + Width;
  end;
  if upd then
  begin
    // currentSource.newPixels(x, y, 12, 12);
    currentSource.newPixelsAll();
  end;
end;

procedure TPc.SetcurrentSource(Value: ISource);
begin
  mCurrentSource := Value;
end;

function TPc.GetcurrentSource: ISource;
begin
  exit(mCurrentSource);
end;

procedure TPc.Setsource(Value: SourceArray);
begin
  mSource := Value;
end;

function TPc.Getsource: SourceArray;
begin
  exit(mSource);
end;

procedure TPc.Setwidth(Value: integer);
begin
  mWidth := Value;
end;

function TPc.Getwidth: integer;
begin
  exit(mWidth);
end;

procedure TPc.Setheight(Value: integer);
begin
  mHeight := Value;
end;

function TPc.Getheight: integer;
begin
  exit(mHeight);
end;

procedure TPc.Setpixels(Value: IntegerArray);
begin
  mPixels := Value;
end;

function TPc.Getpixels: IntegerArray;
begin
  exit(mPixels);
end;

end.
