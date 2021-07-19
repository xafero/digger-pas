unit Drawing;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, api;

type
  TDrawing = class(TInterfacedObject, IDrawing)
  private
  var
    dig:        IDigger;
  var
    field1:     array of integer;
  var
    field2:     array of integer;
  var
    mField:     array of integer;
  var
    bitmasks:   array of integer;
  var
    monspr:     array of integer;
  var
    monspd:     array of integer;
  var
    diggerbuf:  array of Int16;
  var
    bagbuf1:    array of Int16;
  var
    bagbuf2:    array of Int16;
  var
    bagbuf3:    array of Int16;
  var
    bagbuf4:    array of Int16;
  var
    bagbuf5:    array of Int16;
  var
    bagbuf6:    array of Int16;
  var
    bagbuf7:    array of Int16;
  var
    monbuf1:    array of Int16;
  var
    monbuf2:    array of Int16;
  var
    monbuf3:    array of Int16;
  var
    monbuf4:    array of Int16;
  var
    monbuf5:    array of Int16;
  var
    monbuf6:    array of Int16;
  var
    bonusbuf:   array of Int16;
  var
    firebuf:    array of Int16;
  var
    digspr:     integer;
  var
    digspd:     integer;
  var
    firespr:    integer;
  var
    fireheight: integer;
  public
    procedure Setfield(Value: IntegerArray);
    function Getfield(): IntegerArray;
    property field: IntegerArray Read Getfield Write Setfield;

    constructor Create(d: IDigger);
    procedure createdbfspr;
    procedure creatembspr;
    procedure drawbackg(l: integer);
    procedure drawbonus(x: integer; y: integer);
    procedure drawbottomblob(x: integer; y: integer);
    function drawdigger(t: integer; x: integer; y: integer; f: boolean): integer;
    procedure drawemerald(x: integer; y: integer);
    procedure drawfield;
    function drawfire(x: integer; y: integer; t: integer): integer;
    procedure drawfurryblob(x: integer; y: integer);
    function drawgold(n: integer; t: integer; x: integer; y: integer): integer;
    procedure drawleftblob(x: integer; y: integer);
    procedure drawlife(t: integer; x: integer; y: integer);
    procedure drawlives;
    function drawmon(n: integer; nobf: boolean; dir: integer; x: integer;
      y: integer): integer;
    function drawmondie(n: integer; nobf: boolean; dir: integer;
      x: integer; y: integer): integer;
    procedure drawrightblob(x: integer; y: integer);
    procedure drawsquareblob(x: integer; y: integer);
    procedure drawstatics;
    procedure drawtopblob(x: integer; y: integer);
    procedure eatfield(x: integer; y: integer; dir: integer);
    procedure eraseemerald(x: integer; y: integer);
    procedure initdbfspr;
    procedure initmbspr;
    procedure makefield;
    procedure outtext(p: string; x: integer; y: integer; c: integer);
    procedure outtext(p: string; x: integer; y: integer; c: integer; b: boolean);
    procedure savefield;
  end;

implementation

constructor TDrawing.Create(d: IDigger);
begin
  dig := d;
  field1 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  field2 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  field := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  bitmasks := [$FFFE, $FFFD, $FFFB, $FFF7, $FFEF, $FFDF, $FFBF, $FF7F,
    $FEFF, $FDFF, $FBFF, $F7FF];
  monspr := [0, 0, 0, 0, 0, 0];
  monspd := [0, 0, 0, 0, 0, 0];
  SetLength(diggerbuf, 480);
  SetLength(bagbuf1, 480);
  SetLength(bagbuf2, 480);
  SetLength(bagbuf3, 480);
  SetLength(bagbuf4, 480);
  SetLength(bagbuf5, 480);
  SetLength(bagbuf6, 480);
  SetLength(bagbuf7, 480);
  SetLength(monbuf1, 480);
  SetLength(monbuf2, 480);
  SetLength(monbuf3, 480);
  SetLength(monbuf4, 480);
  SetLength(monbuf5, 480);
  SetLength(monbuf6, 480);
  SetLength(bonusbuf, 480);
  SetLength(firebuf, 128);
  digspr  := 0;
  digspd  := 0;
  firespr := 0;
  fireheight := 8;
end;

