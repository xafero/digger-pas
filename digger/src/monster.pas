unit Monster;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, api, monsterdata;

type
  TMonster = class(TInterfacedObject, IMonster)
  private
  var
    dig:           IDigger;
  var
    mondat:        array of TMonsterData;
  var
    nextmonster:   integer;
  var
    totalmonsters: integer;
  var
    maxmononscr:   integer;
  var
    nextmontime:   integer;
  var
    mongaptime:    integer;
  var
    unbonusflag:   boolean;
  var
    mongotgold:    boolean;
  public
    procedure checkcoincide(mon: integer; bits: integer);
    procedure checkmonscared(h: integer);
    procedure createmonster;
    procedure domonsters;
    procedure erasemonsters;
    function fieldclear(dir: integer; x: integer; y: integer): boolean;
    function getfield(x: integer; y: integer): integer;
    procedure incmont(n: integer);
    procedure incpenalties(bits: integer);
    procedure initmonsters;
    procedure killmon(mon: integer);
    function killmonsters(bits: integer): integer;
    procedure monai(mon: integer);
    procedure mondie(mon: integer);
    procedure mongold;
    function monleft: integer;
    function nmononscr: integer;
    procedure squashmonster(mon: integer; death: integer; bag: integer);
    procedure squashmonsters(bag: integer; bits: integer);
    constructor Create(d: IDigger);
  end;

implementation

constructor TMonster.Create(d: IDigger);
begin
  mondat := [TMonsterData.Create(), TMonsterData.Create(), TMonsterData.Create(),
    TMonsterData.Create(), TMonsterData.Create(), TMonsterData.Create()];
  nextmonster := 0;
  totalmonsters := 0;
  maxmononscr := 0;
  nextmontime := 0;
  mongaptime := 0;
  unbonusflag := False;
  mongotgold := False;
  dig := d;
end;

procedure TMonster.checkcoincide(mon: integer; bits: integer);
var
  m: integer;
  b: integer;
begin
  m := 0;
  b := 256;
  for m := 0 to (6 - 1) do
  begin
    if ((bits and b) <> 0) and (mondat[mon].dir = mondat[m].dir) and
      (mondat[m].stime = 0) and (mondat[mon].stime = 0) then
    begin
      mondat[m].dir := dig.reversedir(mondat[m].dir);
    end;
    b := b shl 1;
  end;
end;

procedure TMonster.checkmonscared(h: integer);
var
  m: integer;
begin
  m := 0;
  for m := 0 to (6 - 1) do
    if (h = mondat[m].h) and (mondat[m].dir = 2) then
    begin
      mondat[m].dir := 6;
    end;
end;

procedure TMonster.createmonster;
var
  i: integer;
begin
  i := 0;
  for i := 0 to (6 - 1) do
    if not mondat[i].flag then
    begin
      mondat[i].flag := True;
      mondat[i].alive := True;
      mondat[i].t  := 0;
      mondat[i].nob := True;
      mondat[i].hnt := 0;
      mondat[i].h  := 14;
      mondat[i].v  := 0;
      mondat[i].x  := 292;
      mondat[i].y  := 18;
      mondat[i].xr := 0;
      mondat[i].yr := 0;
      mondat[i].dir := 4;
      mondat[i].hdir := 4;
      Inc(nextmonster);
      nextmontime := mongaptime;
      mondat[i].stime := 5;
      dig.Sprite.movedrawspr(i + 8, mondat[i].x, mondat[i].y);
      break;
    end;
end;

procedure TMonster.domonsters;
var
  i: integer;
begin
  i := 0;
  if nextmontime > 0 then
  begin
    Dec(nextmontime);
  end
  else
  begin
    if (nextmonster < totalmonsters) and (nmononscr() < maxmononscr) and
      dig.digonscr and (not dig.bonusmode) then
    begin
      createmonster();
    end;
    if unbonusflag and (nextmonster = totalmonsters) and (nextmontime = 0) then
    begin
      if dig.digonscr then
      begin
        unbonusflag := False;
        dig.createbonus();
      end;
    end;
  end;
  for i := 0 to (6 - 1) do
    if mondat[i].flag then
    begin
      if mondat[i].hnt > (10 - dig.Main.levof10()) then
      begin
        if mondat[i].nob then
        begin
          mondat[i].nob := False;
          mondat[i].hnt := 0;
        end;
      end;
      if mondat[i].alive then
      begin
        if mondat[i].t = 0 then
        begin
          monai(i);
          if (dig.Main.randno(15 - dig.Main.levof10()) = 0) and mondat[i].nob then
          begin
            monai(i);
          end;
        end
        else
        begin
          Dec(mondat[i].t);
        end;
      end
      else
      begin
        mondie(i);
      end;
    end;
