inherited frmFluxosCaixaEditar: TfrmFluxosCaixaEditar
  Caption = 'Lan'#231'ar Fluxos de Caixa'
  ClientHeight = 213
  ClientWidth = 511
  OnShow = FormShow
  ExplicitWidth = 517
  ExplicitHeight = 242
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 20
    Top = 56
    Width = 74
    Height = 13
    Caption = 'Plano Conta:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel [1]
    Left = 35
    Top = 24
    Width = 55
    Height = 13
    Caption = 'Empresa:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [2]
    Left = 351
    Top = 24
    Width = 32
    Height = 13
    Caption = 'Data:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [3]
    Left = 351
    Top = 57
    Width = 32
    Height = 13
    Caption = 'Hora:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel [4]
    Left = 56
    Top = 121
    Width = 34
    Height = 13
    Caption = 'Valor:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel [5]
    Left = 29
    Top = 90
    Width = 61
    Height = 13
    Caption = 'Descri'#231#227'o:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  inherited pnlRodape: TPanel
    Top = 157
    Width = 511
    ExplicitTop = 157
    ExplicitWidth = 511
    inherited btSalvar: TBitBtn
      Left = 267
      ExplicitLeft = 267
    end
    inherited btCancelar: TBitBtn
      Left = 387
      ExplicitLeft = 387
    end
  end
  object cbPlanoContas: TComboBox
    Left = 100
    Top = 49
    Width = 223
    Height = 21
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object cbEmpresa: TComboBox
    Left = 100
    Top = 17
    Width = 223
    Height = 21
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object dtpData: TDateTimePicker
    Left = 395
    Top = 17
    Width = 91
    Height = 21
    Date = 44768.836791886580000000
    Time = 44768.836791886580000000
    Enabled = False
    TabOrder = 3
  end
  object dtpHora: TDateTimePicker
    Left = 395
    Top = 49
    Width = 91
    Height = 21
    Date = 44768.836791886580000000
    Time = 44768.836791886580000000
    Enabled = False
    Kind = dtkTime
    TabOrder = 4
  end
  object edtValor: TCurrencyEdit
    Left = 100
    Top = 114
    Width = 108
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object edtDescricao: TEdit
    Left = 100
    Top = 82
    Width = 386
    Height = 21
    MaxLength = 255
    TabOrder = 6
    Text = 'edtDescricao'
  end
end
