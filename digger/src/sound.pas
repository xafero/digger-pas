unit Sound;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, api;

type
  TSound = class(TInterfacedObject, ISound)
  private
  var
    dig:                  IDigger;
  var
    pulsewidth:           integer;
  var
    mVolume:              integer;
  var
    timerclock:           integer;
  var
    soundlevdoneflag:     boolean;
  var
    newlevjingle:         array of integer;
  var
    soundbreakflag:       boolean;
  var
    soundwobbleflag:      boolean;
  var
    soundwobblen:         integer;
  var
    soundfireflag:        boolean;
  var
    soundexplodeflag:     boolean;
  var
    soundbonusflag:       boolean;
  var
    soundbonusn:          integer;
  var
    soundemflag:          boolean;
  var
    soundemeraldflag:     boolean;
  var
    soundeatmflag:        boolean;
  var
    soundddieflag:        boolean;
  var
    sound1upflag:         boolean;
  var
    sound1upduration:     integer;
  var
    musicplaying:         boolean;
  var
    soundt0flag:          boolean;
  var
    int8flag:             boolean;
  var
    wavetype:             integer;
  var
    t2val:                integer;
  var
    t0val:                integer;
  var
    musvol:               integer;
  var
    spkrmode:             integer;
  var
    timerrate:            integer;
  var
    timercount:           integer;
  var
    soundflag:            boolean;
  var
    mMusicflag:           boolean;
  var
    sndflag:              boolean;
  var
    soundpausedflag:      boolean;
  var
    nljpointer:           integer;
  var
    nljnoteduration:      integer;
  var
    soundfallflag:        boolean;
  var
    soundfallf:           boolean;
  var
    soundfallvalue:       integer;
  var
    soundfalln:           integer;
  var
    soundbreakduration:   integer;
  var
    soundbreakvalue:      integer;
  var
    soundfirevalue:       integer;
  var
    soundfiren:           integer;
  var
    soundexplodevalue:    integer;
  var
    soundexplodeduration: integer;
  var
    soundemeraldduration: integer;
  var
    emerfreq:             integer;
  var
    soundemeraldn:        integer;
  var
    soundgoldflag:        boolean;
  var
    soundgoldf:           boolean;
  var
    soundgoldvalue1:      integer;
  var
    soundgoldvalue2:      integer;
  var
    soundgoldduration:    integer;
  var
    soundeatmvalue:       integer;
  var
    soundeatmduration:    integer;
  var
    soundeatmn:           integer;
  var
    soundddien:           integer;
  var
    soundddievalue:       integer;
  var
    musicp:               integer;
  var
    tuneno:               integer;
  var
    noteduration:         integer;
  var
    notevalue:            integer;
  var
    musicmaxvol:          integer;
  var
    musicattackrate:      integer;
  var
    musicsustainlevel:    integer;
  var
    musicdecayrate:       integer;
  var
    musicnotewidth:       integer;
  var
    musicreleaserate:     integer;
  var
    musicstage:           integer;
  var
    musicn:               integer;
  public
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
    constructor Create(d: IDigger);
  end;

implementation

constructor TSound.Create(d: IDigger);
begin
  dig := d;
  pulsewidth := 1;
  volume := 0;
  timerclock := 0;
  soundlevdoneflag := False;
  newlevjingle := [$8E8, $712, $5F2, $7F0, $6AC, $54C, $712, $5F2, $4B8, $474, $474];
  soundbreakflag := False;
  soundwobbleflag := False;
  soundwobblen := 0;
  soundfireflag := False;
  soundexplodeflag := False;
  soundbonusflag := False;
  soundbonusn := 0;
  soundemflag := False;
  soundemeraldflag := False;
  soundeatmflag := False;
  soundddieflag := False;
  sound1upflag := False;
  sound1upduration := 0;
  musicplaying := False;
  soundt0flag := False;
  int8flag := False;
  wavetype := 0;
  t2val := 0;
  t0val := 0;
  musvol := 0;
  spkrmode := 0;
  timerrate := $7D0;
  timercount := 0;
  soundflag := True;
  musicflag := True;
  sndflag := False;
  soundpausedflag := False;
  nljpointer := 0;
  nljnoteduration := 0;
  soundfallflag := False;
  soundfallf := False;
  soundfallvalue := 0;
  soundfalln := 0;
  soundbreakduration := 0;
  soundbreakvalue := 0;
  soundfirevalue := 0;
  soundfiren := 0;
  soundexplodevalue := 0;
  soundexplodeduration := 0;
  soundemeraldduration := 0;
  emerfreq := 0;
  soundemeraldn := 0;
  soundgoldflag := False;
  soundgoldf := False;
  soundgoldvalue1 := 0;
  soundgoldvalue2 := 0;
  soundgoldduration := 0;
  soundeatmvalue := 0;
  soundeatmduration := 0;
  soundeatmn := 0;
  soundddien := 0;
  soundddievalue := 0;
  musicp := 0;
  tuneno := 0;
  noteduration := 0;
  notevalue := 0;
  musicmaxvol := 0;
  musicattackrate := 0;
  musicsustainlevel := 0;
  musicdecayrate := 0;
  musicnotewidth := 0;
  musicreleaserate := 0;
  musicstage := 0;
  musicn := 0;
