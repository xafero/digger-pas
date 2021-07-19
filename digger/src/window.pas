unit Window;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, digger, api, LCLType;

type
  TDiggerForm = class(TForm, IFactory, ISource)
  private
  var
    mDigger: TDigger;
    mModel:  IColorModel;

    function ConvertToLegacy(netCode: word): integer;
    procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
  protected
    procedure Loaded; override;
    procedure Paint; override;
  public
    function CreateRefresher(digger: IDigger; model: IColorModel): ISource;
    procedure newPixels(x: integer; y: integer; w: integer; h: integer);
    procedure newPixelsAll();
    procedure setAnimated(val: boolean);
    procedure RequestFocus();
    function getSubmitParameter(): string;
    function getSpeedParameter(): integer;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  end;

var
  MainWindow: TDiggerForm;

implementation

{$R *.lfm}

procedure TDiggerForm.RequestFocus();
begin
end;

function TDiggerForm.getSubmitParameter(): string;
begin
  exit('');
end;

function TDiggerForm.getSpeedParameter(): integer;
begin
  exit(66);
end;

procedure TDiggerForm.Loaded;
var
  game: TDigger;
begin
  game := TDigger.Create(self);
  mDigger := game;
  game.Init();
  game.Start();

  self.OnKeyDown := @FormKeyDown;
  self.OnKeyUp := @FormKeyUp;
  self.OnClose := @FormClose;

  inherited Loaded;
end;

function TDiggerForm.CreateRefresher(digger: IDigger; model: IColorModel): ISource;
begin
  mModel := model;
  exit(self);
end;

procedure TDiggerForm.Paint;
var
  scale: integer;
  shift: integer;
  w:  integer;
  h:  integer;
  x:  integer;
  y:  integer;
  cols: IntegerArray;
  pc: IPc;
  model: IColorModel;
  R:  TRect;
  Data: IntegerArray;
  arrayIndex: integer;
  myColor: TColor;
begin
  pc := mDigger.Pc;
  w  := pc.GetWidth();
  h  := pc.GetHeight();
  Data := pc.GetPixels();
  model := mModel;
  scale := 4;

  with Canvas do
  begin
    shift := 1;
    for x := 0 to (w - 1) do
    begin
      for y := 0 to (h - 1) do
      begin
        arrayIndex := (y * w) + x;
        cols  := model.GetColor(Data[arrayIndex]);
        myColor := Graphics.RGBToColor(cols[0], cols[1], cols[2]);
        R.Left := (x * scale) + shift;
        R.Top := (y * scale) + shift;
        R.Right := R.Left + scale;
        R.Bottom := R.Top + scale;
        Brush.Color := myColor;
        Brush.Style := bsSolid;
        FillRect(R);
      end;
    end;
  end;
  inherited Paint;
end;

procedure TDiggerForm.newPixels(x: integer; y: integer; w: integer; h: integer);
begin
  self.Invalidate();

end;

procedure TDiggerForm.newPixelsAll();
begin
  self.Invalidate();

end;

procedure TDiggerForm.setAnimated(val: boolean);
begin
end;

procedure TDiggerForm.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
var
  num: integer;
begin
  num := ConvertToLegacy(Key);
  if num >= 0 then
  begin
    mDigger.keyDown(num);
  end;
end;

procedure TDiggerForm.FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
var
  num: integer;
begin
  num := ConvertToLegacy(Key);
  if num >= 0 then
  begin
    mDigger.keyUp(num);
  end;
end;

function TDiggerForm.ConvertToLegacy(netCode: word): integer;
begin
  case netCode of
    VK_LEFT:
    begin
      exit(1006);
    end;
    VK_RIGHT:
    begin
      exit(1007);
    end;
    VK_UP:
    begin
      exit(1004);
    end;
    VK_DOWN:
    begin
      exit(1005);
    end;
    VK_F1:
    begin
      exit(1008);
    end;
    VK_F10:
    begin
      exit(1021);
    end;
    VK_ADD:
    begin
      exit(1031);
    end;
    VK_SUBTRACT:
    begin
      exit(1032);
    end;
    else
    begin
      exit(integer(netCode));
    end;
  end;
end;

procedure TDiggerForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

  mDigger.mydestroy();

end;

end.
