program FluxodeCaixa;

uses
  Vcl.Forms,
  View.Principal in 'Fontes\View.Principal.pas' {frmPrincipal},
  dbSQL.Interfaces in '..\dbSQL\dbSQL.Interfaces.pas',
  Dao.Interfaces in 'Fontes\Dao.Interfaces.pas',
  Model.Enum in 'Fontes\Model.Enum.pas',
  Dao.FiltroPlanoContas in 'Fontes\PlanoContas\Dao.FiltroPlanoContas.pas',
  Dao.PlanoContas in 'Fontes\PlanoContas\Dao.PlanoContas.pas',
  Model.PlanoContas in 'Fontes\PlanoContas\Model.PlanoContas.pas',
  View.PlanoConta in 'Fontes\PlanoContas\View.PlanoConta.pas' {frmPlanoContas},
  Dao.Empresa in 'Fontes\Empresa\Dao.Empresa.pas',
  Dao.FiltroEmpresa in 'Fontes\Empresa\Dao.FiltroEmpresa.pas',
  Model.Empresa in 'Fontes\Empresa\Model.Empresa.pas',
  Dao.FiltroFluxosCaixa in 'Fontes\FluxosCaixa\Dao.FiltroFluxosCaixa.pas',
  Dao.FluxosCaixa in 'Fontes\FluxosCaixa\Dao.FluxosCaixa.pas',
  Model.FluxosCaixa in 'Fontes\FluxosCaixa\Model.FluxosCaixa.pas',
  View.FormBase in 'Fontes\FormBase\View.FormBase.pas' {FrmBase},
  View.FormBaseCadastro in 'Fontes\FormBase\View.FormBaseCadastro.pas' {FrmBaseCadastro},
  View.FormBaseEditarCadastro in 'Fontes\FormBase\View.FormBaseEditarCadastro.pas' {FrmBaseEditarCadastro},
  View.PlanoConta.Editar in 'Fontes\PlanoContas\View.PlanoConta.Editar.pas' {FrmPlanoContasEditar},
  Controller.Interfaces in 'Fontes\Controller.Interfaces.pas',
  View.Operacoes.interfaces in 'Fontes\FormBase\View.Operacoes.interfaces.pas',
  Interfaces in 'Fontes\Interfaces.pas',
  View.Empresa in 'Fontes\Empresa\View.Empresa.pas' {FrmEmpresa},
  View.Empresa.Editar in 'Fontes\Empresa\View.Empresa.Editar.pas' {FrmEmpresaEditar},
  View.FluxosCaixa in 'Fontes\FluxosCaixa\View.FluxosCaixa.pas' {frmFluxosCaixa},
  View.FluxosCaixa.Editar in 'Fontes\FluxosCaixa\View.FluxosCaixa.Editar.pas' {frmFluxosCaixaEditar},
  dbSQL.FireDac.Connection in '..\dbSQL\FireDac\dbSQL.FireDac.Connection.pas',
  LerArquivoINI in '..\dbSQL\LerArquivoINI.pas',
  dbSQL.FireDac.SQLCommand in '..\dbSQL\FireDac\dbSQL.FireDac.SQLCommand.pas',
  Controller.PlanoContas in 'Fontes\PlanoContas\Controller.PlanoContas.pas',
  Controller.Empresa in 'Fontes\Empresa\Controller.Empresa.pas',
  Controller.FluxosCaixa in 'Fontes\FluxosCaixa\Controller.FluxosCaixa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmFluxosCaixaEditar, frmFluxosCaixaEditar);
  Application.Run;
end.
