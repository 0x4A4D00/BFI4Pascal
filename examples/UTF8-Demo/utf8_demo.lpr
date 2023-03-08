program utf8_demo;

{                                                                                                       }
{  Title: UTF8 Demo                                                                         			}
{  Description: This is a Pascal code sample for using Persian Characters with UTF8 encoding.			}
{  Author: 0x4A4D                                                                                       }
{                                                                                                       }


uses
  BFI;

begin
  WriteLn(UTF8Encode(Interpret(',[>,]<[.<]', 'سلام فارسی!')));

  ReadLn;
end.

