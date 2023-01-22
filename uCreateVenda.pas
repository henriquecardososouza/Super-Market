unit uCreateVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.NumberBox,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmCreateVenda = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cbCliente: TComboBox;
    Label2: TLabel;
    cbProduto: TComboBox;
    Label3: TLabel;
    edtQuant: TNumberBox;
    btnRegistrar: TButton;
    qryGetClientes: TFDQuery;
    qryGetProdutos: TFDQuery;
    qryInsert: TFDQuery;
    qryGetProduto: TFDQuery;
    qryGetCliente: TFDQuery;
    qryUpdateProduto: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnRegistrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreateVenda: TfrmCreateVenda;

implementation

{$R *.dfm}

uses uDataModule;

procedure TfrmCreateVenda.btnRegistrarClick(Sender: TObject);
var
  cliente: String;
  produto: String;
  quantidade: Integer;

begin
  cliente := cbCliente.Text;
  produto := cbProduto.Text;
  quantidade := edtQuant.ValueInt;

  if cliente.IsEmpty then
  begin
    ShowMessage('Escolha uma op��o para o campo Cliente');
    Exit;
  end;

  if produto.IsEmpty then
  begin
    ShowMessage('Escolha uma op��o para o campo Produto');
    Exit;
  end;

  if quantidade = 0 then
  begin
    ShowMessage('A quantidade de produtos deve ser maior que 0');
    Exit;
  end;

  qryGetProduto.ParamByName('nome').AsString := produto;
  qryGetProduto.Open;

  if (quantidade > qryGetProduto.FieldValues['estoque']) then
  begin
    ShowMessage('A quantidade vendida excede a quantidade em estoque');
    qryGetProduto.Close;
    Exit;
  end;

  qryGetCliente.ParamByName('nome').AsString := cliente;
  qryGetCliente.Open;

  qryInsert.ParamByName('cliente').AsInteger := qryGetCliente.FieldValues['id'];
  qryInsert.ParamByName('produto').AsInteger := qryGetProduto.FieldValues['id'];
  qryInsert.ParamByName('quantidade').AsInteger := quantidade;
  qryInsert.ParamByName('valor').AsFloat := quantidade * qryGetProduto.FieldValues['preco'];

  qryGetCliente.Close;

  try
    qryInsert.Execute;
  except
  begin
    qryGetProduto.Close;
    ShowMessage('Ocorreu um erro ao registrar a venda');
    Exit;
  end;
  end;

  ShowMessage('Venda registrada com sucesso');

  qryUpdateProduto.ParamByName('nome').AsString := qryGetProduto.FieldValues['nome'];
  qryUpdateProduto.ParamByName('preco').AsString := qryGetProduto.FieldValues['preco'];
  qryUpdateProduto.ParamByName('quantidade').AsString := qryGetProduto.FieldValues['estoque'] - quantidade;
  qryUpdateProduto.ParamByName('id').AsString := qryGetProduto.FieldValues['id'];

  qryUpdateProduto.Execute;

  qryGetProduto.Close;
end;

procedure TfrmCreateVenda.FormCreate(Sender: TObject);
begin
  qryGetClientes.Open;
  qryGetClientes.First;

  While not qryGetClientes.Eof do
  begin
    cbCliente.Items.Add(qryGetClientes.FieldByName('nome').AsString);
    qryGetClientes.Next;
  end;

  qryGetClientes.Close;

  qryGetProdutos.Open;
  qryGetProdutos.First;

  While not qryGetProdutos.Eof do
  begin
    cbProduto.Items.Add(qryGetProdutos.FieldByName('nome').AsString);
    qryGetProdutos.Next;
  end;

  qryGetProdutos.Close;
end;

end.