end;

procedure TSound.initsound;
begin
  wavetype := 2;
  t0val  := 12000;
  musvol := 8;
  t2val  := 40;
  soundt0flag := True;
  sndflag := True;
  spkrmode := 0;
  int8flag := False;
  setsoundt2();
  soundstop();
  startint8();
  timerrate := $4000;
end;

procedure TSound.killsound;
begin
end;

procedure TSound.music(tune: integer);
begin
  tuneno := tune;
  musicp := 0;
  noteduration := 0;
  case tune of
    0:
    begin
      musicmaxvol := 50;
      musicattackrate := 20;
      musicsustainlevel := 20;
      musicdecayrate := 10;
      musicreleaserate := 4;
    end;
    1:
    begin
      musicmaxvol := 50;
      musicattackrate := 50;
      musicsustainlevel := 8;
      musicdecayrate := 15;
      musicreleaserate := 1;
    end;
    2:
    begin
      musicmaxvol := 50;
      musicattackrate := 50;
      musicsustainlevel := 25;
      musicdecayrate := 5;
      musicreleaserate := 1;
    end;
  end;
  musicplaying := True;
  if tune = 2 then
  begin
    soundddieoff();
  end;
end;

procedure TSound.musicoff;
begin
  musicplaying := False;
  musicp := 0;
end;

procedure TSound.musicupdate;
label
  BreakOut;
begin
  if not musicplaying then
  begin
    exit;
  end;
  if noteduration <> 0 then
  begin
    Dec(noteduration);
  end
  else
  begin
    musicn := 0;
    musicstage := 0;
    case tuneno of
      0:
      begin
        musicnotewidth := noteduration - 3;
        musicp := musicp + 2;
      end;
      1:
      begin
        musicnotewidth := 12;
        musicp := musicp + 2;
      end;
      2:
      begin
        musicnotewidth := noteduration - 10;
        musicp := musicp + 2;
      end;
    end;
  end;
  Inc(musicn);
  wavetype := 1;
  t0val := notevalue;
  if musicn >= musicnotewidth then
  begin
    musicstage := 2;
  end;
  case musicstage of
    0:
    begin
      if (musvol + musicattackrate) >= musicmaxvol then
      begin
        musicstage := 1;
        musvol := musicmaxvol;
        goto BreakOut;
      end;
      musvol := musvol + musicattackrate;
    end;
    1:
    begin
      if (musvol - musicdecayrate) <= musicsustainlevel then
      begin
        musvol := musicsustainlevel;
        goto BreakOut;
      end;
      musvol := musvol - musicdecayrate;
    end;
    2:
    begin
      if (musvol - musicreleaserate) <= 1 then
      begin
        musvol := 1;
        goto BreakOut;
      end;
      musvol := musvol - musicreleaserate;
    end;
  end;
  BreakOut:
    if musvol = 1 then
    begin
      t0val := $7D00;
    end;
end;

procedure TSound.s0fillbuffer;
begin
end;

procedure TSound.s0killsound;
begin
  setsoundt2();
  stopint8();
end;

procedure TSound.s0setupsound;
begin
  startint8();
end;

procedure TSound.setsoundmode;
begin
  spkrmode := wavetype;
  if (not soundt0flag) and sndflag then
  begin
    soundt0flag := True;
  end;
end;

