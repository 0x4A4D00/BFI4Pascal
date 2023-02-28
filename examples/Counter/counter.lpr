program counter;

{                                                                                                       }
{  Title: Counter                                                                                       }
{  Description: This is a Pascal code sample for a simple counter (0-99).                               }
{  Author: 0x4A4D                                                                                       }
{                                                                                                       }

uses
  BFI;

function InputHandler():string;
begin
  ReadLn(Result);
end;

procedure OutputHandler(Output : char);
begin
  Write(Output);
end;

begin
  Write('BF Counter:');
  InterpretFile('counter.bf',@InputHandler, @OutputHandler);

  ReadLn;
end.

