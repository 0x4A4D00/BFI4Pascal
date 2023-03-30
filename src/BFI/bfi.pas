unit BFI;

interface

uses
  Parser;


function Interpret(ACode: string; AInput: {$ifdef Mode16}widestring{$else}string{$endif} = ''; AOutputHandler: TOutputHandler = nil; AWipeLastData : boolean = true): {$ifdef Mode16}widestring{$else}string{$endif};
function Interpret(ACode: string; AInputHandler: TInputHandler; AOutputHandler: TOutputHandler = nil; AWipeLastData : boolean = true): {$ifdef Mode16}widestring{$else}string{$endif};
function InterpretFile(AFilePath: string; AInput: {$ifdef Mode16}widestring{$else}string{$endif} = ''; AOutputHandler: TOutputHandler = nil; AWipeLastData : boolean = true): {$ifdef Mode16}widestring{$else}string{$endif};
function InterpretFile(AFilePath: string; AInputHandler: TInputHandler; AOutputHandler: TOutputHandler = nil; AWipeLastData : boolean = true): {$ifdef Mode16}widestring{$else}string{$endif};

implementation

procedure InitializeData;
begin
  Memory        := Default(TCharRec);
  Input         := Default(TCharRec);
  Output        := Default(TCharRec);
  LoopLastPos   := Default(TIntegerArray);
  MemoryCounter := 0;
  InputCounter  := 0;
  LoopCounter   := 0;
  InputHandler  := nil;
end;

function Interpret(ACode: string; AInput: {$ifdef Mode16}widestring{$else}string{$endif} = ''; AOutputHandler: TOutputHandler = nil; AWipeLastData : boolean = true): {$ifdef Mode16}widestring{$else}string{$endif};
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

  Interpret := (Output.Text);
end;

function Interpret(ACode: string; AInputHandler: TInputHandler; AOutputHandler: TOutputHandler = nil; AWipeLastData : boolean = true): {$ifdef Mode16}widestring{$else}string{$endif};
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
    Interpret := (Output.Text);
end;

function InterpretFile(AFilePath: string; AInput: {$ifdef Mode16}widestring{$else}string{$endif} = ''; AOutputHandler: TOutputHandler = nil; AWipeLastData : boolean = true): {$ifdef Mode16}widestring{$else}string{$endif};
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

  InterpretFile := (Output.Text);
end;

function InterpretFile(AFilePath: string; AInputHandler: TInputHandler; AOutputHandler: TOutputHandler = nil; AWipeLastData : boolean = true): {$ifdef Mode16}widestring{$else}string{$endif};
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
    InterpretFile := (Output.Text);
end;

end.

