{*******************************************************}
{                                                       }
{                      ES Sistemas                      }
{                                                       }
{ Empresas de Sistemas 2003-2023 www.bemoreweb.com.br   }
{                     (17)98169-5336                    }
{                                                       }
{*******************************************************}
unit Model.Conexao.Firedac.Interfaces;

interface

uses
  Data.DB,
  FireDAC.Comp.Client;

type
  iConexao = interface
    ['{84579E1B-EE58-41AF-AAED-DC9B55F40F73}']
    function Conexao(aValue : TFDConnection) : iConexao; overload;
    function Conexao          : TFDConnection; overload;
    function StartTransaction : iConexao;
    function Commit           : iConexao;
    function Rollback         : iConexao;

    procedure ConfigurarMySQL;
  end;

implementation

end.
