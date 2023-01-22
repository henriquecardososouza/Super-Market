object frmConfigUser: TfrmConfigUser
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Configurar Usu'#225'rios'
  ClientHeight = 511
  ClientWidth = 593
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
    Width = 593
    Height = 60
    Align = alTop
    Caption = 'Configurar Usu'#225'rios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 583
  end
  object GroupBox1: TGroupBox
    Left = 64
    Top = 104
    Width = 465
    Height = 361
    TabOrder = 1
    object Label1: TLabel
      Left = 128
      Top = 40
      Width = 46
      Height = 13
      Caption = 'Usu'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 72
      Top = 96
      Width = 68
      Height = 13
      Caption = 'Permiss'#245'es:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbUsuarios: TComboBox
      Left = 196
      Top = 37
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnChange = cbUsuariosChange
    end
    object cbCadCliente: TCheckBox
      Left = 72
      Top = 128
      Width = 170
      Height = 17
      Caption = 'Pode cadastrar novos clientes'
      TabOrder = 1
    end
    object cbEditCliente: TCheckBox
      Left = 72
      Top = 162
      Width = 177
      Height = 17
      Caption = 'Pode editar o perfil de um cliente'
      TabOrder = 2
    end
    object cbEditProduto: TCheckBox
      Left = 272
      Top = 128
      Width = 153
      Height = 17
      Caption = 'Pode editar um produto'
      TabOrder = 3
    end
    object cbDeleteProduto: TCheckBox
      Left = 272
      Top = 162
      Width = 153
      Height = 17
      Caption = 'Pode excluir um produto'
      TabOrder = 4
    end
    object cbCadProduto: TCheckBox
      Left = 72
      Top = 240
      Width = 177
      Height = 17
      Caption = 'Pode cadastrar novos produtos'
      TabOrder = 5
    end
    object cbExport: TCheckBox
      Left = 272
      Top = 200
      Width = 145
      Height = 17
      Caption = 'Pode exportar dados'
      TabOrder = 6
    end
    object cbDeleteCliente: TCheckBox
      Left = 72
      Top = 200
      Width = 170
      Height = 17
      Caption = 'Pode excluir um cliente'
      TabOrder = 7
    end
    object cbCreateVenda: TCheckBox
      Left = 272
      Top = 240
      Width = 153
      Height = 17
      Caption = 'Pode registrar novas vendas'
      TabOrder = 8
    end
    object cbConfigUsers: TCheckBox
      Left = 72
      Top = 280
      Width = 245
      Height = 17
      Caption = 'Pode alterar permiss'#245'es de outros usu'#225'rios'
      TabOrder = 9
    end
    object btnSalvar: TButton
      Left = 376
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 10
      OnClick = btnSalvarClick
    end
  end
  object qryGetUsuarios: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      'SELECT * FROM usuarios')
    Left = 384
    Top = 64
  end
  object qryInsert: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      
        'UPDATE permissoes SET cad_cliente = :cad_cliente, edit_cliente =' +
        ' :edit_cliente, delete_cliente = :delete_cliente, cad_produto = ' +
        ':cad_produto, edit_produto = :edit_produto, delete_produto = :de' +
        'lete_produto, export_data = :export_data, config_users = :config' +
        '_users, realizar_venda = :realizar_venda WHERE usuario = :usuari' +
        'o')
    Left = 288
    Top = 64
    ParamData = <
      item
        Name = 'CAD_CLIENTE'
        ParamType = ptInput
      end
      item
        Name = 'EDIT_CLIENTE'
        ParamType = ptInput
      end
      item
        Name = 'DELETE_CLIENTE'
        ParamType = ptInput
      end
      item
        Name = 'CAD_PRODUTO'
        ParamType = ptInput
      end
      item
        Name = 'EDIT_PRODUTO'
        ParamType = ptInput
      end
      item
        Name = 'DELETE_PRODUTO'
        ParamType = ptInput
      end
      item
        Name = 'EXPORT_DATA'
        ParamType = ptInput
      end
      item
        Name = 'CONFIG_USERS'
        ParamType = ptInput
      end
      item
        Name = 'REALIZAR_VENDA'
        ParamType = ptInput
      end
      item
        Name = 'USUARIO'
        ParamType = ptInput
      end>
  end
  object qryGetPermissoes: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      'SELECT * FROM permissoes WHERE usuario = :usuario')
    Left = 192
    Top = 64
    ParamData = <
      item
        Name = 'USUARIO'
        ParamType = ptInput
      end>
  end
  object qryGetUser: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      'SELECT * FROM usuarios WHERE nome = :nome')
    Left = 96
    Top = 64
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end>
  end
end
