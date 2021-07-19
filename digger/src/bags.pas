unit Bags;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, api, bagdata;

type
  TBags = class(TInterfacedObject, IBags)
  private
  var
    dig:       IDigger;
  var
    wblanim:   array of integer;
  var
    bagdat1:   array of TBagData;
  var
    bagdat2:   array of TBagData;
  var
    bagdat:    array of TBagData;
  var
    pushcount: integer;
  var
    goldtime:  integer;
  public
    constructor Create(d: IDigger);
    function bagbits(): integer;
    procedure baghitground(bag: integer);
    function bagy(bag: integer): integer;
    procedure cleanupbags();
    procedure dobags;
    procedure drawbags;
    function getbagdir(bag: integer): integer;
    procedure getgold(bag: integer);
    function getnmovingbags: integer;
    procedure initbags;
    function pushbag(bag: integer; dir: integer): boolean;
    function pushbags(dir: integer; bits: integer): boolean;
    function pushudbags(bits: integer): boolean;
    procedure removebag(bag: integer);
    procedure removebags(bits: integer);
    procedure updatebag(bag: integer);
  end;

implementation

constructor TBags.Create(d: IDigger);
begin
  dig := d;
  wblanim := [2, 0, 1, 0];
  bagdat1 := [TBagData.Create(), TBagData.Create(), TBagData.Create(),
    TBagData.Create(), TBagData.Create(), TBagData.Create(),
    TBagData.Create(), TBagData.Create()];
  bagdat2 := [TBagData.Create(), TBagData.Create(), TBagData.Create(),
    TBagData.Create(), TBagData.Create(), TBagData.Create(),
    TBagData.Create(), TBagData.Create()];
  bagdat := [TBagData.Create(), TBagData.Create(), TBagData.Create(),
    TBagData.Create(), TBagData.Create(), TBagData.Create(),
    TBagData.Create(), TBagData.Create()];
  pushcount := 0;
  goldtime := 0;
end;

function TBags.bagbits(): integer;
var
  bag: integer;
  b: integer;
  bags: integer;
begin
  bags := 0;
  b := 2;
  for bag := 1 to (8 - 1) do
  begin
    if bagdat[bag].exist then
    begin
      bags := bags or b;
    end;
    b := b shl 1;
  end;
  exit(bags);
end;

procedure TBags.removebag(bag: integer);
begin
  if bagdat[bag].exist then
  begin
    bagdat[bag].exist := False;
    dig.Sprite.erasespr(bag);
  end;
end;

procedure TBags.removebags(bits: integer);
var
  bag: integer;
  b: integer;
begin
  bag := 0;
  b := 2;
  for bag := 1 to (8 - 1) do
  begin
    if bagdat[bag].exist and ((bits and b) <> 0) then
    begin
      removebag(bag);
    end;
    b := b shl 1;
  end;
end;

procedure TBags.baghitground(bag: integer);
var
  bn: integer;
  b:  integer;
  clbits: integer;
begin
  bn := 0;
  b  := 0;
  clbits := 0;

  if (bagdat[bag].dir = 6) and (bagdat[bag].fallh > 1) then
  begin
    bagdat[bag].gt := 1;
  end
  else
  begin
    bagdat[bag].fallh := 0;
  end;
  bagdat[bag].dir := -1;
  bagdat[bag].wt := 15;
  bagdat[bag].wobbling := False;
  clbits := dig.Drawing.drawgold(bag, 0, bagdat[bag].x, bagdat[bag].y);
  dig.Main.incpenalty();
  b := 2;
  for bn := 1 to (8 - 1) do
  begin
    if (b and clbits) <> 0 then
    begin
      removebag(bn);
    end;
    b := b shl 1;
  end;
end;

function TBags.bagy(bag: integer): integer;
begin
  exit(bagdat[bag].y);
end;

procedure TBags.cleanupbags();
var
  bpa: integer;
begin
  bpa := 0;

  dig.Sound.soundfalloff();
  for bpa := 1 to (8 - 1) do
  begin
    if bagdat[bpa].exist and (((bagdat[bpa].h = 7) and (bagdat[bpa].v = 9)) or
      (bagdat[bpa].xr <> 0) or (bagdat[bpa].yr <> 0) or (bagdat[bpa].gt <> 0) or
      (bagdat[bpa].fallh <> 0) or bagdat[bpa].wobbling) then
    begin
      bagdat[bpa].exist := False;
      dig.Sprite.erasespr(bpa);
    end;
    if dig.Main.getcplayer() = 0 then
    begin
      bagdat1[bpa].copyFrom(bagdat[bpa]);
    end
    else
    begin
      bagdat2[bpa].copyFrom(bagdat[bpa]);
    end;
  end;
