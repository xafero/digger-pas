unit Input;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, api;

type
  TInput = class(TInterfacedObject, IInput)
  private
  var
    dig:          IDigger;
  var
    mKeypressed:  integer;
  var
    mAkeypressed: integer;
  var
    mFirepflag:   boolean;
  var
    joyflag:      boolean;
  var
    leftpressed:  boolean;
  var
    rightpressed: boolean;
  var
    uppressed:    boolean;
  var
    downpressed:  boolean;
  var
    f1pressed:    boolean;
  var
    mFirepressed: boolean;
  var
    minuspressed: boolean;
  var
    pluspressed:  boolean;
  var
    f10pressed:   boolean;
  var
    mEscape:      boolean;
  var
    dynamicdir:   integer;
  var
    staticdir:    integer;
  var
    joyx:         integer;
  var
    joyy:         integer;
  var
    joybut1:      boolean;
  var
    joybut2:      boolean;
  var
    keydir:       integer;
  var
    jleftthresh:  integer;
  var
    jupthresh:    integer;
  var
    jrightthresh: integer;
  var
    jdownthresh:  integer;
  var
    joyanax:      integer;
  var
    joyanay:      integer;
  public
    procedure Setakeypressed(Value: integer);
    function Getakeypressed: integer;
    property akeypressed: integer Read Getakeypressed Write Setakeypressed;

    procedure Setkeypressed(Value: integer);
    function Getkeypressed: integer;
    property keypressed: integer Read Getkeypressed Write Setkeypressed;

    procedure Setfirepressed(Value: boolean);
    function Getfirepressed: boolean;
    property firepressed: boolean Read Getfirepressed Write Setfirepressed;

    procedure Setescape(Value: boolean);
    function Getescape: boolean;
    property escape: boolean Read Getescape Write Setescape;

    procedure Setfirepflag(Value: boolean);
    function Getfirepflag: boolean;
    property firepflag: boolean Read Getfirepflag Write Setfirepflag;

    constructor Create(d: IDigger);
    procedure checkkeyb;
    procedure detectjoy;
    function getasciikey(make: integer): integer;
    function getdir: integer;
    procedure initkeyb;
    procedure Key_downpressed;
    procedure Key_downreleased;
    procedure Key_f1pressed;
    procedure Key_f1released;
    procedure Key_leftpressed;
    procedure Key_leftreleased;
    procedure Key_rightpressed;
    procedure Key_rightreleased;
    procedure Key_uppressed;
    procedure Key_upreleased;
    procedure processkey(key: integer);
    procedure readdir;
    procedure readjoy;
    procedure setdirec;
    function teststart: boolean;
  end;

implementation

constructor TInput.Create(d: IDigger);
begin
  dig  := d;
  keypressed := 0;
  akeypressed := 0;
  firepflag := False;
  joyflag := False;
  leftpressed := False;
  rightpressed := False;
  uppressed := False;
  downpressed := False;
  f1pressed := False;
  firepressed := False;
  minuspressed := False;
  pluspressed := False;
  f10pressed := False;
  escape := False;
  dynamicdir := -1;
  staticdir := -1;
  joyx := 0;
  joyy := 0;
  joybut1 := False;
  joybut2 := False;
  keydir := 0;
  jleftthresh := 0;
  jupthresh := 0;
  jrightthresh := 0;
  jdownthresh := 0;
  joyanax := 0;
  joyanay := 0;
end;

procedure TInput.checkkeyb;
begin
  if pluspressed then
  begin
    if dig.frametime > 40 then
    begin
      dig.frametime := dig.frametime - 5;
    end;
  end;
  if minuspressed then
  begin
    if dig.frametime < 200 then
    begin
      dig.frametime := dig.frametime + 5;
    end;
  end;
  if f10pressed then
  begin
    escape := True;
  end;
end;

procedure TInput.detectjoy;
begin
  joyflag := False;
  dynamicdir := -1;
  staticdir := -1;
end;

function TInput.getasciikey(make: integer): integer;
var
  k: integer;
