unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDataModule;

type
  TfrmLogin = class(TForm)
    query1: TFDQuery;
    Label1: TLabel;
    Label2: TLabel;
    btnEntrar: TButton;
    btnCadastrar: TButton;
    edtSenha: TEdit;
    edtNome: TEdit;
    procedure btnEntrarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses uSign, uMain;

var
  frmSign: TfrmSign;
  dm: TdataModule;

procedure TfrmLogin.btnCadastrarClick(Sender: TObject);
begin
  frmSign := TfrmSign.Create(Self);
  frmSign.ShowModal;
  frmSign.Free;

  if not TfrmMain.user.IsEmpty then
    Self.Close;
end;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
var
  nome: String;
  senha: String;
begin
  nome := edtNome.Text;
  senha := edtSenha.Text;

  if nome.IsEmpty or senha.IsEmpty then
  begin
    ShowMessage('Preencha todos os campos');
    Exit;
  end;

  query1.ParamByName('nome').AsString := nome;

  query1.Open;

  if not (VartoStr(query1.FieldByName('senha').Value) = senha) or (query1.isEmpty) then
    ShowMessage('Usu�rio ou senha incorretos')

  else
  begin
    TfrmMain.user := query1.FieldValues['nome'];
    TfrmMain.email := query1.FieldValues['email'];
    TfrmMain.id := query1.FieldValues['id'];
    Self.Close;
  end;

  query1.Close;

end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  dm := TdataModule.Create(Self);
end;

procedure TfrmLogin.FormDestroy(Sender: TObject);
begin
  dm.Free;
end;

end.
