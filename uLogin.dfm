object frmLogin: TfrmLogin
  Left = 470
  Top = 192
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Entrar'
  ClientHeight = 231
  ClientWidth = 207
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 20
  Padding.Top = 20
  Padding.Right = 20
  Padding.Bottom = 20
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 23
    Top = 23
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 23
    Top = 79
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object btnEntrar: TButton
    Left = 23
    Top = 138
    Width = 161
    Height = 25
    Caption = 'Entrar'
    TabOrder = 0
    OnClick = btnEntrarClick
  end
  object btnCadastrar: TButton
    Left = 23
    Top = 173
    Width = 161
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 1
    OnClick = btnCadastrarClick
  end
  object edtSenha: TEdit
    Left = 23
    Top = 98
    Width = 161
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object edtNome: TEdit
    Left = 23
    Top = 42
    Width = 161
    Height = 21
    TabOrder = 3
  end
  object query1: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      'Select * FROM usuarios WHERE nome = :nome')
    Left = 152
    Top = 8
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
        Value = Null
      end>
  end
end
