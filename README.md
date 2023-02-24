# BFI4Pascal
### BFI4P is a simple brain f*ck interpreter for Pascal,that can be used in Standard Pascal, Objpas(FPC) and Delphi.

<br />

## Usage
### You can extract src folder to your project main folder or simply just install lpk package file in Lazarus and then use BFI unit.

```Pascal
program Caesar_Cipher;

uses
  BFI;

begin

  // Caesar cipher encoder by 3 right shifts 
  WriteLn(Interpret(',[+++.>,]', 'Hello'));
  
end.

```


# Defines

<br />

| Define | Usage |
| ------ | ------ |
| ConsoleMode | If you are working in console environment you can define this for ignore eol (#13#10) at input.   |
| Debug | For debugging :) |

## License
- Feel free to edit and contribute, this project is license free :)
