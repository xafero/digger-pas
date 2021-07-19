unit Api;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  IntegerArray = array of integer;

type
  ShortArray = array of Int16;

type
  ByteArray = array of byte;

type
  Byte2Array = array of array of byte;

type
  Byte3Array = array of array of array of byte;

type
  Object2Array = array of array of TObject;

type
  IColorModel = interface
    function GetColor(ind: integer): IntegerArray;
  end;

type
  IDrawing = interface
    procedure Setfield(Value: IntegerArray);
    function Getfield(): IntegerArray;
    property field: IntegerArray Read Getfield Write Setfield;

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

type
  ISound = interface
    procedure SetVolume(Value: integer);
    function GetVolume: integer;
    property volume: integer Read GetVolume Write SetVolume;

    procedure Setmusicflag(Value: boolean);
    function Getmusicflag: boolean;
    property musicflag: boolean Read Getmusicflag Write Setmusicflag;

    procedure initsound;
    procedure killsound;
    procedure music(tune: integer);
    procedure musicoff;
    procedure musicupdate;
    procedure s0fillbuffer;
    procedure s0killsound;
    procedure s0setupsound;
    procedure setsoundmode;
    procedure setsoundt2;
    procedure sett0;
    procedure sett2val(t2v: integer);
    procedure setupsound;
    procedure sound1up;
    procedure sound1upoff;
    procedure sound1upupdate;
    procedure soundbonus;
    procedure soundbonusoff;
    procedure soundbonusupdate;
    procedure soundbreak;
    procedure soundbreakoff;
    procedure soundbreakupdate;
    procedure soundddie;
    procedure soundddieoff;
    procedure soundddieupdate;
    procedure soundeatm;
    procedure soundeatmoff;
    procedure soundeatmupdate;
    procedure soundem;
    procedure soundemerald(emocttime: integer);
    procedure soundemeraldoff;
    procedure soundemeraldupdate;
    procedure soundemoff;
    procedure soundemupdate;
    procedure soundexplode;
    procedure soundexplodeoff;
    procedure soundexplodeupdate;
    procedure soundfall;
    procedure soundfalloff;
    procedure soundfallupdate;
    procedure soundfire;
    procedure soundfireoff;
    procedure soundfireupdate;
    procedure soundgold;
    procedure soundgoldoff;
    procedure soundgoldupdate;
    procedure soundint;
    procedure soundlevdone;
    procedure soundlevdoneoff;
    procedure soundlevdoneupdate;
    procedure soundoff;
    procedure soundpause;
    procedure soundpauseoff;
    procedure soundstop;
    procedure soundwobble;
    procedure soundwobbleoff;
    procedure soundwobbleupdate;
    procedure startint8;
    procedure stopint8;
  end;

type
  IBags = interface
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

type
  IScoreTuple = interface
    function getKey(): string;
    function getValue(): integer;
  end;

type
  ScoreTuples = array of IScoreTuple;

type
  IScores = interface
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
    procedure writecurscore(bp: integer);
    procedure writenum(n: int64; x: integer; y: integer; w: integer; c: integer);
    procedure zeroscores;
  end;

type
  IMain = interface
    procedure Setnplayers(Value: integer);
    function Getnplayers: integer;
    property nplayers: integer Read Getnplayers Write Setnplayers;

    procedure Setpldispbuf(Value: string);
    function Getpldispbuf: string;
    property pldispbuf: string Read Getpldispbuf Write Setpldispbuf;

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

type
  IMonster = interface
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
  end;

type
  ISource = interface
    procedure newPixels(x: integer; y: integer; w: integer; h: integer);
    procedure newPixelsAll();
    procedure setAnimated(val: boolean);
  end;

type
  SourceArray = array of ISource;

type
  IPc = interface
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

    procedure gclear;
    function gethrt: int64;
    function getkips: integer;
    procedure ggeti(x: integer; y: integer; p: array of Int16; w: integer; h: integer);
    function ggetpix(x: integer; y: integer): integer;
    procedure ginit;
    procedure ginten(inten: integer);
    procedure gpal(pal: integer);
    procedure gputi(x: integer; y: integer; p: array of Int16; w: integer; h: integer);
    procedure gputi(x: integer; y: integer; p: array of Int16;
      w: integer; h: integer; b: boolean);
    procedure gputim(x: integer; y: integer; ch: integer; w: integer; h: integer);
    procedure gtitle;
    procedure gwrite(x: integer; y: integer; ch: integer; c: integer);
    procedure gwrite(x: integer; y: integer; ch: integer; c: integer; upd: boolean);
  end;

type
  IInput = interface
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

type
  IBagData = interface
    procedure copyFrom(t: IBagData);
  end;

type
  ISprite = interface
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
  end;

type
  IDigger = interface
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

type
  IFactory = interface
    function CreateRefresher(digger: IDigger; model: IColorModel): ISource;
    procedure RequestFocus();
    function getSubmitParameter(): string;
    function getSpeedParameter(): integer;
  end;

implementation

end.
