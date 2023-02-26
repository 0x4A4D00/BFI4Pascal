program CommandLineParameter;

{                                                                                                       }
{  Title: Command lIne Parameters                                                                       }
{  Description: This is a Pascal code sample for Using Command lIne Parameters with interpreter         }
{  Author: 0x4A4D                                                                                       }
{  Run: ./CommandLineParameter '++++++[>++++++++++<-]>+++++.,.' 'B'                                     }
{  Output: AB                                                                                           }
{                                                                                                       }

uses
  BFI;

begin
  WriteLn(Interpret(ParamStr(1), ParamStr(2)));

  ReadLn;
end.

