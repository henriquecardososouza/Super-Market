unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.NumberBox;

type
  TfrmCadProduto = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtNome: TEdit;
    btnCadastrar: TButton;
    qryInsert: TFDQuery;
    edtQuant: TNumberBox;
    edtPreco: TNumberBox;
    procedure btnCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

procedure TfrmCadProduto.btnCadastrarClick(Sender: TObject);
var
  nome: String;
  preco: Double;
  estoque: Integer;

begin
    nome := edtNome.Text;
    preco := edtPreco.ValueFloat;
    estoque := edtQuant.ValueInt;

    if nome.IsEmpty then
    begin
      ShowMessage('Preencha todos os campos');
      Exit;
    end;

    if preco = 0 then
    begin
      ShowMessage('O campo Pre�o n�o pode ser nulo');
      Exit;
    end;

    qryInsert.ParamByName('nome').AsString := nome;
    qryInsert.ParamByName('preco').AsFloat := preco;
    qryInsert.ParamByName('estoque').AsInteger := estoque;

    try
      qryInsert.Execute;
    except
    begin
      ShowMessage('Ocorreu um erro ao realizar o cadastro');
      Exit;
    end;
    end;

    ShowMessage('Cadastro realizado com sucesso');

    if Messagedlg('Deseja realizar mais um cadastro?', mtConfirmation, [mbOk, mbCancel], 0) = MrCancel then
      Self.Close;
end;

end.
