object frmCadProduto: TfrmCadProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastrar Produto'
  ClientHeight = 499
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 60
    Align = alTop
    Caption = 'Cadastrar Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 80
    Top = 104
    Width = 449
    Height = 337
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 112
      Top = 40
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 112
      Top = 120
      Width = 27
      Height = 13
      Caption = 'Pre'#231'o'
    end
    object Label3: TLabel
      Left = 112
      Top = 200
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object edtNome: TEdit
      Left = 112
      Top = 59
      Width = 217
      Height = 21
      TabOrder = 0
    end
    object btnCadastrar: TButton
      Left = 112
      Top = 280
      Width = 217
      Height = 33
      Caption = 'Cadastrar'
      TabOrder = 1
      OnClick = btnCadastrarClick
    end
    object edtQuant: TNumberBox
      Left = 112
      Top = 219
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edtPreco: TNumberBox
      Left = 112
      Top = 139
      Width = 121
      Height = 21
      Mode = nbmFloat
      TabOrder = 3
    end
  end
  object qryInsert: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      
        'INSERT INTO produtos (nome, preco, estoque) VALUES (:nome, :prec' +
        'o, :estoque)')
    Left = 80
    Top = 64
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PRECO'
        ParamType = ptInput
      end
      item
        Name = 'ESTOQUE'
        ParamType = ptInput
      end>
  end
end
