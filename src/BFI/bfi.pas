unit BFI;

interface

uses
  Parser;

function Interpret(ACode: string; AInput: string = ''): string;
function Interpret(ACode: string; AInputHandler: TInputHandler): string;

implementation

procedure InitializeData;
begin
  Memory        := Default(TCharArray);
  Input         := Default(TCharArray);
  Output        := Default(TCharArray);
  LoopLastPos   := Default(TIntegerArray);
  MemoryCounter := 0;
  InputCounter  := 0;
  LoopCounter   := 0;
  InputHandler  := nil;
end;

function Interpret(ACode: string; AInput: string = ''): string;
begin
  InitializeData;
  Code.Text    := ACode;
  Code.Length  := Length(ACode);

  Input.Text   := AInput;
  Input.Length := Length(AInput);

  for Point := 0 to Length(ACode) do
    Parse(Point);

  Interpret := Output.Text;
end;

function Interpret(ACode: string; AInputHandler: TInputHandler): string;
begin
  InitializeData;
  Code.Text    := ACode;
  Code.Length  := Length(ACode);

  Input.Length := -1;

  InputHandler := AInputHandler;

  for Point := 0 to Length(ACode) do
    Parse(Point);

  Interpret := Output.Text;
end;

end.

