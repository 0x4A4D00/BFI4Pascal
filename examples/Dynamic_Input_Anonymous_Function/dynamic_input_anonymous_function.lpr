program Dynamic_Input_Anonymous_Function;

{                                                                                                       }
{  Title: Dynamic Input with Anonymous Functions Example                                                }
{  Description: This is a Pascal code sample for setting Input Dynamically with anonymous functions.    }
{  Author: 0x4A4D                                                                                       }
{                                                                                                       }

{$modeswitch anonymousfunctions}

uses
  BFI;

var
  InputHandler : function():string;

begin

  InputHandler := function():string
  begin
    ReadLn(Result);
  end;

  WriteLn(Interpret(',.', InputHandler));

  // OR

  WriteLn(Interpret(',.', function():string
                          begin
                            ReadLn(Result);
                          end));
  ReadLn;
end.

