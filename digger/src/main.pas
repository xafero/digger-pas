unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, api, gamedata;

type
  TMain = class(TInterfacedObject, IMain)
  private
  var
    dig:         IDigger;
  var
    digsprorder: array of integer;
  var
    gamedat:     array of TGameData;
  var
    mPldispbuf:  string;
  var
    levfflag:    boolean;
  var
    biosflag:    boolean;
  var
    speedmul:    integer;
  var
    delaytime:   integer;
  var
    randv:       integer;
  var
    leveldat:    array of array of string;
  var
    curplayer:   integer;
  var
    mNplayers:   integer;
  var
    penalty:     integer;
  var
    levnotdrawn: boolean;
  var
    flashplayer: boolean;
  public
    procedure Setnplayers(Value: integer);
    function Getnplayers: integer;
    property nplayers: integer Read Getnplayers Write Setnplayers;

    procedure Setpldispbuf(Value: string);
    function Getpldispbuf: string;
    property pldispbuf: string Read Getpldispbuf Write Setpldispbuf;

    constructor Create(d: IDigger);
    procedure addlife(pl: integer);
    procedure calibrate;
    procedure checklevdone;
    procedure cleartopline;
    procedure drawscreen;
    function getcplayer: integer;
    function getlevch(x: integer; y: integer; l: integer): integer;
    function getlives(pl: integer): integer;
    procedure incpenalty;
    procedure initchars;
    procedure initlevel;
    function levno: integer;
    function levof10: integer;
    function levplan: integer;
    procedure main;
    procedure play;
    function randno(n: integer): integer;
    procedure setdead(bp6: boolean);
    procedure shownplayers;
    procedure switchnplayers;
    procedure testpause;
  end;

implementation

constructor TMain.Create(d: IDigger);
begin
  digsprorder := [14, 13, 7, 6, 5, 4, 3, 2, 1, 12, 11, 10, 9, 8, 15, 0];
  gamedat := [TGameData.Create(), TGameData.Create()];
  pldispbuf := '';
  levfflag := False;
  biosflag := False;
  speedmul := 40;
  delaytime := 0;
  randv := 0;
  leveldat := [['S   B     HHHHS', 'V  CC  C  V B  ', 'VB CC  C  V    ',
    'V  CCB CB V CCC', 'V  CC  C  V CCC', 'HH CC  C  V CCC',
    ' V    B B V    ', ' HHHH     V    ', 'C   V     V   C', 'CC  HHHHHHH  CC'],
    ['SHHHHH  B B  HS', ' CC  V       V ', ' CC  V CCCCC V ',
    'BCCB V CCCCC V ', 'CCCC V       V ', 'CCCC V B  HHHH ',
    ' CC  V CC V    ', ' BB  VCCCCV CC ', 'C    V CC V CC ', 'CC   HHHHHH    '],
    ['SHHHHB B BHHHHS', 'CC  V C C V BB ', 'C   V C C V CC ',
    ' BB V C C VCCCC', 'CCCCV C C VCCCC', 'CCCCHHHHHHH CC ',
    ' CC  C V C  CC ', ' CC  C V C     ', 'C    C V C    C', 'CC   C H C   CC'],
    ['SHBCCCCBCCCCBHS', 'CV  CCCCCCC  VC', 'CHHH CCCCC HHHC',
    'C  V  CCC  V  C', '   HHH C HHH   ', '  B  V B V  B  ',
    '  C  VCCCV  C  ', ' CCC HHHHH CCC ', 'CCCCC CVC CCCCC', 'CCCCC CHC CCCCC'],
    ['SHHHHHHHHHHHHHS', 'VBCCCCBVCCCCCCV', 'VCCCCCCV CCBC V',
    'V CCCC VCCBCCCV', 'VCCCCCCV CCCC V', 'V CCCC VBCCCCCV',
    'VCCBCCCV CCCC V', 'V CCBC VCCCCCCV', 'VCCCCCCVCCCCCCV', 'HHHHHHHHHHHHHHH'],
    ['SHHHHHHHHHHHHHS', 'VCBCCV V VCCBCV', 'VCCC VBVBV CCCV',
    'VCCCHH V HHCCCV', 'VCC V CVC V CCV', 'VCCHH CVC HHCCV',
    'VC V CCVCC V CV', 'VCHHBCCVCCBHHCV', 'VCVCCCCVCCCCVCV', 'HHHHHHHHHHHHHHH'],
    ['SHCCCCCVCCCCCHS', ' VCBCBCVCBCBCV ', 'BVCCCCCVCCCCCVB',
    'CHHCCCCVCCCCHHC', 'CCV CCCVCCC VCC', 'CCHHHCCVCCHHHCC',
    'CCCCV CVC VCCCC', 'CCCCHH V HHCCCC', 'CCCCCV V VCCCCC', 'CCCCCHHHHHCCCCC'],
    ['HHHHHHHHHHHHHHS', 'V CCBCCCCCBCC V', 'HHHCCCCBCCCCHHH',
    'VBV CCCCCCC VBV', 'VCHHHCCCCCHHHCV', 'VCCBV CCC VBCCV',
    'VCCCHHHCHHHCCCV', 'VCCCC V V CCCCV', 'VCCCCCV VCCCCCV', 'HHHHHHHHHHHHHHH']];
  curplayer := 0;
  nplayers := 0;
  penalty := 0;
  levnotdrawn := False;
  flashplayer := False;
  dig := d;
