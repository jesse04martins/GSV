unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  RxToolEdit, RxCurrEdit, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    mnPlanoContas: TSpeedButton;
    mnFluxosCaixa: TSpeedButton;
    mnEmpresa: TSpeedButton;
    procedure mnPlanoContasClick(Sender: TObject);
    procedure mnFluxosCaixaClick(Sender: TObject);
    procedure mnEmpresaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses View.PlanoConta, View.FluxosCaixa, View.Empresa;

procedure TfrmPrincipal.mnEmpresaClick(Sender: TObject);
var
   lForm : TFrmEmpresa;
begin
   lForm := TFrmEmpresa.Create(self);
   try
     lForm.ShowModal;
   finally
     FreeAndNil(lForm);
   end;

end;

procedure TfrmPrincipal.mnFluxosCaixaClick(Sender: TObject);
var
   lForm : TfrmFluxosCaixa;
begin
   lForm := TfrmFluxosCaixa.Create(self);
   try
     lForm.ShowModal;
   finally
     FreeAndNil(lForm);
   end;
end;

procedure TfrmPrincipal.mnPlanoContasClick(Sender: TObject);
var
   lFrmPlanoContas : TfrmPlanoContas;
begin
   lFrmPlanoContas := TfrmPlanoContas.Create(self);
   try
      lFrmPlanoContas.ShowModal;
   finally
      FreeAndNil(lFrmPlanoContas);
   end;
end;

end.
