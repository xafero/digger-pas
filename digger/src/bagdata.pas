unit BagData;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TBagData = class
  public
    x:        integer;
    y:        integer;
    h:        integer;
    v:        integer;
    xr:       integer;
    yr:       integer;
    dir:      integer;
    wt:       integer;
    gt:       integer;
    fallh:    integer;
    wobbling: boolean;
    unfallen: boolean;
    exist:    boolean;
    procedure copyFrom(t: TBagData);
  end;

implementation

procedure TBagData.copyFrom(t: TBagData);
begin
  x  := t.x;
  y  := t.y;
  h  := t.h;
  v  := t.v;
  xr := t.xr;
  yr := t.yr;
  dir := t.dir;
  wt := t.wt;
  gt := t.gt;
  fallh := t.fallh;
  wobbling := t.wobbling;
  unfallen := t.unfallen;
  exist := t.exist;
end;

end.
