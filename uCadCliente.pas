unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask;

type
  TfrmCadCliente = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtNome: TEdit;
    Label1: TLabel;
    edtEmail: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    btnCadastrar: TButton;
    qryInsert: TFDQuery;
    edtTelefone: TMaskEdit;
    procedure btnCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

uses uDataModule;

procedure TfrmCadCliente.btnCadastrarClick(Sender: TObject);
var
  nome: String;
  email: String;
  telefone: String;

begin
  nome := edtNome.Text;
  email := edtEmail.Text;
  telefone := edtTelefone.Text;

  qryInsert.ParamByName('nome').AsString := nome;
  qryInsert.ParamByName('email').AsString := email;
  qryInsert.ParamByName('telefone').AsString := telefone;

  if nome.IsEmpty or email.IsEmpty or telefone.IsEmpty then
  begin
    ShowMessage('Preencha todos os campos');
    Exit;
  end;

  try
    qryInsert.Execute;
  except
  begin
    ShowMessage('Ocorreu um erro ao realizar o cadastro');
    Exit;
  end;
  end;

  ShowMessage('Cadastro conclu�do com sucesso');

  if Messagedlg('Deseja realizar mais um cadastro?', mtConfirmation, [mbOk, mbCancel], 0) = MrCancel then
    Self.Close;

end;

end.
