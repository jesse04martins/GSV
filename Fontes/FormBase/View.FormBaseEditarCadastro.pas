unit View.FormBaseEditarCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.FormBase, Vcl.StdCtrls, Data.DB, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmBaseEditarCadastro = class(TFrmBase)
    pnlRodape: TPanel;
    btSalvar: TBitBtn;
    btCancelar: TBitBtn;
    procedure btCancelarClick(Sender: TObject);
  private

  protected
    procedure EventoSalvarCorrecao(Sender: TObject);
    procedure EventoSalvarInsercao(Sender: TObject);

  public
  end;

var
  FrmBaseEditarCadastro: TFrmBaseEditarCadastro;

implementation

{$R *.dfm}

procedure TFrmBaseEditarCadastro.btCancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmBaseEditarCadastro.EventoSalvarCorrecao(Sender: TObject);
begin

end;

procedure TFrmBaseEditarCadastro.EventoSalvarInsercao(Sender: TObject);
begin

end;

end.