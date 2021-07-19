program Launcher;

{$mode objfpc}{$H+}

uses
  cthreads,
  Interfaces,
  Forms,
  Window,
  MonsterData,
  GameData,
  BagData,
  Alpha,
  Bags,
  CgaGrafx,
  Digger,
  Drawing,
  Input,
  Main,
  Monster,
  Pc,
  Scores,
  Sound,
  Sprite,
  Api,
  ColorModel;

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Scaled := True;
  Application.Initialize;
  Application.CreateForm(TDiggerForm, MainWindow);
  Application.Run;
end.
