unit Controller.FluxosCaixa;

interface

uses System.Classes,  System.SysUtils, Data.DB, Model.FluxosCaixa, Dao.Interfaces, Model.Enum;

type
  TControllerFluxosCaixa = class
  private
    FDataSource : TDataSource;
    FDao : IDaoRetornarDados;
  public
    procedure Excluir;
    procedure Salvar(value: TModelFluxosCaixa; enumSalvar: TEnumSalvarDados);
  end;

implementation

{ TControllerFluxosCaixa }

procedure TControllerFluxosCaixa.Excluir;
begin

   try

      (FDao as IDaoAtulizarDados<TModelFluxosCaixa>).Excluir(FDataSource.DataSet.FieldByName('id_caixa').AsInteger);
      FDataSource.DataSet.Refresh;

   except on e : Exception do
      begin
          raise Exception.Create(e.Message);
      end;
   end;

end;

procedure TControllerFluxosCaixa.Salvar(value: TModelFluxosCaixa; enumSalvar: TEnumSalvarDados);
begin
   try
      value.Validar;

      case enumSalvar of
         enCadastrar: (FDao as IDaoAtulizarDados<TModelFluxosCaixa>).Inserir(value);
         enCorrigir: (FDao as IDaoAtulizarDados<TModelFluxosCaixa>).Alterar(value);
      end;

      FDataSource.DataSet.Refresh;

   except on e : Exception do
      begin
          raise Exception.Create(e.Message);
      end;
   end;

end;


end.
