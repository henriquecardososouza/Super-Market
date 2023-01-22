unit uEditCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask;

type
  TfrmEditCliente = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtNome: TEdit;
    edtEmail: TEdit;
    btnEditar: TButton;
    edtTelefone: TMaskEdit;
    qryGetData: TFDQuery;
    cbClientes: TComboBox;
    qryGetAttributes: TFDQuery;
    qryUpdate: TFDQuery;
    btnExcluir: TButton;
    qryDelete: TFDQuery;
    qryGetUser: TFDQuery;
    qryGetPermissao: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure cbClientesChange(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditCliente: TfrmEditCliente;
  btnExcluirAllow: Boolean;

implementation

{$R *.dfm}

uses uDataModule, uMain;

procedure TfrmEditCliente.btnEditarClick(Sender: TObject);
var
  nome: String;
  email: String;
  telefone: String;

begin
  nome := edtNome.Text;
  email := edtEmail.Text;
  telefone := edtTelefone.Text;

  if nome.IsEmpty or email.IsEmpty or telefone.IsEmpty then
  begin
    ShowMessage('Preencha todos os campos');
    Exit;
  end;

  qryUpdate.ParamByName('nomeAtual').AsString := cbClientes.Text;
  qryUpdate.ParamByName('nome').AsString := nome;
  qryUpdate.ParamByName('email').AsString := email;
  qryUpdate.ParamByName('telefone').AsString := telefone;

  try
    qryUpdate.Execute;
  except
  begin
    ShowMessage('Ocooreu um erro ao realizar a edição');
    Exit;
  end;
  end;

  ShowMessage('Dados atualizados com sucesso');

  cbClientes.Items.Clear;
  FormCreate(TObject.Create);

  edtNome.Clear;
  edtEmail.Clear;
  edtTelefone.Clear;
end;

procedure TfrmEditCliente.btnExcluirClick(Sender: TObject);
begin
  if Messagedlg('Realmente deseja excluir?', mtConfirmation, [mbOk, mbCancel], 0) = MrOk then
  begin
    qryGetAttributes.ParamByName('nome').AsString := cbClientes.Text;
    qryGetAttributes.Open;

    qryDelete.ParamByName('id').AsInteger := qryGetAttributes.FieldValues['id'];

    qryGetAttributes.Close;

    try
      qryDelete.Execute;
    except
    begin
      ShowMessage('Ocorreu um erro ao deletar o cliente');
      Exit;
    end;
    end;

    ShowMessage('Cliente excluído com sucesso');
    Self.Close;
  end;
end;

procedure TfrmEditCliente.cbClientesChange(Sender: TObject);
begin
  qryGetAttributes.ParamByName('nome').AsString := cbClientes.Text;
  qryGetAttributes.Open;

  edtNome.Text := qryGetAttributes.FieldValues['nome'];
  edtEmail.Text := qryGetAttributes.FieldValues['email'];
  edtTelefone.Text := qryGetAttributes.FieldValues['telefone'];

  btnEditar.Enabled := true;

  if btnExcluirAllow then
    btnExcluir.Enabled := true;

  qryGetAttributes.Close;
end;

procedure TfrmEditCliente.FormCreate(Sender: TObject);
begin
  btnEditar.Enabled := false;
  btnExcluir.Enabled := false;
  qryGetData.Open;
  qryGetData.First;

  While not qryGetData.Eof do
  begin
    cbClientes.Items.Add(qryGetData.FieldByName('nome').AsString);
    qryGetData.Next;
  end;

  qryGetData.Close;

  qryGetUser.ParamByName('nome').AsString := frmMain.user;
  qryGetUser.Open;

  qryGetPermissao.ParamByName('usuario').AsInteger := qryGetUser.FieldValues['id'];
  qryGetPermissao.Open;

  if qryGetPermissao.FieldValues['delete_cliente'] then
    btnExcluirAllow := true

  else
    btnExcluirAllow := false;
end;

end.
