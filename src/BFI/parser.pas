unit Parser;

interface

uses
  SysUtils;

procedure Parse;
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
  TArraySize      = 0..10000;     // 2 bytes

  TInputHandler   = function():string;
  {$ifdef Mode16}
  TOutputHandler  = procedure(Output: widechar);
  {$else}
  TOutputHandler  = procedure(Output: char);
  {$endif}

  TCharArray    = record
    {$ifdef Mode16}
    Text   : array[TArraySize] of WideChar;
    {$else}
    Text   : array[TArraySize] of char;
    {$endif}
    Length : Integer;
  end;

  TIntegerArray = array[TArraySize] of integer;

var
  Memory        ,
  Input         ,
  Output        ,
  Code          : TCharArray;

  LoopLastPos   : TIntegerArray;

  Point         ,
  MemoryCounter ,
  InputCounter  ,
  LoopCounter   : TArraySize;

  InputHandler  : TInputHandler;
  OutputHandler : TOutputHandler;

implementation

procedure Parse;
{$ifdef OPTIMIZATION}
var
  NextChar : char;
{$endif}
begin

  case Code.Text[Point] of
    {$ifdef OPTIMIZATION}
    '+' : Inc(Memory.Text[MemoryCounter]);
    '-' : Dec(Memory.Text[MemoryCounter]);
    '>' :
    begin
      if MemoryCounter = 10000 then
        MemoryCounter := 0
      else
        Inc(MemoryCounter);

    end;
    '<' :
    begin
      if MemoryCounter = 0 then
        MemoryCounter := 10000
      else
        Dec(MemoryCounter);
      end;
    '[' :
    begin
      if Memory.Text[MemoryCounter] = #00 then
      begin
        NextChar := '[';

        while NOT(NextChar = ']') do
        begin
          Inc(Point);
          NextChar := ReadNext;

          if NextChar = '[' then
            Parse;

        end;
      end
      else
      begin
        LoopLastPos[LoopCounter] := Point;

        Inc(LoopCounter);
      end;
    end;
    ']' :
    begin
      Dec(LoopCounter);

      Point := LoopLastPos[LoopCounter];

      Parse;
    end;
    ',' : GetInput;
    '.' : SetOutput;
    {$else}
    '+' : Increase;
    '-' : Decrease;
    '>' : MoveForward;
    '<' : MoveBackward;
    '[' : LoopStart;
    ']' : LoopEnd;
    ',' : GetInput;
    '.' : SetOutput;
    {$endif}
    {$ifdef Debugging}
    otherwise if NOT(Code.Text[Point] = #00) then raise Exception.Create(Format('Unknown character[%s] at:%d', [Code.Text[Point], Point + 1]));
    {$endif}
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

  Parse();
end;

procedure GetInput;
var
  Temp : string;
begin
  if (Input.Length < InputCounter) AND NOT(InputHandler = nil) then
  begin
    Temp         := InputHandler();
    Input.Text   := Temp;
    Input.Length := Length(Temp);
  end;

  {$ifdef Debugging}
  if Input.Text[InputCounter] = #00 then raise Exception.Create(Format('Input argument is empty but input needed at:%d', [Point + 1]));
  {$endif}

  Memory.Text[MemoryCounter] := Input.Text[InputCounter];

  if InputCounter = 10000 then
    InputCounter := 0
  else
    Inc(InputCounter);

end;

procedure SetOutput;
begin
  if OutputHandler = nil then
    Output.Text += Memory.Text[MemoryCounter]
  else
    OutputHandler(Memory.Text[MemoryCounter]);
end;

end.

