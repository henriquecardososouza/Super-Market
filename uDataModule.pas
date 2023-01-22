unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmMain = class(TDataModule)
    connSuperMarket: TFDConnection;
    tbClientes: TFDTable;
    tbClientesnome: TStringField;
    tbClientesemail: TStringField;
    tbClientestelefone: TStringField;
    tbClientesid: TFDAutoIncField;
    tbProdutos: TFDTable;
    tbProdutosid: TFDAutoIncField;
    tbProdutosnome: TStringField;
    tbProdutospreco: TSingleField;
    tbProdutosestoque: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmMain.DataModuleCreate(Sender: TObject);
begin
  connSuperMarket.Connected := true;
end;

procedure TdmMain.DataModuleDestroy(Sender: TObject);
begin
  connSuperMarket.Connected := false;
end;

end.
