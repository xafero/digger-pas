unit Digger;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, bags, main, sound, monster, scores, sprite,
  drawing, input, pc, api, colormodel;

type
  TDigger = class(TInterfacedObject, IDigger)
  private
  var
    gamethread:         TThread;
  var
    mSubaddr:           string;
  var
    mBags:              IBags;
  var
    mMain:              IMain;
  var
    mSound:             ISound;
  var
    mMonster:           IMonster;
  var
    mScores:            IScores;
  var
    mSprite:            ISprite;
  var
    mDrawing:           IDrawing;
  var
    mInput:             IInput;
  var
    mPc:                IPc;
  var
    emmask:             integer;
  var
    emfield:            array of byte;
  var
    embox:              array of integer;
  var
    deatharc:           array of integer;
    class var MAX_RATE: integer;
    class var MIN_RATE: integer;
  var
    Width:              integer;
  var
    Height:             integer;
  var
    mFrametime:         integer;
  var
    mDiggerx:           integer;
  var
    mDiggery:           integer;
  var
    diggerh:            integer;
  var
    diggerv:            integer;
  var
    diggerrx:           integer;
  var
    diggerry:           integer;
  var
    digmdir:            integer;
  var
    digdir:             integer;
  var
    mDigtime:           integer;
  var
    rechargetime:       integer;
  var
    firex:              integer;
  var
    firey:              integer;
  var
    firedir:            integer;
  var
    expsn:              integer;
  var
    deathstage:         integer;
  var
    deathbag:           integer;
  var
    deathani:           integer;
  var
    deathtime:          integer;
  var
    startbonustimeleft: integer;
  var
    bonustimeleft:      integer;
  var
    mEatmsc:            integer;
  var
    emocttime:          integer;
  var
    mDigonscr:          boolean;
  var
    notfiring:          boolean;
  var
    mBonusvisible:      boolean;
  var
    mBonusmode:         boolean;
  var
    diggervisible:      boolean;
  var
    mTime:              int64;
  var
    mFtime:             int64;
  var
    factory:            IFactory;
    class constructor Create;
  public
    constructor Create(f: IFactory);

    function getDigTime(): integer;
    procedure setDigTime(Value: integer);
    property digtime: integer Read getDigTime Write setDigTime;

    procedure Setsubaddr(Value: string);
    function Getsubaddr: string;
    property subaddr: string Read Getsubaddr Write Setsubaddr;

    function getDiggerY(): integer;
    procedure setDiggerY(Value: integer);
    property diggery: integer Read getDiggerY Write setDiggerY;

    function getDiggerX(): integer;
    procedure setDiggerX(Value: integer);
    property diggerx: integer Read getDiggerX Write setDiggerX;

    procedure SetDigonscr(Value: boolean);
    function GetDigonscr: boolean;
    property digonscr: boolean Read GetDigonscr Write SetDigonscr;

    procedure Setftime(Value: integer);
    function Getftime: integer;
    property ftime: integer Read Getftime Write Setftime;

    procedure Settime(Value: int64);
    function Gettime: int64;
    property time: int64 Read Gettime Write Settime;

    procedure Setframetime(Value: integer);
    function Getframetime: integer;
    property frametime: integer Read Getframetime Write Setframetime;

    procedure Seteatmsc(Value: integer);
    function Geteatmsc: integer;
    property eatmsc: integer Read Geteatmsc Write Seteatmsc;

    procedure Setbonusmode(Value: boolean);
    function Getbonusmode: boolean;
    property bonusmode: boolean Read Getbonusmode Write Setbonusmode;

    procedure Setbonusvisible(Value: boolean);
    function Getbonusvisible: boolean;
    property bonusvisible: boolean Read Getbonusvisible Write Setbonusvisible;

    function Drawing(): IDrawing;
    function Main(): IMain;
    function Monster(): IMonster;
    function Sprite(): ISprite;
    function Input(): IInput;
    function Bags(): IBags;
    function Scores(): IScores;
    function Pc(): IPc;
    function Sound(): ISound;

    function checkdiggerunderbag(h: integer; v: integer): boolean;
    function countem: integer;
    procedure createbonus;
    procedure mydestroy;
    procedure diggerdie;
    procedure dodigger;
    procedure drawemeralds;
    procedure drawexplosion;
    procedure endbonusmode;
    procedure erasebonus;
    procedure erasedigger;
    function getAppletInfo: string;
    function getfirepflag: boolean;
    function hitemerald(x: integer; y: integer; rx: integer; ry: integer;
      dir: integer): boolean;
    procedure init;
    procedure initbonusmode;
    procedure initdigger;
    function keyDown(key: integer): boolean;
    function keyUp(key: integer): boolean;
    procedure killdigger(stage: integer; bag: integer);
    procedure killemerald(x: integer; y: integer);
    procedure killfire;
    procedure makeemfield;
    procedure newframe;
    function reversedir(dir: integer): integer;
    procedure run;
    procedure start;
    procedure updatedigger;
    procedure updatefire;
  end;

