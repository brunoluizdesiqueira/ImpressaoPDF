object frmPrincipal: TfrmPrincipal
  Left = 498
  Top = 353
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = 'Teste de Impress'#227'o de Danfe'
  ClientHeight = 142
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 16
    Width = 112
    Height = 13
    Caption = 'Selecione a impressora:'
  end
  object Label2: TLabel
    Left = 11
    Top = 65
    Width = 121
    Height = 13
    Caption = 'Caminho do PDF (Danfe):'
  end
  object edtNmArquivoPDF: TEdit
    Left = 9
    Top = 84
    Width = 535
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
  end
  object btnAbrir: TButton
    Left = 549
    Top = 83
    Width = 20
    Height = 20
    Caption = '...'
    TabOrder = 1
    OnClick = btnAbrirClick
  end
  object btnImprimir: TButton
    Left = 495
    Top = 115
    Width = 75
    Height = 25
    Caption = '&Imprimir'
    TabOrder = 2
    OnClick = btnImprimirClick
  end
  object cbxImpressoraEmpresa: TComboBox
    Left = 8
    Top = 40
    Width = 561
    Height = 21
    ItemHeight = 13
    TabOrder = 3
  end
  object dlgOpen1: TOpenDialog
    Left = 545
    Top = 65535
  end
end
