unit BFI;

interface

uses
  Parser;

function Interpret(Code,Input : string): string;
function Interpret(Code : string): string;

implementation

procedure InitializeData;
begin

  Memory        := Default(TCharArray);
  _input        := Default(TCharArray);
  _output       := Default(TCharArray);
  LoopLastPos   := Default(TIntegerArray);
  MemoryCounter := 0;
  InputCounter  := 0;
  LoopCounter   := 0;

end;

function Interpret(Code,Input : string): string;
begin

  InitializeData;
  _code  := Code;
  _input := Input;

  for Point := 0 to Length(Code) do
    Parse(Point);

  Interpret := _output;
end;

function Interpret(Code : string): string;
begin

  InitializeData;
  _code  := Code;

  for Point := 0 to Length(Code) do
    Parse(Point);

  Interpret := _output;
end;

end.