procedure TSound.setsoundt2;
begin
  if soundt0flag then
  begin
    spkrmode := 0;
    soundt0flag := False;
  end;
end;

procedure TSound.sett0;
begin
  if sndflag then
  begin
    if (t0val < 1000) and ((wavetype = 1) or (wavetype = 2)) then
    begin
      t0val := 1000;
    end;
    timerrate := t0val;
    if musvol < 1 then
    begin
      musvol := 1;
    end;
    if musvol > 50 then
    begin
      musvol := 50;
    end;
    pulsewidth := musvol * volume;
    setsoundmode();
  end;
end;

procedure TSound.sett2val(t2v: integer);
begin
end;

procedure TSound.setupsound;
begin
end;

procedure TSound.sound1up;
begin
  sound1upduration := 96;
  sound1upflag := True;
end;

procedure TSound.sound1upoff;
begin
  sound1upflag := False;
end;

procedure TSound.sound1upupdate;
begin
  if sound1upflag then
  begin
    if ((trunc(sound1upduration / 3)) mod 2) <> 0 then
    begin
      t2val := (sound1upduration shl 2) + 600;
    end;
    Dec(sound1upduration);
    if sound1upduration < 1 then
    begin
      sound1upflag := False;
    end;
  end;
end;

procedure TSound.soundbonus;
begin
  soundbonusflag := True;
end;

procedure TSound.soundbonusoff;
begin
  soundbonusflag := False;
  soundbonusn := 0;
end;

procedure TSound.soundbonusupdate;
begin
  if soundbonusflag then
  begin
    Inc(soundbonusn);
    if soundbonusn > 15 then
    begin
      soundbonusn := 0;
    end;
    if (soundbonusn >= 0) and (soundbonusn < 6) then
    begin
      t2val := $4CE;
    end;
    if (soundbonusn >= 8) and (soundbonusn < 14) then
    begin
      t2val := $5E9;
    end;
  end;
end;

procedure TSound.soundbreak;
begin
  soundbreakduration := 3;
  if soundbreakvalue < 15000 then
  begin
    soundbreakvalue := 15000;
  end;
  soundbreakflag := True;
end;

procedure TSound.soundbreakoff;
begin
  soundbreakflag := False;
end;

procedure TSound.soundbreakupdate;
begin
  if soundbreakflag then
  begin
    if soundbreakduration <> 0 then
    begin
      Dec(soundbreakduration);
      t2val := soundbreakvalue;
    end
    else
    begin
      soundbreakflag := False;
    end;
  end;
end;

procedure TSound.soundddie;
begin
  soundddien := 0;
  soundddievalue := 20000;
  soundddieflag := True;
end;

procedure TSound.soundddieoff;
begin
  soundddieflag := False;
end;

procedure TSound.soundddieupdate;
begin
  if soundddieflag then
  begin
    Inc(soundddien);
    if soundddien = 1 then
    begin
      musicoff();
    end;
    if (soundddien >= 1) and (soundddien <= 10) then
    begin
      soundddievalue := 20000 - (soundddien * 1000);
    end;
    if soundddien > 10 then
    begin
      soundddievalue := soundddievalue + 500;
    end;
    if soundddievalue > 30000 then
    begin
      soundddieoff();
    end;
    t2val := soundddievalue;
  end;
end;

procedure TSound.soundeatm;
begin
  soundeatmduration := 20;
  soundeatmn := 3;
  soundeatmvalue := 2000;
  soundeatmflag := True;
end;

procedure TSound.soundeatmoff;
begin
  soundeatmflag := False;
end;

procedure TSound.soundeatmupdate;
begin
  if soundeatmflag then
  begin
    if soundeatmn <> 0 then
    begin
      if soundeatmduration <> 0 then
      begin
        if (soundeatmduration mod 4) = 1 then
        begin
          t2val := soundeatmvalue;
        end;
        if (soundeatmduration mod 4) = 3 then
        begin
          t2val := soundeatmvalue - (soundeatmvalue shr 4);
        end;
        Dec(soundeatmduration);
        soundeatmvalue := soundeatmvalue - soundeatmvalue shr 4;
      end
      else
      begin
        soundeatmduration := 20;
        Dec(soundeatmn);
        soundeatmvalue := 2000;
      end;
    end
    else
    begin
      soundeatmflag := False;
    end;
  end;
end;

