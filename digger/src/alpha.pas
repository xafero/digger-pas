unit Alpha;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TAlpha = class
  public
    class var copyright:   string;
    class var textoffdat:  array of integer;
    class var cgaletA:     array of Int16;
    class var cgaletB:     array of Int16;
    class var cgaletC:     array of Int16;
    class var cgaletD:     array of Int16;
    class var cgaletE:     array of Int16;
    class var cgaletF:     array of Int16;
    class var cgaletG:     array of Int16;
    class var cgaletH:     array of Int16;
    class var cgaletI:     array of Int16;
    class var cgaletJ:     array of Int16;
    class var cgaletK:     array of Int16;
    class var cgaletL:     array of Int16;
    class var cgaletM:     array of Int16;
    class var cgaletN:     array of Int16;
    class var cgaletO:     array of Int16;
    class var cgaletP:     array of Int16;
    class var cgaletQ:     array of Int16;
    class var cgaletR:     array of Int16;
    class var cgaletS:     array of Int16;
    class var cgaletT:     array of Int16;
    class var cgaletU:     array of Int16;
    class var cgaletV:     array of Int16;
    class var cgaletW:     array of Int16;
    class var cgaletX:     array of Int16;
    class var cgaletY:     array of Int16;
    class var cgaletZ:     array of Int16;
    class var cganum0:     array of Int16;
    class var cganum1:     array of Int16;
    class var cganum2:     array of Int16;
    class var cganum3:     array of Int16;
    class var cganum4:     array of Int16;
    class var cganum5:     array of Int16;
    class var cganum6:     array of Int16;
    class var cganum7:     array of Int16;
    class var cganum8:     array of Int16;
    class var cganum9:     array of Int16;
    class var cgasymdot:   array of Int16;
    class var cgasymline:  array of Int16;
    class var cgasymspace: array of Int16;
    class var ascii2cga:   array of array of Int16;
    class constructor Create;
  end;

implementation