implementation

class constructor TDigger.Create;
begin
  MAX_RATE := 200;
  MIN_RATE := 40;
end;

constructor TDigger.Create(f: IFactory);
begin
  factory := f;
  Width := 320;
  Height := 200;
  frametime := 66;
  diggerx := 0;
  diggery := 0;
  diggerh := 0;
  diggerv := 0;
  diggerrx := 0;
  diggerry := 0;
  digmdir := 0;
  digdir := 0;
  digtime := 0;
  rechargetime := 0;
  firex := 0;
  firey := 0;
  firedir := 0;
  expsn := 0;
  deathstage := 0;
  deathbag := 0;
  deathani := 0;
  deathtime := 0;
  startbonustimeleft := 0;
  bonustimeleft := 0;
  eatmsc := 0;
  emocttime := 0;
  digonscr := False;
  notfiring := False;
  bonusvisible := False;
  bonusmode := False;
  diggervisible := False;
  time := 0;
  ftime := 50;
  emmask := 0;
  emfield := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  embox := [8, 12, 12, 9, 16, 12, 6, 9];
  deatharc := [3, 5, 6, 6, 5, 3, 0];
  mBags := TBags.Create(self);
  mMain := TMain.Create(self);
  mSound := TSound.Create(self);
  mMonster := TMonster.Create(self);
  mScores := TScores.Create(self);
  mSprite := TSprite.Create(self);
  mDrawing := TDrawing.Create(self);
  mInput := TInput.Create(self);
  mPc := TPc.Create(self);
end;

function TDigger.checkdiggerunderbag(h: integer; v: integer): boolean;
begin
  if (digmdir = 2) or (digmdir = 6) then
  begin
    if ((diggerx - 12) / 20) = h then
    begin
      if (((diggery - 18) / 18) = v) or ((((diggery - 18) / 18) + 1) = v) then
      begin
        exit(True);
      end;
    end;
  end;
  exit(False);
end;

function TDigger.countem: integer;
var
  x: integer;
  y: integer;
  n: integer;
begin
  x := 0;
  y := 0;
  n := 0;
  for x := 0 to (15 - 1) do
    for y := 0 to (10 - 1) do
      if (emfield[(y * 15) + x] and emmask) <> 0 then
      begin
        Inc(n);
      end;
  exit(n);
end;

procedure TDigger.createbonus;
begin
  bonusvisible := True;
  Drawing.drawbonus(292, 18);
end;

procedure TDigger.mydestroy;
begin
  if assigned(gamethread) then
  begin

    gamethread.Terminate();

  end;
end;

procedure TDigger.diggerdie;
var
  clbits: integer;
label
  BreakOut;