procedure TSound.soundem;
begin
  soundemflag := True;
end;

procedure TSound.soundemerald(emocttime: integer);
begin
  if emocttime <> 0 then
  begin
    case emerfreq of
      $8E8:
      begin
        emerfreq := $7F0;
      end;
      $7F0:
      begin
        emerfreq := $712;
      end;
      $712:
      begin
        emerfreq := $6AC;
      end;
      $6AC:
      begin
        emerfreq := $5F2;
      end;
      $5F2:
      begin
        emerfreq := $54C;
      end;
      $54C:
      begin
        emerfreq := $4B8;
      end;
      $4B8:
      begin
        emerfreq := $474;
        dig.Scores.scoreoctave();
      end;
      $474:
      begin
        emerfreq := $8E8;
      end;
    end;
  end
  else
  begin
    emerfreq := $8E8;
  end;
  soundemeraldduration := 7;
  soundemeraldn := 0;
  soundemeraldflag := True;
end;

procedure TSound.soundemeraldoff;
begin
  soundemeraldflag := False;
end;

procedure TSound.soundemeraldupdate;
begin
  if soundemeraldflag then
  begin
    if soundemeraldduration <> 0 then
    begin
      if (soundemeraldn = 0) or (soundemeraldn = 1) then
      begin
        t2val := emerfreq;
      end;
      Inc(soundemeraldn);
      if soundemeraldn > 7 then
      begin
        soundemeraldn := 0;
        Dec(soundemeraldduration);
      end;
    end
    else
    begin
      soundemeraldoff();
    end;
  end;
end;

procedure TSound.soundemoff;
begin
  soundemflag := False;
end;

procedure TSound.soundemupdate;
begin
  if soundemflag then
  begin
    t2val := 1000;
    soundemoff();
  end;
end;

procedure TSound.soundexplode;
begin
  soundexplodevalue := 1500;
  soundexplodeduration := 10;
  soundexplodeflag  := True;
  soundfireoff();
end;

procedure TSound.soundexplodeoff;
begin
  soundexplodeflag := False;
end;

procedure TSound.soundexplodeupdate;
begin
  if soundexplodeflag then
  begin
    if soundexplodeduration <> 0 then
    begin
      t2val := soundexplodevalue - (soundexplodevalue shr 3);
      soundexplodevalue := soundexplodevalue - (soundexplodevalue shr 3);
      Dec(soundexplodeduration);
    end
    else
    begin
      soundexplodeflag := False;
    end;
  end;
end;

procedure TSound.soundfall;
begin
  soundfallvalue := 1000;
  soundfallflag  := True;
end;

procedure TSound.soundfalloff;
begin
  soundfallflag := False;
  soundfalln := 0;
end;

procedure TSound.soundfallupdate;
begin
  if soundfallflag then
  begin
    if soundfalln < 1 then
    begin
      Inc(soundfalln);
      if soundfallf then
      begin
        t2val := soundfallvalue;
      end;
    end
    else
    begin
      soundfalln := 0;
      if soundfallf then
      begin
        soundfallvalue := soundfallvalue + 50;
        soundfallf := False;
      end
      else
      begin
        soundfallf := True;
      end;
    end;
  end;
end;

procedure TSound.soundfire;
begin
  soundfirevalue := 500;
  soundfireflag  := True;
end;

procedure TSound.soundfireoff;
begin
  soundfireflag := False;
  soundfiren := 0;
end;

procedure TSound.soundfireupdate;
begin
  if soundfireflag then
  begin
    if soundfiren = 1 then
    begin
      soundfiren := 0;
      soundfirevalue := soundfirevalue + trunc(soundfirevalue / 55);
      t2val := soundfirevalue + dig.Main.randno(soundfirevalue shr 3);
      if soundfirevalue > 30000 then
      begin
        soundfireoff();
      end;
    end
    else
    begin
      Inc(soundfiren);
    end;
  end;
end;

procedure TSound.soundgold;
begin
  soundgoldvalue1 := 500;
  soundgoldvalue2 := 4000;
  soundgoldduration := 30;
  soundgoldf := False;
  soundgoldflag := True;
end;

procedure TSound.soundgoldoff;
begin
  soundgoldflag := False;
end;

