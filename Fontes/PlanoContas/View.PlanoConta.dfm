inherited frmPlanoContas: TfrmPlanoContas
  BorderStyle = bsDialog
  Caption = 'Plano de Contas'
  ClientHeight = 316
  ClientWidth = 533
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 539
  ExplicitHeight = 345
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotao: TPanel
    Width = 533
    ExplicitWidth = 454
    inherited btNovo: TBitBtn
      OnClick = btNovoClick
    end
    inherited btCorrigir: TBitBtn
      Width = 90
      OnClick = btCorrigirClick
      ExplicitWidth = 90
    end
    inherited btExcluir: TBitBtn
      Left = 168
      Width = 83
      OnClick = btExcluirClick
      ExplicitLeft = 168
      ExplicitWidth = 83
    end
    inherited btImprimir: TBitBtn
      Left = 251
      Width = 96
      ExplicitLeft = 251
      ExplicitWidth = 96
    end
  end
  inherited PnlPesquisar: TPanel
    Width = 533
    ExplicitWidth = 454
    object Label1: TLabel [0]
      Left = 7
      Top = 9
      Width = 92
      Height = 13
      Caption = 'Plano de Conta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    inherited btPesquisar: TBitBtn
      Left = 435
      Width = 98
      TabOrder = 1
      OnClick = btPesquisarClick
      ExplicitLeft = 356
      ExplicitWidth = 98
    end
    object edtPesquisar: TEdit
      Left = 115
      Top = 4
      Width = 213
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  inherited DBGrid1: TDBGrid
    Width = 533
    Height = 243
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Verdana'
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_PLANO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLANO'
        Title.Caption = 'Plano Conta'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO_TIPO'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Width = 100
        Visible = True
      end>
  end
  inherited pnlRodape: TPanel
    Top = 312
    Width = 533
    ExplicitTop = 263
    ExplicitWidth = 454
  end
end