begin
  clbits := 0;
  case deathstage of
    1:
    begin
      if (Bags.bagy(deathbag) + 6) > diggery then
      begin
        diggery := Bags.bagy(deathbag) + 6;
      end;
      Drawing.drawdigger(15, diggerx, diggery, False);
      Main.incpenalty();
      if (Bags.getbagdir(deathbag) + 1) = 0 then
      begin
        Sound.soundddie();
        deathtime := 5;
        deathstage := 2;
        deathani := 0;
        diggery  := diggery - 6;
      end;
    end;
    2:
    begin
      if deathtime <> 0 then
      begin
        Dec(deathtime);
        goto BreakOut;
      end;
      if deathani = 0 then
      begin
        Sound.music(2);
      end;
      clbits := Drawing.drawdigger(14 - deathani, diggerx, diggery, False);
      Main.incpenalty();
      if (deathani = 0) and ((clbits and $3F00) <> 0) then
      begin
        Monster.killmonsters(clbits);
      end;
      if deathani < 4 then
      begin
        Inc(deathani);
        deathtime := 2;
      end
      else
      begin
        deathstage := 4;
        if Sound.musicflag then
        begin
          deathtime := 60;
        end
        else
        begin
          deathtime := 10;
        end;
      end;
    end;
    3:
    begin
      deathstage := 5;
      deathani  := 0;
      deathtime := 0;
    end;
    5:
    begin
      if (deathani >= 0) and (deathani <= 6) then
      begin
        Drawing.drawdigger(15, diggerx, diggery - deatharc[deathani], False);
        if deathani = 6 then
        begin
          Sound.musicoff();
        end;
        Main.incpenalty();
        Inc(deathani);
        if deathani = 1 then
        begin
          Sound.soundddie();
        end;
        if deathani = 7 then
        begin
          deathtime := 5;
          deathani  := 0;
          deathstage := 2;
        end;
      end;
    end;
    4:
    begin
      if deathtime <> 0 then
      begin
        Dec(deathtime);
      end
      else
      begin
        Main.setdead(True);
      end;
    end;
  end;
  BreakOut: ;
end;

procedure TDigger.dodigger;
begin
  newframe();

  if expsn <> 0 then
  begin

    drawexplosion();
  end
  else
  begin

    updatefire();
  end;

  if diggervisible then
  begin
    if digonscr then
    begin
      if digtime <> 0 then
      begin

        Drawing.drawdigger(digmdir, diggerx, diggery, notfiring and
          (rechargetime = 0));

        Main.incpenalty();
        Dec(mDigtime);
      end
      else
      begin

        updatedigger();

      end;
    end
    else
    begin

      diggerdie();
    end;
  end;
  if bonusmode and digonscr then
  begin
    if bonustimeleft <> 0 then
    begin
      Dec(bonustimeleft);
      if (startbonustimeleft <> 0) or (bonustimeleft < 20) then
      begin
        Dec(startbonustimeleft);
        if (bonustimeleft and 1) <> 0 then
        begin
          Pc.ginten(0);
          Sound.soundbonus();
        end
        else
        begin
          Pc.ginten(1);
          Sound.soundbonus();
        end;
        if startbonustimeleft = 0 then
        begin
          Sound.music(0);
          Sound.soundbonusoff();
          Pc.ginten(1);
        end;
      end;
    end
    else
    begin
      endbonusmode();
      Sound.soundbonusoff();
      Sound.music(1);
    end;
  end;
  if bonusmode and (not digonscr) then
  begin
    endbonusmode();
    Sound.soundbonusoff();
    Sound.music(1);
  end;
  if emocttime > 0 then
  begin
    Dec(emocttime);
  end;
end;

procedure TDigger.drawemeralds;
var
  x: integer;
  y: integer;
begin
  x := 0;
  y := 0;
  emmask := 1 shl Main.getcplayer();
  for x := 0 to (15 - 1) do
    for y := 0 to (10 - 1) do
      if (emfield[(y * 15) + x] and emmask) <> 0 then
      begin
        Drawing.drawemerald((x * 20) + 12, (y * 18) + 21);
      end;
end;

procedure TDigger.drawexplosion;
label
  Until3;
begin
  case expsn of
    1:
    begin
      Sound.soundexplode();
      goto Until3;
    end;
    2:
    begin
      goto Until3;
    end;
    3:
    begin
      Until3:
        Drawing.drawfire(firex, firey, expsn);
      Main.incpenalty();
      Inc(expsn);
    end;
    else
    begin
      killfire();
      expsn := 0;
    end;
  end;
end;

procedure TDigger.endbonusmode;
begin
  bonusmode := False;
  Pc.ginten(0);
end;

procedure TDigger.erasebonus;
begin
  if bonusvisible then
  begin
    bonusvisible := False;
    Sprite.erasespr(14);
  end;
  Pc.ginten(0);
end;

procedure TDigger.erasedigger;
begin
  Sprite.erasespr(0);
  diggervisible := False;
end;

function TDigger.getAppletInfo: string;
begin
  exit('The Digger Remastered -- http://www.digger.org, Copyright (c) Andrew Jenner & Marek Futrega / MAF');
end;