end;

procedure TMonster.erasemonsters;
var
  i: integer;
begin
  i := 0;
  for i := 0 to (6 - 1) do
    if mondat[i].flag then
    begin
      dig.Sprite.erasespr(i + 8);
    end;
end;

function TMonster.fieldclear(dir: integer; x: integer; y: integer): boolean;
begin
  case dir of
    0:
    begin
      if x < 14 then
      begin
        if (getfield(x + 1, y) and $2000) = 0 then
        begin
          if ((getfield(x + 1, y) and 1) = 0) or
            ((getfield(x, y) and $10) = 0) then
          begin
            exit(True);
          end;
        end;
      end;
    end;
    4:
    begin
      if x > 0 then
      begin
        if (getfield(x - 1, y) and $2000) = 0 then
        begin
          if ((getfield(x - 1, y) and $10) = 0) or
            ((getfield(x, y) and 1) = 0) then
          begin
            exit(True);
          end;
        end;
      end;
    end;
    2:
    begin
      if y > 0 then
      begin
        if (getfield(x, y - 1) and $2000) = 0 then
        begin
          if ((getfield(x, y - 1) and $800) = 0) or
            ((getfield(x, y) and $40) = 0) then
          begin
            exit(True);
          end;
        end;
      end;
    end;
    6:
    begin
      if y < 9 then
      begin
        if (getfield(x, y + 1) and $2000) = 0 then
        begin
          if ((getfield(x, y + 1) and $40) = 0) or
            ((getfield(x, y) and $800) = 0) then
          begin
            exit(True);
          end;
        end;
      end;
    end;
  end;
  exit(False);
end;

function TMonster.getfield(x: integer; y: integer): integer;
begin
  exit(dig.Drawing.field[(y * 15) + x]);
end;

procedure TMonster.incmont(n: integer);
var
  m: integer;
begin
  m := 0;
  if n > 6 then
  begin
    n := 6;
  end;
  for m := 1 to (n - 1) do
    Inc(mondat[m].t);
end;

procedure TMonster.incpenalties(bits: integer);
var
  m: integer;
  b: integer;
begin
  m := 0;
  b := 256;
  for m := 0 to (6 - 1) do
  begin
    if (bits and b) <> 0 then
    begin
      dig.Main.incpenalty();
    end;
    b := b shl 1;
    b := b shl 1;
  end;
end;

procedure TMonster.initmonsters;
var
  i: integer;
label
  Until7, Until10;
begin
  i := 0;
  for i := 0 to (6 - 1) do
    mondat[i].flag := False;
  nextmonster := 0;
  mongaptime  := 45 - (dig.Main.levof10() shl 1);
  totalmonsters := dig.Main.levof10() + 5;
  case dig.Main.levof10() of
    1:
    begin
      maxmononscr := 3;
    end;
    2:
    begin
      goto Until7;
    end;
    3:
    begin
      goto Until7;
    end;
    4:
    begin
      goto Until7;
    end;
    5:
    begin
      goto Until7;
    end;
    6:
    begin
      goto Until7;
    end;
    7:
    begin
      Until7:
        maxmononscr := 4;
    end;
    8:
    begin
      goto Until10;
    end;
    9:
    begin
      goto Until10;
    end;
    10:
    begin
      Until10:
        maxmononscr := 5;
    end;
  end;
  nextmontime := 10;
  unbonusflag := True;
end;

procedure TMonster.killmon(mon: integer);
begin
  if mondat[mon].flag then
  begin
    mondat[mon].alive := False;
    mondat[mon].flag  := False;
    dig.Sprite.erasespr(mon + 8);
    if dig.bonusmode then
    begin
      Inc(totalmonsters);
    end;
  end;
