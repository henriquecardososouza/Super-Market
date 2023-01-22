unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmMain = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Sistema2: TMenuItem;
    Consulta1: TMenuItem;
    Cliente1: TMenuItem;
    Cliente2: TMenuItem;
    Cliente3: TMenuItem;
    Cliente4: TMenuItem;
    Configuraes1: TMenuItem;
    Configuraes2: TMenuItem;
    Sair1: TMenuItem;
    lbNome: TLabel;
    RealizarVenda1: TMenuItem;
    Editar1: TMenuItem;
    Editar2: TMenuItem;
    qryPermissoes: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Cliente3Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Editar2Click(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
    procedure Cliente4Click(Sender: TObject);
    procedure Cliente2Click(Sender: TObject);
    procedure RealizarVenda1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    class var user: String;
    class var email: String;
    class var id: Integer;
  end;

var
  frmMain: TfrmMain;
implementation

{$R *.dfm}

uses
  uLogin, uSplash, uCadCliente, uCadProduto, uDataModule, uEditCliente,
  uEditProduto, uConsCliente, uConsProduto, uCreateVenda, uConfigUser;

var
  frmLogin: TfrmLogin;
  frmSplash: TfrmSplash;
  frmCadCliente: TfrmCadCliente;
  frmCadProduto: TfrmCadProduto;
  frmEditProduto: TfrmEditProduto;
  frmConsCliente: TfrmConsCliente;
  frmConsProsuto: TfrmConsProduto;
  frmCreateVenda: TfrmCreateVenda;
  frmConfigUser: TfrmConfigUser;

procedure TfrmMain.Cliente1Click(Sender: TObject);
begin
  qryPermissoes.ParamByName('id').AsInteger := Self.id;
  qryPermissoes.Open;

  if qryPermissoes.IsEmpty or not qryPermissoes.FieldValues['cad_produto'] then
  begin
    ShowMessage('Voc� n�o possui permiss�o para acessar esta p�gina');
    qryPermissoes.Close;
    Exit;
  end;

  qryPermissoes.Close;

  frmCadProduto := TfrmCadProduto.Create(Self);
  frmCadProduto.ShowModal;
  frmCadProduto.Free;
end;

procedure TfrmMain.Cliente2Click(Sender: TObject);
begin
  frmConsProduto := TfrmConsProduto.Create(Self);
  frmConsProduto.ShowModal;
  frmConsProduto.Free;
end;

procedure TfrmMain.Cliente3Click(Sender: TObject);
begin
  qryPermissoes.ParamByName('id').AsInteger := Self.id;
  qryPermissoes.Open;

  if qryPermissoes.IsEmpty or not qryPermissoes.FieldValues['cad_cliente'] then
  begin
    ShowMessage('Voc� n�o possui permiss�o para acessar esta p�gina');
    qryPermissoes.Close;
    Exit;
  end;

  qryPermissoes.Close;

  frmCadCliente := TfrmCadCliente.Create(Self);
  frmCadCliente.ShowModal;
  frmCadCliente.Free;
end;

procedure TfrmMain.Cliente4Click(Sender: TObject);
begin
  frmConsCliente := TfrmConsCliente.Create(Self);
  frmConsCliente.ShowModal;
  frmConsCliente.Free;
end;

procedure TfrmMain.Configuraes1Click(Sender: TObject);
begin
  qryPermissoes.ParamByName('id').AsInteger := Self.id;
  qryPermissoes.Open;

  if qryPermissoes.IsEmpty or not qryPermissoes.FieldValues['config_users'] then
  begin
    ShowMessage('Voc� n�o possui permiss�o para acessar esta p�gina');
    qryPermissoes.Close;
    Exit;
  end;

  qryPermissoes.Close;

  frmConfigUser := TfrmConfigUser.Create(Self);
  frmConfigUser.ShowModal;
  frmConfigUser.Free;
end;

procedure TfrmMain.Editar1Click(Sender: TObject);
begin
  qryPermissoes.ParamByName('id').AsInteger := Self.id;
  qryPermissoes.Open;

  if qryPermissoes.IsEmpty or not qryPermissoes.FieldValues['edit_produto'] then
  begin
    ShowMessage('Voc� n�o possui permiss�o para acessar esta p�gina');
    qryPermissoes.Close;
    Exit;
  end;

  qryPermissoes.Close;

  frmEditProduto := TfrmEditProduto.Create(Self);
  frmEditProduto.ShowModal;
  frmEditProduto.Free;
end;

procedure TfrmMain.Editar2Click(Sender: TObject);
begin
  qryPermissoes.ParamByName('id').AsInteger := Self.id;
  qryPermissoes.Open;

  if qryPermissoes.IsEmpty or not qryPermissoes.FieldValues['edit_cliente'] then
  begin
    ShowMessage('Voc� n�o possui permiss�o para acessar esta p�gina');
    qryPermissoes.Close;
    Exit;
  end;

  qryPermissoes.Close;

  frmEditCliente := TfrmEditCliente.Create(Self);
  frmEditCliente.ShowModal;
  frmEditCliente.Free;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Self.user := '';
  Self.Hide;

  frmSplash := TfrmSplash.Create(Self);

  try
    frmSplash.Show;
    frmSplash.Update;
    Sleep(3000);
    frmSplash.Close;
  finally
    frmSplash.Free;
  end;

  frmLogin := TfrmLogin.Create(Self);
  frmLogin.ShowModal;
  frmlogin.Update;
  frmLogin.Free;

  if Self.user.IsEmpty then
    Application.Terminate

  else
    lbNome.Caption := Self.user;
end;

procedure TfrmMain.RealizarVenda1Click(Sender: TObject);
begin
  qryPermissoes.ParamByName('id').AsInteger := Self.id;
  qryPermissoes.Open;

  if qryPermissoes.IsEmpty or not qryPermissoes.FieldValues['realizar_venda'] then
  begin
    ShowMessage('Voc� n�o possui permiss�o para acessar esta p�gina');
    qryPermissoes.Close;
    Exit;
  end;

  qryPermissoes.Close;

  frmCreateVenda := TfrmCreateVenda.Create(Self);
  frmCreateVenda.ShowModal;
  frmCreateVenda.Free;
end;

procedure TfrmMain.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
