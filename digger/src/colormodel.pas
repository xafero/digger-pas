unit ColorModel;

{$mode objfpc}{$H+}

interface

uses
  api;

type
  TColorModel = class(TInterfacedObject, IColorModel)
  private
  var
    _bits: integer;
  var
    _size: integer;
  var
    _r:    ByteArray;
  var
    _g:    ByteArray;
  var
    _b:    ByteArray;
  public
    constructor Create(bits: integer; size: integer; r: ByteArray;
      g: ByteArray; b: ByteArray);
    function GetColor(ind: integer): IntegerArray;
  end;

implementation

constructor TColorModel.Create(bits: integer; size: integer; r: ByteArray;
  g: ByteArray; b: ByteArray);
begin
  _bits := bits;
  _size := size;
  _r := r;
  _g := g;
  _b := b;
end;

function TColorModel.GetColor(ind: integer): IntegerArray;
var
  r: byte;
  g: byte;
  b: byte;
begin
  r := _r[ind];
  g := _g[ind];
  b := _b[ind];
  exit([r, g, b]);
end;

end.
