unit uSign;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmSign = class(TForm)
    qryInsert: TFDQuery;
    DataSource1: TDataSource;
    qryInsertid: TFDAutoIncField;
    qryInsertnome: TStringField;
    qryInsertemail: TStringField;
    qryInsertsenha: TStringField;
    Label1: TLabel;
    edtNome: TDBEdit;
    Label2: TLabel;
    edtEmail: TDBEdit;
    Label3: TLabel;
    edtSenha: TDBEdit;
    btnCadastrar: TButton;
    qryAux: TFDQuery;
    qryPermissao: TFDQuery;
    qryRepeatUser: TFDQuery;
    qryAdmin: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSign: TfrmSign;

implementation

{$R *.dfm}

uses uDataModule, uMain;

var
  dm: TdataModule;

procedure TfrmSign.btnCadastrarClick(Sender: TObject);
var
  nome: String;
  email: String;
  senha: String;
  configUsers: Boolean;
begin
  nome := edtnome.Text;
  email := edtEmail.Text;
  senha := edtSenha.Text;

  if length(nome) > 60 then
  begin
    ShowMessage('O nome informado � muito longo');
    Exit;
  end;

  if length(email) > 200 then
  begin
    ShowMessage('O email informado � muito longo');
    Exit;
  end;

  if length(senha) > 60 then
  begin
    ShowMessage('A senha informada � muito longa');
    Exit;
  end;


  if nome.IsEmpty or email.IsEmpty or senha.IsEmpty then
  begin
    ShowMessage('Preencha todos os campos');
    Exit;
  end;

  qryRepeatUser.ParamByName('nome').AsString := nome;
  qryRepeatUser.Open;

  if not(qryRepeatUser.IsEmpty) then
  begin
    ShowMessage('Este nome j� est� sendo utilizado, por favor escolha outro');
    qryRepeatUser.Close;
    Exit;
  end;

  qryRepeatUser.Close;

  try
    qryInsert.Post;
  except
    ShowMessage('Ocorreu um erro ao realizar o cadastro');
    Exit;
  end;

  TfrmMain.user := nome;
  TfrmMain.email := email;

  qryAdmin.Open;
  configUsers := false;

  if qryAdmin.IsEmpty then
  begin
    if Messagedlg('Nenhum dos usu�rios cadastrados no sistema possui permiss�o para conceder privil�gios a outros usu�rios. Deseja conceder a este novo usu�rio esse privil�gio?', mtConfirmation, [mbOk, mbCancel], 0) = MrOk then
      configUsers := true;
  end;

  qryAdmin.Close;

  qryAux.ParamByName('nome').AsString := nome;
  qryAux.ParamByName('email').AsString := email;
  qryAux.Open;

  TfrmMain.id := qryAux.FieldValues['id'];

  qryPermissao.ParamByName('id').AsInteger := qryAux.FieldValues['id'];
  qryPermissao.ParamByName('configUsers').AsBoolean := configUsers;
  qryPermissao.Execute;

  qryAux.Close;

  Self.Close;
end;

procedure TfrmSign.FormCreate(Sender: TObject);
begin
  qryInsert.Open;
  qryInsert.Insert;

  dm := TdataModule.Create(Self);
end;

procedure TfrmSign.FormDestroy(Sender: TObject);
begin
  qryInsert.Close;
  dm.Free;
end;

end.