procedure TDrawing.createdbfspr;
begin
  digspd  := 1;
  digspr  := 0;
  firespr := 0;
  dig.Sprite.createspr(0, 0, diggerbuf, 4, 15, 0, 0);
  dig.Sprite.createspr(14, 81, bonusbuf, 4, 15, 0, 0);
  dig.Sprite.createspr(15, 82, firebuf, 2, fireheight, 0, 0);
end;

procedure TDrawing.creatembspr;
var
  i: integer;
begin
  i := 0;
  dig.Sprite.createspr(1, 62, bagbuf1, 4, 15, 0, 0);
  dig.Sprite.createspr(2, 62, bagbuf2, 4, 15, 0, 0);
  dig.Sprite.createspr(3, 62, bagbuf3, 4, 15, 0, 0);
  dig.Sprite.createspr(4, 62, bagbuf4, 4, 15, 0, 0);
  dig.Sprite.createspr(5, 62, bagbuf5, 4, 15, 0, 0);
  dig.Sprite.createspr(6, 62, bagbuf6, 4, 15, 0, 0);
  dig.Sprite.createspr(7, 62, bagbuf7, 4, 15, 0, 0);
  dig.Sprite.createspr(8, 71, monbuf1, 4, 15, 0, 0);
  dig.Sprite.createspr(9, 71, monbuf2, 4, 15, 0, 0);
  dig.Sprite.createspr(10, 71, monbuf3, 4, 15, 0, 0);
  dig.Sprite.createspr(11, 71, monbuf4, 4, 15, 0, 0);
  dig.Sprite.createspr(12, 71, monbuf5, 4, 15, 0, 0);
  dig.Sprite.createspr(13, 71, monbuf6, 4, 15, 0, 0);
  createdbfspr();
  for i := 0 to (6 - 1) do
  begin
    monspr[i] := 0;
    monspd[i] := 1;
  end;
end;

procedure TDrawing.drawbackg(l: integer);
var
  x: integer;
  y: integer;
begin
  y := 14;
  while y < 200 do
  begin
    x := 0;
    while x < 320 do
    begin
      dig.Sprite.drawmiscspr(x, y, 93 + l, 5, 4);
      x := x + 20;
    end;
    y := y + 4;
  end;
end;

procedure TDrawing.drawbonus(x: integer; y: integer);
begin
  dig.Sprite.initspr(14, 81, 4, 15, 0, 0);
  dig.Sprite.movedrawspr(14, x, y);
end;

procedure TDrawing.drawbottomblob(x: integer; y: integer);
begin
  dig.Sprite.initmiscspr(x - 4, y + 15, 6, 6);
  dig.Sprite.drawmiscspr(x - 4, y + 15, 105, 6, 6);
  dig.Sprite.getis();
end;

function TDrawing.drawdigger(t: integer; x: integer; y: integer; f: boolean): integer;
var
  addi: integer;
begin
  digspr := digspr + digspd;
  if (digspr = 2) or (digspr = 0) then
  begin
    digspd := -digspd;
  end;
  if digspr > 2 then
  begin
    digspr := 2;
  end;
  if digspr < 0 then
  begin
    digspr := 0;
  end;
  if (t >= 0) and (t <= 6) and (not (t and 1) <> 0) then
  begin
    if (f) then
      addi := 0
    else
      addi := 1;
    dig.Sprite.initspr(0, ((t + addi) * 3) + digspr + 1, 4, 15, 0, 0);
    exit(dig.Sprite.drawspr(0, x, y));
  end;
  if (t >= 10) and (t <= 15) then
  begin
    dig.Sprite.initspr(0, 40 - t, 4, 15, 0, 0);
    exit(dig.Sprite.drawspr(0, x, y));
  end;
  exit(0);
end;

procedure TDrawing.drawemerald(x: integer; y: integer);
begin
  dig.Sprite.initmiscspr(x, y, 4, 10);
  dig.Sprite.drawmiscspr(x, y, 108, 4, 10);
  dig.Sprite.getis();
end;

procedure TDrawing.drawfield;
var
  x:  integer;
  y:  integer;
  xp: integer;
  yp: integer;

