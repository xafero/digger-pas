unit GameData;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TGameData = class
  public
    lives:   integer;
    level:   integer;
    dead:    boolean;
    levdone: boolean;
    constructor Create();
  end;

implementation

constructor TGameData.Create;
begin
end;

end.
