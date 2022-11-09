unit Dao.Empresa;

interface

uses System.SysUtils, System.classes, interfaces, Dao.Interfaces, Model.Empresa,
     dbSQL.Interfaces, Data.DB;

type
   TDaoEmpresa = class(TInterfacedObject, IDaoRetornarDados, IDaoAtulizarDados<TModelEmpresa>)
   private
    FdbCommand : iDB_SQLCommand;
   public
    constructor Create(ADB_SQLCommand : iDB_SQLCommand);
    function Listar(pParametro : iParametroSQL) : TDataSet;
    procedure Inserir(pEntidade : TModelEmpresa);
    procedure Alterar(pEntidade : TModelEmpresa);
    procedure Excluir(pId : integer);

   end;
implementation

{ TDaoEmpresa }

constructor TDaoEmpresa.Create(ADB_SQLCommand: iDB_SQLCommand);
begin
   FdbCommand := ADB_SQLCommand;
end;

procedure TDaoEmpresa.Alterar(pEntidade: TModelEmpresa);
begin
   try

      pEntidade.Validar;

      FdbCommand.ExecutarSQL
         (
            'update EMPRESA set RAZAO_SOCIAL = ' + pEntidade.RazaoSocial.QuotedString + ', ' + sLineBreak +
            '    NOME_FANTASIA = ' + pEntidade.NomeFantasia.QuotedString + sLineBreak +
            'where (ID_EMPRESA = ' + pEntidade.IdEmpresa.ToString + ')'
         );
   except on e : Exception do
       begin
           raise Exception.Create(e.Message);
       end;
   end;

end;

procedure TDaoEmpresa.Excluir(pId: integer);
begin
   try
      FdbCommand.ExecutarSQL
         (
            'delete from empresa where (ID_EMPRESA = ' + pId.ToString + ')'
         );
   except on e : Exception do
       begin
           raise Exception.Create(e.Message);
       end;
   end;

end;

procedure TDaoEmpresa.Inserir(pEntidade: TModelEmpresa);
begin
   try
      pEntidade.Validar;

      FdbCommand.ExecutarSQL('insert into EMPRESA (RAZAO_SOCIAL, NOME_FANTASIA)' + sLineBreak +
                                'values (' + pEntidade.RazaoSocial.QuotedString+ ', ' + pEntidade.NomeFantasia.QuotedString +')');
   except on e : Exception do
       begin
           raise Exception.Create(e.Message);
       end;
   end;
end;

function TDaoEmpresa.Listar(pParametro : iParametroSQL): TDataSet;
var
   lParametro : string;
begin
   lParametro := '';

   if (Assigned(pParametro)) then begin
       lParametro := pParametro.GetValue;
   end;

   try
      Result := FdbCommand.ExecutarSelect('select ID_EMPRESA, RAZAO_SOCIAL, NOME_FANTASIA from EMPRESA ' + lParametro + ' order by razao_social');
   except on e : Exception do
       begin
           raise Exception.Create(e.Message);
       end;
   end;

end;

end.
