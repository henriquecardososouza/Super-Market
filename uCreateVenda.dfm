object frmCreateVenda: TfrmCreateVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Registrar Venda'
  ClientHeight = 440
  ClientWidth = 571
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 571
    Height = 60
    Align = alTop
    Caption = 'Registrar Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 519
  end
  object GroupBox1: TGroupBox
    Left = 64
    Top = 112
    Width = 441
    Height = 273
    TabOrder = 1
    object Label1: TLabel
      Left = 136
      Top = 32
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object Label2: TLabel
      Left = 136
      Top = 96
      Width = 38
      Height = 13
      Caption = 'Produto'
    end
    object Label3: TLabel
      Left = 136
      Top = 160
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object cbCliente: TComboBox
      Left = 136
      Top = 51
      Width = 177
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
    object cbProduto: TComboBox
      Left = 136
      Top = 115
      Width = 177
      Height = 21
      Style = csDropDownList
      TabOrder = 1
    end
    object edtQuant: TNumberBox
      Left = 136
      Top = 179
      Width = 177
      Height = 21
      TabOrder = 2
    end
    object btnRegistrar: TButton
      Left = 238
      Top = 224
      Width = 75
      Height = 25
      Caption = 'Registrar'
      TabOrder = 3
      OnClick = btnRegistrarClick
    end
  end
  object qryGetClientes: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      'SELECT * FROM clientes')
    Left = 200
    Top = 72
  end
  object qryGetProdutos: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      'SELECT * FROM produtos')
    Left = 280
    Top = 72
  end
  object qryInsert: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      
        'INSERT INTO vendas (cliente, produto, quantidade, valor) VALUES ' +
        '(:cliente, :produto, :quantidade, :valor)')
    Left = 352
    Top = 72
    ParamData = <
      item
        Name = 'CLIENTE'
        ParamType = ptInput
      end
      item
        Name = 'PRODUTO'
        ParamType = ptInput
      end
      item
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end
      item
        Name = 'VALOR'
        ParamType = ptInput
      end>
  end
  object qryGetProduto: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      'SELECT * FROM produtos WHERE nome = :nome')
    Left = 416
    Top = 72
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end>
  end
  object qryGetCliente: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      'SELECT * FROM clientes WHERE nome = :nome')
    Left = 120
    Top = 72
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end>
  end
  object qryUpdateProduto: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      
        'UPDATE produtos SET nome = :nome, preco = :preco, estoque = :qua' +
        'ntidade WHERE id = :id')
    Left = 488
    Top = 72
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        Name = 'PRECO'
        ParamType = ptInput
      end
      item
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