end;

procedure TBags.dobags;
var
  bag: integer;
  soundfalloffflag: boolean;
  soundwobbleoffflag: boolean;
begin
  bag := 0;
  soundfalloffflag := True;
  soundwobbleoffflag := True;

  for bag := 1 to (8 - 1) do
  begin

    if bagdat[bag].exist then
    begin
      if bagdat[bag].gt <> 0 then
      begin
        if bagdat[bag].gt = 1 then
        begin

          dig.Sound.soundbreak();
          dig.Drawing.drawgold(bag, 4, bagdat[bag].x, bagdat[bag].y);
          dig.Main.incpenalty();
        end;
        if bagdat[bag].gt = 3 then
        begin

          dig.Drawing.drawgold(bag, 5, bagdat[bag].x, bagdat[bag].y);
          dig.Main.incpenalty();
        end;
        if bagdat[bag].gt = 5 then
        begin

          dig.Drawing.drawgold(bag, 6, bagdat[bag].x, bagdat[bag].y);
          dig.Main.incpenalty();
        end;
        Inc(bagdat[bag].gt);
        if bagdat[bag].gt = goldtime then
        begin

          removebag(bag);
        end
        else
        begin
          if (bagdat[bag].v < 9) and (bagdat[bag].gt < (goldtime - 10)) then
          begin

            if (dig.Monster.getfield(bagdat[bag].h, bagdat[bag].v + 1) and
              $2000) = 0 then
            begin

              bagdat[bag].gt := goldtime - 10;
            end;
          end;
        end;
      end
      else
      begin

        updatebag(bag);

      end;
    end;
  end;

  for bag := 1 to (8 - 1) do
  begin

    if (bagdat[bag].dir = 6) and bagdat[bag].exist then
    begin
      soundfalloffflag := False;
    end;

    if (bagdat[bag].dir <> 6) and bagdat[bag].wobbling and bagdat[bag].exist then
    begin
      soundwobbleoffflag := False;
    end;

  end;
  if soundfalloffflag then
  begin

    dig.Sound.soundfalloff();
  end;
  if soundwobbleoffflag then
  begin

    dig.Sound.soundwobbleoff();
  end;

end;

procedure TBags.drawbags;
var
  bag: integer;
begin
  bag := 0;
  for bag := 1 to (8 - 1) do
  begin
    if dig.Main.getcplayer() = 0 then
    begin
      bagdat[bag].copyFrom(bagdat1[bag]);
    end
    else
    begin
      bagdat[bag].copyFrom(bagdat2[bag]);
    end;
    if bagdat[bag].exist then
    begin
      dig.Sprite.movedrawspr(bag, bagdat[bag].x, bagdat[bag].y);
    end;
  end;
end;

function TBags.getbagdir(bag: integer): integer;
begin
  if bagdat[bag].exist then
  begin
    exit(bagdat[bag].dir);
  end;
  exit(-1);
end;

procedure TBags.getgold(bag: integer);
var
  clbits: integer;
begin
  clbits := 0;
  clbits := dig.Drawing.drawgold(bag, 6, bagdat[bag].x, bagdat[bag].y);
  dig.Main.incpenalty();
  if (clbits and 1) <> 0 then
  begin
    dig.Scores.scoregold();
    dig.Sound.soundgold();
    dig.digtime := 0;
  end
  else
  begin
    dig.Monster.mongold();
  end;
  removebag(bag);
end;

function TBags.getnmovingbags: integer;
var
  bag: integer;
  n: integer;
begin
  bag := 0;
  n := 0;
  for bag := 1 to (8 - 1) do
  begin
    if bagdat[bag].exist and (bagdat[bag].gt < 10) and
      ((bagdat[bag].gt <> 0) or bagdat[bag].wobbling) then
    begin
      Inc(n);
    end;
  end;
  exit(n);
end;

procedure TBags.initbags;
var
  bag: integer;
  x: integer;
  y: integer;
  i: integer;
