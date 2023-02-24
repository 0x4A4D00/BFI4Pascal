{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit BFI4Pascal;

{$warn 5023 off : no warning about unused units}
interface

uses
  BFI, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('BFI4Pascal', @Register);
end.
