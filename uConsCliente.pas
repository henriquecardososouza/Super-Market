unit uConsCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtDlgs, Datasnap.DBClient, Datasnap.Provider;

type
  TfrmConsCliente = class(TForm)
    Panel1: TPanel;
    cbClientes: TComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbNome: TLabel;
    lbEmail: TLabel;
    lbTelefone: TLabel;
    qryGetData: TFDQuery;
    qryGetAttributes: TFDQuery;
    Button1: TButton;
    qryPermissao: TFDQuery;
    qryGetID: TFDQuery;
    SaveDialog1: TSaveDialog;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    procedure FormCreate(Sender: TObject);
    procedure cbClientesChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SaveAsCSV(myFileName: string; myDataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsCliente: TfrmConsCliente;

implementation

{$R *.dfm}

uses uDataModule, uMain;

procedure TfrmConsCliente.Button1Click(Sender: TObject);
var
  id: Integer;

begin
  qryGetID.ParamByName('nome').AsString := TfrmMain.user;
  qryGetID.Open;

  id := qryGetId.FieldValues['id'];

  qryGetID.Close;

  qryPermissao.ParamByName('usuario').AsInteger := id;
  qryPermissao.Open;

  if not qryPermissao.FieldValues['export_data'] then
  begin
    ShowMessage('Você não possui permissão para executar esta ação');
    qryPermissao.Close;
    Exit;
  end;

  qryPermissao.Close;

  if (SaveDialog1.Execute = true) and (length(SaveDialog1.FileName) > 0) then
  begin
    SaveDialog1.DefaultExt := 'csv';
    SaveAsCSV(SaveDialog1.FileName,ClientDataSet1);
    ShowMessage('Dados salvos com sucesso');
    Exit;
  end;

  ShowMessage('Caminho inválido');

end;

procedure TfrmConsCliente.SaveAsCSV(myFileName: string; myDataSet: TDataSet);
var
  myTextFile: TextFile;
  i: integer;
  s: string;
begin
  //create a new file
  AssignFile(myTextFile, myFileName);
  Rewrite(myTextFile);

  s := ''; //initialize empty string

  try
    //write field names (as column headers)
    for i := 0 to myDataSet.FieldCount - 1 do
      begin
        s := s + Format('"%s";', [myDataSet.Fields[i].FieldName]);
      end;
    Writeln(myTextFile, s);

    //write field values
    while not myDataSet.Eof do
      begin
        s := '';
        for i := 0 to myDataSet.FieldCount - 1 do
          begin
            s := s + Format('"%s";', [myDataSet.Fields[i].AsString]);
          end;
        Writeln(myTextfile, s);
        myDataSet.Next;
      end;

  finally
    CloseFile(myTextFile);
  end;
end;

procedure TfrmConsCliente.cbClientesChange(Sender: TObject);
var
nome: String;

begin
  nome := cbClientes.Text;

  qryGetAttributes.ParamByName('nome').AsString := nome;
  qryGetAttributes.Open;

  lbNome.Caption := qryGetAttributes.FieldValues['nome'];
  lbEmail.Caption := qryGetAttributes.FieldValues['email'];
  lbTelefone.Caption := qryGetAttributes.FieldValues['telefone'];

  qryGetAttributes.Close;
end;

procedure TfrmConsCliente.FormCreate(Sender: TObject);
begin
  qryGetData.Open;
  qryGetData.First;

  While not qryGetData.Eof do
  begin
    cbClientes.Items.Add(qryGetData.FieldByName('nome').AsString);
    qryGetData.Next;
  end;

  qryGetData.Close;
end;

end.