end;

procedure TMain.addlife(pl: integer);
begin
  Inc(gamedat[pl - 1].lives);
  dig.Sound.sound1up();
end;

procedure TMain.calibrate;
begin
  dig.Sound.volume := trunc(dig.Pc.getkips() / 291);
  if dig.Sound.volume = 0 then
  begin
    dig.Sound.volume := 1;
  end;
end;

procedure TMain.checklevdone;
begin
  if ((dig.countem() = 0) or (dig.Monster.monleft() = 0)) and dig.digonscr then
  begin
    gamedat[curplayer].levdone := True;
  end
  else
  begin
    gamedat[curplayer].levdone := False;
  end;
end;

procedure TMain.cleartopline;
begin
  dig.Drawing.outtext('                          ', 0, 0, 3);
  dig.Drawing.outtext(' ', 308, 0, 3);
end;

procedure TMain.drawscreen;
begin

  dig.Drawing.creatembspr();

  dig.Drawing.drawstatics();

  dig.Bags.drawbags();

  dig.drawemeralds();

  dig.initdigger();

  dig.Monster.initmonsters();

end;

function TMain.getcplayer: integer;
begin
  exit(curplayer);
end;

function TMain.getlevch(x: integer; y: integer; l: integer): integer;
begin
  if l = 0 then
  begin
    Inc(l);
  end;
  exit(Ord(leveldat[l - 1][y][x + 1]));
end;

function TMain.getlives(pl: integer): integer;
begin
  exit(gamedat[pl - 1].lives);
end;

procedure TMain.incpenalty;
begin
  Inc(penalty);
end;

procedure TMain.initchars;
begin
  dig.Drawing.initmbspr();
  dig.initdigger();
  dig.Monster.initmonsters();
end;

procedure TMain.initlevel;
begin
  gamedat[curplayer].levdone := False;

  dig.Drawing.makefield();

  dig.makeemfield();

  dig.Bags.initbags();

  levnotdrawn := True;
end;

function TMain.levno: integer;
begin
  exit(gamedat[curplayer].level);
end;

function TMain.levof10: integer;
begin
  if gamedat[curplayer].level > 10 then
  begin
    exit(10);
  end;
  exit(gamedat[curplayer].level);
end;

function TMain.levplan: integer;
var
  l: integer;
begin
  l := levno();
  if l > 8 then
  begin
    l := (l and 3) + 5;
  end;
  exit(l);
end;

procedure TMain.main;
var
  frame: integer;
  t: integer;
  x: integer;
  start: boolean;
