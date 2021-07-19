unit Scores;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, api;

type
  TScores = class(TInterfacedObject, IScores)
  private
  var
    dig:         IDigger;
  var
    mScores:     array of array of TObject;
  var
    substr:      string;
  var
    highbuf:     array of AnsiChar;
  var
    scorehigh:   array of int64;
  var
    scoreinit:   array of string;
  var
    hsbuf:       string;
  var
    scorebuf:    array of AnsiChar;
  var
    bonusscore:  integer;
  var
    gotinitflag: boolean;
  var
    scoret:      int64;
  var
    score1:      int64;
  var
    score2:      int64;
  var
    nextbs1:     int64;
  var
    nextbs2:     int64;
  public
    procedure Setscores(Value: Object2Array);
    function Getscores: Object2Array;
    property scores: Object2Array Read Getscores Write Setscores;

    function _submit(n: string; s: integer): Object2Array;
    procedure _updatescores(o: Object2Array);
    procedure addscore(score: integer);
    procedure drawscores;
    procedure endofgame;
    procedure flashywait(n: integer);
    function getinitial(x: integer; y: integer): integer;
    procedure getinitials;
    procedure initscores;
    procedure loadscores;
    function numtostring(n: int64): string;
    procedure run;
    procedure scorebonus;
    procedure scoreeatm;
    procedure scoreemerald;
    procedure scoregold;
    procedure scorekill;
    procedure scoreoctave;
    procedure showtable;
    procedure shufflehigh;
    procedure writecurscore(bp6: integer);
    procedure writenum(n: int64; x: integer; y: integer; w: integer; c: integer);
    procedure zeroscores;
    constructor Create(d: IDigger);
  end;

implementation

constructor TScores.Create(d: IDigger);
begin
  SetLength(mScores, 10);
  substr := '';
  SetLength(highbuf, 10);
  scorehigh := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  scoreinit := ['', '', '', '', '', '', '', '', '', '', ''];
  hsbuf := '';
  SetLength(scorebuf, 512);
  bonusscore := 20000;
  gotinitflag := False;
  scoret := 0;
  score1 := 0;
  score2 := 0;
  nextbs1 := 0;
  nextbs2 := 0;
  dig := d;
end;

function TScores._submit(n: string; s: integer): Object2Array;
begin
  if dig.subaddr <> '' then
  begin
  end;
  exit(scores);
end;

procedure TScores._updatescores(o: Object2Array);
var
  inx: array of string;
  scx: array of integer;
  i: integer;
begin
  if o = nil then
  begin
    exit;
  end;
  try
    SetLength(inx, 10);
    SetLength(scx, 10);
    for i := 0 to (10 - 1) do
    begin
      inx[i] := string(o[i][0]);
      scx[i] := StrToInt(string(o[i][1]));
    end;
    for i := 0 to (10 - 1) do
    begin
      scoreinit[i + 1] := inx[i];
      scorehigh[i + 2] := scx[i];
    end;
  except
    on e: Exception do
    begin
    end;
  end;

end;

procedure TScores.addscore(score: integer);
begin
  if dig.Main.getcplayer() = 0 then
  begin
    score1 := score1 + score;
    if score1 > 999999 then
    begin
      score1 := 0;
    end;
    writenum(score1, 0, 0, 6, 1);
    if score1 >= nextbs1 then
    begin
      if dig.Main.getlives(1) < 5 then
      begin
        dig.Main.addlife(1);
        dig.Drawing.drawlives();
      end;
      nextbs1 := nextbs1 + bonusscore;
    end;
  end
  else
  begin
    score2 := score2 + score;
    if score2 > 999999 then
    begin
      score2 := 0;
    end;
    if score2 < 100000 then
    begin
      writenum(score2, 236, 0, 6, 1);
    end
    else
    begin
      writenum(score2, 248, 0, 6, 1);
    end;
    if score2 > nextbs2 then
    begin
      if dig.Main.getlives(2) < 5 then
      begin
        dig.Main.addlife(2);
        dig.Drawing.drawlives();
      end;
      nextbs2 := nextbs2 + bonusscore;
    end;
  end;
  dig.Main.incpenalty();
  dig.Main.incpenalty();
  dig.Main.incpenalty();
end;