begin
  bag := 0;
  x := 0;
  y := 0;
  i := 0;
  pushcount := 0;
  goldtime := 150 - (dig.Main.levof10() * 10);
  for bag := 1 to (8 - 1) do
  begin
    bagdat[bag].exist := False;
  end;
  bag := 1;
  for x := 0 to (15 - 1) do
    for y := 0 to (10 - 1) do
      if Ord(dig.Main.getlevch(x, y, dig.Main.levplan())) = Ord('B') then
      begin
        if bag < 8 then
        begin
          bagdat[bag].exist := True;
          bagdat[bag].gt := 0;
          bagdat[bag].fallh := 0;
          bagdat[bag].dir := -1;
          bagdat[bag].wobbling := False;
          bagdat[bag].wt := 15;
          bagdat[bag].unfallen := True;
          bagdat[bag].x  := (x * 20) + 12;
          bagdat[bag].y  := (y * 18) + 18;
          bagdat[bag].h  := x;
          bagdat[bag].v  := y;
          bagdat[bag].xr := 0;
          bagdat[bag].yr := 0;
          Inc(bag);
        end;
      end;
  if dig.Main.getcplayer() = 0 then
  begin
    for i := 1 to (8 - 1) do
      bagdat1[i].copyFrom(bagdat[i]);
  end
  else
  begin
    for i := 1 to (8 - 1) do
      bagdat2[i].copyFrom(bagdat[i]);
  end;
end;

function TBags.pushbag(bag: integer; dir: integer): boolean;
var
  x:  integer;
  y:  integer;
  h:  integer;
  v:  integer;
  ox: integer;
  oy: integer;
  clbits: integer;
  push: boolean;
begin
  x  := 0;
  y  := 0;
  h  := 0;
  v  := 0;
  ox := 0;
  oy := 0;
  clbits := 0;
  push := True;
  x  := bagdat[bag].x;
  ox := bagdat[bag].x;
  y  := bagdat[bag].y;
  oy := bagdat[bag].y;
  h  := bagdat[bag].h;
  v  := bagdat[bag].v;
  if bagdat[bag].gt <> 0 then
  begin
    getgold(bag);
    exit(True);
  end;
  if (bagdat[bag].dir = 6) and ((dir = 4) or (dir = 0)) then
  begin
    clbits := dig.Drawing.drawgold(bag, 3, x, y);
    dig.Main.incpenalty();
    if ((clbits and 1) <> 0) and (dig.diggery >= y) then
    begin
      dig.killdigger(1, bag);
    end;
    if (clbits and $3F00) <> 0 then
    begin
      dig.Monster.squashmonsters(bag, clbits);
    end;
    exit(True);
  end;
  if ((x = 292) and (dir = 0)) or ((x = 12) and (dir = 4)) or
    ((y = 180) and (dir = 6)) or ((y = 18) and (dir = 2)) then
  begin
    push := False;
  end;
  if push then
  begin
    case dir of
      0:
      begin
        x := x + 4;
      end;
      4:
      begin
        x := x - 4;
      end;
      6:
      begin
        if bagdat[bag].unfallen then
        begin
          bagdat[bag].unfallen := False;
          dig.Drawing.drawsquareblob(x, y);
          dig.Drawing.drawtopblob(x, y + 21);
        end
        else
        begin
          dig.Drawing.drawfurryblob(x, y);
        end;
        dig.Drawing.eatfield(x, y, dir);
        dig.killemerald(h, v);
        y := y + 6;
      end;
    end;
    case dir of
      6:
      begin
        clbits := dig.Drawing.drawgold(bag, 3, x, y);
        dig.Main.incpenalty();
        if ((clbits and 1) <> 0) and (dig.diggery >= y) then
        begin
          dig.killdigger(1, bag);
        end;
        if (clbits and $3F00) <> 0 then
        begin
          dig.Monster.squashmonsters(bag, clbits);
        end;
      end;
      0:
      begin
      end;
      4:
      begin
        bagdat[bag].wt := 15;
        bagdat[bag].wobbling := False;
        clbits := dig.Drawing.drawgold(bag, 0, x, y);
        dig.Main.incpenalty();
        pushcount := 1;
        if (clbits and $FE) <> 0 then
        begin
          if not pushbags(dir, clbits) then
          begin
            x := ox;
            y := oy;
            dig.Drawing.drawgold(bag, 0, ox, oy);
            dig.Main.incpenalty();
            push := False;
          end;
        end;
        if ((clbits and 1) <> 0) or ((clbits and $3F00) <> 0) then
        begin
          x := ox;
          y := oy;
          dig.Drawing.drawgold(bag, 0, ox, oy);
          dig.Main.incpenalty();
          push := False;
        end;
      end;
    end;
    if push then
    begin
      bagdat[bag].dir := dir;
    end
    else
    begin
      bagdat[bag].dir := dig.reversedir(dir);
    end;
    bagdat[bag].x  := x;
    bagdat[bag].y  := y;
    bagdat[bag].h  := trunc((x - 12) / 20);
    bagdat[bag].v  := trunc((y - 18) / 18);
    bagdat[bag].xr := (x - 12) mod 20;
    bagdat[bag].yr := (y - 18) mod 18;
  end;
  exit(push);