function TDigger.getfirepflag: boolean;
begin
  exit(Input.firepflag);
end;

function TDigger.hitemerald(x: integer; y: integer; rx: integer;
  ry: integer; dir: integer): boolean;
var
  hit: boolean;
  r: integer;
begin
  hit := False;
  r := 0;
  if (dir < 0) or (dir > 6) or ((dir and 1) <> 0) then
  begin
    exit(hit);
  end;
  if (dir = 0) and (rx <> 0) then
  begin
    Inc(x);
  end;
  if (dir = 6) and (ry <> 0) then
  begin
    Inc(y);
  end;
  if (dir = 0) or (dir = 4) then
  begin
    r := rx;
  end
  else
  begin
    r := ry;
  end;
  if (emfield[(y * 15) + x] and emmask) <> 0 then
  begin
    if r = embox[dir] then
    begin
      Drawing.drawemerald((x * 20) + 12, (y * 18) + 21);
      Main.incpenalty();
    end;
    if r = embox[dir + 1] then
    begin
      Drawing.eraseemerald((x * 20) + 12, (y * 18) + 21);
      Main.incpenalty();
      hit := True;
      emfield[(y * 15) + x] := emfield[(y * 15) + x] and not emmask;
    end;
  end;
  exit(hit);
end;

procedure TDigger.init;
var
  i: integer;
  pal: Byte3Array;
  model: IColorModel;
begin
  if assigned(gamethread) then
  begin
    gamethread.Terminate();
  end;

  subaddr := factory.getSubmitParameter();
  try
    frametime := factory.getSpeedParameter();
    if frametime > MAX_RATE then
    begin
      frametime := MAX_RATE;
    end
    else
    begin
      if frametime < MIN_RATE then
      begin
        frametime := MIN_RATE;
      end;
    end;
  except
    on e: Exception do
    begin
    end;
  end;

  for i := 0 to (2 - 1) do
  begin
    pal := mPc.GetPal();
    model := TColorModel.Create(8, 4, pal[i][0], pal[i][1], pal[i][2]);
    Pc.Source[i] := factory.CreateRefresher(self, model);
    Pc.Source[i].setAnimated(True);
    Pc.Source[i].newPixelsAll();
  end;

  Pc.currentSource := Pc.Source[0];

  gamethread := TThread.ExecuteInThread(@run);
end;

procedure TDigger.initbonusmode;
begin
  bonusmode := True;
  erasebonus();
  Pc.ginten(1);
  bonustimeleft := 250 - (Main.levof10() * 20);
  startbonustimeleft := 20;
  eatmsc := 1;
end;

procedure TDigger.initdigger;
begin
  diggerv := 9;
  digmdir := 4;
  diggerh := 7;
  diggerx := (diggerh * 20) + 12;
  digdir  := 0;
  diggerrx := 0;
  diggerry := 0;
  digtime := 0;
  digonscr := True;
  deathstage := 1;
  diggervisible := True;
  diggery := (diggerv * 18) + 18;
  Sprite.movedrawspr(0, diggerx, diggery);
  notfiring := True;
  emocttime := 0;
  bonusmode := False;
  bonusvisible := False;
  Input.firepressed := False;
  expsn := 0;
  rechargetime := 0;
end;

function TDigger.keyDown(key: integer): boolean;
begin
  case key of
    1006:
    begin
      Input.processkey($4B);
    end;
    1007:
    begin
      Input.processkey($4D);
    end;
    1004:
    begin
      Input.processkey($48);
    end;
    1005:
    begin
      Input.processkey($50);
    end;
    1008:
    begin
      Input.processkey($3B);
    end;
    else
    begin
      key := key and $7F;
      if (key >= 65) and (key <= 90) then
      begin
        key := key + 97 - 65;
      end;
      Input.processkey(key);
    end;
  end;
  exit(True);
end;

function TDigger.keyUp(key: integer): boolean;
begin
  case key of
    1006:
    begin
      Input.processkey($CB);
    end;
    1007:
    begin
      Input.processkey($CD);
    end;
    1004:
    begin
      Input.processkey($C8);
    end;
    1005:
    begin
      Input.processkey($D0);
    end;
    1008:
    begin
      Input.processkey($BB);
    end;
    else
    begin
      key := key and $7F;
      if (key >= 65) and (key <= 90) then
      begin
        key := key + 97 - 65;
      end;
      Input.processkey($80 or key);
    end;
  end;
  exit(True);
