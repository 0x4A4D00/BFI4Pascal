# BFI4Pascal
### BFI4P is a simple brain f*ck interpreter for Pascal,that can be used in both Objpas(FPC) and Delphi.


![version](https://badgen.net/badge/version/1.0.7/red?style=flat-square)<br />
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/0x4A4D00/BFI4Pascal?style=flat-square)<br />
![Github lines of code](https://badgen.net/badge/total%20lines/399/green?style=flat-square) <br />
[![license](https://badgen.net/badge/license/MIT-0/477?style=flat-square)](https://github.com/0x4A4D00/BFI4Pascal/blob/main/LICENSE)

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

## Defines

<br />

| Define | Usage |
| ------ | ------ |
| Mode16 | Using Sequence of 1-4 bytes for each Character Instead of Using 8 bits Characters(ASCII -> UTF8). |
| Optimization | By Passing some Branches to Speedup the Interpreter around 10-25 Percents.(Different in 8/16 bits Modes) | 
| Debug | For Debugging.|

#### Note
- There is no need to Define Mode16 in GUI Applications. 

## License
- This "Software" is Licensed Under `MIT No Attribution License (MIT-0)`.
