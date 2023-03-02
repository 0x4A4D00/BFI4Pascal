program prime;

{                                                                                                       }
{  Title: prime counter                                                                                 }
{  Description: This is a Pascal code sample for count prime numbers                                    }
{  Author: 0x4A4D                                                                                       }
{  BF Code By:Copyright (c) 2002, 2005 by Stefan Partusch                                               }
{  https://spartusch.github.io/legacy-website/html_en/bfd.html                                          }
{                                                                                                       }
{                                                                                                       }

uses
  BFI;

function InputHandler():string;
begin
  Read(InputHandler);
  InputHandler += #10;
end;

procedure OutputHandler(Output: char);
begin
  Write(Output);
end;

begin
  InterpretFile('prime.bf', @InputHandler, @OutputHandler);

  ReadLn;
end.

