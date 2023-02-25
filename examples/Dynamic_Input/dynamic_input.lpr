program Dynamic_Input;

{                                                                                                       }
{  Title: Dynamic Input Example                                                                         }
{  Description: This is a Pascal code sample for setting Input Dynamically.                             }
{  Author: 0x4A4D                                                                                       }
{                                                                                                       }


uses
  BFI;

function InputHandler():string;
var
  input : string;
begin
  ReadLn(input);

  InputHandler := input;

  (*
  Also in Objpas and Delphi you can set result directly
  ReadLn(Result);
  *)
end;

begin

  WriteLn(Interpret(',.', @InputHandler));

  ReadLn;

end.