begin

  frame := 0;
  t := 0;
  x := 0;
  start := False;
  randv := dig.Pc.gethrt();
  calibrate();
  dig.ftime := speedmul * 2000;
  dig.Sprite.setretr(False);
  dig.Pc.ginit();
  dig.Sprite.setretr(True);
  dig.Pc.gpal(0);
  dig.Input.initkeyb();
  dig.Input.detectjoy();
  dig.Scores.loadscores();
  dig.Sound.initsound();
  dig.Scores.run();

  dig.Scores._updatescores(dig.Scores.scores);
  nplayers := 1;

  repeat
    dig.Sound.soundstop();

    dig.Sprite.setsprorder(digsprorder);

    dig.Drawing.creatembspr();

    dig.Input.detectjoy();

    dig.Pc.gclear();

    dig.Pc.gtitle();

    dig.Drawing.outtext('D I G G E R', 100, 0, 3);

    shownplayers();

    dig.Scores.showtable();

    start := False;
    frame := 0;

    dig.time := dig.Pc.gethrt();

    while (not TThread.CheckTerminated) and not start do
    begin
      start := dig.Input.teststart();
      if dig.Input.akeypressed = 27 then
      begin
        switchnplayers();
        shownplayers();
        dig.Input.akeypressed := 0;
        dig.Input.keypressed  := 0;
      end;
      if frame = 0 then
      begin
        t := 54;
        while t < 174 do
        begin
          dig.Drawing.outtext('            ', 164, t, 0);
          t := t + 12;
        end;
      end;
      if frame = 50 then
      begin
        dig.Sprite.movedrawspr(8, 292, 63);
        x := 292;
      end;
      if (frame > 50) and (frame <= 77) then
      begin
        x := x - 4;
        dig.Drawing.drawmon(0, True, 4, x, 63);
      end;
      if frame > 77 then
      begin
        dig.Drawing.drawmon(0, True, 0, 184, 63);
      end;
      if frame = 83 then
      begin
        dig.Drawing.outtext('NOBBIN', 216, 64, 2);
      end;
      if frame = 90 then
      begin
        dig.Sprite.movedrawspr(9, 292, 82);
        dig.Drawing.drawmon(1, False, 4, 292, 82);
        x := 292;
      end;
      if (frame > 90) and (frame <= 117) then
      begin
        x := x - 4;
        dig.Drawing.drawmon(1, False, 4, x, 82);
      end;
      if frame > 117 then
      begin
        dig.Drawing.drawmon(1, False, 0, 184, 82);
      end;
      if frame = 123 then
      begin
        dig.Drawing.outtext('HOBBIN', 216, 83, 2);
      end;
      if frame = 130 then
      begin
        dig.Sprite.movedrawspr(0, 292, 101);
        dig.Drawing.drawdigger(4, 292, 101, True);
        x := 292;
      end;
      if (frame > 130) and (frame <= 157) then
      begin
        x := x - 4;
        dig.Drawing.drawdigger(4, x, 101, True);
      end;
      if frame > 157 then
      begin
        dig.Drawing.drawdigger(0, 184, 101, True);
      end;
      if frame = 163 then
      begin
        dig.Drawing.outtext('DIGGER', 216, 102, 2);
      end;
      if frame = 178 then
      begin
        dig.Sprite.movedrawspr(1, 184, 120);
        dig.Drawing.drawgold(1, 0, 184, 120);
      end;
      if frame = 183 then
      begin
        dig.Drawing.outtext('GOLD', 216, 121, 2);
      end;
      if frame = 198 then
      begin
        dig.Drawing.drawemerald(184, 141);
      end;
      if frame = 203 then
      begin
        dig.Drawing.outtext('EMERALD', 216, 140, 2);
      end;
      if frame = 218 then
      begin
        dig.Drawing.drawbonus(184, 158);
      end;
      if frame = 223 then
      begin
        dig.Drawing.outtext('BONUS', 216, 159, 2);
      end;
      dig.newframe();
      Inc(frame);
      if frame > 250 then
      begin
        frame := 0;
      end;
    end;

    gamedat[0].level := 1;
    gamedat[0].lives := 3;
    if nplayers = 2 then
    begin
      gamedat[1].level := 1;
      gamedat[1].lives := 3;
    end
    else
    begin
      gamedat[1].lives := 0;
    end;

    dig.Pc.gclear();
    curplayer := 0;

    initlevel();
    curplayer := 1;

    initlevel();
    dig.Scores.zeroscores();
    dig.bonusvisible := True;

    if nplayers = 2 then
    begin
      flashplayer := True;
    end;
    curplayer := 0;

    while (not TThread.CheckTerminated) and ((gamedat[0].lives <> 0) or
        (gamedat[1].lives <> 0)) and (not dig.Input.escape) do
    begin
      gamedat[curplayer].dead := False;

      while (not TThread.CheckTerminated) and (not gamedat[curplayer].dead) and
        (gamedat[curplayer].lives <> 0) and (not dig.Input.escape) do
      begin
        dig.Drawing.initmbspr();

        play();

      end;
      if gamedat[1 - curplayer].lives <> 0 then
      begin
        curplayer := 1 - curplayer;
        levnotdrawn := True;
        flashplayer := True;

      end;
    end;

    dig.Input.escape := False;
  until TThread.CheckTerminated;
end;

procedure TMain.play;
var
  t: integer;
  c: integer;
