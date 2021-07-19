unit CgaGrafx;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TCgaGrafx = class
  private
    class var cgazero60:         array of Int16;
    class var cgaediggermask:    array of Int16;
    class var cgardigger1:       array of Int16;
    class var cgardigger1mask:   array of Int16;
    class var cgardigger2:       array of Int16;
    class var cgardigger2mask:   array of Int16;
    class var cgardigger3:       array of Int16;
    class var cgardigger3mask:   array of Int16;
    class var cgarxdigger1:      array of Int16;
    class var cgarxdigger1mask:  array of Int16;
    class var cgarxdigger2:      array of Int16;
    class var cgarxdigger2mask:  array of Int16;
    class var cgarxdigger3:      array of Int16;
    class var cgarxdigger3mask:  array of Int16;
    class var cgaudigger1:       array of Int16;
    class var cgaudigger1mask:   array of Int16;
    class var cgaudigger2:       array of Int16;
    class var cgaudigger2mask:   array of Int16;
    class var cgaudigger3:       array of Int16;
    class var cgaudigger3mask:   array of Int16;
    class var cgauxdigger1:      array of Int16;
    class var cgauxdigger1mask:  array of Int16;
    class var cgauxdigger2:      array of Int16;
    class var cgauxdigger2mask:  array of Int16;
    class var cgauxdigger3:      array of Int16;
    class var cgauxdigger3mask:  array of Int16;
    class var cgaldigger1:       array of Int16;
    class var cgaldigger1mask:   array of Int16;
    class var cgaldigger2:       array of Int16;
    class var cgaldigger2mask:   array of Int16;
    class var cgaldigger3:       array of Int16;
    class var cgaldigger3mask:   array of Int16;
    class var cgalxdigger1:      array of Int16;
    class var cgalxdigger1mask:  array of Int16;
    class var cgalxdigger2:      array of Int16;
    class var cgalxdigger2mask:  array of Int16;
    class var cgalxdigger3:      array of Int16;
    class var cgalxdigger3mask:  array of Int16;
    class var cgaddigger1:       array of Int16;
    class var cgaddigger1mask:   array of Int16;
    class var cgaddigger2:       array of Int16;
    class var cgaddigger2mask:   array of Int16;
    class var cgaddigger3:       array of Int16;
    class var cgaddigger3mask:   array of Int16;
    class var cgadxdigger1:      array of Int16;
    class var cgadxdigger1mask:  array of Int16;
    class var cgadxdigger2:      array of Int16;
    class var cgadxdigger2mask:  array of Int16;
    class var cgadxdigger3:      array of Int16;
    class var cgadxdigger3mask:  array of Int16;
    class var cgadiggerd:        array of Int16;
    class var cgadiggerdmask:    array of Int16;
    class var cgagrave1:         array of Int16;
    class var cgagrave1mask:     array of Int16;
    class var cgagrave2:         array of Int16;
    class var cgagrave2mask:     array of Int16;
    class var cgagrave3:         array of Int16;
    class var cgagrave3mask:     array of Int16;
    class var cgagrave4:         array of Int16;
    class var cgagrave4mask:     array of Int16;
    class var cgagrave5:         array of Int16;
    class var cgagrave5mask:     array of Int16;
    class var cgasbag:           array of Int16;
    class var cgasbagmask:       array of Int16;
    class var cgarbag:           array of Int16;
    class var cgarbagmask:       array of Int16;
    class var cgalbag:           array of Int16;
    class var cgalbagmask:       array of Int16;
    class var cgafbag:           array of Int16;
    class var cgafbagmask:       array of Int16;
    class var cgagold1:          array of Int16;
    class var cgagold1mask:      array of Int16;
    class var cgagold2:          array of Int16;
    class var cgagold2mask:      array of Int16;
    class var cgagold3:          array of Int16;
    class var cgagold3mask:      array of Int16;
    class var cganobbin1:        array of Int16;
    class var cganobbin1mask:    array of Int16;
    class var cganobbin2:        array of Int16;
    class var cganobbin2mask:    array of Int16;
    class var cganobbin3:        array of Int16;
    class var cganobbin3mask:    array of Int16;
    class var cganobbind:        array of Int16;
    class var cganobbindmask:    array of Int16;
    class var cgarhobbin1:       array of Int16;
    class var cgarhobbin1mask:   array of Int16;
    class var cgarhobbin2:       array of Int16;
    class var cgarhobbin2mask:   array of Int16;
    class var cgarhobbin3:       array of Int16;
    class var cgarhobbin3mask:   array of Int16;
    class var cgarhobbind:       array of Int16;
    class var cgarhobbindmask:   array of Int16;
    class var cgalhobbin1:       array of Int16;
    class var cgalhobbin1mask:   array of Int16;
    class var cgalhobbin2:       array of Int16;
    class var cgalhobbin2mask:   array of Int16;
    class var cgalhobbin3:       array of Int16;
    class var cgalhobbin3mask:   array of Int16;
    class var cgalhobbind:       array of Int16;
    class var cgalhobbindmask:   array of Int16;
    class var cgabonus:          array of Int16;
    class var cgafire1:          array of Int16;
    class var cgafire1mask:      array of Int16;
    class var cgafire2:          array of Int16;
    class var cgafire2mask:      array of Int16;
    class var cgafire3:          array of Int16;
    class var cgafire3mask:      array of Int16;
    class var cgaexp1:           array of Int16;
    class var cgaexp1mask:       array of Int16;
    class var cgaexp2:           array of Int16;
    class var cgaexp2mask:       array of Int16;
    class var cgaexp3:           array of Int16;
    class var cgaexp3mask:       array of Int16;
    class var cgaback1:          array of Int16;
    class var cgaback2:          array of Int16;
    class var cgaback3:          array of Int16;
    class var cgaback4:          array of Int16;
    class var cgaback5:          array of Int16;
    class var cgaback6:          array of Int16;
    class var cgaback7:          array of Int16;
    class var cgaback8:          array of Int16;
    class var cgarightblobmask:  array of Int16;
    class var cgatopblobmask:    array of Int16;
    class var cgaleftblobmask:   array of Int16;
    class var cgabottomblobmask: array of Int16;
    class var cgasquareblobmask: array of Int16;
    class var cgafurryblobmask:  array of Int16;
    class var cgaemerald:        array of Int16;
    class var cgaemeraldmask:    array of Int16;
    class var cgaliferight:      array of Int16;
    class var cgaliferightmask:  array of Int16;
    class var cgalifeleft:       array of Int16;
    class var cgalifeleftmask:   array of Int16;
    class var cgaelifemask:      array of Int16;
    class constructor Create;
  public
    class var cgatable:    array of array of Int16;
    class var cgatitledat: array of Int16;
  end;

implementation

