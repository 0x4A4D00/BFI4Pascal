unit Parser;

interface

uses
  SysUtils;

procedure Parse(Number : integer);
function  ReadNext(): char;
procedure Increase;
procedure Decrease;
procedure MoveForward;
procedure MoveBackward;
procedure LoopStart;
procedure LoopEnd;
procedure GetInput;
procedure SetOutput;

type
  TCharArray    = array[0..10000] of char;
  TIntegerArray = array[1..10000] of integer;


var
  Memory        : TCharArray;
  _input        : TCharArray;
  _output       : TCharArray;
  _code         : TCharArray;
  LoopLastPos   : TIntegerArray;
  Point         ,
  MemoryCounter ,
  InputCounter  ,
  LoopCounter   : integer;



implementation

procedure Parse(Number : integer);
begin

  case _Code[Number] of
    '+' : Increase;
    '-' : Decrease;
    '>' : MoveForward;
    '<' : MoveBackward;
    '[' : LoopStart;
    ']' : LoopEnd;
    ',' : GetInput;
    '.' : SetOutput;
  end;

end;

function ReadNext(): char;
begin
  ReadNext := _Code[point];
end;


procedure Increase;
begin

  Inc(Memory[MemoryCounter]);

end;

procedure Decrease;
begin

  Dec(Memory[MemoryCounter]);

end;

procedure MoveForward;
begin

  Inc(MemoryCounter);

end;

procedure MoveBackward;
begin

  Dec(MemoryCounter);

end;

procedure LoopStart;
var
  NextChar : char;
begin

  if Memory[MemoryCounter] = #00 then
  begin
    NextChar := '[';

    while NOT(NextChar = ']') do
    begin
      Inc(Point);
      NextChar := ReadNext;

      if NextChar = '[' then
      begin

        LoopStart;

      end;

    end;



    //if LoopCounter = 0 then
    //  Inc(Point);

  end
  else
  begin
    LoopLastPos[LoopCounter] := Point;

    Inc(LoopCounter);
  end;

end;

procedure LoopEnd;
begin

  //if NOT(LoopCounter = 0) then
  Dec(LoopCounter);

  Point := LoopLastPos[LoopCounter];

  Parse(Point);

end;

procedure GetInput;
begin

  {$ifdef Debugging}
  if _input[InputCounter] = #00 then raise Exception.Create(Format('Input argument is empty but input needed in %d', [Point]));
  {$endif}

  { For ignoring eol in console mode}
  {$ifdef ConsoleMode}
  if input[InputCounter] = #13 then
  begin
    Inc(InputCounter);

    input := #00;
  end;
  {$endif}

  Memory[MemoryCounter] := _input[InputCounter];

  Inc(InputCounter);

end;

procedure SetOutput;
begin

  _output += Memory[MemoryCounter];

end;

end.

