unit BFI;

interface

uses
  Parser;

function Interpret(ACode: string; AInput: string = ''; AOutputHandler: TOutputHandler = nil; AWipeLastData : boolean = true): string;
function Interpret(ACode: string; AInputHandler: TInputHandler; AOutputHandler: TOutputHandler = nil; AWipeLastData : boolean = true): string;
function InterpretFile(AFilePath: string; AInput: string = ''; AOutputHandler: TOutputHandler = nil; AWipeLastData : boolean = true): string;
function InterpretFile(AFilePath: string; AInputHandler: TInputHandler; AOutputHandler: TOutputHandler = nil; AWipeLastData : boolean = true): string;

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

function Interpret(ACode: string; AInput: string = ''; AOutputHandler: TOutputHandler = nil; AWipeLastData : boolean = true): string;
begin
  if AWipeLastData then
    InitializeData;

  Code.Text     := ACode;
  Code.Length   := Length(ACode);

  Input.Text    := AInput;
  Input.Length  := Length(AInput);

  OutputHandler := AOutputHandler;

  for Point := 0 to Length(ACode) do
    Parse;

  Interpret := Output.Text;
end;

function Interpret(ACode: string; AInputHandler: TInputHandler; AOutputHandler: TOutputHandler = nil; AWipeLastData : boolean = true): string;
begin
  if AWipeLastData then
    InitializeData;

  Code.Text     := ACode;
  Code.Length   := Length(ACode);

  Input.Length  := -1;

  InputHandler  := AInputHandler;
  OutputHandler := AOutputHandler;

  for Point := 0 to Length(ACode) do
    Parse;

  if AOutputHandler = nil then
    Interpret := Output.Text;
end;

function InterpretFile(AFilePath: string; AInput: string = ''; AOutputHandler: TOutputHandler = nil; AWipeLastData : boolean = true): string;
var
  Target    : TextFile;
  Character : char;
  ACode     : string = '';
begin

  Assign(Target, AFilePath);

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

  if AWipeLastData then
    InitializeData;

  Code.Text     := ACode;
  Code.Length   := Length(ACode);

  Input.Text    := AInput;
  Input.Length  := Length(AInput);

  OutputHandler := AOutputHandler;

  for Point := 0 to Length(ACode) do
    Parse;

  InterpretFile := Output.Text;
end;

function InterpretFile(AFilePath: string; AInputHandler: TInputHandler; AOutputHandler: TOutputHandler = nil; AWipeLastData : boolean = true): string;
var
  Target    : TextFile;
  Character : char;
  ACode     : string = '';
begin
  Assign(Target, AFilePath);

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

  if AWipeLastData then
    InitializeData;

  Code.Text     := ACode;
  Code.Length   := Length(ACode);

  Input.Length  := -1;

  InputHandler  := AInputHandler;
  OutputHandler := AOutputHandler;

  for Point := 0 to Length(ACode) do
    Parse;

  if AOutputHandler = nil then
    InterpretFile := Output.Text;
end;

end.