class constructor TCgaGrafx.Create;
begin
  cgazero60 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  cgaediggermask := [$C0, 0, 0, $3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $C0, 0, 0, $3];
  cgardigger1 := [0, 0, 0, 0, 0, $F, 0, 0, 0, $3F, $C0, 0, 0, $30,
    $C0, 0, 0, $30, $C0, 0, 0, $30, $C0, 0, $2, $AA, $A1, $55, $A,
    $AA, $A5, $55, $2A, $AA, $A5, 0, $82, $AA, $A5, $55, $3C, $A8,
    $21, $55, $C3, $23, $C0, 0, $C3, $C, $30, 0, $3C, $C, $30, 0, 0, $3, $C0, 0];
  cgardigger1mask := [$FF, $F0, $FF, $FF, $FF, $C0, $3F, $FF, $FF,
    0, $F, $FF, $FF, 0, $F, $FF, $FF, 0, $F, $FF, $FC, 0, $C, 0, $F0,
    0, 0, 0, $C0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    $C, 0, 0, 0, $3, $FF, 0, $C0, $3, $FF, $C3, $F0, $F, $FF];
  cgardigger2 := [0, 0, 0, 0, 0, 0, 0, 0, 0, $F, 0, 0, 0, $3F, $C0,
    0, 0, $30, $C0, 0, 0, $30, $C0, $54, $2, $AA, $A5, $54, $A, $AA,
    $A5, $40, $2A, $AA, $A5, 0, $AA, $A8, $25, $40, $82, $A3, $C5,
    $54, $3C, $8C, $30, $54, $C3, $C, $30, 0, $C3, $3, $C0, 0, $3C, 0, 0, 0];
  cgardigger2mask := [$FF, $FF, $FF, $FF, $FF, $F0, $FF, $FF, $FF,
    $C0, $3F, $FF, $FF, 0, $F, $FF, $FF, 0, $F, $3, $FC, 0, 0, 0, $F0,
    0, 0, 0, $C0, 0, 0, $3, 0, 0, 0, $3F, 0, 0, 0, $3, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, $3, $3, 0, $30, $F, $FF, 0, $FC, $3F, $FF];
  cgardigger3 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $F, 0, 0,
    0, $3F, $C0, $50, 0, $30, $C1, $50, $2, $AA, $A5, $40, $A, $AA,
    $A5, 0, $2A, $AA, $A5, 0, $82, $AA, $A5, 0, $3C, $A8, $25, $40,
    $C3, $23, $C1, $50, $C3, $C, $30, $50, $3C, $C, $30, 0, 0, $3, $C0, 0];
  cgardigger3mask := [$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $F0, $FF, $FF, $FF, $C0, $3F, $F, $FF, 0, $C, $3, $FC, 0, 0, $3,
    $F0, 0, 0, $F, $C0, 0, 0, $3F, 0, 0, 0, $3F, 0, 0, 0, $3F, 0, 0,
    0, $F, 0, 0, 0, $3, 0, 0, 0, $3, 0, $C0, $3, $F, $C3, $F0, $F, $FF];
  cgarxdigger1 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, $F, 0, 0, 0, $3F, $C0, 0, $2, $AA, $A1, $55, $A, $AA, $A5, $55,
    $2A, $AA, $A5, 0, $82, $AA, $A5, $55, $3C, $A8, $21, $55, $C3,
    $23, $C0, 0, $C3, $C, $30, 0, $3C, $C, $30, 0, 0, $3, $C0, 0];
  cgarxdigger1mask := [$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $F0, $FF, $FF, $FF, $C0, $3F, $FF, $FC, 0,
    $C, 0, $F0, 0, 0, 0, $C0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, $C, 0, 0, 0, $3, $FF, 0, $C0, $3, $FF, $C3, $F0, $F, $FF];
  cgarxdigger2 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, $F, 0, 0, 0, $3F, $C0, $54, $2, $AA, $A5, $54, $A, $AA, $A5,
    $40, $2A, $AA, $A5, 0, $AA, $A8, $25, $40, $82, $A3, $C5, $54,
    $3C, $8C, $30, $54, $C3, $C, $30, 0, $C3, $3, $C0, 0, $3C, 0, 0, 0];
  cgarxdigger2mask := [$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $F0, $FF, $FF, $FF, $C0, $3F, $3, $FC, 0, 0,
    0, $F0, 0, 0, 0, $C0, 0, 0, $3, 0, 0, 0, $3F, 0, 0, 0, $3, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, $3, $3, 0, $30, $F, $FF, 0, $FC, $3F, $FF];
  cgarxdigger3 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, $F, 0, $50, 0, $3F, $C1, $50, $2, $AA, $A5, $40, $A, $AA, $A5,
    0, $2A, $AA, $A5, 0, $82, $AA, $A5, 0, $3C, $A8, $25, $40, $C3,
    $23, $C1, $50, $C3, $C, $30, $50, $3C, $C, $30, 0, 0, $3, $C0, 0];
  cgarxdigger3mask := [$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $F0, $FF, $F, $FF, $C0, $3C, $3, $FC, 0, 0,
    $3, $F0, 0, 0, $F, $C0, 0, 0, $3F, 0, 0, 0, $3F, 0, 0, 0, $3F,
    0, 0, 0, $F, 0, 0, 0, $3, 0, 0, 0, $3, 0, $C0, $3, $F, $C3, $F0, $F, $FF];
  cgaudigger1 := [0, $51, $40, 0, 0, $51, $40, 0, 0, $51, $40, 0,
    0, $51, $40, 0, 0, $15, 0, 0, $3C, $AA, $80, 0, $C3, $2A, $BF,
    $C0, $C3, $2A, $80, $F0, $3C, $AA, $80, $F0, 0, $AA, $BF, $C0,
    0, $AA, $80, 0, $F, $2A, $80, 0, $30, $CA, 0, 0, $30, $C8, 0, 0, $F, $20, 0, 0];
  cgaudigger1mask := [$FC, 0, $F, $FF, $FC, 0, $F, $FF, $FC, 0, $F,
    $FF, $FC, 0, $F, $FF, $C3, 0, $3F, $FF, 0, 0, 0, $3F, 0, 0, 0,
    $F, 0, 0, 0, $3, 0, 0, 0, $3, $C0, 0, 0, $F, $F0, 0, 0, $3F, $C0,
    0, $F, $FF, 0, 0, $3F, $FF, 0, 0, $FF, $FF, $C0, $3, $FF, $FF];
  cgaudigger2 := [1, $40, $50, 0, 1, $40, $50, 0, 1, $51, $50, 0,
    1, $55, $50, 0, 0, $55, $40, 0, $F, $2A, $80, 0, $30, $CA, $BF,
    0, $30, $CA, $83, $C0, $F, $2A, $83, $C0, 0, $2A, $BF, 0, 0, $AA,
    $80, 0, $3C, $AA, $80, 0, $C3, $2A, 0, 0, $C3, $28, 0, 0, $3C, $A0, 0, 0];
  cgaudigger2mask := [$F0, $C, $3, $FF, $F0, $C, $3, $FF, $F0, 0,
    $3, $FF, $F0, 0, $3, $FF, $F0, 0, $F, $FF, $C0, 0, 0, $FF, 0, 0,
    0, $3F, 0, 0, 0, $F, $C0, 0, 0, $F, $F0, 0, 0, $3F, $C0, 0, 0,
    $FF, 0, 0, $F, $FF, 0, 0, $3F, $FF, 0, $3, $FF, $FF, 0, $F, $FF, $FF];
  cgaudigger3 := [0, 0, 0, 0, $5, 0, $14, 0, $5, $40, $54, 0, 1,
    $55, $50, 0, 0, $55, $40, 0, $3C, $AA, $80, 0, $C3, $2A, $BC, 0,
    $C3, $2A, $8F, 0, $3C, $AA, $8F, 0, 0, $AA, $BC, 0, 0, $AA, $80,
    0, $F, $2A, $80, 0, $30, $CA, 0, 0, $30, $C8, 0, 0, $F, $20, 0, 0];
  cgaudigger3mask := [$F0, $FF, $C3, $FF, $C0, $3F, 0, $FF, $C0, 0,
    0, $FF, $F0, 0, $3, $FF, $C0, 0, $F, $FF, 0, 0, $3, $FF, 0, 0,
    0, $FF, 0, 0, 0, $3F, 0, 0, 0, $3F, $C0, 0, 0, $FF, $F0, 0, $3,
    $FF, $C0, 0, $F, $FF, 0, 0, $3F, $FF, 0, 0, $FF, $FF, $C0, $3, $FF, $FF];
  cgauxdigger1 := [0, $51, $40, 0, 0, $51, $40, 0, 0, $51, $40, 0,
    0, $51, $40, 0, 0, $15, 0, 0, $3C, $AA, $80, 0, $C3, $2A, $B0,
    0, $C3, $2A, $BC, 0, $3C, $AA, $BC, 0, 0, $AA, $B0, 0, 0, $AA,
    $80, 0, $F, $2A, $80, 0, $30, $CA, 0, 0, $30, $C8, 0, 0, $F, $20, 0, 0];
  cgauxdigger1mask := [$FC, 0, $F, $FF, $FC, 0, $F, $FF, $FC, 0,
    $F, $FF, $FC, 0, $F, $FF, $C3, 0, $3F, $FF, 0, 0, $F, $FF, 0, 0,
    $3, $FF, 0, 0, 0, $FF, 0, 0, 0, $FF, $C0, 0, $3, $FF, $F0, 0, $F,
    $FF, $C0, 0, $F, $FF, 0, 0, $3F, $FF, 0, 0, $FF, $FF, $C0, $3, $FF, $FF];
  cgauxdigger2 := [1, $40, $50, 0, 1, $40, $50, 0, 1, $51, $50, 0,
    1, $55, $50, 0, 0, $55, $40, 0, $F, $2A, $80, 0, $30, $CA, $B0,
    0, $30, $CA, $BC, 0, $F, $2A, $BC, 0, 0, $2A, $B0, 0, 0, $AA, $80,
    0, $3C, $AA, $80, 0, $C3, $2A, 0, 0, $C3, $28, 0, 0, $3C, $A0, 0, 0];
  cgauxdigger2mask := [$F0, $C, $3, $FF, $F0, $C, $3, $FF, $F0, 0,
    $3, $FF, $F0, 0, $3, $FF, $F0, 0, $F, $FF, $C0, 0, $F, $FF, 0,
    0, $3, $FF, 0, 0, 0, $FF, $C0, 0, 0, $FF, $F0, 0, $3, $FF, $C0,
    0, $F, $FF, 0, 0, $F, $FF, 0, 0, $3F, $FF, 0, 0, $FF, $FF, 0, $3, $FF, $FF];
  cgauxdigger3 := [0, 0, 0, 0, $5, 0, $14, 0, $5, $40, $54, 0, 1,
    $55, $50, 0, 0, $55, $40, 0, $3C, $AA, $80, 0, $C3, $2A, $B0, 0,
    $C3, $2A, $BC, 0, $3C, $AA, $BC, 0, 0, $AA, $B0, 0, 0, $AA, $80,
    0, $F, $2A, $80, 0, $30, $CA, 0, 0, $30, $C8, 0, 0, $F, $20, 0, 0];
  cgauxdigger3mask := [$F0, $FF, $C3, $FF, $C0, $3F, 0, $FF, $C0,
    0, 0, $FF, $F0, 0, $3, $FF, $C0, 0, $F, $FF, 0, 0, $F, $FF, 0,
    0, $3, $FF, 0, 0, 0, $FF, 0, 0, 0, $FF, $C0, 0, $3, $FF, $F0, 0,
    $F, $FF, $C0, 0, $F, $FF, 0, 0, $3F, $FF, 0, 0, $FF, $FF, $C0, $3, $FF, $FF];
  cgaldigger1 := [0, 0, 0, 0, 0, 0, $F0, 0, 0, $3, $FC, 0, 0, $3,
    $C, 0, 0, $3, $C, 0, 0, $3, $C, 0, $55, $4A, $AA, $80, $55, $5A,
    $AA, $A0, 0, $5A, $AA, $A8, $55, $5A, $AA, $82, $55, $48, $2A,
    $3C, 0, $3, $C8, $C3, 0, $C, $30, $C3, 0, $C, $30, $3C, 0, $3, $C0, 0];
  cgaldigger1mask := [$FF, $FF, $F, $FF, $FF, $FC, $3, $FF, $FF,
    $F0, 0, $FF, $FF, $F0, 0, $FF, $FF, $F0, 0, $FF, 0, $30, 0, $3F,
    0, 0, 0, $F, 0, 0, 0, $3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    $30, 0, 0, $FF, $C0, 0, 0, $FF, $C0, $3, 0, $FF, $F0, $F, $C3];
  cgaldigger2 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $F0, 0, 0, $3, $FC,
    0, 0, $3, $C, 0, $15, $43, $C, 0, $15, $5A, $AA, $80, 1, $5A, $AA,
    $A0, 0, $5A, $AA, $A8, 1, $58, $2A, $AA, $15, $53, $C2, $82, $15,
    $4C, $30, $3C, 0, $C, $30, $C3, 0, $3, $C0, $C3, 0, 0, 0, $3C];
  cgaldigger2mask := [$FF, $FF, $FF, $FF, $FF, $FF, $F, $FF, $FF,
    $FC, $3, $FF, $FF, $F0, 0, $FF, $C0, $30, 0, $FF, 0, 0, 0, $3F,
    0, 0, 0, $F, $C0, 0, 0, $3, $FC, 0, 0, 0, $C0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, $C0, 0, 0, 0, $FF, $F0, $C, 0, $FF, $FC, $3F, 0];
  cgaldigger3 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $F0, 0,
    $5, $3, $FC, 0, $5, $43, $C, 0, 1, $5A, $AA, $80, 0, $5A, $AA,
    $A0, 0, $5A, $AA, $A8, 0, $5A, $AA, $82, 1, $58, $2A, $3C, $5,
    $43, $C8, $C3, $5, $C, $30, $C3, 0, $C, $30, $3C, 0, $3, $C0, 0];
  cgaldigger3mask := [$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $F, $FF, $F0, $FC, $3, $FF, $C0, $30, 0, $FF, $C0, 0, 0, $3F,
    $F0, 0, 0, $F, $FC, 0, 0, $3, $FC, 0, 0, 0, $FC, 0, 0, 0, $F0,
    0, 0, 0, $C0, 0, 0, 0, $C0, 0, 0, 0, $F0, $C0, $3, 0, $FF, $F0, $F, $C3];
  cgalxdigger1 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, $F0, 0, 0, $3, $FC, 0, $55, $4A, $AA, $80, $55, $5A, $AA,
    $A0, 0, $5A, $AA, $A8, $55, $5A, $AA, $82, $55, $48, $2A, $3C,
    0, $3, $C8, $C3, 0, $C, $30, $C3, 0, $C, $30, $3C, 0, $3, $C0, 0];
  cgalxdigger1mask := [$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $F, $FF, $FF, $FC, $3, $FF, 0, $30, 0,
    $3F, 0, 0, 0, $F, 0, 0, 0, $3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, $30, 0, 0, $FF, $C0, 0, 0, $FF, $C0, $3, 0, $FF, $F0, $F, $C3];
  cgalxdigger2 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, $F0, 0, $15, $43, $FC, 0, $15, $5A, $AA, $80, 1, $5A, $AA,
    $A0, 0, $5A, $AA, $A8, 1, $58, $2A, $AA, $15, $53, $C2, $82, $15,
    $4C, $30, $3C, 0, $C, $30, $C3, 0, $3, $C0, $C3, 0, 0, 0, $3C];
  cgalxdigger2mask := [$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $F, $FF, $C0, $3C, $3, $FF, 0, 0, 0, $3F,
    0, 0, 0, $F, $C0, 0, 0, $3, $FC, 0, 0, 0, $C0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, $C0, 0, 0, 0, $FF, $F0, $C, 0, $FF, $FC, $3F, 0];
  cgalxdigger3 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    $5, 0, $F0, 0, $5, $43, $FC, 0, 1, $5A, $AA, $80, 0, $5A, $AA,
    $A0, 0, $5A, $AA, $A8, 0, $5A, $AA, $82, 1, $58, $2A, $3C, $5,
    $43, $C8, $C3, $5, $C, $30, $C3, 0, $C, $30, $3C, 0, $3, $C0, 0];
  cgalxdigger3mask := [$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $F0, $FF, $F, $FF, $C0, $3C, $3, $FF, $C0, 0, 0,
    $3F, $F0, 0, 0, $F, $FC, 0, 0, $3, $FC, 0, 0, 0, $FC, 0, 0, 0,
    $F0, 0, 0, 0, $C0, 0, 0, 0, $C0, 0, 0, 0, $F0, $C0, $3, 0, $FF, $F0, $F, $C3];
  cgaddigger1 := [0, 0, $8, $F0, 0, 0, $23, $C, 0, 0, $A3, $C, 0,
    $2, $A8, $F0, 0, $2, $AA, 0, $3, $FE, $AA, 0, $F, $2, $AA, $3C,
    $F, $2, $A8, $C3, $3, $FE, $A8, $C3, 0, $2, $AA, $3C, 0, 0, $54,
    0, 0, 1, $55, 0, 0, 1, $45, 0, 0, 1, $45, 0, 0, 1, $45, 0];
  cgaddigger1mask := [$FF, $FF, $C0, $3, $FF, $FF, 0, 0, $FF, $FC,
    0, 0, $FF, $F0, 0, $3, $FC, 0, 0, $F, $F0, 0, 0, $3, $C0, 0, 0,
    0, $C0, 0, 0, 0, $F0, 0, 0, 0, $FC, 0, 0, 0, $FF, $FC, 0, $C3,
    $FF, $F0, 0, $3F, $FF, $F0, 0, $3F, $FF, $F0, 0, $3F, $FF, $F0, 0, $3F];
  cgaddigger2 := [0, 0, $A, $3C, 0, 0, $28, $C3, 0, 0, $A8, $C3, 0,
    $2, $AA, $3C, 0, $2, $AA, 0, 0, $FE, $A8, 0, $3, $C2, $A8, $F0,
    $3, $C2, $A3, $C, 0, $FE, $A3, $C, 0, $2, $A8, $F0, 0, 1, $54,
    0, 0, $5, $45, $40, 0, $5, 1, $40, 0, $5, 1, $40, 0, $5, 1, $40];
  cgaddigger2mask := [$FF, $FF, $C0, 0, $FF, $FF, 0, 0, $FF, $FC,
    0, 0, $FF, $F0, 0, 0, $FF, 0, 0, $3, $FC, 0, 0, $F, $F0, 0, 0,
    $3, $F0, 0, 0, 0, $FC, 0, 0, 0, $FF, 0, 0, $3, $FF, $F0, 0, $F,
    $FF, $C0, 0, $F, $FF, $C0, $30, $F, $FF, $C0, $30, $F, $FF, $C0, $30, $F];
  cgaddigger3 := [0, 0, $8, $F0, 0, 0, $23, $C, 0, 0, $A3, $C, 0,
    $2, $A8, $F0, 0, $2, $AA, 0, 0, $3E, $AA, 0, 0, $F2, $AA, $3C,
    0, $F2, $A8, $C3, 0, $3E, $A8, $C3, 0, $2, $AA, $3C, 0, 1, $55,
    0, 0, $5, $55, $40, 0, $15, 1, $50, 0, $14, 0, $50, 0, 0, 0, 0];
  cgaddigger3mask := [$FF, $FF, $C0, $3, $FF, $FF, 0, 0, $FF, $FC,
    0, 0, $FF, $F0, 0, $3, $FF, $C0, 0, $F, $FF, 0, 0, $3, $FC, 0,
    0, 0, $FC, 0, 0, 0, $FF, 0, 0, 0, $FF, $C0, 0, 0, $FF, $F0, 0,
    $3, $FF, $C0, 0, $F, $FF, 0, 0, $3, $FF, 0, $FC, $3, $FF, $C3, $FF, $F];
  cgadxdigger1 := [0, 0, $8, $F0, 0, 0, $23, $C, 0, 0, $A3, $C, 0,
    $2, $A8, $F0, 0, $2, $AA, 0, 0, $E, $AA, 0, 0, $3E, $AA, $3C, 0,
    $3E, $A8, $C3, 0, $E, $A8, $C3, 0, $2, $AA, $3C, 0, 0, $54, 0,
    0, 1, $55, 0, 0, 1, $45, 0, 0, 1, $45, 0, 0, 1, $45, 0];
  cgadxdigger1mask := [$FF, $FF, $C0, $3, $FF, $FF, 0, 0, $FF, $FC,
    0, 0, $FF, $F0, 0, $3, $FF, $F0, 0, $F, $FF, $C0, 0, $3, $FF, 0,
    0, 0, $FF, 0, 0, 0, $FF, $C0, 0, 0, $FF, $F0, 0, 0, $FF, $FC, 0,
    $C3, $FF, $F0, 0, $3F, $FF, $F0, 0, $3F, $FF, $F0, 0, $3F, $FF, $F0, 0, $3F];
  cgadxdigger2 := [0, 0, $A, $3C, 0, 0, $28, $C3, 0, 0, $A8, $C3,
    0, $2, $AA, $3C, 0, $2, $AA, 0, 0, $E, $A8, 0, 0, $3E, $A8, $F0,
    0, $3E, $A3, $C, 0, $E, $A3, $C, 0, $2, $A8, $F0, 0, 1, $54, 0,
    0, $5, $45, $40, 0, $5, 1, $40, 0, $5, 1, $40, 0, $5, 1, $40];
  cgadxdigger2mask := [$FF, $FF, $C0, 0, $FF, $FF, 0, 0, $FF, $FC,
    0, 0, $FF, $F0, 0, 0, $FF, $F0, 0, $3, $FF, $C0, 0, $F, $FF, 0,
    0, $3, $FF, 0, 0, 0, $FF, $C0, 0, 0, $FF, $F0, 0, $3, $FF, $F0,
    0, $F, $FF, $C0, 0, $F, $FF, $C0, $30, $F, $FF, $C0, $30, $F, $FF, $C0, $30, $F];
  cgadxdigger3 := [0, 0, $8, $F0, 0, 0, $23, $C, 0, 0, $A3, $C, 0,
    $2, $A8, $F0, 0, $2, $AA, 0, 0, $E, $AA, 0, 0, $3E, $AA, $3C, 0,
    $3E, $A8, $C3, 0, $E, $A8, $C3, 0, $2, $AA, $3C, 0, 1, $55, 0,
    0, $5, $55, $40, 0, $15, 1, $50, 0, $14, 0, $50, 0, 0, 0, 0];
  cgadxdigger3mask := [$FF, $FF, $C0, $3, $FF, $FF, 0, 0, $FF, $FC,
    0, 0, $FF, $F0, 0, $3, $FF, $F0, 0, $F, $FF, $C0, 0, $3, $FF, 0,
    0, 0, $FF, 0, 0, 0, $FF, $C0, 0, 0, $FF, $F0, 0, 0, $FF, $F0, 0,
    $3, $FF, $C0, 0, $F, $FF, 0, 0, $3, $FF, 0, $FC, $3, $FF, $C3, $FF, $F];
  cgadiggerd := [0, 0, 0, 0, 0, $3, $C0, $3C, 0, $F, $30, $FF, 0,
    $F, $F0, $F3, $5, $43, $CA, $3C, $55, $58, $2A, $82, $50, $5A,
    $AA, $A8, $5, $5A, $AA, $A0, $55, $4A, $AA, $80, $50, $3, $F, 0,
    0, 0, $CC, 0, 0, $3, $F, 0, 0, 0, $FF, 0, 0, 0, $3C, 0, 0, 0, 0, 0];
  cgadiggerdmask := [$FF, $FC, $3F, $C3, $FF, $F0, $F, 0, $FF, $C0,
    0, 0, $F0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    $3, 0, 0, 0, $F, 0, $30, 0, $3F, $F, $F0, 0, $3F, $FF, $F0, 0,
    $3F, $FF, $FC, 0, $3F, $FF, $FF, 0, $FF, $FF, $FF, $C3, $FF];
  cgagrave1 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, $5, $40, 0, 0, $5F, $D4, 0, $5, $FF, $FD, $40, $7, $FF,
    $FF, $40, 0, 0, 0, 0];
  cgagrave1mask := [$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $F0, $3F, $FF, $FF, 0, $3, $FF, $F0, 0, 0, $3F, $C0,
    0, 0, $F, $C0, 0, 0, $F, 0, 0, 0, $3];
  cgagrave2 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $5, $40, 0, 0,
    $5F, $D4, 0, $5, $FF, $FD, $40, $7, $FF, $FF, $40, $10, $F, $FF,
    $D0, $13, $CC, $FF, $D0, 0, 0, 0, 0];
  cgagrave2mask := [$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $F0, $3F, $FF, $FF, 0, $3, $FF,
    $F0, 0, 0, $3F, $C0, 0, 0, $F, $C0, 0, 0, $F, 0, 0, 0, $3, 0, 0, 0, $3, 0, 0, 0, $3];
  cgagrave3 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, $5, $40, 0, 0, $5F, $D4, 0, $5, $FF, $FD,
    $40, $7, $FF, $FF, $40, $10, $F, $FF, $D0, $13, $CC, $FF, $D0,
    $10, $C, $C0, $10, $10, $FC, $CF, $10, 0, 0, 0, 0];
  cgagrave3mask := [$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $F0,
    $3F, $FF, $FF, 0, $3, $FF, $F0, 0, 0, $3F, $C0, 0, 0, $F, $C0,
    0, 0, $F, 0, 0, 0, $3, 0, 0, 0, $3, 0, 0, 0, $3, 0, 0, 0, $3, 0, 0, 0, $3];
  cgagrave4 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $5, $40, 0,
    0, $5F, $D4, 0, $5, $FF, $FD, $40, $7, $FF, $FF, $40, $10, $F,
    $FF, $D0, $13, $CC, $FF, $D0, $10, $C, $C0, $10, $10, $FC, $CF,
    $10, $13, $3C, $C0, $10, $13, $CC, $CF, $D0, $1F, $FC, $CF, $D0, 0, 0, 0, 0];
  cgagrave4mask := [$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $F0, $3F, $FF, $FF, 0, $3, $FF, $F0, 0, 0, $3F, $C0, 0, 0, $F,
    $C0, 0, 0, $F, 0, 0, 0, $3, 0, 0, 0, $3, 0, 0, 0, $3, 0, 0, 0,
    $3, 0, 0, 0, $3, 0, 0, 0, $3, 0, 0, 0, $3, 0, 0, 0, $3];
  cgagrave5 := [0, 0, 0, 0, 0, $5, $40, 0, 0, $5F, $D4, 0, $5, $FF,
    $FD, $40, $7, $FF, $FF, $40, $10, $F, $FF, $D0, $13, $CC, $FF,
    $D0, $10, $C, $C0, $10, $10, $FC, $CF, $10, $13, $3C, $C0, $10,
    $13, $CC, $CF, $D0, $1F, $FC, $CF, $D0, $1F, $FF, $CF, $D0, $1F,
    $FF, $FF, $D0, $1F, $FF, $FF, $D0];
  cgagrave5mask := [$FF, $F0, $3F, $FF, $FF, 0, $3, $FF, $F0, 0, 0,
    $3F, $C0, 0, 0, $F, $C0, 0, 0, $F, 0, 0, 0, $3, 0, 0, 0, $3, 0,
    0, 0, $3, 0, 0, 0, $3, 0, 0, 0, $3, 0, 0, 0, $3, 0, 0, 0, $3, 0,
    0, 0, $3, 0, 0, 0, $3, 0, 0, 0, $3];
  cgasbag  := [0, 0, 0, 0, 0, $F, $F0, 0, 0, $3, $C0, 0, 0, $F, $F0,
    0, 0, $FF, $FF, 0, $3, $FC, $3F, $C0, $F, 0, 0, $F0, $3C, $3C,
    $3F, $FC, $3C, 0, 0, $3C, $3F, $FC, $3C, $3C, $3C, $3C, $3C, $3C,
    $3F, 0, 0, $FC, $F, $FC, $3F, $F0, 0, $FF, $FF, 0, 0, 0, 0, 0];
  cgasbagmask := [$FF, $C0, $3, $FF, $FF, $C0, $3, $FF, $FF, $F0,
    $F, $FF, $FF, 0, 0, $FF, $FC, 0, 0, $3F, $F0, 0, 0, $F, $C0, 0,
    0, $3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, $C0, 0, 0, $3, $F0, 0, 0, $F, $FF, 0, 0, $FF];
  cgarbag  := [0, 0, 0, 0, 0, $3, $FC, 0, 0, 0, $F0, 0, 0, $F, $FC,
    0, 0, $3F, $FF, 0, 0, $FF, $F, $C0, $3, $C0, 0, $30, $F, $F, $F,
    $FC, $F, 0, 0, $C, $F, $FF, $F, $C, $F, $F, $F, $C, $3, $C0, 0,
    $30, 0, $FF, $F, $C0, 0, $F, $FC, 0, 0, 0, 0, 0];
  cgarbagmask := [$FF, $FC, $3, $FF, $FF, $F0, 0, $FF, $FF, $F0,
    $3, $FF, $FF, $C0, 0, $FF, $FF, 0, 0, $3F, $FC, 0, 0, $F, $F0,
    0, 0, $3, $C0, 0, 0, 0, $C0, 0, 0, 0, $C0, 0, 0, 0, $C0, 0, 0,
    0, $F0, 0, 0, $3, $FC, 0, 0, $F, $FF, 0, 0, $3F, $FF, $F0, $3, $FF];
  cgalbag  := [0, 0, 0, 0, 0, $3F, $C0, 0, 0, $F, 0, 0, 0, $3F, $C0,
    0, 0, $FF, $FC, 0, $3, $F0, $FF, 0, $C, 0, $3, $C0, $30, $F0, $FF,
    $F0, $30, 0, 0, $F0, $3F, $F0, $F0, $F0, $30, $F0, $F0, $F0, $3C,
    0, $3, $C0, $F, $F0, $FF, 0, 0, $FF, $F0, 0, 0, 0, 0, 0];
  cgalbagmask := [$FF, $C0, $3F, $FF, $FF, 0, $F, $FF, $FF, $C0,
    $3F, $FF, $FF, 0, $3, $FF, $FC, 0, 0, $FF, $F0, 0, 0, $3F, $C0,
    0, 0, $F, 0, 0, 0, $3, 0, 0, 0, $3, 0, 0, 0, $3, 0, 0, 0, $3, 0,
    0, 0, $F, $C0, 0, 0, $3F, $F0, 0, 0, $FF, $FF, 0, $F, $FF];
  cgafbag  := [0, $C, $30, 0, 0, $3, $C0, 0, 0, $3, $C0, 0, 0, $F,
    $F0, 0, 0, $3F, $FC, 0, 0, $FC, $3F, 0, $3, 0, 0, $C0, $C, $3C,
    $3F, $F0, $C, 0, 0, $30, $F, $FC, $3C, $30, $C, $3C, $3C, $30,
    $3, 0, 0, $C0, 0, $FC, $3F, 0, 0, $3F, $FC, 0, 0, $3, $C0, 0];
  cgafbagmask := [$FF, $C0, $3, $FF, $FF, $F0, $F, $FF, $FF, $F0,
    $F, $FF, $FF, $C0, $3, $FF, $FF, 0, 0, $FF, $FC, 0, 0, $3F, $F0,
    0, 0, $F, $C0, 0, 0, $3, $C0, 0, 0, $3, $C0, 0, 0, $3, $C0, 0,
    0, $3, $F0, 0, 0, $F, $FC, 0, 0, $3F, $FF, 0, 0, $FF, $FF, $C0, $3, $FF];
  cgagold1 := [0, 0, 0, 0, 0, $3, $C0, 0, 0, $F, $F0, 0, 0, $F3,
    $F0, 0, $3, $FC, $CC, 0, $F, $FF, $3F, 0, $F, $FF, $3F, $C0, $3,
    $FC, $FF, $C0, 0, $F0, $FF, 0, $3, $F, 0, 0, $F, $F3, $3C, 0, $3F,
    $FC, $FF, 0, $3F, $FC, $FF, $C0, $F, $F3, $FF, $C0, $3, $CC, $FF, 0];
  cgagold1mask := [$FF, $FC, $3F, $FF, $FF, $F0, $F, $FF, $FF, 0,
    $3, $FF, $FC, 0, $3, $FF, $F0, 0, 0, $FF, $C0, 0, 0, $3F, $C0,
    0, 0, $F, $F0, 0, 0, $F, $FC, 0, 0, $3F, $F0, 0, 0, $FF, $C0, 0,
    0, $FF, $C0, 0, 0, $3F, 0, 0, 0, $F, $C0, 0, 0, $F, $F0, 0, 0, $3F];
  cgagold2 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $F, 0, 0,
    $F0, $3F, $C0, $3, $FC, $FF, $F0, $F, $FF, $3F, $F0, $F, $FF, $F,
    $C0, $3, $FC, $F3, 0, 0, $F3, $FC, 0, $F, $F, $F3, 0, $3F, $C3,
    $CF, $C0, $3F, $F0, $3F, $F0, $F, $F3, $3F, $F0, $3, $CF, $CF, $C0];
  cgagold2mask := [$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $F0, $FF, $FF, $F, $C0, $3F, $FC, $3, 0, $F, $F0, 0, 0, $3, $C0,
    0, 0, $3, $C0, 0, 0, $F, $F0, 0, 0, $3F, $F0, 0, 0, $FF, $C0, 0,
    0, $3F, $C0, 0, 0, $F, 0, 0, 0, $3, $C0, 0, 0, $3, $F0, 0, 0, $F];
  cgagold3 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, $3, $C0, $3, $C0, $F, $F3, $CF, $F0, $3F,
    $FC, $F3, $FC, $3F, $FC, $FC, $FC, $F, $F0, $FC, 0, $3, $C3, $F3,
    $F0, $3C, $30, $F, $FC, $3F, $F3, $CF, $FC, $F, $CF, $F3, $F0];
  cgagold3mask := [$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FC, $3F, $FC,
    $3F, $F0, $C, 0, $F, $C0, 0, 0, $3, 0, 0, 0, 0, 0, 0, 0, 0, $C0,
    0, 0, $3, $C0, 0, 0, $3, 0, 0, 0, 0, 0, 0, 0, 0, $C0, 0, 0, $3];
  cganobbin1 := [0, 0, 0, 0, $3, $F0, $F, $C0, $F, $FD, $7F, $F0,
    $C, $3D, $70, $F0, $C, $3D, $70, $F0, $3, $F5, $5F, $C0, 0, $55,
    $55, 0, 0, $15, $54, 0, $2, $84, $12, $80, $A, $5, $50, $A0, $A,
    1, $40, $A0, $A, 0, $2, $A8, $A, 0, $A, $AA, $2A, $80, 0, 0, $AA, $A0, 0, 0];
  cganobbin1mask := [$FC, $F, $F0, $3F, $F0, 0, 0, $F, $C0, 0, 0,
    $3, $C0, 0, 0, $3, $C0, 0, 0, $3, $F0, 0, 0, $F, $FC, 0, 0, $3F,
    $FC, 0, 0, $3F, $F0, 0, 0, $F, $C0, 0, 0, $3, $C0, $30, $C, $3,
    $C0, $3C, $30, 0, $C0, $3F, $C0, 0, 0, $F, $F0, 0, 0, $3, $FF, $FF];
  cganobbin2 := [0, 0, 0, 0, $3, $F0, $F, $C0, $F, $FD, $7F, $F0,
    $F, $D, $7C, $30, $F, $D, $7C, $30, $3, $F5, $5F, $C0, 0, $55,
    $55, 0, 0, $14, $14, 0, $2, $84, $12, $80, $A, $5, $50, $A0, $A,
    1, $40, $A0, $A, 0, 0, $A0, $2A, $80, $2, $A8, $AA, $A0, $A, $AA, 0, 0, 0, 0];
  cganobbin2mask := [$FC, $F, $F0, $3F, $F0, 0, 0, $F, $C0, 0, 0,
    $3, $C0, 0, 0, $3, $C0, 0, 0, $3, $F0, 0, 0, $F, $FC, 0, 0, $3F,
    $FC, 0, 0, $3F, $F0, 0, 0, $F, $C0, 0, 0, $3, $C0, $30, $C, $3,
    $C0, $3C, $3C, $3, 0, $3F, $F0, 0, 0, $F, $C0, 0, 0, $F, $F0, 0];
  cganobbin3 := [0, 0, 0, 0, $3, $F0, $F, $C0, $F, $D, $7C, $30,
    $F, $D, $7C, $30, $F, $FD, $7F, $F0, $3, $F5, $5F, $C0, 0, $54,
    $15, 0, 0, $14, $14, 0, $2, $84, $12, $80, $A, $4, $10, $A0, $A,
    1, $40, $A0, $2A, $80, 0, $A0, $AA, $A0, 0, $A0, 0, 0, $2, $A8, 0, 0, $A, $AA];
  cganobbin3mask := [$FC, $F, $F0, $3F, $F0, 0, 0, $F, $C0, 0, 0,
    $3, $C0, 0, 0, $3, $C0, 0, 0, $3, $F0, 0, 0, $F, $FC, 0, 0, $3F,
    $FC, 0, 0, $3F, $F0, 0, 0, $F, $C0, 0, 0, $3, $C0, $30, $C, $3,
    0, $C, $3C, $3, 0, $3, $FC, $3, 0, $F, $F0, 0, $FF, $FF, $C0, 0];
  cganobbind := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $3, $F0, $F,
    $C0, $C, $3D, $7C, $30, $C, $3D, $7C, $30, $F, $FD, $7F, $F0, $3,
    $F5, $5F, $C0, 0, $54, $15, 0, 0, $14, $14, 0, $2, $84, $12, $80,
    $A, $4, $10, $A0, $2A, $81, $42, $A8, $AA, $A0, $A, $AA, 0, 0, 0, 0];
  cganobbindmask := [$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FC,
    $F, $F0, $3F, $F0, 0, 0, $F, $C0, 0, 0, $3, $C0, 0, 0, $3, $C0,
    0, 0, $3, $F0, 0, 0, $F, $FC, 0, 0, $3F, $FC, 0, 0, $3F, $F0, 0,
    0, $F, $C0, 0, 0, $3, 0, 0, 0, 0, 0, 0, 0, 0, 0, $F, $F0, 0];
  cgarhobbin1 := [0, $4F, $C4, 0, 1, $3F, $F1, 0, $5, $30, $F1, 0,
    $15, $30, $F1, $40, $15, $4F, $C5, $50, $15, $50, $15, $54, $5,
    $55, $6A, $A0, 1, $55, $80, 0, 0, $55, $6A, $A0, 0, $15, $55, $40,
    0, $2, $80, 0, 0, $2, $80, 0, 0, $2, $80, 0, 0, $A, $A0, 0, 0, $2A, $A8, 0];
  cgarhobbin1mask := [$FC, 0, 0, $FF, $F0, 0, 0, $3F, $C0, 0, 0,
    $3F, 0, 0, 0, $F, 0, 0, 0, $3, 0, 0, 0, 0, $C0, 0, 0, $3, $F0,
    0, 0, $F, $FC, 0, 0, $3, $FF, 0, 0, $F, $FF, $C0, 0, $3F, $FF,
    $F0, $F, $FF, $FF, $F0, $F, $FF, $FF, $C0, $3, $FF, $FF, 0, 0, $FF];
  cgarhobbin2 := [0, $4F, $C4, 0, 1, $3F, $F1, 0, $5, $3C, $31, $40,
    $15, $3C, $31, $50, $15, $4F, $C5, $54, $15, $50, $15, $A8, $5,
    $55, $6A, 0, 1, $55, $80, 0, 0, $55, $68, 0, 0, $15, $56, $A0,
    0, $2, $81, $50, 0, $2, $80, 0, 0, $A, $A0, 0, 0, $2A, $A8, 0, 0, 0, 0, 0];
  cgarhobbin2mask := [$FC, 0, 0, $FF, $F0, 0, 0, $3F, $C0, 0, 0,
    $3F, 0, 0, 0, $F, 0, 0, 0, $3, 0, 0, 0, $3, $C0, 0, 0, $F, $F0,
    0, 0, $FF, $FC, 0, 0, $F, $FF, 0, 0, $3, $FF, $C0, 0, $F, $FF,
    $F0, $C, $3F, $FF, $C0, $3, $FF, $FF, 0, 0, $FF, $FF, $C0, $3, $FF];
  cgarhobbin3 := [0, $4F, $C4, 0, 1, $3C, $31, 0, $5, $3C, $31, $40,
    $15, $3F, $F1, $50, $15, $4F, $C5, $68, $15, $50, $16, $80, $5,
    $55, $68, 0, 1, $55, $80, 0, 0, $55, $68, 0, 0, $15, $56, $80,
    0, $2, $81, $60, 0, $A, $A0, 0, 0, $2A, $A8, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  cgarhobbin3mask := [$FC, 0, 0, $FF, $F0, 0, 0, $3F, $C0, 0, 0,
    $F, 0, 0, 0, $3, 0, 0, 0, 0, 0, 0, 0, $3, $C0, 0, 0, $3F, $F0,
    0, $3, $FF, $FC, 0, 0, $3F, $FF, 0, 0, $3, $FF, $C0, 0, $3, $FF,
    $C0, 0, $F, $FF, 0, 0, $FF, $FF, $C0, $3, $FF, $FF, $FF, $FF, $FF];
  cgarhobbind := [0, 0, 0, 0, 0, 0, 0, 0, 0, $4F, $C4, 0, 1, $3C,
    $31, 0, $5, $3C, $31, $40, $15, $3F, $F1, $50, $15, $4F, $C5, $68,
    $15, $50, $16, $80, $5, $55, $68, 0, 1, $55, $A8, 0, 0, $55, $5A,
    $80, 0, $15, $55, $A8, 0, $A, $A0, 0, 0, $2A, $A8, 0, 0, 0, 0, 0];
  cgarhobbindmask := [$FF, $FF, $FF, $FF, $FF, 0, $3, $FF, $FC, 0,
    0, $FF, $F0, 0, 0, $3F, $C0, 0, 0, $F, 0, 0, 0, $3, 0, 0, 0, 0,
    0, 0, 0, $3, $C0, 0, 0, $3F, $F0, 0, $3, $FF, $FC, 0, 0, $3F, $FF,
    0, 0, $3, $FF, $C0, 0, $3, $FF, 0, 0, $FF, $FF, $C0, $3, $FF];
  cgalhobbin1 := [0, $13, $F1, 0, 0, $4F, $FC, $40, 0, $4F, $C, $50,
    1, $4F, $C, $54, $5, $53, $F1, $54, $15, $54, $5, $54, $A, $A9,
    $55, $50, 0, $2, $55, $40, $A, $A9, $55, 0, 1, $55, $54, 0, 0,
    $2, $80, 0, 0, $2, $80, 0, 0, $2, $80, 0, 0, $A, $A0, 0, 0, $2A, $A8, 0];
  cgalhobbin1mask := [$FF, 0, 0, $3F, $FC, 0, 0, $F, $FC, 0, 0, $3,
    $F0, 0, 0, 0, $C0, 0, 0, 0, 0, 0, 0, 0, $C0, 0, 0, $3, $F0, 0,
    0, $F, $C0, 0, 0, $3F, $F0, 0, 0, $FF, $FC, 0, $3, $FF, $FF, $F0,
    $F, $FF, $FF, $F0, $F, $FF, $FF, $C0, $3, $FF, $FF, 0, 0, $FF];
  cgalhobbin2 := [0, $13, $F1, 0, 0, $4F, $FC, $40, 1, $4C, $3C,
    $50, $5, $4C, $3C, $54, $15, $53, $F1, $54, $2A, $54, $5, $54,
    0, $A9, $55, $50, 0, $2, $55, $40, 0, $29, $55, 0, $A, $95, $54,
    0, $5, $42, $80, 0, 0, $2, $80, 0, 0, $A, $A0, 0, 0, $2A, $A8, 0, 0, 0, 0, 0];
  cgalhobbin2mask := [$FF, 0, 0, $3F, $FC, 0, 0, $F, $F0, 0, 0, $3,
    $C0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $C0, 0, 0, $3, $FF, 0, 0,
    $F, $F0, 0, 0, $3F, $C0, 0, 0, $FF, $F0, 0, $3, $FF, $FC, $30,
    $F, $FF, $FF, $C0, $3, $FF, $FF, 0, 0, $FF, $FF, $C0, $3, $FF];
  cgalhobbin3 := [0, $13, $F1, 0, 0, $4C, $3C, $40, 1, $4C, $3C,
    $50, $5, $4F, $FC, $54, $29, $53, $F1, $54, $2, $94, $5, $54, 0,
    $29, $55, $50, 0, $2, $55, $40, 0, $29, $55, 0, $2, $95, $54, 0,
    $9, $42, $80, 0, 0, $A, $A0, 0, 0, $2A, $A8, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  cgalhobbin3mask := [$FF, 0, 0, $3F, $FC, 0, 0, $F, $F0, 0, 0, $3,
    $C0, 0, 0, 0, 0, 0, 0, 0, $C0, 0, 0, 0, $FC, 0, 0, $3, $FF, 0,
    0, $F, $F0, 0, 0, $3F, $F0, 0, 0, $FF, $F0, 0, $3, $FF, $FC, 0,
    $3, $FF, $FF, 0, 0, $FF, $FF, $C0, $3, $FF, $FF, $FF, $FF, $FF];
  cgalhobbind := [0, 0, 0, 0, 0, $13, $F1, 0, 0, $4C, $3C, $40, 1,
    $4C, $3C, $50, $5, $4F, $FC, $54, $29, $53, $F1, $54, $2, $94,
    $5, $54, 0, $29, $55, $50, 0, $2A, $55, $40, $2, $A5, $55, 0, $2A,
    $55, $54, 0, 0, $A, $A0, 0, 0, $2A, $A8, 0, 0, 0, 0, 0];
  cgalhobbindmask := [$FF, $C0, 0, $FF, $FF, 0, 0, $3F, $FC, 0, 0,
    $F, $F0, 0, 0, $3, $C0, 0, 0, 0, 0, 0, 0, 0, $C0, 0, 0, 0, $FC,
    0, 0, $3, $FC, 0, 0, $F, $F0, 0, 0, $3F, $C0, 0, 0, $FF, $F0, 0,
    $3, $FF, $FF, 0, 0, $FF, $FF, $C0, $3, $FF];
  cgabonus := [0, 0, $54, 0, 0, 1, $55, 0, 0, 1, $45, 0, 0, $5, 1,
    $40, 0, $5, 0, $50, 0, $14, $4, $51, 0, $14, 1, $54, $4, $51, 0,
    $50, 1, $54, $2, $A0, $2, $A0, $B, $E8, $B, $E8, $2F, $AA, $2B,
    $AA, $2A, $AA, $2A, $AA, $A, $A8, $A, $A8, $2, $A0, $2, $A0, 0, 0];
  cgafire1 := [$3, $C0, $2C, $BE, $3B, $CC, $F3, $FB, $3C, $FC, $33, $CC, $33, $B0];
  cgafire1mask := [$C0, $3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $C0, $3];
  cgafire2 := [$B, $88, $3C, $AE, $A, $C8, $F3, $BA, $AC, $8E, $A3, $A2, $23, $88];
  cgafire2mask := [$C0, $33, 0, 0, 0, $3, 0, 0, 0, 0, 0, 0, $CC, $3];
  cgafire3 := [$A, $28, $23, $A2, $8A, $8A, $B3, $A8, $2A, $BA, $A3, $A3, $A, $88];
  cgafire3mask := [$C0, $3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $C0, $3];
  cgaexp1  := [0, 0, $30, $C, $E, $B0, $2, $80, $E, $B0, $30, $C, 0, 0];
  cgaexp1mask := [$F, $F0, 0, 0, $C0, $3, $F0, $F, $C0, $3, 0, 0, $F, $F0];
  cgaexp2  := [$C0, $3, $30, $C, $8, $20, 0, 0, $8, $20, $30, $C, $C0, $3];
  cgaexp2mask := [$F, $F0, $3, $C0, $C3, $C3, $F3, $CF, $C3, $C3, $3, $C0, $F, $F0];
  cgaexp3  := [$80, $2, $30, $C, 0, 0, 0, 0, 0, 0, $30, $C, $80, $2];
  cgaexp3mask := [$F, $F0, $3, $C0, $CF, $F3, $FF, $FF, $CF, $F3, $3, $C0, $F, $F0];
  cgaback1 := [$AF, $FF, $AA, $FF, $FA, $EB, $FE, $BE, $BF, $EB,
    $FA, $FA, $FF, $AF, $AF, $FE, $AB, $FF, $EA, $BF];
  cgaback2 := [$5A, $5A, $5A, $5A, $5A, $96, $96, $96, $96, $96,
    $A5, $A5, $A5, $A5, $A5, $96, $96, $96, $96, $96];
  cgaback3 := [$AF, $AF, $AF, $AF, $AF, $EB, $EB, $EB, $EB, $EB,
    $FA, $FA, $FA, $FA, $FA, $BE, $BE, $BE, $BE, $BE];
  cgaback4 := [$5F, $FF, $55, $FF, $F5, $D7, $FD, $7D, $7F, $D7,
    $F5, $F5, $FF, $5F, $5F, $FD, $57, $FF, $D5, $7F];
  cgaback5 := [$AF, $FF, $AA, $FF, $FA, $D7, $FD, $7D, $7F, $D7,
    $FA, $FA, $FF, $AF, $AF, $FD, $57, $FF, $D5, $7F];
  cgaback6 := [$5A, $5A, $5A, $5A, $5A, $96, $96, $96, $96, $96,
    $5A, $5A, $5A, $5A, $5A, $96, $96, $96, $96, $96];
  cgaback7 := [$AF, $AF, $AF, $AF, $AF, $D7, $D7, $D7, $D7, $D7,
    $F5, $F5, $F5, $F5, $F5, $BE, $BE, $BE, $BE, $BE];
  cgaback8 := [$FA, $FA, $FA, $FA, $FA, $BE, $BE, $BE, $BE, $BE,
    $AF, $AF, $AF, $AF, $AF, $BE, $BE, $BE, $BE, $BE];
  cgarightblobmask := [$F0, $FF, 0, $FF, 0, $3F, 0, $F, 0, $F, 0,
    $3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $3, 0, $F, 0, $3F, 0,
    $3F, $C3, $FF, $F, $FF];
  cgatopblobmask := [$FF, $FF, $C0, $3, $FF, $FF, $FF, $FC, 0, 0,
    $3F, $FF, $FF, $F0, 0, 0, $3, $FF, $FC, 0, 0, 0, 0, $3F, $F0, 0,
    0, 0, 0, $FF, $FF, 0, 0, 0, 0, $F];
  cgaleftblobmask := [$FF, $F0, $FF, 0, $FC, 0, $F0, 0, $F0, 0, $C0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $C0, 0, $F0, 0, $F0, 0,
    $FC, 0, $FF, $C3, $FF, $F];
  cgabottomblobmask := [$FC, 0, 0, 0, 0, $3F, $F0, 0, 0, 0, 0, $FF,
    $FF, 0, 0, 0, 0, $F, $FF, $C0, 0, 0, $3, $FF, $FF, $FC, 0, 0, $3F,
    $FF, $FF, $FF, $C0, $3, $FF, $FF];
  cgasquareblobmask := [$F0, $F0, $F0, $F0, $F0, $FF, $FC, 0, 0, 0,
    0, $3F, $F0, 0, 0, 0, 0, $FF, $FF, 0, 0, 0, 0, $F, $FF, $C0, 0,
    0, 0, $3F, $FF, 0, 0, 0, 0, $FF];
  cgafurryblobmask := [$FC, $3C, $3C, $3C, $3C, $3F, $F0, 0, 0, 0,
    0, $FF, $FF, 0, 0, 0, 0, $F, $FC, 0, 0, 0, 0, $3F, $F0, 0, 0, 0,
    0, $FF, $FF, 0, 0, 0, 0, $F, $FF, $C3, $C3, $C3, $C3, $FF, $FF, $F, $F, $F, $F, $FF];
  cgaemerald := [0, 0, 0, 0, 0, $5, $55, $40, 0, $17, $55, $50, 0,
    $5D, $55, $54, 0, $17, $55, $10, 0, $5, $54, $40, 0, 1, $51, 0,
    0, 0, $54, 0, 0, 0, $10, 0, 0, 0, 0, 0];
  cgaemeraldmask := [$FF, $C0, 0, $F, $FF, 0, 0, $3, $FC, 0, 0, 0,
    $F0, 0, 0, 0, $FC, 0, 0, 0, $FF, 0, 0, $3, $FF, $C0, 0, $F, $FF,
    $F0, 0, $3F, $FF, $FC, 0, $FF, $FF, $FF, $3, $FF];
  cgaliferight := [0, $F, 0, 0, 0, $3F, $C0, 0, 0, $30, $C0, 0, $2,
    $AA, $A1, $55, $A, $AA, $A5, $55, $2A, $AA, $A5, 0, $AA, $AA, $A5,
    $55, $82, $A8, $21, $55, $3C, $A3, $C0, 0, $C3, $C, $30, 0, $C3,
    $C, $30, 0, $3C, $3, $C0, 0];
  cgaliferightmask := [$FF, $C0, $3F, $FF, $FF, 0, $F, $FF, $FC, 0,
    $C, 0, $F0, 0, 0, 0, $C0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, $C, 0, 0, 0, $3, $FF, 0, 0, $3, $FF, 0, $F0, $F, $FF];
  cgalifeleft := [0, 0, $F0, 0, 0, $3, $FC, 0, 0, $3, $C, 0, $55,
    $4A, $AA, $80, $55, $5A, $AA, $A0, 0, $5A, $AA, $A8, $55, $5A,
    $AA, $AA, $55, $48, $2A, $82, 0, $3, $CA, $3C, 0, $C, $30, $C3,
    0, $C, $30, $C3, 0, $3, $C0, $3C];
  cgalifeleftmask := [$FF, $FC, $3, $FF, $FF, $F0, 0, $FF, 0, $30,
    0, $3F, 0, 0, 0, $F, 0, 0, 0, $3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, $30, 0, 0, $FF, $C0, 0, 0, $FF, $C0, 0, 0, $FF, $F0, $F, 0];
  cgaelifemask := [$C0, 0, 0, $3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, $C0, 0, 0, $3];
  cgatable := [cgazero60, cgaediggermask, cgardigger1, cgardigger1mask,
    cgardigger2, cgardigger2mask, cgardigger3, cgardigger3mask,
    cgarxdigger1, cgarxdigger1mask, cgarxdigger2, cgarxdigger2mask,
    cgarxdigger3, cgarxdigger3mask, cgaudigger1, cgaudigger1mask,
    cgaudigger2, cgaudigger2mask, cgaudigger3, cgaudigger3mask,
    cgauxdigger1, cgauxdigger1mask, cgauxdigger2, cgauxdigger2mask,
    cgauxdigger3, cgauxdigger3mask, cgaldigger1, cgaldigger1mask,
    cgaldigger2, cgaldigger2mask, cgaldigger3, cgaldigger3mask,
    cgalxdigger1, cgalxdigger1mask, cgalxdigger2, cgalxdigger2mask,
    cgalxdigger3, cgalxdigger3mask, cgaddigger1, cgaddigger1mask,
    cgaddigger2, cgaddigger2mask, cgaddigger3, cgaddigger3mask,
    cgadxdigger1, cgadxdigger1mask, cgadxdigger2, cgadxdigger2mask,
    cgadxdigger3, cgadxdigger3mask, cgadiggerd, cgadiggerdmask,
    cgagrave1, cgagrave1mask, cgagrave2, cgagrave2mask, cgagrave3,
    cgagrave3mask, cgagrave4, cgagrave4mask, cgagrave5, cgagrave5mask,
    cgazero60, cgaediggermask, cgardigger1, cgardigger1mask, cgardigger2,
    cgardigger2mask, cgardigger3, cgardigger3mask, cgarxdigger1,
    cgarxdigger1mask, cgarxdigger2, cgarxdigger2mask, cgarxdigger3,
    cgarxdigger3mask, cgaudigger1, cgaudigger1mask, cgaudigger2,
    cgaudigger2mask, cgaudigger3, cgaudigger3mask, cgauxdigger1,
    cgauxdigger1mask, cgauxdigger2, cgauxdigger2mask, cgauxdigger3,
    cgauxdigger3mask, cgaldigger1, cgaldigger1mask, cgaldigger2,
    cgaldigger2mask, cgaldigger3, cgaldigger3mask, cgalxdigger1,
    cgalxdigger1mask, cgalxdigger2, cgalxdigger2mask, cgalxdigger3,
    cgalxdigger3mask, cgaddigger1, cgaddigger1mask, cgaddigger2,
    cgaddigger2mask, cgaddigger3, cgaddigger3mask, cgadxdigger1,
    cgadxdigger1mask, cgadxdigger2, cgadxdigger2mask, cgadxdigger3,
    cgadxdigger3mask, cgadiggerd, cgadiggerdmask, cgagrave1, cgagrave1mask,
    cgagrave2, cgagrave2mask, cgagrave3, cgagrave3mask, cgagrave4,
    cgagrave4mask, cgagrave5, cgagrave5mask, cgasbag, cgasbagmask,
    cgarbag, cgarbagmask, cgalbag, cgalbagmask, cgafbag, cgafbagmask,
    cgagold1, cgagold1mask, cgagold2, cgagold2mask, cgagold3, cgagold3mask,
    cganobbin1, cganobbin1mask, cganobbin2, cganobbin2mask, cganobbin3,
    cganobbin3mask, cganobbind, cganobbindmask, cgarhobbin1, cgarhobbin1mask,
    cgarhobbin2, cgarhobbin2mask, cgarhobbin3, cgarhobbin3mask,
    cgarhobbind, cgarhobbindmask, cgalhobbin1, cgalhobbin1mask,
    cgalhobbin2, cgalhobbin2mask, cgalhobbin3, cgalhobbin3mask,
    cgalhobbind, cgalhobbindmask, cgabonus, cgaediggermask, cgafire1,
    cgafire1mask, cgafire2, cgafire2mask, cgafire3, cgafire3mask,
    cgaexp1, cgaexp1mask, cgaexp2, cgaexp2mask, cgaexp3, cgaexp3mask,
    cgafire1, cgafire1mask, cgafire2, cgafire2mask, cgafire3, cgafire3mask,
    cgaexp1, cgaexp1mask, cgaexp2, cgaexp2mask, cgaexp3, cgaexp3mask,
    cgaback1, cgazero60, cgaback2, cgazero60, cgaback3, cgazero60,
    cgaback4, cgazero60, cgaback5, cgazero60, cgaback6, cgazero60,
    cgaback7, cgazero60, cgaback8, cgazero60, cgazero60, cgarightblobmask,
    cgazero60, cgatopblobmask, cgazero60, cgaleftblobmask, cgazero60,
    cgabottomblobmask, cgazero60, cgasquareblobmask, cgazero60,
    cgafurryblobmask, cgaemerald, cgaemeraldmask, cgazero60, cgaemeraldmask,
    cgaliferight, cgaliferightmask, cgalifeleft, cgalifeleftmask,
    cgazero60, cgaelifemask];
  cgatitledat := [254, 0, 0, 254, 0, 0, 254, 208, 0, 254, 80, 170,
    168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254,
    38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39,
    0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168,
    254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38,
    0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170,
    254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254,
    39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42,
    168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254,
    38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39,
    0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168,
    254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38,
    0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170,
    254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254,
    39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42,
    168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254,
    38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39,
    0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168,
    254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38,
    0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170,
    254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254,
    39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42,
    168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254,
    38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39,
    0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168,
    254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38,
    0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170,
    254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254,
    39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42,
    168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254,
    38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39,
    0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168,
    254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38,
    0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170,
    254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254,
    39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42,
    168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254,
    38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39,
    0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168,
    254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38,
    0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170,
    254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254,
    39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42,
    168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254,
    38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39,
    0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168,
    254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38,
    0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 254, 80, 170, 254,
    164, 0, 60, 0, 240, 0, 0, 63, 240, 60, 63, 240, 15, 254, 7, 0,
    255, 254, 8, 0, 240, 3, 252, 0, 255, 254, 5, 0, 255, 195, 254,
    5, 0, 63, 192, 15, 254, 32, 0, 3, 0, 0, 3, 0, 0, 3, 192, 60, 3,
    192, 254, 8, 0, 15, 254, 10, 0, 60, 0, 15, 254, 4, 0, 60, 0, 15,
    254, 4, 0, 3, 192, 240, 15, 254, 32, 0, 12, 3, 3, 0, 192, 0, 0,
    240, 207, 15, 0, 255, 0, 63, 255, 240, 0, 0, 63, 255, 0, 63, 255,
    240, 15, 240, 0, 15, 240, 0, 60, 0, 15, 254, 4, 0, 15, 0, 3, 0,
    3, 255, 0, 63, 252, 0, 255, 252, 15, 255, 15, 15, 252, 3, 255,
    0, 3, 255, 255, 0, 15, 252, 254, 17, 0, 12, 12, 0, 0, 192, 0, 0,
    240, 207, 12, 0, 15, 0, 3, 192, 3, 192, 15, 0, 15, 0, 3, 240, 3,
    240, 3, 192, 0, 240, 0, 60, 0, 15, 254, 5, 0, 255, 192, 0, 240,
    0, 240, 3, 192, 0, 15, 0, 0, 240, 51, 195, 0, 15, 0, 240, 0, 60,
    3, 192, 240, 3, 192, 254, 16, 0, 12, 3, 3, 0, 192, 0, 0, 63, 3,
    240, 0, 15, 0, 3, 192, 3, 192, 15, 0, 15, 0, 3, 192, 3, 192, 3,
    192, 0, 240, 0, 60, 0, 15, 254, 6, 0, 63, 0, 240, 0, 240, 3, 192,
    0, 15, 0, 0, 60, 51, 195, 0, 0, 60, 240, 0, 60, 0, 0, 255, 255,
    192, 254, 3, 0, 3, 240, 254, 6, 15, 254, 5, 0, 3, 0, 0, 3, 254,
    3, 0, 63, 3, 240, 0, 15, 0, 3, 192, 3, 192, 15, 0, 15, 0, 3, 192,
    3, 192, 3, 192, 0, 240, 0, 60, 0, 15, 254, 4, 0, 12, 0, 3, 192,
    240, 0, 240, 3, 192, 0, 15, 0, 0, 15, 192, 252, 0, 15, 0, 240,
    0, 60, 0, 0, 240, 254, 6, 0, 240, 3, 255, 3, 252, 0, 252, 254,
    6, 0, 60, 0, 240, 254, 3, 0, 12, 0, 192, 0, 15, 0, 3, 192, 3, 192,
    3, 192, 255, 0, 3, 192, 3, 192, 3, 192, 0, 240, 0, 60, 0, 15, 254,
    4, 0, 15, 240, 15, 0, 60, 3, 192, 3, 192, 0, 3, 195, 0, 3, 0, 48,
    0, 15, 3, 240, 0, 60, 0, 0, 60, 15, 254, 5, 0, 240, 0, 60, 254,
    4, 15, 254, 0, 0, 254, 0, 0, 254, 0, 0, 254, 146, 0, 254, 80, 170,
    168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254,
    38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39,
    0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168,
    254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38,
    0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170,
    254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254,
    39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42,
    168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254,
    38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39,
    0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168,
    254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38,
    0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170,
    254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254,
    39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42,
    168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254,
    38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39,
    0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168,
    254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38,
    0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0,
    170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168,
    254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38,
    0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170,
    254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254,
    39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42,
    168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254,
    38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39,
    0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168,
    254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38,
    0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170,
    254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254,
    39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42,
    168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254,
    38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39,
    0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168,
    254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38,
    0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170,
    254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254,
    39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42,
    168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254,
    38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39,
    0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168,
    254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38,
    0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170,
    254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254,
    39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254, 38, 0, 42,
    168, 254, 39, 0, 170, 254, 38, 0, 42, 168, 254, 39, 0, 170, 254,
    38, 0, 42, 254, 80, 170, 254, 164, 0, 3, 255, 254, 78, 0, 192,
    0, 12, 0, 0, 3, 192, 60, 3, 192, 15, 254, 7, 0, 15, 254, 8, 0,
    240, 0, 60, 0, 15, 254, 4, 0, 15, 192, 63, 254, 5, 0, 192, 240,
    15, 254, 32, 0, 3, 0, 252, 3, 254, 3, 0, 240, 207, 3, 254, 9, 0,
    15, 254, 10, 0, 60, 0, 15, 254, 4, 0, 60, 0, 3, 254, 4, 0, 3, 192,
    0, 15, 254, 32, 0, 12, 12, 0, 0, 192, 0, 0, 240, 207, 12, 0, 15,
    0, 3, 240, 15, 0, 3, 192, 63, 0, 3, 240, 15, 240, 15, 0, 0, 240,
    0, 60, 0, 15, 254, 4, 0, 3, 252, 0, 0, 60, 3, 192, 3, 192, 0, 15,
    0, 0, 240, 15, 0, 192, 15, 0, 192, 0, 63, 3, 192, 60, 15, 254,
    17, 0, 12, 12, 0, 0, 192, 0, 0, 63, 3, 252, 0, 15, 0, 3, 192, 3,
    192, 15, 0, 15, 0, 3, 192, 3, 192, 3, 192, 0, 240, 0, 60, 0, 15,
    254, 5, 0, 3, 252, 0, 240, 0, 240, 3, 192, 0, 15, 0, 0, 60, 51,
    195, 0, 0, 3, 240, 0, 60, 0, 0, 240, 3, 192, 254, 4, 0, 240, 3,
    252, 3, 252, 3, 252, 254, 5, 0, 3, 0, 252, 3, 254, 3, 0, 63, 3,
    240, 0, 15, 0, 3, 192, 3, 192, 15, 0, 15, 0, 3, 192, 3, 192, 3,
    192, 0, 240, 0, 60, 0, 15, 254, 4, 0, 12, 0, 3, 192, 240, 0, 240,
    3, 192, 0, 15, 0, 0, 15, 192, 252, 0, 3, 192, 240, 0, 60, 0, 0,
    240, 254, 6, 0, 240, 254, 4, 15, 0, 15, 254, 6, 0, 192, 0, 12,
    254, 3, 0, 12, 0, 192, 0, 15, 0, 3, 192, 3, 192, 15, 0, 15, 0,
    3, 192, 3, 192, 3, 192, 0, 240, 0, 60, 0, 15, 254, 4, 0, 15, 0,
    3, 192, 240, 0, 240, 3, 192, 0, 15, 3, 0, 15, 192, 252, 0, 15,
    0, 240, 0, 60, 0, 0, 240, 0, 192, 254, 4, 0, 240, 0, 254, 3, 15,
    0, 15, 254, 6, 0, 3, 255, 254, 4, 0, 12, 0, 192, 0, 255, 240, 63,
    252, 63, 252, 0, 255, 15, 252, 63, 252, 63, 252, 63, 252, 15, 255,
    3, 255, 192, 255, 240, 254, 3, 0, 12, 15, 240, 0, 15, 252, 0, 63,
    252, 0, 0, 252, 0, 3, 0, 48, 0, 3, 252, 63, 3, 255, 192, 0, 15,
    240, 254, 4, 0, 15, 255, 3, 240, 3, 252, 3, 252, 0, 0, 0, 0, 0, 0, 0];
end;

end.
