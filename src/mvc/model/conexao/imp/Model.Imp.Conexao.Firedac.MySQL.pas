{*******************************************************}
{                                                       }
{                      ES Sistemas                      }
{                                                       }
{ Empresas de Sistemas 2003-2023 www.bemoreweb.com.br   }
{                     (17)98169-5336                    }
{                                                       }
{*******************************************************}
unit Model.Imp.Conexao.Firedac.MySQL;

interface

uses
  Data.DB,
  System.SysUtils,
  System.JSON,

  FireDAC.UI.Intf,
  FireDAC.FMXUI.Wait,
  FireDAC.Stan.Intf,
  FireDAC.Comp.UI,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,

  Model.Conexao.Firedac.Interfaces;

type
  TModelConexaoFiredacMySQL = class(TInterfacedObject, iConexao)
    private
      FConexao     : TFDConnection;
      FDriverMySQL : TFDPhysMySQLDriverLink;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iConexao;

      function Conexao(aValue : TFDConnection) : iConexao; overload;
      function Conexao : TFDConnection; overload;
      function StartTransaction : iConexao;
      function Commit           : iConexao;
      function Rollback         : iConexao;


      procedure ConfigurarMySQL;
  end;

implementation

{ TModelConexaoFiredacMySQL }

constructor TModelConexaoFiredacMySQL.Create;
begin
  ConfigurarMySQL;
end;

destructor TModelConexaoFiredacMySQL.Destroy;
begin
  FreeAndNil(FConexao);
  FreeAndNil(FDriverMySQL);
  inherited;
end;

class function TModelConexaoFiredacMySQL.New: iConexao;
begin
  Result := Self.Create;
end;

function TModelConexaoFiredacMySQL.StartTransaction: iConexao;
begin
  Result := Self;
  FConexao.StartTransaction;
end;

function TModelConexaoFiredacMySQL.Commit: iConexao;
begin
  Result := Self;
  FConexao.Commit;
end;

function TModelConexaoFiredacMySQL.Rollback: iConexao;
begin
  Result := Self;
  FConexao.Rollback;
end;

function TModelConexaoFiredacMySQL.Conexao(aValue: TFDConnection): iConexao;
begin
  Result := Self;
  FConexao := aValue;
end;

function TModelConexaoFiredacMySQL.Conexao: TFDConnection;
begin
  Result := FConexao;
end;

procedure TModelConexaoFiredacMySQL.ConfigurarMySQL;
begin
  try
    FConexao := TFDConnection.Create(nil);
    FDriverMySQL := TFDPhysMySQLDriverLink.Create(nil);

    FDriverMySQL.VendorLib   := 'C:\RedeInfocon\MyRepository\RI-Fontes\ServidorHorse\APICadastros\libmysql.dll' ;
    FConexao.Params.DriverID := 'MySQL';
    FConexao.Params.Database := 'essistemas';
    FConexao.Params.UserName := 'esilva';
    FConexao.Params.Password := 'EleandroSilva';
    FConexao.Params.Add('Port='+'41890');
    FConexao.Params.Add('utf8mb4');
    FConexao.Params.Add('Server='+'mysql670.umbler.com');
    FConexao.LoginPrompt     := False;
    FConexao.Connected;
  except
    on e: Exception do
    raise Exception.Create('Erro ao tentar se conectar com a base de dados: ' +e.Message);
  end;
end;

end.
