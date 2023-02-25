# BFI4Pascal
### BFI4P is a simple brain f*ck interpreter for Pascal,that can be used in Standard Pascal, Objpas(FPC) and Delphi.


![version](https://badgen.net/badge/version/1.0.4/blue)<br />
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/0x4A4D00/BFI4Pascal)<br />
![Github lines of code](https://badgen.net/badge/total%20lines/320/blue)

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