begin
  x  := 0;
  y  := 0;
  xp := 0;
  yp := 0;
  for x := 0 to (15 - 1) do
    for y := 0 to (10 - 1) do
      if (field[(y * 15) + x] and $2000) = 0 then
      begin
        xp := (x * 20) + 12;
        yp := (y * 18) + 18;
        if (field[(y * 15) + x] and $FC0) <> $FC0 then
        begin
          field[(y * 15) + x] := field[(y * 15) + x] and $D03F;
          drawbottomblob(xp, yp - 15);
          drawbottomblob(xp, yp - 12);
          drawbottomblob(xp, yp - 9);
          drawbottomblob(xp, yp - 6);
          drawbottomblob(xp, yp - 3);
          drawtopblob(xp, yp + 3);
        end;
        if (field[(y * 15) + x] and $1F) <> $1F then
        begin
          field[(y * 15) + x] := field[(y * 15) + x] and $DFE0;
          drawrightblob(xp - 16, yp);
          drawrightblob(xp - 12, yp);
          drawrightblob(xp - 8, yp);
          drawrightblob(xp - 4, yp);
          drawleftblob(xp + 4, yp);
        end;
        if x < 14 then
        begin
          if (field[(y * 15) + x + 1] and $FDF) <> $FDF then
          begin
            drawrightblob(xp, yp);
          end;
        end;
        if y < 9 then
        begin
          if (field[((y + 1) * 15) + x] and $FDF) <> $FDF then
          begin
            drawbottomblob(xp, yp);
          end;
        end;
      end;
end;

function TDrawing.drawfire(x: integer; y: integer; t: integer): integer;
begin
  if t = 0 then
  begin
    Inc(firespr);
    if firespr > 2 then
    begin
      firespr := 0;
    end;
    dig.Sprite.initspr(15, 82 + firespr, 2, fireheight, 0, 0);
  end
  else
  begin
    dig.Sprite.initspr(15, 84 + t, 2, fireheight, 0, 0);
  end;
  exit(dig.Sprite.drawspr(15, x, y));
end;

procedure TDrawing.drawfurryblob(x: integer; y: integer);
begin
  dig.Sprite.initmiscspr(x - 4, y + 15, 6, 8);
  dig.Sprite.drawmiscspr(x - 4, y + 15, 107, 6, 8);
  dig.Sprite.getis();
end;

function TDrawing.drawgold(n: integer; t: integer; x: integer; y: integer): integer;
begin
  dig.Sprite.initspr(n, t + 62, 4, 15, 0, 0);
  exit(dig.Sprite.drawspr(n, x, y));
end;

procedure TDrawing.drawleftblob(x: integer; y: integer);
begin
  dig.Sprite.initmiscspr(x - 8, y - 1, 2, 18);
  dig.Sprite.drawmiscspr(x - 8, y - 1, 104, 2, 18);
  dig.Sprite.getis();
end;

procedure TDrawing.drawlife(t: integer; x: integer; y: integer);
begin
  dig.Sprite.drawmiscspr(x, y, t + 110, 4, 12);
end;

procedure TDrawing.drawlives;
var
  l: integer;
  n: integer;
  addi: integer;
begin
  l := 0;
  n := 0;
  n := dig.Main.getlives(1) - 1;
  for l := 1 to (5 - 1) do
  begin
    if n > 0 then
      addi := 0
    else
      addi := 2;
    drawlife(addi, (l * 20) + 60, 0);
    Dec(n);
  end;
  if dig.Main.nplayers = 2 then
  begin
    n := dig.Main.getlives(2) - 1;
    for l := 1 to (5 - 1) do
    begin
      if n > 0 then
        addi := 1
      else
        addi := 2;
      drawlife(addi, 244 - (l * 20), 0);
      Dec(n);
    end;
  end;
end;

function TDrawing.drawmon(n: integer; nobf: boolean; dir: integer;
  x: integer; y: integer): integer;
begin
  monspr[n] := monspr[n] + monspd[n];
  if (monspr[n] = 2) or (monspr[n] = 0) then
  begin
    monspd[n] := -monspd[n];
  end;
  if monspr[n] > 2 then
  begin
    monspr[n] := 2;
  end;
  if monspr[n] < 0 then
  begin
    monspr[n] := 0;
  end;
  if nobf then
  begin
    dig.Sprite.initspr(n + 8, monspr[n] + 69, 4, 15, 0, 0);
  end
  else
  begin
    case dir of
      0:
      begin
        dig.Sprite.initspr(n + 8, monspr[n] + 73, 4, 15, 0, 0);
      end;
      4:
      begin
        dig.Sprite.initspr(n + 8, monspr[n] + 77, 4, 15, 0, 0);
      end;
    end;
  end;
  exit(dig.Sprite.drawspr(n + 8, x, y));
