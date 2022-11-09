unit Dao.FiltroPlanoContas;

interface

uses System.SysUtils, Interfaces, Model.Enum;

type
  TDaoFiltroPlanoContas = class(TInterfacedObject, iParametroSQL)
  private
    FFiltroSQL : string;
  public
    function ComCodigoPlano(value : integer) :  TDaoFiltroPlanoContas;
    function ComDescricaoPlano(value : string) : TDaoFiltroPlanoContas;
    function ComTipoPlano(value : TTipoPlanoConta) : TDaoFiltroPlanoContas;
    function ComDescriacao_TipoPlano(pDescricao : string; pTipo : TTipoPlanoConta) :  TDaoFiltroPlanoContas;
    function GetValue: string;
    destructor Destroy; override;

  end;

implementation

{ TDaoFiltroPlanoContas }

function TDaoFiltroPlanoContas.ComCodigoPlano(value: integer): TDaoFiltroPlanoContas;
begin
    FFiltroSQL := 'Where id_plano = ' + value.ToString;
    Result := Self;
end;

function TDaoFiltroPlanoContas.ComDescriacao_TipoPlano(pDescricao: string; pTipo: TTipoPlanoConta): TDaoFiltroPlanoContas;
begin
   FFiltroSQL := 'Where plano like ' + QuotedStr(pDescricao +'%') + 'and Tipo = ' + Integer(pTipo).ToString;
   Result := Self;
end;

function TDaoFiltroPlanoContas.ComDescricaoPlano(value: string): TDaoFiltroPlanoContas;
begin
   FFiltroSQL := 'Where plano like ' + QuotedStr(value +'%');
   Result := Self;
end;

function TDaoFiltroPlanoContas.ComTipoPlano(value: TTipoPlanoConta): TDaoFiltroPlanoContas;
begin
    FFiltroSQL := 'Where Tipo = ' + Integer(value).ToString;
    Result := Self;
end;

destructor TDaoFiltroPlanoContas.Destroy;
begin

  inherited;
end;

function TDaoFiltroPlanoContas.GetValue: string;
begin
    Result := FFiltroSQL;
end;

end.
