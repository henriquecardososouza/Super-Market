object frmCadCliente: TfrmCadCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastrar Cliente'
  ClientHeight = 489
  ClientWidth = 614
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
    Width = 614
    Height = 60
    Align = alTop
    Caption = 'Cadastrar Cliente'
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
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object Label3: TLabel
      Left = 112
      Top = 200
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object edtNome: TEdit
      Left = 112
      Top = 59
      Width = 217
      Height = 21
      TabOrder = 0
    end
    object edtEmail: TEdit
      Left = 112
      Top = 139
      Width = 217
      Height = 21
      TabOrder = 1
    end
    object btnCadastrar: TButton
      Left = 112
      Top = 280
      Width = 217
      Height = 33
      Caption = 'Cadastrar'
      TabOrder = 2
      OnClick = btnCadastrarClick
    end
    object edtTelefone: TMaskEdit
      Left = 112
      Top = 219
      Width = 215
      Height = 21
      EditMask = '!\(99\)00000-0000;1;_'
      MaxLength = 14
      TabOrder = 3
      Text = '(  )     -    '
    end
  end
  object qryInsert: TFDQuery
    Connection = dmMain.connSuperMarket
    SQL.Strings = (
      
        'INSERT INTO clientes (nome, email, telefone) VALUES (:nome, :ema' +
        'il, :telefone)')
    Left = 80
    Top = 64
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EMAIL'
        ParamType = ptInput
      end
      item
        Name = 'TELEFONE'
        ParamType = ptInput
      end>
  end
end