end;

function TMonster.killmonsters(bits: integer): integer;
var
  m: integer;
  b: integer;
  n: integer;
begin
  m := 0;
  b := 256;
  n := 0;
  for m := 0 to (6 - 1) do
  begin
    if (bits and b) <> 0 then
    begin
      killmon(m);
      Inc(n);
    end;
    b := b shl 1;
  end;
  exit(n);
end;

procedure TMonster.monai(mon: integer);
var
  clbits: integer;
  monox: integer;
  monoy: integer;
  dir: integer;
  mdirp1: integer;
  mdirp2: integer;
  mdirp3: integer;
  mdirp4: integer;
  t: integer;
  push: boolean;
begin
  clbits := 0;
  monox := 0;
  monoy := 0;
  dir := 0;
  mdirp1 := 0;
  mdirp2 := 0;
  mdirp3 := 0;
  mdirp4 := 0;
  t := 0;
  push := False;
  monox := mondat[mon].x;
  monoy := mondat[mon].y;
  if (mondat[mon].xr = 0) and (mondat[mon].yr = 0) then
  begin
    //  If we are here the monster needs to know which way to turn next.
    //  Turn hobbin back into nobbin if it's had its time
    if mondat[mon].hnt > (30 + (dig.Main.levof10() shl 1)) then
    begin
      if not mondat[mon].nob then
      begin
        mondat[mon].hnt := 0;
        mondat[mon].nob := True;
      end;
    end;
    //  Set up monster direction properties to chase dig
    if abs(dig.diggery - mondat[mon].y) > abs(dig.diggerx - mondat[mon].x) then
    begin
      if dig.diggery < mondat[mon].y then
      begin
        mdirp1 := 2;
        mdirp4 := 6;
      end
      else
      begin
        mdirp1 := 6;
        mdirp4 := 2;
      end;
      if dig.diggerx < mondat[mon].x then
      begin
        mdirp2 := 4;
        mdirp3 := 0;
      end
      else
      begin
        mdirp2 := 0;
        mdirp3 := 4;
      end;
    end
    else
    begin
      if dig.diggerx < mondat[mon].x then
      begin
        mdirp1 := 4;
        mdirp4 := 0;
      end
      else
      begin
        mdirp1 := 0;
        mdirp4 := 4;
      end;
      if dig.diggery < mondat[mon].y then
      begin
        mdirp2 := 2;
        mdirp3 := 6;
      end
      else
      begin
        mdirp2 := 6;
        mdirp3 := 2;
      end;
    end;
    //  In bonus mode, run away from digger
    if dig.bonusmode then
    begin
      t := mdirp1;
      mdirp1 := mdirp4;
      mdirp4 := t;
      t := mdirp2;
      mdirp2 := mdirp3;
      mdirp3 := t;
    end;
    //  Adjust priorities so that monsters don't reverse direction unless they really have to
    dir := dig.reversedir(mondat[mon].dir);
    if dir = mdirp1 then
    begin
      mdirp1 := mdirp2;
      mdirp2 := mdirp3;
      mdirp3 := mdirp4;
      mdirp4 := dir;
    end;
    if dir = mdirp2 then
    begin
      mdirp2 := mdirp3;
      mdirp3 := mdirp4;
      mdirp4 := dir;
    end;
    if dir = mdirp3 then
    begin
      mdirp3 := mdirp4;
      mdirp4 := dir;
    end;
    //  Introduce a randno element on levels <6 : occasionally swap p1 and p3
    if (dig.Main.randno(dig.Main.levof10() + 5) = 1) and
      (dig.Main.levof10() < 6) then
    begin
      t := mdirp1;
      mdirp1 := mdirp3;
      mdirp3 := t;
    end;
    //  Check field and find direction
    if fieldclear(mdirp1, mondat[mon].h, mondat[mon].v) then
    begin
      dir := mdirp1;
    end
    else
    begin
      if fieldclear(mdirp2, mondat[mon].h, mondat[mon].v) then
      begin
        dir := mdirp2;
      end
      else
      begin
        if fieldclear(mdirp3, mondat[mon].h, mondat[mon].v) then
        begin
          dir := mdirp3;
        end
        else
        begin
          if fieldclear(mdirp4, mondat[mon].h, mondat[mon].v) then
          begin
            dir := mdirp4;
          end;
        end;
      end;
    end;
    //  Hobbins don't care about the field: they go where they want.
    if not mondat[mon].nob then
    begin
      dir := mdirp1;
    end;
    //  Monsters take a time penalty for changing direction
    if mondat[mon].dir <> dir then
    begin
      Inc(mondat[mon].t);
    end;
    //  Save the new direction
    mondat[mon].dir := dir;
  end;
  //  If monster is about to go off edge of screen, stop it.
  if ((mondat[mon].x = 292) and (mondat[mon].dir = 0)) or
    ((mondat[mon].x = 12) and (mondat[mon].dir = 4)) or
    ((mondat[mon].y = 180) and (mondat[mon].dir = 6)) or
    ((mondat[mon].y = 18) and (mondat[mon].dir = 2)) then
  begin
    mondat[mon].dir := -1;
  end;
  //  Change hdir for hobbin
  if (mondat[mon].dir = 4) or (mondat[mon].dir = 0) then
  begin
    mondat[mon].hdir := mondat[mon].dir;
  end;
  //  Hobbins digger
  if not mondat[mon].nob then
  begin
    dig.Drawing.eatfield(mondat[mon].x, mondat[mon].y, mondat[mon].dir);
  end;
  //  (Draw new tunnels) and move monster
  case mondat[mon].dir of
    0:
    begin
      if not mondat[mon].nob then
      begin
        dig.Drawing.drawrightblob(mondat[mon].x, mondat[mon].y);
      end;
      mondat[mon].x := mondat[mon].x + 4;
    end;
    4:
    begin
      if not mondat[mon].nob then
      begin
        dig.Drawing.drawleftblob(mondat[mon].x, mondat[mon].y);
      end;
      mondat[mon].x := mondat[mon].x - 4;
    end;
    2:
    begin
      if not mondat[mon].nob then
      begin
        dig.Drawing.drawtopblob(mondat[mon].x, mondat[mon].y);
      end;
      mondat[mon].y := mondat[mon].y - 3;
    end;
    6:
    begin
      if not mondat[mon].nob then
      begin
        dig.Drawing.drawbottomblob(mondat[mon].x, mondat[mon].y);
      end;
      mondat[mon].y := mondat[mon].y + 3;
    end;
  end;
  //  Hobbins can eat emeralds
  if not mondat[mon].nob then
  begin
    dig.hitemerald(trunc((mondat[mon].x - 12) / 20), trunc(
      (mondat[mon].y - 18) / 18), (mondat[mon].x - 12) mod 20,
      (mondat[mon].y - 18) mod 18, mondat[mon].dir);
  end;
  //  If digger's gone, don't bother
  if not dig.digonscr then
  begin
    mondat[mon].x := monox;
    mondat[mon].y := monoy;
  end;
  //  If monster's just started, don't move yet
  if mondat[mon].stime <> 0 then
  begin
    Dec(mondat[mon].stime);
    mondat[mon].x := monox;
    mondat[mon].y := monoy;
  end;
  //  Increase time counter for hobbin
  if (not mondat[mon].nob) and (mondat[mon].hnt < 100) then
  begin
    Inc(mondat[mon].hnt);
  end;
  //  Draw monster
  push := True;
  clbits := dig.Drawing.drawmon(mon, mondat[mon].nob, mondat[mon].hdir,
    mondat[mon].x, mondat[mon].y);
  dig.Main.incpenalty();
  //  Collision with another monster
  if (clbits and $3F00) <> 0 then
  begin
    Inc(mondat[mon].t);
    //  Time penalty
    checkcoincide(mon, clbits);
    //  Ensure both aren't moving in the same dir.
    incpenalties(clbits);
  end;
  //  Check for collision with bag
  if (clbits and dig.Bags.bagbits()) <> 0 then
  begin
    Inc(mondat[mon].t);
    //  Time penalty
    mongotgold := False;
    if (mondat[mon].dir = 4) or (mondat[mon].dir = 0) then
    begin
      //  Horizontal push
      push := dig.Bags.pushbags(mondat[mon].dir, clbits);
      Inc(mondat[mon].t);
      //  Time penalty
    end
    else
    begin
      if not dig.Bags.pushudbags(clbits) then
      begin
        push := False;
      end;
    end;
    if mongotgold then
    begin
      mondat[mon].t := 0;
    end;
    if (not mondat[mon].nob) and (mondat[mon].hnt > 1) then
    begin
      dig.Bags.removebags(clbits);
    end;
    //  Hobbins eat bags
  end;
  //  Increase hobbin cross counter
  if mondat[mon].nob and ((clbits and $3F00) <> 0) and dig.digonscr then
  begin
    Inc(mondat[mon].hnt);
  end;
  //  See if bags push monster back
  if not push then
  begin
    mondat[mon].x := monox;
    mondat[mon].y := monoy;
    dig.Drawing.drawmon(mon, mondat[mon].nob, mondat[mon].hdir,
      mondat[mon].x, mondat[mon].y);
    dig.Main.incpenalty();
    if mondat[mon].nob then
    begin
      Inc(mondat[mon].hnt);
    end;
    if ((mondat[mon].dir = 2) or (mondat[mon].dir = 6)) and mondat[mon].nob then
    begin
      mondat[mon].dir := dig.reversedir(mondat[mon].dir);
    end;
    //  If vertical, give up
  end;
  //  Collision with digger
  if ((clbits and 1) <> 0) and dig.digonscr then
  begin
    if dig.bonusmode then
    begin
      killmon(mon);
      dig.Scores.scoreeatm();
      dig.Sound.soundeatm();
      //  Collision in bonus mode
    end
    else
    begin
      dig.killdigger(3, 0);
    end;
  end;
  //  Kill digger
  //  Update co-ordinates
  mondat[mon].h  := trunc((mondat[mon].x - 12) / 20);
  mondat[mon].v  := trunc((mondat[mon].y - 18) / 18);
  mondat[mon].xr := (mondat[mon].x - 12) mod 20;
  mondat[mon].yr := (mondat[mon].y - 18) mod 18;
