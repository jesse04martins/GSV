inherited FrmEmpresa: TFrmEmpresa
  Caption = 'Cadastro de Empresa'
  ClientHeight = 317
  ClientWidth = 475
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 491
  ExplicitHeight = 356
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotao: TPanel
    Width = 475
    ExplicitWidth = 417
    inherited btNovo: TBitBtn
      OnClick = btNovoClick
    end
    inherited btCorrigir: TBitBtn
      OnClick = btCorrigirClick
    end
    inherited btExcluir: TBitBtn
      OnClick = btExcluirClick
    end
  end
  inherited PnlPesquisar: TPanel
    Width = 475
    Visible = False
    ExplicitWidth = 417
    inherited btPesquisar: TBitBtn
      Left = 379
      OnClick = btPesquisarClick
      ExplicitLeft = 321
    end
  end
  inherited DBGrid1: TDBGrid
    Width = 475
    Height = 244
    DataSource = nil
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_EMPRESA'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZAO_SOCIAL'
        Title.Caption = 'Raz'#227'o Social'
        Width = 329
        Visible = True
      end>
  end
  inherited pnlRodape: TPanel
    Top = 313
    Width = 475
    ExplicitTop = 358
    ExplicitWidth = 417
  end
end
