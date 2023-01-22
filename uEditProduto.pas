unit uEditProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.NumberBox;

type
  TfrmEditProduto = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtNome: TEdit;
    btnEditar: TButton;
    cbProdutos: TComboBox;
    qryGetData: TFDQuery;
    qryGetAttributes: TFDQuery;
    qryUpdate: TFDQuery;
    edtPreco: TNumberBox;
    edtQuant: TNumberBox;
    btnExcluir: TButton;
    qryDelete: TFDQuery;
    qryGetUser: TFDQuery;
    qryGetPermissao: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure cbProdutosChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditProduto: TfrmEditProduto;
  btnExcluirAllow: Boolean;

implementation

{$R *.dfm}

uses uDataModule, uMain;

procedure TfrmEditProduto.btnEditarClick(Sender: TObject);
var
  nome: String;
  preco: Double;
  quantidade: Integer;

begin
  nome := edtNome.Text;
  preco := edtPreco.ValueFloat;
  quantidade := edtQuant.ValueInt;

  if nome.IsEmpty then
  begin
    ShowMessage('Preencha todos os campos');
    Exit;
  end;

  if preco = 0 then
  begin
    ShowMessage('O campo Preço não pode contêr ser nulo');
    Exit;
  end;

  qryUpdate.ParamByName('nomeAtual').AsString := cbProdutos.Text;
  qryUpdate.ParamByName('nome').AsString := nome;
  qryUpdate.ParamByName('preco').AsFloat := preco;
  qryUpdate.ParamByName('quant').AsInteger := quantidade;

  try
    qryUpdate.Execute;
  except
  begin
    ShowMessage('Ocooreu um erro ao realizar a edição');
    Exit;
  end;
  end;

  ShowMessage('Dados atualizados com sucesso');

  cbprodutos.Items.Clear;
  FormCreate(TObject.Create);

  edtNome.Clear;
  edtPreco.Clear;
  edtQuant.Clear;
end;

procedure TfrmEditProduto.btnExcluirClick(Sender: TObject);
begin
  if Messagedlg('Realmente deseja excluir?', mtConfirmation, [mbOk, mbCancel], 0) = MrOk then
  begin
    qryGetAttributes.ParamByName('nome').AsString := cbProdutos.Text;
    qryGetAttributes.Open;

    qryDelete.ParamByName('id').AsInteger := qryGetAttributes.FieldValues['id'];

    qryGetAttributes.Close;

    try
      qryDelete.Execute;
    except
    begin
      ShowMessage('Ocorreu um erro ao deletar o produto');
      Exit;
    end;
    end;

    ShowMessage('Produto excluído com sucesso');
    Self.Close;
  end;
end;

procedure TfrmEditProduto.cbProdutosChange(Sender: TObject);
begin
  qryGetAttributes.ParamByName('nome').AsString := cbProdutos.Text;
  qryGetAttributes.Open;

  edtNome.Text := qryGetAttributes.FieldValues['nome'];
  edtPreco.Text := qryGetAttributes.FieldValues['preco'];
  edtQuant.Text := qryGetAttributes.FieldValues['estoque'];

  btnEditar.Enabled := true;

  if btnExcluirAllow then
    btnExcluir.Enabled := true;

  qryGetAttributes.Close;
end;

procedure TfrmEditProduto.FormCreate(Sender: TObject);
begin
  btnEditar.Enabled := false;
  btnExcluir.Enabled := false;
  qryGetData.Open;
  qryGetData.First;

  While not qryGetData.Eof do
  begin
    cbProdutos.Items.Add(qryGetData.FieldByName('nome').AsString);
    qryGetData.Next;
  end;

  qryGetData.Close;

  qryGetUser.ParamByName('nome').AsString := frmMain.user;
  qryGetUser.Open;

  qryGetPermissao.ParamByName('usuario').AsInteger := qryGetUser.FieldValues['id'];
  qryGetPermissao.Open;

  if qryGetPermissao.FieldValues['delete_produto'] then
    btnExcluirAllow := true

  else
    btnExcluirAllow := false;
end;

end.
