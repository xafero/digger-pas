unit MonsterData;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TMonsterData = class
  public
    x:     integer;
    y:     integer;
    h:     integer;
    v:     integer;
    xr:    integer;
    yr:    integer;
    dir:   integer;
    hdir:  integer;
    t:     integer;
    hnt:   integer;
    death: integer;
    bag:   integer;
    dtime: integer;
    stime: integer;
    flag:  boolean;
    nob:   boolean;
    alive: boolean;
  end;

implementation

end.