procedure TSound.soundgoldupdate;
begin
  if soundgoldflag then
  begin
    if soundgoldduration <> 0 then
    begin
      Dec(soundgoldduration);
    end
    else
    begin
      soundgoldflag := False;
    end;
    if soundgoldf then
    begin
      soundgoldf := False;
      t2val := soundgoldvalue1;
    end
    else
    begin
      soundgoldf := True;
      t2val := soundgoldvalue2;
    end;
    soundgoldvalue1 := soundgoldvalue1 + soundgoldvalue1 shr 4;
    soundgoldvalue2 := soundgoldvalue2 - soundgoldvalue2 shr 4;
  end;
end;

procedure TSound.soundint;
begin
  Inc(timerclock);
  if soundflag and (not sndflag) then
  begin
    musicflag := True;
  end;
  if (not soundflag) and sndflag then
  begin
    sndflag := False;
    setsoundt2();
  end;
  if sndflag and (not soundpausedflag) then
  begin
    t0val := $7D00;
    t2val := 40;
    if musicflag then
    begin
      musicupdate();
    end;
    soundemeraldupdate();
    soundwobbleupdate();
    soundddieupdate();
    soundbreakupdate();
    soundgoldupdate();
    soundemupdate();
    soundexplodeupdate();
    soundfireupdate();
    soundeatmupdate();
    soundfallupdate();
    sound1upupdate();
    soundbonusupdate();
    if (t0val = $7D00) or (t2val <> 40) then
    begin
      setsoundt2();
    end
    else
    begin
      setsoundmode();
      sett0();
    end;
    sett2val(t2val);
  end;
end;

procedure TSound.soundlevdone;
begin
  try
    TThread.sleep(1000);
  except
    on e: Exception do
    begin
    end;
  end;
end;

procedure TSound.soundlevdoneoff;
begin
  soundpausedflag  := False;
  soundlevdoneflag := False;
end;

procedure TSound.soundlevdoneupdate;
begin
  if sndflag then
  begin
    if nljpointer < 11 then
    begin
      t2val := newlevjingle[nljpointer];
    end;
    t0val  := t2val + 35;
    musvol := 50;
    setsoundmode();
    sett0();
    sett2val(t2val);
    if nljnoteduration > 0 then
    begin
      Dec(nljnoteduration);
    end
    else
    begin
      nljnoteduration := 20;
      Inc(nljpointer);
      if nljpointer > 10 then
      begin
        soundlevdoneoff();
      end;
    end;
  end
  else
  begin
    soundlevdoneflag := False;
  end;
end;

procedure TSound.soundoff;
begin
end;

procedure TSound.soundpause;
begin
  soundpausedflag := True;
end;

procedure TSound.soundpauseoff;
begin
  soundpausedflag := False;
end;

procedure TSound.soundstop;
begin
  soundfalloff();
  soundwobbleoff();
  soundfireoff();
  musicoff();
  soundbonusoff();
  soundexplodeoff();
  soundbreakoff();
  soundemoff();
  soundemeraldoff();
  soundgoldoff();
  soundeatmoff();
  soundddieoff();
  sound1upoff();
end;

procedure TSound.soundwobble;
begin
  soundwobbleflag := True;
end;

procedure TSound.soundwobbleoff;
begin
  soundwobbleflag := False;
  soundwobblen := 0;
end;

procedure TSound.soundwobbleupdate;
begin
  if soundwobbleflag then
  begin
    Inc(soundwobblen);
    if soundwobblen > 63 then
    begin
      soundwobblen := 0;
    end;
    case soundwobblen of
      0:
      begin
        t2val := $7D0;
      end;
      16:
      begin
      end;
      48:
      begin
        t2val := $9C4;
      end;
      32:
      begin
        t2val := $BB8;
      end;
    end;
  end;
end;

procedure TSound.startint8;
begin
  if not int8flag then
  begin
    timerrate := $4000;
    int8flag  := True;
  end;
end;

procedure TSound.stopint8;
begin
  if int8flag then
  begin
    int8flag := False;
  end;
  sett2val(40);
end;

procedure TSound.SetVolume(Value: integer);
begin
  mVolume := Value;
end;

function TSound.GetVolume: integer;
begin
  exit(mVolume);
end;

procedure TSound.Setmusicflag(Value: boolean);
begin
  mMusicflag := Value;
end;

function TSound.Getmusicflag: boolean;
begin
  exit(mMusicflag);
end;

end.