end;

function TDrawing.drawmondie(n: integer; nobf: boolean; dir: integer;
  x: integer; y: integer): integer;
begin
  if nobf then
  begin
    dig.Sprite.initspr(n + 8, 72, 4, 15, 0, 0);
  end
  else
  begin
    case dir of
      0:
      begin
        dig.Sprite.initspr(n + 8, 76, 4, 15, 0, 0);
      end;
      4:
      begin
        dig.Sprite.initspr(n + 8, 80, 4, 14, 0, 0);
      end;
    end;
  end;
  exit(dig.Sprite.drawspr(n + 8, x, y));
end;

procedure TDrawing.drawrightblob(x: integer; y: integer);
begin
  dig.Sprite.initmiscspr(x + 16, y - 1, 2, 18);
  dig.Sprite.drawmiscspr(x + 16, y - 1, 102, 2, 18);
  dig.Sprite.getis();
end;

procedure TDrawing.drawsquareblob(x: integer; y: integer);
begin
  dig.Sprite.initmiscspr(x - 4, y + 17, 6, 6);
  dig.Sprite.drawmiscspr(x - 4, y + 17, 106, 6, 6);
  dig.Sprite.getis();
end;

procedure TDrawing.drawstatics;
var
  x: integer;
  y: integer;
begin
  x := 0;
  y := 0;
  for x := 0 to (15 - 1) do
    for y := 0 to (10 - 1) do
      if dig.Main.getcplayer() = 0 then
      begin
        field[(y * 15) + x] := field1[(y * 15) + x];
      end
      else
      begin
        field[(y * 15) + x] := field2[(y * 15) + x];
      end;
  dig.Sprite.setretr(True);
  dig.Pc.gpal(0);
  dig.Pc.ginten(0);
  drawbackg(dig.Main.levplan());
  drawfield();
  dig.Pc.currentSource.newPixels(0, 0, dig.Pc.Width, dig.Pc.Height);
end;

procedure TDrawing.drawtopblob(x: integer; y: integer);
begin
  dig.Sprite.initmiscspr(x - 4, y - 6, 6, 6);
  dig.Sprite.drawmiscspr(x - 4, y - 6, 103, 6, 6);
  dig.Sprite.getis();
end;

procedure TDrawing.eatfield(x: integer; y: integer; dir: integer);
var
  h:  integer;
  xr: integer;
  v:  integer;
  yr: integer;
label
  BreakOut;
begin
  h  := trunc((x - 12) / 20);
  xr := trunc(((x - 12) mod 20) / 4);
  v  := trunc((y - 18) / 18);
  yr := trunc(((y - 18) mod 18) / 3);
  dig.Main.incpenalty();
  case dir of
    0:
    begin
      Inc(h);
      field[(v * 15) + h] := field[(v * 15) + h] and bitmasks[xr];
      if (field[(v * 15) + h] and $1F) <> 0 then
      begin
        goto BreakOut;
      end;
      field[(v * 15) + h] := field[(v * 15) + h] and $DFFF;
    end;
    4:
    begin
      Dec(xr);
      if xr < 0 then
      begin
        xr := xr + 5;
        Dec(h);
      end;
      field[(v * 15) + h] := field[(v * 15) + h] and bitmasks[xr];
      if (field[(v * 15) + h] and $1F) <> 0 then
      begin
        goto BreakOut;
      end;
      field[(v * 15) + h] := field[(v * 15) + h] and $DFFF;
    end;
    2:
    begin
      Dec(yr);
      if yr < 0 then
      begin
        yr := yr + 6;
        Dec(v);
      end;
      field[(v * 15) + h] := field[(v * 15) + h] and bitmasks[6 + yr];
      if (field[(v * 15) + h] and $FC0) <> 0 then
      begin
        goto BreakOut;
      end;
      field[(v * 15) + h] := field[(v * 15) + h] and $DFFF;
    end;
    6:
    begin
      Inc(v);
      field[(v * 15) + h] := field[(v * 15) + h] and bitmasks[6 + yr];
      if (field[(v * 15) + h] and $FC0) <> 0 then
      begin
        goto BreakOut;
      end;
      field[(v * 15) + h] := field[(v * 15) + h] and $DFFF;
    end;
  end;
  BreakOut: ;
