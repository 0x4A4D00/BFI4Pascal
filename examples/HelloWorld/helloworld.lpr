program HelloWorld;

{                                                                                                       }
{  Title: Hello World!                                                                                  }
{  Description: This is a Pascal code sample for Writing Hello World in Brain F*ck with                 }
{               file handler and code interpreter.                                                      }
{  Author: 0x4A4D                                                                                       }
{                                                                                                       }

uses
  BFI;

begin

  WriteLn(Interpret(
  '+++++++[>++++++++++<-]>++.'+
  '>+++[<++++++++++>-]<-.'+
  '+++++++..'+
  '+++.'+
  '>++++[>++++++++++<-]>++++.'+
  '------------.'+
  '<++++++++[>>++++++++++<<-]>>+++++++.'+
  '<<<.'+
  '+++.'+
  '------.'+
  '--------.'+
  '>>+.'));

  // OR

  WriteLn(InterpretFile('HelloWorld.bf'));

  ReadLn;
end.

