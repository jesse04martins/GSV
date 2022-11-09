unit Dao.PlanoContas;

interface

uses System.SysUtils, System.classes, Model.PlanoContas, Dao.Interfaces, dbSQL.Interfaces, Data.DB,
     interfaces;

type
  TDaoPlanoConta = class(TInterfacedObject, IDaoRetornarDados, IDaoAtulizarDados<TModelPlanoContas>)
  private
    FdbCommand : iDB_SQLCommand;
    function Listar(pParametro : iParametroSQL = nil) : TDataSet;
    procedure Inserir(pPlanoContas: TModelPlanoContas);
    procedure Alterar(pPlanoContas: TModelPlanoContas);
    procedure Excluir(pIdPlano: Integer);
  public
    constructor Create(ADB_SQLCommand : iDB_SQLCommand);
    destructor Destroy; override;
  end;

implementation

{ TípoContaDao }

constructor TDaoPlanoConta.Create(ADB_SQLCommand: iDB_SQLCommand);
begin
   FdbCommand := ADB_SQLCommand;
end;

destructor TDaoPlanoConta.Destroy;
begin

  inherited;
end;

procedure TDaoPlanoConta.Alterar(pPlanoContas: TModelPlanoContas);
begin
   try
      pPlanoContas.Validar;

      FdbCommand.ExecutarSQL
         ('update PLANO_CONTAS' + sLineBreak +
          'set PLANO = ' + pPlanoContas.Plano.QuotedString + ',' + sLineBreak +
          '    TIPO  = ' + Integer(pPlanoContas.Tipo).ToString + sLineBreak +
          'where (ID_PLANO = ' + pPlanoContas.IdPlano.ToString +')'
         );
   except on e : Exception do
       begin
           raise Exception.Create(e.Message);
       end;
   end;
end;

procedure TDaoPlanoConta.Excluir(pIdPlano: Integer);
begin
   try
      FdbCommand.ExecutarSQL( 'delete from PLANO_CONTAS where (ID_PLANO = ' + pIdPlano.ToString +')');
   except on e : Exception do
       begin
           raise Exception.Create(e.Message);
       end;
   end;
end;

procedure TDaoPlanoConta.Inserir(pPlanoContas: TModelPlanoContas);
begin
   try
      pPlanoContas.Validar;

      FdbCommand.ExecutarSQL
      ('insert into PLANO_CONTAS (PLANO, TIPO)' + sLineBreak +
       'values (' + pPlanoContas.Plano.QuotedString + ', ' + Integer(pPlanoContas.Tipo).ToString +')'
      );
   except on e : Exception do
       begin
           raise Exception.Create(e.Message);
       end;
   end;

end;

function TDaoPlanoConta.Listar(pParametro : iParametroSQL): TDataSet;
var
   lParametro : string;
begin
   lParametro := '';

   if (Assigned(pParametro)) then begin
       lParametro := pParametro.GetValue;
   end;

   try
     Result := FdbCommand.ExecutarSelect('select ID_PLANO, PLANO, TIPO,' + sLineBreak +
                                          '      CASE WHEN TIPO = 1 THEN ''SAIDA'' ELSE ''ENTRADA'' END AS DESCRICAO_TIPO' + sLineBreak +
                                          'from PLANO_CONTAS ' + lParametro + ' order by plano');
   except on e : Exception do
       begin
           raise Exception.Create(e.Message);
       end;
   end;

end;

end.