end;

procedure TDigger.killdigger(stage: integer; bag: integer);
begin
  if (deathstage < 2) or (deathstage > 4) then
  begin
    digonscr := False;
    deathstage := stage;
    deathbag := bag;
  end;
end;

procedure TDigger.killemerald(x: integer; y: integer);
begin
  if (emfield[(y * 15) + x + 15] and emmask) <> 0 then
  begin
    emfield[(y * 15) + x + 15] := emfield[(y * 15) + x + 15] and not emmask;
    Drawing.eraseemerald((x * 20) + 12, ((y + 1) * 18) + 21);
  end;
end;

procedure TDigger.killfire;
begin
  if not notfiring then
  begin
    notfiring := True;
    Sprite.erasespr(15);
    Sound.soundfireoff();
  end;
end;

procedure TDigger.makeemfield;
var
  x: integer;
  y: integer;
begin
  x := 0;
  y := 0;
  emmask := 1 shl Main.getcplayer();
  for x := 0 to (15 - 1) do
    for y := 0 to (10 - 1) do
      if Main.getlevch(x, y, Main.levplan()) = Ord(#67) then
      begin
        emfield[(y * 15) + x] := emfield[(y * 15) + x] or emmask;
      end
      else
      begin
        emfield[(y * 15) + x] := emfield[(y * 15) + x] and not emmask;
      end;
end;

procedure TDigger.newframe;
var
  l: int64;
begin
  Input.checkkeyb();
  mTime := mTime + mFrametime;
  l := mTime - Pc.gethrt();
  if l > 0 then
  begin
    TThread.sleep(l);
  end;
  Pc.currentSource.newPixelsAll();
end;

function TDigger.reversedir(dir: integer): integer;
begin
  case dir of
    0:
    begin
      exit(4);
    end;
    4:
    begin
      exit(0);
    end;
    2:
    begin
      exit(6);
    end;
    6:
    begin
      exit(2);
    end;
  end;
  exit(dir);
end;

procedure TDigger.run;
begin

  Main.main();
end;

procedure TDigger.start;
begin
  factory.RequestFocus();
end;

procedure TDigger.updatedigger;
var
  dir:  integer;
  ddir: integer;
  clbits: integer;
  diggerox: integer;
  diggeroy: integer;
  nmon: integer;
  push: boolean;
begin
  dir  := 0;
  ddir := 0;
  clbits := 0;
  diggerox := 0;
  diggeroy := 0;
  nmon := 0;
  push := False;
  Input.readdir();
  dir := Input.getdir();
  if (dir = 0) or (dir = 2) or (dir = 4) or (dir = 6) then
  begin
    ddir := dir;
  end
  else
  begin
    ddir := -1;
  end;
  if (diggerrx = 0) and ((ddir = 2) or (ddir = 6)) then
  begin
    digmdir := ddir;
    digdir  := ddir;
  end;
  if (diggerry = 0) and ((ddir = 4) or (ddir = 0)) then
  begin
    digmdir := ddir;
    digdir  := ddir;
  end;
  if dir = (-1) then
  begin
    digmdir := -1;
  end
  else
  begin
    digmdir := digdir;
  end;
  if ((diggerx = 292) and (digmdir = 0)) or ((diggerx = 12) and (digmdir = 4)) or
    ((diggery = 180) and (digmdir = 6)) or ((diggery = 18) and (digmdir = 2)) then
  begin
    digmdir := -1;
  end;
  diggerox := diggerx;
  diggeroy := diggery;
  if digmdir <> (-1) then
  begin
    Drawing.eatfield(diggerox, diggeroy, digmdir);
  end;
  case digmdir of
    0:
    begin
      Drawing.drawrightblob(diggerx, diggery);
      diggerx := diggerx + 4;

    end;
    4:
    begin
      Drawing.drawleftblob(diggerx, diggery);
      diggerx := diggerx - 4;

    end;
    2:
    begin
      Drawing.drawtopblob(diggerx, diggery);
      diggery := diggery - 3;

    end;
    6:
    begin
      Drawing.drawbottomblob(diggerx, diggery);
      diggery := diggery + 3;

    end;
  end;
  if hitemerald(trunc((diggerx - 12) / 20), trunc((diggery - 18) / 18),
    (diggerx - 12) mod 20, (diggery - 18) mod 18, digmdir) then
  begin
    Scores.scoreemerald();
    Sound.soundem();
    Sound.soundemerald(emocttime);
    emocttime := 9;
  end;
  clbits := Drawing.drawdigger(digdir, diggerx, diggery, notfiring and
    (rechargetime = 0));
  Main.incpenalty();
  if (Bags.bagbits() and clbits) <> 0 then
  begin
    if (digmdir = 0) or (digmdir = 4) then
    begin
      push := Bags.pushbags(digmdir, clbits);
      Inc(mDigtime);
    end
    else
    begin
      if not Bags.pushudbags(clbits) then
      begin
        push := False;
      end;
    end;
    if not push then
    begin
      diggerx := diggerox;
      diggery := diggeroy;
      Drawing.drawdigger(digmdir, diggerx, diggery, notfiring and
        (rechargetime = 0));
      Main.incpenalty();
      digdir := reversedir(digmdir);
    end;
  end;
  if ((clbits and $3F00) <> 0) and bonusmode then
  begin
    for nmon := Monster.killmonsters(clbits) downto 0 do
    begin
      Sound.soundeatm();
      Scores.scoreeatm();
    end;
  end;
  if (clbits and $4000) <> 0 then
  begin
    Scores.scorebonus();
    initbonusmode();
  end;
  diggerh  := trunc((diggerx - 12) / 20);
  diggerrx := (diggerx - 12) mod 20;
  diggerv  := trunc((diggery - 18) / 18);
  diggerry := (diggery - 18) mod 18;
end;

procedure TDigger.updatefire;
var
  clbits: integer;
  b: integer;
  mon: integer;
  pix: integer;
begin
  clbits := 0;
  b := 0;
  mon := 0;
  pix := 0;
  if notfiring then
  begin
    if rechargetime <> 0 then
    begin
      Dec(rechargetime);
    end
    else
    begin
      if getfirepflag() then
      begin
        if digonscr then
        begin
          rechargetime := (Main.levof10() * 3) + 60;
          notfiring := False;
          case digdir of
            0:
            begin
              firex := diggerx + 8;
              firey := diggery + 4;
            end;
            4:
            begin
              firex := diggerx;
              firey := diggery + 4;
            end;
            2:
            begin
              firex := diggerx + 4;
              firey := diggery;
            end;
            6:
            begin
              firex := diggerx + 4;
              firey := diggery + 8;
            end;
          end;
          firedir := digdir;
          Sprite.movedrawspr(15, firex, firey);
          Sound.soundfire();
        end;
      end;
    end;
  end
  else
  begin
    case firedir of
      0:
      begin
        firex := firex + 8;
        pix := Pc.ggetpix(firex, firey + 4) or Pc.ggetpix(firex + 4, firey + 4);
      end;
      4:
      begin
        firex := firex - 8;
        pix := Pc.ggetpix(firex, firey + 4) or Pc.ggetpix(firex + 4, firey + 4);
      end;
      2:
      begin
        firey := firey - 7;
        pix := (Pc.ggetpix(firex + 4, firey) or
          Pc.ggetpix(firex + 4, firey + 1) or Pc.ggetpix(firex + 4, firey + 2) or
          Pc.ggetpix(firex + 4, firey + 3) or Pc.ggetpix(firex + 4, firey + 4) or
          Pc.ggetpix(firex + 4, firey + 5) or Pc.ggetpix(firex + 4, firey + 6)) and $C0;
      end;
      6:
      begin
        firey := firey + 7;
        pix := (Pc.ggetpix(firex, firey) or Pc.ggetpix(firex, firey + 1) or
          Pc.ggetpix(firex, firey + 2) or Pc.ggetpix(firex, firey + 3) or
          Pc.ggetpix(firex, firey + 4) or Pc.ggetpix(firex, firey + 5) or
          Pc.ggetpix(firex, firey + 6)) and 3;
      end;
    end;
    clbits := Drawing.drawfire(firex, firey, 0);
    Main.incpenalty();
    if (clbits and $3F00) <> 0 then
    begin
      b := 256;
      for mon := 0 to (6 - 1) do
      begin
        if (clbits and b) <> 0 then
        begin
          Monster.killmon(mon);
          Scores.scorekill();
          expsn := 1;
        end;
        b := b shl 1;
      end;
    end;
    if (clbits and $40FE) <> 0 then
    begin
      expsn := 1;
    end;
    case firedir of
      0:
      begin
        if firex > 296 then
        begin
          expsn := 1;
        end
        else
        begin
          if (pix <> 0) and (clbits = 0) then
          begin
            expsn := 1;
            firex := firex - 8;
            Drawing.drawfire(firex, firey, 0);
          end;
        end;
      end;
      4:
      begin
        if firex < 16 then
        begin
          expsn := 1;
        end
        else
        begin
          if (pix <> 0) and (clbits = 0) then
          begin
            expsn := 1;
            firex := firex + 8;
            Drawing.drawfire(firex, firey, 0);
          end;
        end;
      end;
      2:
      begin
        if firey < 15 then
        begin
          expsn := 1;
        end
        else
        begin
          if (pix <> 0) and (clbits = 0) then
          begin
            expsn := 1;
            firey := firey + 7;
            Drawing.drawfire(firex, firey, 0);
          end;
        end;
      end;
      6:
      begin
        if firey > 183 then
        begin
          expsn := 1;
        end
        else
        begin
          if (pix <> 0) and (clbits = 0) then
          begin
            expsn := 1;
            firey := firey - 7;
            Drawing.drawfire(firex, firey, 0);
          end;
        end;
      end;
    end;
  end;
end;

function TDigger.Drawing(): IDrawing;
begin
  exit(self.mDrawing);
end;

function TDigger.Main(): IMain;
begin
  exit(self.mMain);
end;

function TDigger.Monster(): IMonster;
begin
  exit(self.mMonster);
end;

function TDigger.Sprite(): ISprite;
begin
  exit(self.mSprite);
end;

function TDigger.Input(): IInput;
begin
  exit(self.mInput);
end;

function TDigger.Bags(): IBags;
begin
  exit(self.mBags);
end;

function TDigger.Scores(): IScores;
begin
  exit(self.mScores);
end;

function TDigger.Pc(): IPc;
begin
  exit(self.mPc);
end;

function TDigger.Sound(): ISound;
begin
  exit(self.mSound);
end;


function TDigger.getDigTime(): integer;
begin
  exit(mDigtime);
end;

procedure TDigger.setDigTime(Value: integer);
begin
  mDigtime := Value;
end;

procedure TDigger.Setsubaddr(Value: string);
begin
  mSubaddr := Value;
end;

function TDigger.Getsubaddr: string;
begin
  exit(mSubaddr);
end;

function TDigger.getDiggerY(): integer;
begin
  exit(mDiggery);
end;

procedure TDigger.setDiggerY(Value: integer);
begin
  mDiggery := Value;
end;

function TDigger.getDiggerX(): integer;
begin
  exit(mDiggerx);
end;

procedure TDigger.setDiggerX(Value: integer);
begin
  mDiggerx := Value;
end;

procedure TDigger.SetDigonscr(Value: boolean);
begin
  mDigonscr := Value;
end;

function TDigger.GetDigonscr: boolean;
begin
  exit(mDigonscr);
end;

procedure TDigger.Setftime(Value: integer);
begin
  mFtime := Value;
end;

function TDigger.Getftime: integer;
begin
  exit(mFtime);
end;

procedure TDigger.Settime(Value: int64);
begin
  mTime := Value;
end;

function TDigger.Gettime: int64;
begin
  exit(mTime);
end;

procedure TDigger.Setframetime(Value: integer);
begin
  mFrametime := Value;
end;

function TDigger.Getframetime: integer;
begin
  exit(mFrametime);
end;

procedure TDigger.Seteatmsc(Value: integer);
begin
  mEatmsc := Value;
end;

function TDigger.Geteatmsc: integer;
begin
  exit(mEatmsc);
end;

procedure TDigger.Setbonusmode(Value: boolean);
begin
  mBonusmode := Value;
end;

function TDigger.Getbonusmode: boolean;
begin
  exit(mBonusmode);
end;

procedure TDigger.Setbonusvisible(Value: boolean);
begin
  mBonusvisible := Value;
end;

function TDigger.Getbonusvisible: boolean;
begin
  exit(mBonusvisible);
end;

end.
