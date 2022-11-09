unit Controller.Empresa;

interface

uses System.Classes, System.SysUtils, Data.DB, Dao.Interfaces, Model.Empresa, Model.Enum;

type
  TControllerEmpresa = class
  private
    FDataSource : TDataSource;
    FDao : IDaoRetornarDados;
  public
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    function RetornaDataSource : TDataSource;
    procedure Salvar(value: TModelEmpresa; enumSalvar: TEnumSalvarDados);
    procedure Excluir;
    function VerificarSePossuiFluxosCaixa: Boolean;
  end;

implementation

{ TControllerEmpresa }

uses Dao.Empresa, Dao.FiltroEmpresa, Dao.FluxosCaixa, Dao.FiltroFluxosCaixa, dbSQL.FireDac.SQLCommand,
     dbSQL.FireDac.Connection;

constructor TControllerEmpresa.Create(AOwner: TComponent);
begin
   FDataSource := TDataSource.Create(AOwner);
   FDao        := TDaoEmpresa.Create(TFireDacSQLCommand.Create(AOwner, TFireDacConnection.GetInstance));
end;

destructor TControllerEmpresa.Destroy;
begin
   FreeAndNil(FDataSource);
   inherited;
end;

function TControllerEmpresa.RetornaDataSource: TDataSource;
begin
    FDataSource.DataSet := FDao.Listar(TDaoFiltroEmpresa.Create);
    Result := FDataSource;
end;

procedure TControllerEmpresa.Salvar(value: TModelEmpresa; enumSalvar: TEnumSalvarDados);
begin
   try
      value.Validar;

      case enumSalvar of
        enCadastrar: (FDao as IDaoAtulizarDados<TModelEmpresa>).Inserir(value);
        enCorrigir: (FDao as IDaoAtulizarDados<TModelEmpresa>).Alterar(value);
      end;
      FDataSource.DataSet.Refresh;
   except on e : Exception do
      begin
          raise Exception.Create(e.Message);
      end;
   end;

end;

function TControllerEmpresa.VerificarSePossuiFluxosCaixa: Boolean;
var
   lDaoFluxos : IDaoRetornarDados;
begin
   Result := False;

   try
      lDaoFluxos := TDaoFluxosCaixa.Create(TFireDacSQLCommand.Create(FDataSource.Owner, TFireDacConnection.GetInstance));

      Result := (lDaoFluxos.Listar(TDaoFiltroFluxosCaixa.Create.ComIdEmpresa(FDataSource.DataSet.FieldByName('id_empresa').AsInteger)).RecordCount >0)
   except on e : Exception do
      begin
         raise Exception.Create(e.Message);
      end;
   end;
end;

procedure TControllerEmpresa.Excluir;
begin
   try
      if (VerificarSePossuiFluxosCaixa) then
          raise Exception.Create('J� existe lan�amento de fluxos de caixa para esta empresa por isso n�o ser� poss�vel exclu�-la.');


      (FDao as IDaoAtulizarDados<TModelEmpresa>).Excluir(FDataSource.DataSet.FieldByName('id_empresa').AsInteger);
      FDataSource.DataSet.Refresh;
   except on e : Exception do
      begin
          raise Exception.Create(e.Message);
      end;
   end;
end;

end.
