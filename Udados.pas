unit Udados;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBDatabase, inifiles,  Messages, Forms,
  IBX.IBCustomDataSet, IBX.IBQuery;

type
  TDados = class(TDataModule)
    IBDatabase: TIBDatabase;
    IBTransaction: TIBTransaction;
    QryBuscaproduto: TIBQuery;
    dtsbuscaproduto: TDataSource;
    QrybuscaVariacao: TIBQuery;
    dtsbuscavariacao: TDataSource;
    QrybuscaVariacaoCOD_PRODUTO: TIBStringField;
    QrybuscaVariacaoCODGERAL: TIBStringField;
    QrybuscaVariacaoESTOQUE: TIBBCDField;
    QrybuscaVariacaoPRECO: TIBBCDField;
    QrybuscaVariacaoPESO: TIBBCDField;
    QrybuscaVariacaoCODBANHO: TIBStringField;
    QrybuscaVariacaoCODTAMANHO: TIBStringField;
    QrybuscaVariacaoSITUACAO: TIBStringField;
    dtHrEnvDadosmacro: TIBQuery;
    QrybuscaVariacaoCODGRUPO: TIBStringField;
    QryBuscaVar: TIBQuery;
    dtsbuscavar: TDataSource;
    QryAtualizaEnv: TIBQuery;
    dtHrEnvDadosmacroDTHR_GP_ENV: TDateTimeField;
    dtHrEnvDadosmacroDTHR_BN_ENV: TDateTimeField;
    dtHrEnvDadosmacroDTHR_TM_ENV: TDateTimeField;
    dtHrEnvDadosmacroDTHR_PR_ENV: TDateTimeField;
    dtHrEnvDadosmacroDTHR_VR_ENV: TDateTimeField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dados: TDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDados.DataModuleCreate(Sender: TObject);
var
  config    : TIniFile;

  database  : string;
  user      : string;
  passwd    : string;
  port      : string;
  path      : string;
  ip        : string;
begin
  config := TIniFile.Create(ExtractFilePath(Application.ExeName)+'config.ini');
  database  := config.ReadString('CONFIG','database','');
  user      := config.ReadString('CONFIG','user','');
  passwd    := config.ReadString('CONFIG','pass','');
  port      := config.ReadString('CONFIG','port','');
  path      := config.ReadString('CONFIG','path','');
  ip        := config.ReadString('CONFIG','ip','');
  config.Free;

  {si o banco tiver conectado o no tiver conectado}
  if IBDatabase.Connected then
  begin
   {si tiver en trasaction comita e depois deconecte o banco}
   if IBTransaction.InTransaction then
      begin
         IBTransaction.Commit;
         IBDatabase.Close;
      end;
  end;

  try
    {parametro para criar a conexao}
    //IBDatabase.DatabaseName := '127.0.0.1\3050:C:\Banco\AUTOMACAO.GDB';//IP+PATH+'\'+DATABASE;
    IBDatabase.DatabaseName := IP +':'+PATH+'\'+DATABASE;
    //IBDatabase.DatabaseName := IP +'\'+port+':'+PATH+'\'+DATABASE;
    IBDatabase.Params.Clear;
    IBDatabase.Params.Add('user_name='+user);
    IBDatabase.Params.Add('password='+passwd);
    IBDatabase.Params.Add('lc_ctype=iso8859_1');
    IBDatabase.Open;
  finally

  end;


end;
end.