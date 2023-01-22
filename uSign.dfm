object frmSign: TfrmSign
  Left = 583
  Top = 207
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastrar'
  ClientHeight = 261
  ClientWidth = 210
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 29
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = edtNome
  end
  object Label2: TLabel
    Left = 24
    Top = 88
    Width = 24
    Height = 13
    Caption = 'Email'
    FocusControl = edtEmail
  end
  object Label3: TLabel
    Left = 24
    Top = 144
    Width = 30
    Height = 13
    Caption = 'Senha'
    FocusControl = edtSenha
  end
  object edtNome: TDBEdit
    Left = 24
    Top = 48
    Width = 161
    Height = 21
    DataField = 'nome'
    DataSource = DataSource1
    TabOrder = 0
  end
  object edtEmail: TDBEdit
    Left = 24
    Top = 104
    Width = 161
    Height = 21
    DataField = 'email'
    DataSource = DataSource1
    TabOrder = 1
  end
  object edtSenha: TDBEdit
    Left = 24
    Top = 160
    Width = 161
    Height = 21
    DataField = 'senha'
    DataSource = DataSource1
    PasswordChar = '*'
    TabOrder = 2
  end
  object btnCadastrar: TButton
    Left = 24
    Top = 208
    Width = 161
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 3
    OnClick = btnCadastrarClick
  end
  object qryInsert: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      'SELECT * FROM usuarios')
    Left = 176
    Top = 8
    object qryInsertid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryInsertnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 200
    end
    object qryInsertemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Required = True
      Size = 200
    end
    object qryInsertsenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = qryInsert
    Left = 144
    Top = 8
  end
  object qryAux: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      'SELECT * FROM usuarios WHERE nome = :nome AND email = :email')
    Left = 112
    Top = 8
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        Name = 'EMAIL'
        ParamType = ptInput
      end>
  end
  object qryPermissao: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      
        'INSERT INTO permissoes (id, usuario, cad_cliente, edit_cliente, ' +
        'delete_cliente, cad_produto, edit_produto, delete_produto, expor' +
        't_data, config_users, realizar_venda) VALUES (NULL, :id, false, ' +
        'false, false, false, false, false, false, :configUsers, false);')
    Left = 80
    Top = 8
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end
      item
        Name = 'CONFIGUSERS'
        ParamType = ptInput
      end>
  end
  object qryRepeatUser: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      'SELECT * FROM usuarios WHERE nome = :nome')
    Left = 48
    Top = 8
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end>
  end
  object qryAdmin: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      'SELECT usuario FROM permissoes WHERE config_users = true')
    Left = 16
    Top = 8
  end
end