procedure TScores.drawscores;
begin
  writenum(score1, 0, 0, 6, 3);
  if dig.Main.nplayers = 2 then
  begin
    if score2 < 100000 then
    begin
      writenum(score2, 236, 0, 6, 3);
    end
    else
    begin
      writenum(score2, 248, 0, 6, 3);
    end;
  end;
end;

procedure TScores.endofgame;
var
  i: integer;
  j: integer;
  z: integer;
begin
  i := 0;
  j := 0;
  z := 0;
  addscore(0);
  if dig.Main.getcplayer() = 0 then
  begin
    scoret := score1;
  end
  else
  begin
    scoret := score2;
  end;
  if scoret > scorehigh[11] then
  begin
    dig.Pc.gclear();
    drawscores();
    dig.Main.pldispbuf := 'PLAYER ';
    if dig.Main.getcplayer() = 0 then
    begin
      dig.Main.pldispbuf := dig.Main.pldispbuf + '1';
    end
    else
    begin
      dig.Main.pldispbuf := dig.Main.pldispbuf + '2';
    end;
    dig.Drawing.outtext(dig.Main.pldispbuf, 108, 0, 2, True);
    dig.Drawing.outtext(' NEW HIGH SCORE ', 64, 40, 2, True);
    getinitials();
    _updatescores(_submit(scoreinit[0], integer(scoret)));
    shufflehigh();
  end
  else
  begin
    dig.Main.cleartopline();
    dig.Drawing.outtext('GAME OVER', 104, 0, 3, True);
    _updatescores(_submit('...', integer(scoret)));
    dig.Sound.killsound();
    for j := 0 to (20 - 1) do
      for i := 0 to (2 - 1) do
      begin
        dig.Sprite.setretr(True);
        dig.Pc.gpal(1 - (j and 1));
        dig.Sprite.setretr(False);
        for z := 0 to (111 - 1) do
        begin
        end;
        dig.Pc.gpal(0);
        dig.Pc.ginten((1 - i) and 1);
        dig.newframe();
      end;
    dig.Sound.setupsound();
    dig.Drawing.outtext('         ', 104, 0, 3, True);
    dig.Sprite.setretr(True);
  end;
end;

procedure TScores.flashywait(n: integer);
begin
  try
    TThread.sleep(n * 2);
  except
    on e: Exception do
    begin
    end;
  end;
end;

function TScores.getinitial(x: integer; y: integer): integer;
var
  i: integer;
  j: integer;