end;

procedure TMonster.mondie(mon: integer);
begin
  case mondat[mon].death of
    1:
    begin
      if (dig.Bags.bagy(mondat[mon].bag) + 6) > mondat[mon].y then
      begin
        mondat[mon].y := dig.Bags.bagy(mondat[mon].bag);
      end;
      dig.Drawing.drawmondie(mon, mondat[mon].nob, mondat[mon].hdir,
        mondat[mon].x, mondat[mon].y);
      dig.Main.incpenalty();
      if dig.Bags.getbagdir(mondat[mon].bag) = (-1) then
      begin
        mondat[mon].dtime := 1;
        mondat[mon].death := 4;
      end;
    end;
    4:
    begin
      if mondat[mon].dtime <> 0 then
      begin
        Dec(mondat[mon].dtime);
      end
      else
      begin
        killmon(mon);
        dig.Scores.scorekill();
      end;
    end;
  end;
end;

procedure TMonster.mongold;
begin
  mongotgold := True;
end;

function TMonster.monleft: integer;
begin
  exit((nmononscr() + totalmonsters) - nextmonster);
end;

function TMonster.nmononscr: integer;
var
  i: integer;
  n: integer;
begin
  i := 0;
  n := 0;
  for i := 0 to (6 - 1) do
    if mondat[i].flag then
    begin
      Inc(n);
    end;
  exit(n);
end;

procedure TMonster.squashmonster(mon: integer; death: integer; bag: integer);
begin
  mondat[mon].alive := False;
  mondat[mon].death := death;
  mondat[mon].bag := bag;
end;

procedure TMonster.squashmonsters(bag: integer; bits: integer);
var
  m: integer;
  b: integer;
begin
  m := 0;
  b := 256;
  for m := 0 to (6 - 1) do
  begin
    if (bits and b) <> 0 then
    begin
      if mondat[m].y >= dig.Bags.bagy(bag) then
      begin
        squashmonster(m, 1, bag);
      end;
    end;
    b := b shl 1;
  end;
end;

end.
