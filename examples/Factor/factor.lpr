program factor;

{                                                                                                       }
{  Title: calculate factorial                                                                           }
{  Description: This is a Pascal code sample for calculate factorial.                                   }
{  Author: 0x4A4D                                                                                       }
{  BF Code By: 1999 by Brian Raiter                                                                     }
{  https://spartusch.github.io/legacy-website/html_en/bfd.html                                          }
{                                                                                                       }

uses
  BFI;

function InputHandler():string;
begin
  Read(InputHandler);
end;

procedure OutputHandler(Output: char);
begin
  Write(Output);
end;

begin
  Write(InterpretFile('factor.bf', '20' + #10));

  // OR

  InterpretFile('factor.bf', @InputHandler, @OutputHandler);

  ReadLn;
end.