begin
  t := 0;
  c := 0;

  if levnotdrawn then
  begin
    levnotdrawn := False;

    drawscreen();

    dig.time := dig.Pc.gethrt();

    if flashplayer then
    begin
      flashplayer := False;
      pldispbuf := 'PLAYER ';
      if curplayer = 0 then
      begin
        pldispbuf := pldispbuf + '1';
      end
      else
      begin
        pldispbuf := pldispbuf + '2';
      end;

      cleartopline();

      for t := 0 to (15 - 1) do
        for c := 1 to 3 do
        begin
          dig.Drawing.outtext(pldispbuf, 108, 0, c);
          dig.Scores.writecurscore(c);
          dig.newframe();
          if dig.Input.escape then
          begin
            exit;
          end;
        end;

      dig.Scores.drawscores();

      dig.Scores.addscore(0);
    end;
  end
  else
  begin

    initchars();
  end;

  dig.Input.keypressed := 0;
  dig.Drawing.outtext('        ', 108, 0, 3);

  dig.Scores.initscores();

  dig.Drawing.drawlives();

  dig.Sound.music(1);

  dig.Input.readdir();

  dig.time := dig.Pc.gethrt();

  while (not TThread.CheckTerminated) and (not gamedat[curplayer].dead) and
    (not gamedat[curplayer].levdone) and (not dig.Input.escape) do
  begin

    penalty := 0;

    dig.dodigger();

    dig.Monster.domonsters();

    dig.Bags.dobags();

    if penalty > 8 then
    begin

      dig.Monster.incmont(penalty - 8);

    end;

    testpause();

    checklevdone();

  end;

  dig.erasedigger();

  dig.Sound.musicoff();

  t := 20;
  while (not TThread.CheckTerminated) and ((dig.Bags.getnmovingbags() <> 0) or
      (t <> 0)) and (not dig.Input.escape) do
  begin

    if t <> 0 then
    begin
      Dec(t);
    end;

    penalty := 0;

    dig.Bags.dobags();

    dig.dodigger();

    dig.Monster.domonsters();

    if penalty < 8 then
    begin
      t := 0;
    end;

  end;

  dig.Sound.soundstop();

  dig.killfire();

  dig.erasebonus();

  dig.Bags.cleanupbags();

  dig.Drawing.savefield();

  dig.Monster.erasemonsters();

  dig.newframe();

  if gamedat[curplayer].levdone then
  begin
    dig.Sound.soundlevdone();
  end;

  if dig.countem() = 0 then
  begin
    Inc(gamedat[curplayer].level);
    if gamedat[curplayer].level > 1000 then
    begin
      gamedat[curplayer].level := 1000;
    end;
    initlevel();
  end;
  if gamedat[curplayer].dead then
  begin
    Dec(gamedat[curplayer].lives);
    dig.Drawing.drawlives();
    if (gamedat[curplayer].lives = 0) and (not dig.Input.escape) then
    begin
      dig.Scores.endofgame();
    end;
  end;
  if gamedat[curplayer].levdone then
  begin
    Inc(gamedat[curplayer].level);
    if gamedat[curplayer].level > 1000 then
    begin
      gamedat[curplayer].level := 1000;
    end;
    initlevel();
  end;
end;

function TMain.randno(n: integer): integer;
begin
  randv := (randv * $15A4E35) + 1;
  exit((randv and $7FFFFFFF) mod n);
end;

procedure TMain.setdead(bp6: boolean);
begin
  gamedat[curplayer].dead := bp6;
end;

procedure TMain.shownplayers;
begin
  if nplayers = 1 then
  begin
    dig.Drawing.outtext('ONE', 220, 25, 3);
    dig.Drawing.outtext(' PLAYER ', 192, 39, 3);
  end
  else
  begin
    dig.Drawing.outtext('TWO', 220, 25, 3);
    dig.Drawing.outtext(' PLAYERS', 184, 39, 3);
  end;
end;

procedure TMain.switchnplayers;
begin
  nplayers := 3 - nplayers;
end;

procedure TMain.testpause;
begin
  if dig.Input.akeypressed = 32 then
  begin
    dig.Input.akeypressed := 0;
    dig.Sound.soundpause();
    dig.Sound.sett2val(40);
    dig.Sound.setsoundt2();
    cleartopline();
    dig.Drawing.outtext('PRESS ANY KEY', 80, 0, 1);
    dig.newframe();
    dig.Input.keypressed := 0;
    while (not TThread.CheckTerminated) do
    begin
      try
        TThread.sleep(50);
      except
        on e: Exception do
        begin
        end;
      end;
      if dig.Input.keypressed <> 0 then
      begin
        break;
      end;
    end;
    cleartopline();
    dig.Scores.drawscores();
    dig.Scores.addscore(0);
    dig.Drawing.drawlives();
    dig.newframe();
    dig.time := dig.Pc.gethrt() - dig.frametime;
    dig.Input.keypressed := 0;
  end
  else
  begin
    dig.Sound.soundpauseoff();
  end;
end;

procedure TMain.Setnplayers(Value: integer);
begin
  mNplayers := Value;
end;

function TMain.Getnplayers: integer;
begin
  exit(mNplayers);
end;

procedure TMain.Setpldispbuf(Value: string);
begin
  mPldispbuf := Value;
end;

function TMain.Getpldispbuf: string;
begin
  exit(mPldispbuf);
end;

end.