begin
  k := 0;
  if (make = Ord(#32)) or ((make >= Ord(#97)) and (make <= Ord(#122))) or
    ((make >= Ord(#48)) and (make <= Ord(#57))) then
  begin
    exit(make);
  end
  else
  begin
    exit(0);
  end;
end;

function TInput.getdir: integer;
var
  bp2: integer;
begin
  bp2 := keydir;
  exit(bp2);
end;

procedure TInput.initkeyb;
begin
end;

procedure TInput.Key_downpressed;
begin
  downpressed := True;
  staticdir  := 6;
  dynamicdir := 6;
end;

procedure TInput.Key_downreleased;
begin
  downpressed := False;
  if dynamicdir = 6 then
  begin
    setdirec();
  end;
end;

procedure TInput.Key_f1pressed;
begin
  firepressed := True;
  f1pressed := True;
end;

procedure TInput.Key_f1released;
begin
  f1pressed := False;
end;

procedure TInput.Key_leftpressed;
begin

  leftpressed := True;
  staticdir  := 4;
  dynamicdir := 4;
end;

procedure TInput.Key_leftreleased;
begin
  leftpressed := False;
  if dynamicdir = 4 then
  begin
    setdirec();
  end;
end;

procedure TInput.Key_rightpressed;
begin

  rightpressed := True;
  staticdir  := 0;
  dynamicdir := 0;
end;

procedure TInput.Key_rightreleased;
begin
  rightpressed := False;
  if dynamicdir = 0 then
  begin
    setdirec();
  end;
end;

procedure TInput.Key_uppressed;
begin
  uppressed  := True;
  staticdir  := 2;
  dynamicdir := 2;
end;

procedure TInput.Key_upreleased;
begin
  uppressed := False;
  if dynamicdir = 2 then
  begin
    setdirec();
  end;
end;

procedure TInput.processkey(key: integer);
begin
  keypressed := key;
  if key > $80 then
  begin
    akeypressed := key and $7F;
  end;
  case key of
    $4B:
    begin
      Key_leftpressed();
    end;
    $CB:
    begin
      Key_leftreleased();
    end;
    $4D:
    begin
      Key_rightpressed();
    end;
    $CD:
    begin
      Key_rightreleased();
    end;
    $48:
    begin
      Key_uppressed();
    end;
    $C8:
    begin
      Key_upreleased();
    end;
    $50:
    begin
      Key_downpressed();
    end;
    $D0:
    begin
      Key_downreleased();
    end;
    $3B:
    begin
      Key_f1pressed();
    end;
    $BB:
    begin
      Key_f1released();
    end;
    $78:
    begin
      f10pressed := True;
    end;
    $F8:
    begin
      f10pressed := False;
    end;
    $2B:
    begin
      pluspressed := True;
    end;
    $AB:
    begin
      pluspressed := False;
    end;
    $2D:
    begin
      minuspressed := True;
    end;
    $AD:
    begin
      minuspressed := False;
    end;
  end;
end;

procedure TInput.readdir;
begin
  keydir := staticdir;
  if dynamicdir <> (-1) then
  begin
    keydir := dynamicdir;
  end;
  staticdir := -1;
  if f1pressed or firepressed then
  begin
    firepflag := True;
  end
  else
  begin
    firepflag := False;
  end;
  firepressed := False;
end;

procedure TInput.readjoy;
begin
end;

procedure TInput.setdirec;
begin
  dynamicdir := -1;
  if uppressed then
  begin
    staticdir  := 2;
    dynamicdir := staticdir;
  end;
  if downpressed then
  begin
    staticdir  := 6;
    dynamicdir := staticdir;
  end;
  if leftpressed then
  begin
    staticdir  := 4;
    dynamicdir := staticdir;
  end;
  if rightpressed then
  begin
    staticdir  := 0;
    dynamicdir := staticdir;
  end;
end;

function TInput.teststart: boolean;
var
  startf: boolean;
begin
  startf := False;
  if (keypressed <> 0) and ((keypressed and $80) = 0) and (keypressed <> 27) then
  begin
    startf  := True;
    joyflag := False;
    keypressed := 0;
  end;
  if not startf then
  begin
    exit(False);
  end;
  exit(True);
end;

procedure TInput.Setakeypressed(Value: integer);
begin
  mAkeypressed := Value;
end;

function TInput.Getakeypressed: integer;
begin
  exit(mAkeypressed);
end;

procedure TInput.Setkeypressed(Value: integer);
begin
  mKeypressed := Value;
end;

function TInput.Getkeypressed: integer;
begin
  exit(mKeypressed);
end;

procedure TInput.Setfirepressed(Value: boolean);
begin
  mFirepressed := Value;
end;

function TInput.Getfirepressed: boolean;
begin
  exit(mFirepressed);
end;

procedure TInput.Setescape(Value: boolean);
begin
  mEscape := Value;
end;

function TInput.Getescape: boolean;
begin
  exit(mEscape);
end;

procedure TInput.Setfirepflag(Value: boolean);
begin
  mFirepflag := Value;
end;

function TInput.Getfirepflag: boolean;
begin
  exit(mFirepflag);
end;

end.
