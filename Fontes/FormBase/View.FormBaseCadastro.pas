unit View.FormBaseCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.FormBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmBaseCadastro = class(TFrmBase)
    pnlBotao: TPanel;
    btNovo: TBitBtn;
    btCorrigir: TBitBtn;
    btExcluir: TBitBtn;
    btImprimir: TBitBtn;
    PnlPesquisar: TPanel;
    btPesquisar: TBitBtn;
    DBGrid1: TDBGrid;
    pnlRodape: TPanel;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBaseCadastro: TFrmBaseCadastro;

implementation

{$R *.dfm}

end.
