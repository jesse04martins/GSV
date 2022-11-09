unit Dao.FiltroEmpresa;

interface

uses System.SysUtils, Interfaces;

type
  TDaoFiltroEmpresa = class(TInterfacedObject, iParametroSQL)
  private
    FFiltroSQL : string;
  public
    function ComCodigoEmpres(value : integer) :  TDaoFiltroEmpresa;
    function ComRazaoSocial(value : string) : TDaoFiltroEmpresa;
    function ComRazaoNomeFantasia(value : string) : TDaoFiltroEmpresa;
    function GetValue: string;
    destructor Destroy; override;

  end;


implementation

{ TDaoFiltroEmpresa }

function TDaoFiltroEmpresa.ComCodigoEmpres(value: integer) : TDaoFiltroEmpresa;
begin
   FFiltroSQL := 'where id_empresa = ' + value.ToString;
   Result := Self;
end;

function TDaoFiltroEmpresa.ComRazaoNomeFantasia(value: string): TDaoFiltroEmpresa;
begin
   FFiltroSQL := 'where RAZAO_SOCIAL like ' + QuotedStr(value + '%');
end;

function TDaoFiltroEmpresa.ComRazaoSocial(value: string): TDaoFiltroEmpresa;
begin
   FFiltroSQL := 'where NOME_FANTASIA like ' + QuotedStr(value + '%')
end;

destructor TDaoFiltroEmpresa.Destroy;
begin

  inherited;
end;

function TDaoFiltroEmpresa.GetValue: string;
begin
   Result := Self.FFiltroSQL;
end;

end.
