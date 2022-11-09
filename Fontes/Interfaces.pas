unit Interfaces;

interface

type
  IGetValueOperation<T> = interface
    ['{7FD1C0B0-4AD9-4F1A-A1B2-C2E5E3D8DB68}']
    function GetValue : T;
  end;

  IOperation<T> = interface
    ['{1B0DC181-743F-43F1-8A3A-85C43AB4A92A}']
    procedure Execute(value : T);
  end;

  IParametroSQL = interface(IGetValueOperation<String>) end;

implementation

end.