end;

function TBags.pushbags(dir: integer; bits: integer): boolean;
var
  bag:  integer;
  bit:  integer;
  push: boolean;
begin
  bag  := 0;
  bit  := 2;
  push := True;
  for bag := 1 to (8 - 1) do
  begin
    if (bits and bit) <> 0 then
    begin
      if not pushbag(bag, dir) then
      begin
        push := False;
      end;
    end;
    bit := bit shl 1;
  end;
  exit(push);
end;

function TBags.pushudbags(bits: integer): boolean;
var
  bag: integer;
  b: integer;
  push: boolean;
begin
  bag := 0;
  b := 2;
  push := True;
  for bag := 1 to (8 - 1) do
  begin
    if (bits and b) <> 0 then
    begin
      if bagdat[bag].gt <> 0 then
      begin
        getgold(bag);
      end
      else
      begin
        push := False;
      end;
    end;
    b := b shl 1;
  end;
  exit(push);
end;

procedure TBags.updatebag(bag: integer);
var
  x:  integer;
  h:  integer;
  xr: integer;
  y:  integer;
  v:  integer;
  yr: integer;
  wbl: integer;
label
  BreakOut, Until4;
begin
  x  := 0;
  h  := 0;
  xr := 0;
  y  := 0;
  v  := 0;
  yr := 0;
  wbl := 0;
  x  := bagdat[bag].x;
  h  := bagdat[bag].h;
  xr := bagdat[bag].xr;
  y  := bagdat[bag].y;
  v  := bagdat[bag].v;
  yr := bagdat[bag].yr;
  case bagdat[bag].dir of
    -1:
    begin

      if (y < 180) and (xr = 0) then
      begin
        if bagdat[bag].wobbling then
        begin
          if bagdat[bag].wt = 0 then
          begin
            bagdat[bag].dir := 6;

            dig.Sound.soundfall();
            goto BreakOut;
          end;
          Dec(bagdat[bag].wt);
          wbl := bagdat[bag].wt mod 8;
          if not (wbl and 1) <> 0 then
          begin

            dig.Drawing.drawgold(bag, wblanim[wbl shr 1], x, y);

            dig.Main.incpenalty();

            dig.Sound.soundwobble();

          end;
        end
        else
        begin

          if (dig.Monster.getfield(h, v + 1) and $FDF) <> $FDF then
          begin

            if not dig.checkdiggerunderbag(h, v + 1) then
            begin
              bagdat[bag].wobbling := True;
            end;
          end;
        end;
      end
      else
      begin
        bagdat[bag].wt := 15;
        bagdat[bag].wobbling := False;
      end;
    end;
    0:
    begin
      goto Until4;
    end;
    4:
    begin
      Until4:
        if xr = 0 then
        begin
          if (y < 180) and ((dig.Monster.getfield(h, v + 1) and $FDF) <> $FDF) then
          begin
            bagdat[bag].dir := 6;
            bagdat[bag].wt  := 0;

            dig.Sound.soundfall();
          end
          else
          begin

            baghitground(bag);
          end;
        end;
    end;
    6:
    begin
      if yr = 0 then
      begin
        Inc(bagdat[bag].fallh);
      end;
      if y >= 180 then
      begin

        baghitground(bag);
      end
      else
      begin
        if (dig.Monster.getfield(h, v + 1) and $FDF) = $FDF then
        begin
          if yr = 0 then
          begin

            baghitground(bag);
          end;
        end;
      end;

      dig.Monster.checkmonscared(bagdat[bag].h);
    end;
  end;
  BreakOut:
    if bagdat[bag].dir <> (-1) then
    begin
      if (bagdat[bag].dir <> 6) and (pushcount <> 0) then
      begin
        Dec(pushcount);
      end
      else
      begin

        pushbag(bag, bagdat[bag].dir);
      end;
    end;
end;

end.