end;

procedure TDrawing.eraseemerald(x: integer; y: integer);
begin
  dig.Sprite.initmiscspr(x, y, 4, 10);
  dig.Sprite.drawmiscspr(x, y, 109, 4, 10);
  dig.Sprite.getis();
end;

procedure TDrawing.initdbfspr;
begin
  digspd  := 1;
  digspr  := 0;
  firespr := 0;
  dig.Sprite.initspr(0, 0, 4, 15, 0, 0);
  dig.Sprite.initspr(14, 81, 4, 15, 0, 0);
  dig.Sprite.initspr(15, 82, 2, fireheight, 0, 0);
end;

procedure TDrawing.initmbspr;
begin
  dig.Sprite.initspr(1, 62, 4, 15, 0, 0);
  dig.Sprite.initspr(2, 62, 4, 15, 0, 0);
  dig.Sprite.initspr(3, 62, 4, 15, 0, 0);
  dig.Sprite.initspr(4, 62, 4, 15, 0, 0);
  dig.Sprite.initspr(5, 62, 4, 15, 0, 0);
  dig.Sprite.initspr(6, 62, 4, 15, 0, 0);
  dig.Sprite.initspr(7, 62, 4, 15, 0, 0);
  dig.Sprite.initspr(8, 71, 4, 15, 0, 0);
  dig.Sprite.initspr(9, 71, 4, 15, 0, 0);
  dig.Sprite.initspr(10, 71, 4, 15, 0, 0);
  dig.Sprite.initspr(11, 71, 4, 15, 0, 0);
  dig.Sprite.initspr(12, 71, 4, 15, 0, 0);
  dig.Sprite.initspr(13, 71, 4, 15, 0, 0);
  initdbfspr();
end;

procedure TDrawing.makefield;
var
  c: integer;
  x: integer;
  y: integer;
begin
  c := 0;
  x := 0;
  y := 0;
  for x := 0 to (15 - 1) do
    for y := 0 to (10 - 1) do
    begin
      field[(y * 15) + x] := -1;
      c := dig.Main.getlevch(x, y, dig.Main.levplan());
      if (c = Ord(#83)) or (c = Ord(#86)) then
      begin
        field[(y * 15) + x] := field[(y * 15) + x] and $D03F;
      end;
      if (c = Ord(#83)) or (c = Ord(#72)) then
      begin
        field[(y * 15) + x] := field[(y * 15) + x] and $DFE0;
      end;
      if dig.Main.getcplayer() = 0 then
      begin
        field1[(y * 15) + x] := field[(y * 15) + x];
      end
      else
      begin
        field2[(y * 15) + x] := field[(y * 15) + x];
      end;
    end;
end;

procedure TDrawing.outtext(p: string; x: integer; y: integer; c: integer);
begin
  outtext(p, x, y, c, False);
end;

procedure TDrawing.outtext(p: string; x: integer; y: integer; c: integer; b: boolean);
var
  i:  integer;
  rx: integer;
begin
  i  := 0;
  rx := x;
  for i := 1 to p.length do
  begin
    dig.Pc.gwrite(x, y, Ord(p[i]), c);
    x := x + 12;
  end;
  if b then
  begin
    dig.Pc.currentSource.newPixels(rx, y, (p.length - 1) * 12, 12);
  end;
end;

procedure TDrawing.savefield;
var
  x: integer;
  y: integer;
begin
  x := 0;
  y := 0;
  for x := 0 to (15 - 1) do
    for y := 0 to (10 - 1) do
      if dig.Main.getcplayer() = 0 then
      begin
        field1[(y * 15) + x] := field[(y * 15) + x];
      end
      else
      begin
        field2[(y * 15) + x] := field[(y * 15) + x];
      end;
end;

procedure TDrawing.Setfield(Value: IntegerArray);
begin
  mField := Value;
end;

function TDrawing.Getfield(): IntegerArray;
begin
  exit(mField);
end;

end.
