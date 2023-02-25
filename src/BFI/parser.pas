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
  TInputHandler = function():string;
  TCharArray    = record
    Text   : array[0..10000] of char;
    Length : Integer;
  end;

  //TCharArray    = array[0..10000] of char;
  TIntegerArray = array[0..10000] of integer;


var
  Memory        : TCharArray;
  Input        : TCharArray;
  Output       : TCharArray;
  Code         : TCharArray;
  LoopLastPos   : TIntegerArray;
  Point         ,
  MemoryCounter ,
  InputCounter  ,
  LoopCounter   : integer;
  InputHandler : TInputHandler;



implementation

procedure Parse(Number : integer);
begin

  case Code.Text[Number] of
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
  ReadNext := Code.Text[point];
end;


procedure Increase;
begin
  Inc(Memory.Text[MemoryCounter]);
end;

procedure Decrease;
begin
  Dec(Memory.Text[MemoryCounter]);
end;

procedure MoveForward;
begin

  if MemoryCounter = 10000 then
    MemoryCounter := 0
  else
    Inc(MemoryCounter);

end;

procedure MoveBackward;
begin

  if MemoryCounter = 0 then
    MemoryCounter := 10000
  else
    Dec(MemoryCounter);

end;

procedure LoopStart;
var
  NextChar : char;
begin
  if Memory.Text[MemoryCounter] = #00 then
  begin
    NextChar := '[';

    while NOT(NextChar = ']') do
    begin
      Inc(Point);
      NextChar := ReadNext;

      if NextChar = '[' then
        LoopStart;

    end;
  end
  else
  begin
    LoopLastPos[LoopCounter] := Point;

    Inc(LoopCounter);
  end;
end;

procedure LoopEnd;
begin
  Dec(LoopCounter);

  Point := LoopLastPos[LoopCounter];

  Parse(Point);
end;

procedure GetInput;
var
  Temp : string;
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

  if (Input.Length < InputCounter) AND NOT(InputHandler = nil) then
  begin
    Temp         := InputHandler();
    Input.Text   := Temp;
    Input.Length := Length(Temp);
  end;

    Memory.Text[MemoryCounter] := Input.Text[InputCounter];

  if InputCounter = 10000 then
    InputCounter := 0
  else
    Inc(InputCounter);

end;

procedure SetOutput;
begin
  Output.Text += Memory.Text[MemoryCounter];
end;

end.

