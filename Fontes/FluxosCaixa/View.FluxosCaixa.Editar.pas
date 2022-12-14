unit View.FluxosCaixa.Editar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RxToolEdit, RxCurrEdit, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, View.FormBaseEditarCadastro, Model.FluxosCaixa, Dao.Interfaces, Data.DB;

type
  TfrmFluxosCaixaEditar = class(TFrmBaseEditarCadastro)
    Label1: TLabel;
    cbPlanoContas: TComboBox;
    cbEmpresa: TComboBox;
    Label4: TLabel;
    dtpData: TDateTimePicker;
    Label2: TLabel;
    dtpHora: TDateTimePicker;
    Label3: TLabel;
    edtValor: TCurrencyEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtDescricao: TEdit;
    procedure FormShow(Sender: TObject);
  private
    FDao : IDaoAtulizarDados<TModelFluxosCaixa>;
    FModel : TModelFluxosCaixa;
    procedure EventoSalvarCorrecao(Sender: TObject);
    procedure EventoSalvarInsercao(Sender: TObject);

  public
    constructor Create(AOwner: TComponent; ADao : IDaoAtulizarDados<TModelFluxosCaixa>); overload;
    constructor Create(AOwner: TComponent; ADao : IDaoAtulizarDados<TModelFluxosCaixa>; ADataSet : TDataSet); overload;
  end;

var
  frmFluxosCaixaEditar: TfrmFluxosCaixaEditar;

implementation

{$R *.dfm}

{ TfrmFluxosCaixaEditar }

uses Model.Empresa, Model.PlanoContas;

constructor TfrmFluxosCaixaEditar.Create(AOwner: TComponent; ADao : IDaoAtulizarDados<TModelFluxosCaixa>);
begin
   inherited Create(AOwner);

   Self.Caption := 'Novo Lanšamento';

   FDao := ADao;
   FModel := TModelFluxosCaixa.Create;

   btSalvar.OnClick := EventoSalvarInsercao;
end;

constructor TfrmFluxosCaixaEditar.Create(AOwner: TComponent; ADao: IDaoAtulizarDados<TModelFluxosCaixa>; ADataSet: TDataSet);
begin
   inherited Create(AOwner);

   Self.Caption := 'Corrigir Lanšamento';

   FDao := ADao;
   FModel := TModelFluxosCaixa.Create;

   FModel.IdCaixa       := ADataSet.FieldByName('ID_CAIXA').AsInteger;
   FModel.IdEmpresa     := ADataSet.FieldByName('ID_EMPRESA').AsInteger;
   FModel.IdPlanoConta  := ADataSet.FieldByName('ID_PLANO').AsInteger;
   FModel.Data          := ADataSet.FieldByName('DATA').AsDateTime;
   FModel.Hora          := ADataSet.FieldByName('HORA').AsDateTime;
   FModel.DescricaoLanc := ADataSet.FieldByName('DESCRICAO_LANC').AsString;
   FModel.Valor         := ADataSet.FieldByName('ID_EMPRESA').AsFloat;

   btSalvar.OnClick := EventoSalvarInsercao;
end;


procedure TfrmFluxosCaixaEditar.EventoSalvarCorrecao(Sender: TObject);
begin
    FModel.IdEmpresa     := TModelEmpresa(cbEmpresa.ItemIndex).IdEmpresa;
    FModel.IdPlanoConta  := TModelPlanoContas(cbPlanoContas.ItemIndex).IdPlano;
    FModel.Data          := dtpData.DateTime;
    FModel.Hora          := dtpHora.Time;
    FModel.DescricaoLanc := edtDescricao.Text;
    FModel.Valor         := edtValor.Value;

    try
       FDao.Alterar(FModel);
    except on e : Exception do
       begin
          Application.MessageBox(PChar(e.Message), 'Aviso', MB_ICONEXCLAMATION);
       end;
    end;
    ModalResult := mrOk;
end;

procedure TfrmFluxosCaixaEditar.EventoSalvarInsercao(Sender: TObject);
begin
    FModel.IdEmpresa     := TModelEmpresa(cbEmpresa.ItemIndex).IdEmpresa;
    FModel.IdPlanoConta  := TModelPlanoContas(cbPlanoContas.ItemIndex).IdPlano;
    FModel.Data          := dtpData.DateTime;
    FModel.Hora          := dtpHora.Time;
    FModel.DescricaoLanc := edtDescricao.Text;
    FModel.Valor         := edtValor.Value;

    try
       FDao.Inserir(FModel);
    except on e : Exception do
       begin
          Application.MessageBox(PChar(e.Message), 'Aviso', MB_ICONEXCLAMATION);
       end;
    end;
    ModalResult := mrOk;
end;

procedure TfrmFluxosCaixaEditar.FormShow(Sender: TObject);
begin
   cbEmpresa.ItemIndex     := 0;
   cbPlanoContas.ItemIndex := 0;
   dtpData.DateTime        := FModel.Data;
   dtpHora.Time            := FModel.Hora;
   edtDescricao.Text       := FModel.DescricaoLanc;
   edtValor.Value          := FModel.Valor;
end;

end.