class constructor TAlpha.Create;
begin
  copyright := 'Portions Copyright(c) 1983 Windmill Software Inc.';
  textoffdat := [72, 0, -72, -72, 144, 0, -288, 144, 144, -216, 144,
    -72, 144, -216, -72, 144];
  cgaletA := [$F, $FF, 0, $3F, $FF, $C0, $3C, $3, $C0, $3C, $3, $C0,
    $3C, $3, $C0, $3F, $FF, $C0, $FF, $FF, $F0, $FC, 0, $F0, $FC, 0,
    $F0, $FC, 0, $F0, $FC, 0, $F0, $FC, 0, $F0];
  cgaletB := [$3F, $FC, 0, $FF, $FF, 0, $F0, $F, 0, $F0, $F, 0, $F0,
    $F, 0, $FF, $FF, 0, $FF, $FF, $F0, $FC, 0, $F0, $FC, 0, $F0, $FC,
    0, $F0, $FF, $FF, $F0, $3F, $FF, $C0];
  cgaletC := [$3F, $FF, $C0, $FF, $FF, $F0, $F0, 0, $F0, $F0, 0, $F0,
    $F0, 0, 0, $FC, 0, 0, $FC, 0, 0, $FC, 0, 0, $FC, 0, $F0, $FC, 0,
    $F0, $FF, $FF, $F0, $3F, $FF, $C0];
  cgaletD := [$FF, $FF, $C0, $FF, $FF, $F0, $F0, 0, $F0, $F0, 0, $F0,
    $F0, 0, $F0, $F0, 0, $F0, $FF, 0, $F0, $FF, 0, $F0, $FF, 0, $F0,
    $FF, 0, $F0, $FF, $FF, $F0, $FF, $FF, $C0];
  cgaletE := [$3F, $FF, $F0, $FF, $FF, $F0, $F0, 0, 0, $F0, 0, 0,
    $F0, 0, 0, $FF, $FF, 0, $FF, $FF, 0, $FF, 0, 0, $FF, 0, 0, $FF,
    0, 0, $FF, $FF, $F0, $3F, $FF, $F0];
  cgaletF := [$3F, $FF, $F0, $FF, $FF, $F0, $FC, 0, 0, $FC, 0, 0,
    $FC, 0, 0, $FF, $FF, 0, $FF, $FF, 0, $FF, 0, 0, $FF, 0, 0, $FF,
    0, 0, $FF, 0, 0, $FF, 0, 0];
  cgaletG := [$3F, $FF, $C0, $FF, $FF, $F0, $F0, 0, $F0, $F0, 0, $F0,
    $F0, 0, 0, $F0, 0, 0, $FC, $F, $C0, $FF, $F, $F0, $FF, 0, $F0,
    $FF, 0, $F0, $FF, $FF, $F0, $3F, $FF, $C0];
  cgaletH := [$F0, 0, $F0, $F0, 0, $F0, $F0, 0, $F0, $F0, 0, $F0,
    $F0, 0, $F0, $FF, $FF, $F0, $FF, $FF, $F0, $FF, 0, $F0, $FF, 0,
    $F0, $FF, 0, $F0, $FF, 0, $F0, $FF, 0, $F0];
  cgaletI := [0, $F0, 0, 0, $F0, 0, 0, $F0, 0, 0, $F0, 0, 0, $F0,
    0, 0, $F0, 0, 0, $FF, 0, 0, $FF, 0, 0, $FF, 0, 0, $FF, 0, 0, $FF, 0, 0, $FF, 0];
  cgaletJ := [0, $F, 0, 0, $F, 0, 0, $F, 0, 0, $F, 0, 0, $F, 0, 0,
    $F, $F0, 0, $F, $F0, $F0, $F, $F0, $F0, $F, $F0, $F0, $F, $F0,
    $FF, $FF, $F0, $3F, $FF, $C0];
  cgaletK := [$F0, $F, 0, $F0, $F, 0, $F0, $F, 0, $F0, $F, 0, $F0,
    $F, 0, $FF, $FF, 0, $FF, $FF, $F0, $FF, 0, $F0, $FF, 0, $F0, $FF,
    0, $F0, $FF, 0, $F0, $FF, 0, $F0];
  cgaletL := [$F0, 0, 0, $F0, 0, 0, $F0, 0, 0, $F0, 0, 0, $F0, 0,
    0, $FF, 0, 0, $FF, 0, 0, $FF, 0, 0, $FF, 0, 0, $FF, 0, 0, $FF,
    $FF, $F0, $3F, $FF, $F0];
  cgaletM := [$3F, $FF, $C0, $FF, $FF, $F0, $F0, $F0, $F0, $F0, $F0,
    $F0, $F0, $F0, $F0, $F0, $F0, $F0, $FC, $F0, $F0, $FC, $F0, $F0,
    $FC, $F0, $F0, $FC, $F0, $F0, $FC, $F0, $F0, $FC, $F0, $F0];
  cgaletN := [$F, $FF, $C0, $3F, $FF, $F0, $3C, 0, $F0, $3C, 0, $F0,
    $3C, 0, $F0, $3C, 0, $F0, $3F, 0, $F0, $3F, 0, $F0, $3F, 0, $F0,
    $3F, 0, $F0, $3F, 0, $F0, $3F, 0, $F0];
  cgaletO := [$3F, $FF, $C0, $FF, $FF, $F0, $F0, $F, $F0, $F0, $F,
    $F0, $F0, 0, $F0, $F0, 0, $F0, $F0, 0, $F0, $F0, 0, $F0, $F0, 0,
    $F0, $F0, 0, $F0, $FF, $FF, $F0, $3F, $FF, $C0];
  cgaletP := [$3F, $FF, $C0, $FF, $FF, $F0, $F0, 0, $F0, $F0, 0, $F0,
    $F0, 0, $F0, $FF, $FF, $F0, $FF, $FF, $C0, $FF, 0, 0, $FF, 0, 0,
    $FF, 0, 0, $FF, 0, 0, $FF, 0, 0];
  cgaletQ := [$3F, $FF, $C0, $FF, $FF, $F0, $F0, 0, $F0, $F0, 0, $F0,
    $F0, 0, $F0, $F0, 0, $F0, $F0, 0, $F0, $F0, 0, $F0, $F0, $3F, $F0,
    $F0, $3F, $F0, $FF, $FF, $F0, $3F, $FF, $C0];
  cgaletR := [$3F, $FC, 0, $FF, $FF, 0, $F0, $F, 0, $F0, $F, 0, $F0,
    $F, 0, $FF, $FF, 0, $FF, $FF, $F0, $F0, 0, $F0, $F0, 0, $F0, $F0,
    0, $F0, $F0, 0, $F0, $F0, 0, $F0];
  cgaletS := [$3F, $FF, $C0, $FF, $FF, $F0, $F0, 0, $F0, $F0, 0, 0,
    $F0, 0, 0, $FF, $FF, $C0, $3F, $FF, $F0, 0, $F, $F0, 0, $F, $F0,
    $F0, $F, $F0, $FF, $FF, $F0, $3F, $FF, $C0];
  cgaletT := [$FF, $FF, $F0, $FF, $FF, $F0, 0, $F0, 0, 0, $F0, 0,
    0, $F0, 0, 0, $F0, 0, 0, $FF, 0, 0, $FF, 0, 0, $FF, 0, 0, $FF,
    0, 0, $FF, 0, 0, $FF, 0];
  cgaletU := [$F0, 0, $F0, $F0, 0, $F0, $F0, 0, $F0, $F0, 0, $F0,
    $F0, 0, $F0, $FF, 0, $F0, $FF, 0, $F0, $FF, 0, $F0, $FF, 0, $F0,
    $FF, 0, $F0, $FF, $FF, $F0, $3F, $FF, $C0];
  cgaletV := [$F0, 0, $F0, $F0, 0, $F0, $F0, 0, $F0, $F0, 0, $F0,
    $F0, 0, $F0, $F0, 0, $F0, $F0, 0, $F0, $F0, 0, $F0, $3C, $F, 0,
    $3C, $F, 0, $3F, $FF, 0, $F, $FC, 0];
  cgaletW := [$F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0,
    $F0, $F0, $F0, $F0, $F0, $F0, $F0, $FC, $F0, $F0, $FC, $F0, $F0,
    $FC, $F0, $F0, $FC, $F0, $F0, $FF, $FF, $F0, $3F, $FF, $C0];
  cgaletX := [$F0, 0, $F0, $F0, 0, $F0, $F0, 0, $F0, $F0, 0, $F0,
    $F0, 0, $F0, $F, $FF, 0, $F, $FF, 0, $FF, 0, $F0, $FF, 0, $F0,
    $FF, 0, $F0, $FF, 0, $F0, $FF, 0, $F0];
  cgaletY := [$F0, 0, $F0, $F0, 0, $F0, $F0, 0, $F0, $F0, 0, $F0,
    $F0, 0, $F0, $FF, $FF, $F0, $3F, $FF, $C0, 0, $FC, 0, 0, $FC, 0,
    0, $FC, 0, 0, $FC, 0, 0, $FC, 0];
  cgaletZ := [$3F, $FF, $C0, $FF, $FF, $F0, $F0, 0, $F0, 0, 0, $F0,
    0, 0, $F0, $3F, $FF, $F0, $FF, $FF, $C0, $FF, 0, 0, $FF, 0, 0,
    $FF, 0, $F0, $FF, $FF, $F0, $3F, $FF, $C0];
  cganum0 := [$3F, $FF, $C0, $FF, $FF, $F0, $F0, 0, $F0, $F0, 0, $F0,
    $F0, 0, $F0, $F0, $F, $F0, $F0, $F, $F0, $F0, $F, $F0, $F0, $F,
    $F0, $F0, $F, $F0, $FF, $FF, $F0, $3F, $FF, $C0];
  cganum1 := [0, $3C, 0, 0, $3C, 0, 0, $3C, 0, 0, $3C, 0, 0, $3C,
    0, 0, $FC, 0, 0, $FC, 0, 0, $FC, 0, 0, $FC, 0, 0, $FC, 0, 0, $FC, 0, 0, $FC, 0];
  cganum2 := [$3F, $FF, $C0, $FF, $FF, $F0, $F0, 0, $F0, 0, 0, $F0,
    0, 0, $F0, 0, 0, $F0, $3F, $FF, $F0, $FF, $FF, $C0, $FF, 0, 0,
    $FF, 0, 0, $FF, $FF, $F0, $3F, $FF, $F0];
  cganum3 := [$3F, $FC, 0, $FF, $FF, 0, $F0, $F, 0, $F0, $F, 0, 0,
    $F, 0, $F, $FF, $C0, $F, $FF, $F0, 0, $3, $F0, $F0, $3, $F0, $F0,
    $3, $F0, $FF, $FF, $F0, $3F, $FF, $C0];
  cganum4 := [$F0, 0, 0, $F0, 0, 0, $F0, $F, 0, $F0, $F, 0, $F0, $F,
    0, $F0, $F, 0, $F0, $F, 0, $FF, $FF, $F0, $3F, $FF, $F0, 0, $3F,
    0, 0, $3F, 0, 0, $3F, 0];
  cganum5 := [$3F, $FF, 0, $FF, $FF, 0, $F0, 0, 0, $F0, 0, 0, $F0,
    0, 0, $FF, $FF, $C0, $3F, $FF, $F0, 0, $F, $F0, $F0, $F, $F0, $F0,
    $F, $F0, $FF, $FF, $F0, $3F, $FF, $C0];
  cganum6 := [$3F, $FF, $C0, $FF, $FF, $F0, $F0, 0, $F0, $F0, 0, $F0,
    $F0, 0, 0, $FF, $FF, $C0, $FF, $FF, $F0, $F0, $F, $F0, $F0, $F,
    $F0, $F0, $F, $F0, $FF, $FF, $F0, $3F, $FF, $C0];
  cganum7 := [$3F, $FF, $C0, $3F, $FF, $F0, 0, 0, $F0, 0, 0, $F0,
    0, 0, $F0, 0, 0, $F0, 0, $3, $F0, 0, $3, $F0, 0, $3, $F0, 0, $3,
    $F0, 0, $3, $F0, 0, $3, $F0];
  cganum8 := [$3, $FF, 0, $F, $FF, $C0, $F, $3, $C0, $F, $3, $C0,
    $F, $3, $C0, $F, $FF, $C0, $3F, $FF, $F0, $F0, $3, $F0, $F0, $3,
    $F0, $F0, $3, $F0, $FF, $FF, $F0, $3F, $FF, $C0];
  cganum9 := [$3F, $FF, $C0, $FF, $FF, $F0, $F0, 0, $F0, $F0, 0, $F0,
    $F0, 0, $F0, $FF, $FF, $F0, $3F, $FF, $F0, 0, $F, $F0, 0, $F, $F0,
    0, $F, $F0, 0, $F, $F0, 0, $F, $F0];
  cgasymdot := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $3, $C0, 0, $3, $C0, 0];
  cgasymline := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $F, $FF, $F0];
  cgasymspace := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  ascii2cga := [cgasymspace, nil, nil, nil, nil, nil, nil, nil, nil,
    nil, nil, nil, nil, nil, cgasymdot, nil, cganum0, cganum1, cganum2,
    cganum3, cganum4, cganum5, cganum6, cganum7, cganum8, cganum9,
    nil, nil, nil, nil, nil, nil, nil, cgaletA, cgaletB, cgaletC,
    cgaletD, cgaletE, cgaletF, cgaletG, cgaletH, cgaletI, cgaletJ,
    cgaletK, cgaletL, cgaletM, cgaletN, cgaletO, cgaletP, cgaletQ,
    cgaletR, cgaletS, cgaletT, cgaletU, cgaletV, cgaletW, cgaletX,
    cgaletY, cgaletZ, nil, nil, nil, nil, cgasymline, nil, cgaletA,
    cgaletB, cgaletC, cgaletD, cgaletE, cgaletF, cgaletG, cgaletH,
    cgaletI, cgaletJ, cgaletK, cgaletL, cgaletM, cgaletN, cgaletO,
    cgaletP, cgaletQ, cgaletR, cgaletS, cgaletT, cgaletU, cgaletV,
    cgaletW, cgaletX, cgaletY, cgaletZ, nil, nil, nil, nil];
end;

end.