begin
  i := 0;
  j := 0;
  dig.Input.keypressed := 0;
  dig.Pc.gwrite(x, y, Ord(#95), 3, True);
  for j := 0 to (5 - 1) do
  begin
    for i := 0 to (40 - 1) do
    begin
      if ((dig.Input.keypressed and $80) = 0) and (dig.Input.keypressed <> 0) then
      begin
        exit(dig.Input.keypressed);
      end;
      flashywait(15);
    end;
    for i := 0 to (40 - 1) do
    begin
      if ((dig.Input.keypressed and $80) = 0) and (dig.Input.keypressed <> 0) then
      begin
        dig.Pc.gwrite(x, y, Ord(#95), 3, True);
        exit(dig.Input.keypressed);
      end;
      flashywait(15);
    end;
  end;
  gotinitflag := True;
  exit(0);
end;

procedure TScores.getinitials;
var
  k:  integer;
  i:  integer;
  sb: string;
begin
  k := 0;
  dig.Drawing.outtext('ENTER YOUR', 100, 70, 3, True);
  dig.Drawing.outtext(' INITIALS', 100, 90, 3, True);
  dig.Drawing.outtext('_ _ _', 128, 130, 3, True);
  scoreinit[0] := '...';
  dig.Sound.killsound();
  gotinitflag := False;
  i := 0;
  while i < 3 do
  begin
    k := 0;
    while (k = 0) and (not gotinitflag) do
    begin
      k := getinitial((i * 24) + 128, 130);
      if (i <> 0) and (k = 8) then
      begin
        Dec(i);
      end;
      k := dig.Input.getasciikey(k);
    end;
    if k <> 0 then
    begin
      dig.Pc.gwrite((i * 24) + 128, 130, k, 3, True);
      sb := scoreinit[0] + '';
      Delete(sb, i, 1);
      insert(chr(k), sb, i);
      scoreinit[0] := sb;
    end;
    Inc(i);
  end;
  dig.Input.keypressed := 0;
  for i := 0 to (20 - 1) do
    flashywait(15);
  dig.Sound.setupsound();
  dig.Pc.gclear();
  dig.Pc.gpal(0);
  dig.Pc.ginten(0);
  dig.newframe();
  dig.Sprite.setretr(True);
end;

procedure TScores.initscores;
begin
  addscore(0);
end;

procedure TScores.loadscores;
var
  p: integer;
  i: integer;
  x: integer;
begin
  p := 1;
  i := 0;
  x := 0;
  for i := 1 to (11 - 1) do
  begin
    for x := 0 to (3 - 1) do
      scoreinit[i] := '...';
    p := p + 2;
    for x := 0 to (6 - 1) do
    begin
      highbuf[x] := scorebuf[p];
      Inc(p);
    end;
    scorehigh[i + 1] := 0;
  end;
  if scorebuf[0] <> #115 then
  begin
    for i := 0 to (11 - 1) do
    begin
      scorehigh[i + 1] := 0;
      scoreinit[i] := '...';
    end;
  end;
end;

function TScores.numtostring(n: int64): string;
var
  x: integer;
  p: string;
begin
  x := 0;
  p := '';
  while x < 6 do
  begin
    p := IntToStr(n mod 10) + p;
    n := trunc(n / 10);
    if n = 0 then
    begin
      Inc(x);
      break;
    end;
    Inc(x);
  end;
  while x < 6 do
  begin
    p := #32 + p;
    Inc(x);
  end;
  exit(p);
end;

procedure TScores.run;
begin
  // TODO init ?!
end;

procedure TScores.scorebonus;
begin
  addscore(1000);
end;

procedure TScores.scoreeatm;
begin
  addscore(dig.eatmsc * 200);
  dig.eatmsc := dig.eatmsc shl 1;
end;

procedure TScores.scoreemerald;
begin
  addscore(25);
end;

procedure TScores.scoregold;
begin
  addscore(500);
end;

procedure TScores.scorekill;
begin
  addscore(250);
end;

procedure TScores.scoreoctave;
begin
  addscore(250);
end;

procedure TScores.showtable;
var
  i: integer;
  col: integer;
begin
  i := 0;
  col := 0;
  dig.Drawing.outtext('HIGH SCORES', 16, 25, 3);
  col := 2;
  for i := 1 to (11 - 1) do
  begin
    hsbuf := scoreinit[i] + '  ' + numtostring(scorehigh[i + 1]);
    dig.Drawing.outtext(hsbuf, 16, 31 + (13 * i), col);
    col := 1;
  end;
end;

procedure TScores.shufflehigh;
var
  i: integer;
  j: integer;
begin
  i := 0;
  j := 0;
  for j := 10 downto 1 do
    if scoret < scorehigh[j] then
    begin
      break;
    end;
  for i := 10 downto j do
  begin
    scorehigh[i + 1] := scorehigh[i];
    scoreinit[i] := scoreinit[i - 1];
  end;
  scorehigh[j + 1] := scoret;
  scoreinit[j] := scoreinit[0];
end;

procedure TScores.writecurscore(bp6: integer);
begin
  if dig.Main.getcplayer() = 0 then
  begin
    writenum(score1, 0, 0, 6, bp6);
  end
  else
  begin
    if score2 < 100000 then
    begin
      writenum(score2, 236, 0, 6, bp6);
    end
    else
    begin
      writenum(score2, 248, 0, 6, bp6);
    end;
  end;
end;

procedure TScores.writenum(n: int64; x: integer; y: integer; w: integer; c: integer);
var
  d:  integer;
  xp: integer;
begin
  d  := 0;
  xp := ((w - 1) * 12) + x;
  while w > 0 do
  begin
    d := (n mod 10);
    if (w > 1) or (d > 0) then
    begin
      dig.Pc.gwrite(xp, y, d + Ord(#48), c, False);
    end;
    n := trunc(n / 10);
    Dec(w);
    xp := xp - 12;
  end;
end;

procedure TScores.zeroscores;
begin
  score2  := 0;
  score1  := 0;
  scoret  := 0;
  nextbs1 := bonusscore;
  nextbs2 := bonusscore;
end;

procedure TScores.Setscores(Value: Object2Array);
begin
  mScores := Value;
end;

function TScores.Getscores: Object2Array;
begin
  exit(mScores);
end;

end.
