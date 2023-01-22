program super_market;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uSplash in 'uSplash.pas' {frmSplash},
  uLogin in 'uLogin.pas' {frmLogin},
  uSign in 'uSign.pas' {frmSign},
  uDataModule in 'uDataModule.pas' {dmMain: TDataModule},
  uCadCliente in 'uCadCliente.pas' {frmCadCliente},
  uCadProduto in 'uCadProduto.pas' {frmCadProduto},
  uEditCliente in 'uEditCliente.pas' {frmEditCliente},
  uEditProduto in 'uEditProduto.pas' {frmEditProduto},
  uConsCliente in 'uConsCliente.pas' {frmConsCliente},
  uConsProduto in 'uConsProduto.pas' {frmConsProduto},
  uCreateVenda in 'uCreateVenda.pas' {frmCreateVenda},
  uConfigUser in 'uConfigUser.pas' {frmConfigUser};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSign, frmSign);
  Application.CreateForm(TfrmCadCliente, frmCadCliente);
  Application.CreateForm(TfrmCadProduto, frmCadProduto);
  Application.CreateForm(TfrmEditCliente, frmEditCliente);
  Application.CreateForm(TfrmEditProduto, frmEditProduto);
  Application.CreateForm(TfrmConsCliente, frmConsCliente);
  Application.CreateForm(TfrmConsProduto, frmConsProduto);
  Application.CreateForm(TfrmCreateVenda, frmCreateVenda);
  Application.CreateForm(TfrmConfigUser, frmConfigUser);
  Application.Run;
end.
