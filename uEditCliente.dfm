object frmEditCliente: TfrmEditCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Editar Cliente'
  ClientHeight = 567
  ClientWidth = 587
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
    Width = 587
    Height = 60
    Align = alTop
    Caption = 'Editar Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 71
    Top = 104
    Width = 449
    Height = 425
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 112
      Top = 80
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 112
      Top = 160
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object Label3: TLabel
      Left = 112
      Top = 240
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object edtNome: TEdit
      Left = 112
      Top = 99
      Width = 217
      Height = 21
      TabOrder = 0
    end
    object edtEmail: TEdit
      Left = 112
      Top = 179
      Width = 217
      Height = 21
      TabOrder = 1
    end
    object btnEditar: TButton
      Left = 112
      Top = 320
      Width = 217
      Height = 33
      Caption = 'Editar'
      TabOrder = 2
      OnClick = btnEditarClick
    end
    object edtTelefone: TMaskEdit
      Left = 112
      Top = 259
      Width = 215
      Height = 21
      EditMask = '!\(99\)00000-0000;1;_'
      MaxLength = 14
      TabOrder = 3
      Text = '(  )     -    '
    end
    object cbClientes: TComboBox
      Left = 112
      Top = 32
      Width = 217
      Height = 21
      Style = csDropDownList
      TabOrder = 4
      OnChange = cbClientesChange
    end
    object btnExcluir: TButton
      Left = 112
      Top = 368
      Width = 217
      Height = 33
      Caption = 'Excluir'
      TabOrder = 5
      OnClick = btnExcluirClick
    end
  end
  object qryGetData: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      'SELECT nome FROM clientes')
    Left = 344
    Top = 64
  end
  object qryGetAttributes: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      'SELECT * FROM clientes WHERE nome = :nome')
    Left = 264
    Top = 64
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end>
  end
  object qryUpdate: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      
        'UPDATE clientes SET nome = :nome, email = :email, telefone = :te' +
        'lefone WHERE nome = :nomeAtual')
    Left = 184
    Top = 64
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        Name = 'EMAIL'
        ParamType = ptInput
      end
      item
        Name = 'TELEFONE'
        ParamType = ptInput
      end
      item
        Name = 'NOMEATUAL'
        ParamType = ptInput
      end>
  end
  object qryDelete: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      'DELETE FROM clientes WHERE id = :id')
    Left = 416
    Top = 64
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object qryGetUser: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      'SELECT * FROM usuarios WHERE nome = :nome')
    Left = 120
    Top = 64
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end>
  end
  object qryGetPermissao: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      'SELECT * FROM permissoes WHERE usuario = :usuario')
    Left = 48
    Top = 64
    ParamData = <
      item
        Name = 'USUARIO'
        ParamType = ptInput
      end>
  end
end
