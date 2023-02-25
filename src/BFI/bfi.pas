unit BFI;

interface

uses
  Parser;

function Interpret(ACode: string; AInput: string = ''): string;
function Interpret(ACode: string; AInputHandler: TInputHandler): string;
function InterpretFile(FilePath: string; AInput: string = ''): string;
function InterpretFile(FilePath: string; AInputHandler: TInputHandler): string;


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

function InterpretFile(FilePath: string; AInput: string = ''): string;
var
  Target    : TextFile;
  Character : char;
  ACode     : string = '';
begin

  Assign(Target, FilePath);

  try
    reset(Target);

    while not eof(Target) do
    begin
      Read(Target, Character);
      ACode += Character;
    end;

    CloseFile(Target);

  {$ifdef Debugging}
  except
    on E: EInOutError do
     writeln('Cannot access to the desired file: ', E.Message);
  end;
  {$endif}

  finally;
  end;

  InitializeData;
  Code.Text    := ACode;
  Code.Length  := Length(ACode);

  Input.Text   := AInput;
  Input.Length := Length(AInput);

  for Point := 0 to Length(ACode) do
    Parse(Point);

  InterpretFile := Output.Text;
end;

function InterpretFile(FilePath: string; AInputHandler: TInputHandler): string;
var
  Target    : TextFile;
  Character : char;
  ACode     : string = '';
begin
  Assign(Target, FilePath);

  try
    reset(Target);

    while not eof(Target) do
    begin
      Read(Target, Character);
      ACode += Character;
    end;

    CloseFile(Target);

  {$ifdef Debugging}
  except
    on E: EInOutError do
     writeln('Cannot access to the desired file: ', E.Message);
  end;
  {$endif}

  finally;
  end;

  InitializeData;
  Code.Text    := ACode;
  Code.Length  := Length(ACode);

  Input.Length := -1;

  InputHandler := AInputHandler;

  for Point := 0 to Length(ACode) do
    Parse(Point);

  InterpretFile := Output.Text;
end;

end.

