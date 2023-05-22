{*******************************************************}
{                                                       }
{                      ES Sistemas                      }
{                                                       }
{ Empresas de Sistemas 2003-2023 www.bemoreweb.com.br   }
{                     (17)98169-5336                    }
{                                                       }
{*******************************************************}
unit Model.Factory.Entidade.Interfaces;

interface

uses
  Model.Entidade.Usuario.Interfaces,
  Model.DAO.Entidade.Interfaces,
  Model.Entidade.Empresa.Interfaces;

type
  iFactoryEntidade = interface
    ['{DD4DB681-A424-4AD5-BB0F-FB97062A6BB6}']
    function Usuario : iDAOEntidade<iEntidadeUsuario>;
    function Empresa : iDAOEntidade<iEntidadeEmpresa>;
  end;

implementation

end.
