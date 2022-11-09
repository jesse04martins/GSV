unit View.Operacoes.interfaces;

interface

type
  iViewOperacao<T> = interface
    ['{94809F27-2282-44D5-9AE7-AC072A1ABB41}']
    procedure Execute(value : T);
    function GetValue : T;
  end;

implementation

end.
