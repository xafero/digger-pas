unit Sprite;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, api;

type
  TSprite = class(TInterfacedObject, ISprite)
  private
  var
    dig:         IDigger;
  var
    retrflag:    boolean;
  var
    sprrdrwf:    array of boolean;
  var
    sprrecf:     array of boolean;
  var
    sprenf:      array of boolean;
  var
    sprch:       array of integer;
  var
    sprmov:      array of array of Int16;
  var
    sprx:        array of integer;
  var
    spry:        array of integer;
  var
    sprwid:      array of integer;
  var
    sprhei:      array of integer;
  var
    sprbwid:     array of integer;
  var
    sprbhei:     array of integer;
  var
    sprnch:      array of integer;
  var
    sprnwid:     array of integer;
  var
    sprnhei:     array of integer;
  var
    sprnbwid:    array of integer;
  var
    sprnbhei:    array of integer;
  var
    defsprorder: array of integer;
  var
    sprorder:    array of integer;
  public
    function bcollide(bx: integer; si: integer): boolean;
    function bcollides(bx: integer): integer;
    procedure clearrdrwf;
    procedure clearrecf;
    function collide(bx: integer; si: integer): boolean;
    procedure createspr(n: integer; ch: integer; mov: ShortArray;
      wid: integer; hei: integer; bwid: integer; bhei: integer);
    procedure drawmiscspr(x: integer; y: integer; ch: integer;
      wid: integer; hei: integer);
    function drawspr(n: integer; x: integer; y: integer): integer;
    procedure erasespr(n: integer);
    procedure getis;
    procedure initmiscspr(x: integer; y: integer; wid: integer; hei: integer);
    procedure initspr(n: integer; ch: integer; wid: integer; hei: integer;
      bwid: integer; bhei: integer);
    function movedrawspr(n: integer; x: integer; y: integer): integer;
    procedure putims;
    procedure putis;
    procedure setrdrwflgs(n: integer);
    procedure setretr(f: boolean);
    procedure setsprorder(newsprorder: IntegerArray);
    constructor Create(d: IDigger);
  end;

implementation

constructor TSprite.Create(d: IDigger);
begin
  dig  := d;
  retrflag := True;
  sprrdrwf := [False, False, False, False, False, False, False, False,
    False, False, False, False, False, False, False, False, False];
  sprrecf := [False, False, False, False, False, False, False, False,
    False, False, False, False, False, False, False, False, False];
  sprenf := [False, False, False, False, False, False, False, False,
    False, False, False, False, False, False, False, False];
  sprch := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  sprmov := [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,
    nil, nil, nil, nil, nil];
  sprx := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  spry := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  sprwid := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  sprhei := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  sprbwid := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  sprbhei := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  sprnch := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  sprnwid := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  sprnhei := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  sprnbwid := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  sprnbhei := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  defsprorder := [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  sprorder := defsprorder;
end;

function TSprite.bcollide(bx: integer; si: integer): boolean;
begin
  if sprx[bx] >= sprx[si] then
  begin
    if (sprx[bx] + sprbwid[bx]) > (((sprwid[si] * 4) + sprx[si]) -
      sprbwid[si] - 1) then
    begin
      exit(False);
    end;
  end
  else
  begin
    if (sprx[si] + sprbwid[si]) > (((sprwid[bx] * 4) + sprx[bx]) -
      sprbwid[bx] - 1) then
    begin
      exit(False);
    end;
  end;
  if spry[bx] >= spry[si] then
  begin
    if (spry[bx] + sprbhei[bx]) <= ((sprhei[si] + spry[si]) - sprbhei[si] - 1) then
    begin
      exit(True);
    end;
    exit(False);
  end;
  if (spry[si] + sprbhei[si]) <= ((sprhei[bx] + spry[bx]) - sprbhei[bx] - 1) then
  begin
    exit(True);
  end;
  exit(False);
end;

function TSprite.bcollides(bx: integer): integer;
var
  si: integer;
  ax: integer;
  dx: integer;
begin
  si := bx;
  ax := 0;
  dx := 0;
  bx := 0;
  repeat
    if sprenf[bx] and (bx <> si) then
    begin
      if bcollide(bx, si) then
      begin
        ax := ax or (1 shl dx);
      end;
      sprx[bx] := sprx[bx] + 320;
      spry[bx] := spry[bx] - 2;
      if bcollide(bx, si) then
      begin
        ax := ax or (1 shl dx);
      end;
      sprx[bx] := sprx[bx] - 640;
      spry[bx] := spry[bx] + 4;
      if bcollide(bx, si) then
      begin
        ax := ax or (1 shl dx);
      end;
      sprx[bx] := sprx[bx] + 320;
      spry[bx] := spry[bx] - 2;
    end;
    Inc(bx);
    Inc(dx);
  until dx = 16;
  exit(ax);
end;

procedure TSprite.clearrdrwf;
var
  i: integer;
begin
  i := 0;
  clearrecf();
  for i := 0 to (17 - 1) do
    sprrdrwf[i] := False;
end;

procedure TSprite.clearrecf;
var
  i: integer;
begin
  i := 0;
  for i := 0 to (17 - 1) do
    sprrecf[i] := False;
end;

function TSprite.collide(bx: integer; si: integer): boolean;
begin
  if sprx[bx] >= sprx[si] then
  begin
    if sprx[bx] > (((sprwid[si] * 4) + sprx[si]) - 1) then
    begin
      exit(False);
    end;
  end
  else
  begin
    if sprx[si] > (((sprwid[bx] * 4) + sprx[bx]) - 1) then
    begin
      exit(False);
    end;
  end;
  if spry[bx] >= spry[si] then
  begin
    if spry[bx] <= ((sprhei[si] + spry[si]) - 1) then
    begin
      exit(True);
    end;
    exit(False);
  end;
  if spry[si] <= ((sprhei[bx] + spry[bx]) - 1) then
  begin
    exit(True);
  end;
  exit(False);
end;

procedure TSprite.createspr(n: integer; ch: integer; mov: ShortArray;
  wid: integer; hei: integer; bwid: integer; bhei: integer);
begin
  sprch[n and 15]  := ch;
  sprnch[n and 15] := ch;
  sprmov[n and 15] := mov;
  sprwid[n and 15] := wid;
  sprnwid[n and 15] := wid;
  sprhei[n and 15] := hei;
  sprnhei[n and 15] := hei;
  sprbwid[n and 15] := bwid;
  sprnbwid[n and 15] := bwid;
  sprbhei[n and 15] := bhei;
  sprnbhei[n and 15] := bhei;
  sprenf[n and 15] := False;
end;

procedure TSprite.drawmiscspr(x: integer; y: integer; ch: integer;
  wid: integer; hei: integer);
begin
  sprx[16]  := x and (-4);
  spry[16]  := y;
  sprch[16] := ch;
  sprwid[16] := wid;
  sprhei[16] := hei;
  dig.Pc.gputim(sprx[16], spry[16], sprch[16], sprwid[16], sprhei[16]);
end;

function TSprite.drawspr(n: integer; x: integer; y: integer): integer;
var
  bx: integer;
  t1: integer;
  t2: integer;
  t3: integer;
  t4: integer;
begin
  bx := 0;
  t1 := 0;
  t2 := 0;
  t3 := 0;
  t4 := 0;
  bx := n and 15;
  x  := x and -4;
  clearrdrwf();
  setrdrwflgs(bx);
  t1 := sprx[bx];
  t2 := spry[bx];
  t3 := sprwid[bx];
  t4 := sprhei[bx];
  sprx[bx] := x;
  spry[bx] := y;
  sprwid[bx] := sprnwid[bx];
  sprhei[bx] := sprnhei[bx];
  clearrecf();
  setrdrwflgs(bx);
  sprhei[bx] := t4;
  sprwid[bx] := t3;
  spry[bx] := t2;
  sprx[bx] := t1;
  sprrdrwf[bx] := True;
  putis();
  sprx[bx]  := x;
  spry[bx]  := y;
  sprch[bx] := sprnch[bx];
  sprwid[bx] := sprnwid[bx];
  sprhei[bx] := sprnhei[bx];
  sprbwid[bx] := sprnbwid[bx];
  sprbhei[bx] := sprnbhei[bx];
  dig.Pc.ggeti(sprx[bx], spry[bx], sprmov[bx], sprwid[bx], sprhei[bx]);
  putims();
  exit(bcollides(bx));
end;

procedure TSprite.erasespr(n: integer);
var
  bx: integer;
begin
  bx := n and 15;
  dig.Pc.gputi(sprx[bx], spry[bx], sprmov[bx], sprwid[bx], sprhei[bx], True);
  sprenf[bx] := False;
  clearrdrwf();
  setrdrwflgs(bx);
  putims();
end;

procedure TSprite.getis;
var
  i: integer;
begin
  i := 0;
  for i := 0 to (16 - 1) do
    if sprrdrwf[i] then
    begin
      dig.Pc.ggeti(sprx[i], spry[i], sprmov[i], sprwid[i], sprhei[i]);
    end;
  putims();
end;

procedure TSprite.initmiscspr(x: integer; y: integer; wid: integer; hei: integer);
begin
  sprx[16] := x;
  spry[16] := y;
  sprwid[16] := wid;
  sprhei[16] := hei;
  clearrdrwf();
  setrdrwflgs(16);
  putis();
end;

procedure TSprite.initspr(n: integer; ch: integer; wid: integer;
  hei: integer; bwid: integer; bhei: integer);
begin
  sprnch[n and 15]  := ch;
  sprnwid[n and 15] := wid;
  sprnhei[n and 15] := hei;
  sprnbwid[n and 15] := bwid;
  sprnbhei[n and 15] := bhei;
end;

function TSprite.movedrawspr(n: integer; x: integer; y: integer): integer;
var
  bx: integer;
begin
  bx := n and 15;
  sprx[bx] := x and (-4);
  spry[bx] := y;
  sprch[bx] := sprnch[bx];
  sprwid[bx] := sprnwid[bx];
  sprhei[bx] := sprnhei[bx];
  sprbwid[bx] := sprnbwid[bx];
  sprbhei[bx] := sprnbhei[bx];
  clearrdrwf();
  setrdrwflgs(bx);
  putis();
  dig.Pc.ggeti(sprx[bx], spry[bx], sprmov[bx], sprwid[bx], sprhei[bx]);
  sprenf[bx] := True;
  sprrdrwf[bx] := True;
  putims();
  exit(bcollides(bx));
end;

procedure TSprite.putims;
var
  i: integer;
  j: integer;
begin
  i := 0;
  j := 0;
  for i := 0 to (16 - 1) do
  begin
    j := sprorder[i];
    if sprrdrwf[j] then
    begin
      dig.Pc.gputim(sprx[j], spry[j], sprch[j], sprwid[j], sprhei[j]);
    end;
  end;
end;

procedure TSprite.putis;
var
  i: integer;
begin
  i := 0;
  for i := 0 to (16 - 1) do
    if sprrdrwf[i] then
    begin
      dig.Pc.gputi(sprx[i], spry[i], sprmov[i], sprwid[i], sprhei[i]);
    end;
end;

procedure TSprite.setrdrwflgs(n: integer);
var
  i: integer;
begin
  i := 0;
  if not sprrecf[n] then
  begin
    sprrecf[n] := True;
    for i := 0 to (16 - 1) do
      if sprenf[i] and (i <> n) then
      begin
        if collide(i, n) then
        begin
          sprrdrwf[i] := True;
          setrdrwflgs(i);
        end;
        sprx[i] := sprx[i] + 320;
        spry[i] := spry[i] - 2;
        if collide(i, n) then
        begin
          sprrdrwf[i] := True;
          setrdrwflgs(i);
        end;
        sprx[i] := sprx[i] - 640;
        spry[i] := spry[i] + 4;
        if collide(i, n) then
        begin
          sprrdrwf[i] := True;
          setrdrwflgs(i);
        end;
        sprx[i] := sprx[i] + 320;
        spry[i] := spry[i] - 2;
      end;
  end;
end;

procedure TSprite.setretr(f: boolean);
begin
  retrflag := f;
end;

procedure TSprite.setsprorder(newsprorder: IntegerArray);
begin
  if newsprorder = nil then
  begin
    sprorder := defsprorder;
  end
  else
  begin
    sprorder := newsprorder;
  end;
end;

end.
