{*******************************************************}
{                                                       }
{                      ES Sistemas                      }
{                                                       }
{ Empresas de Sistemas 2003-2023 www.bemoreweb.com.br   }
{                     (17)98169-5336                    }
{                                                       }
{*******************************************************}
unit Model.Entidade.Empresa.Interfaces;

interface

uses
  Model.DAO.Entidade.Interfaces;

type
  iEntidadeEmpresa = interface
    ['{CB016380-5E48-4779-A5AF-20F4077991ED}']
    function Id(aValue : Integer)             : iEntidadeEmpresa; overload;
    function Id                               : Integer;          overload;
    function NomeEmpresarial(aValue : String) : iEntidadeEmpresa; overload;
    function NomeEmpresarial                  : String;           overload;
    function NomeFantasia(aValue : String)    : iEntidadeEmpresa; overload;
    function NomeFantasia                     : String;           overload;
    function CNPJ(aValue : String)            : iEntidadeEmpresa; overload;
    function CNPJ                             : String;           overload;
    function IE(aValue : String)              : iEntidadeEmpresa; overload;
    function IE                               : String;           overload;
    function DD(aValue : String)              : iEntidadeEmpresa; overload;
    function DD                               : String;           overload;
    function Celular(aValue : String)         : iEntidadeEmpresa; overload;
    function Celular                          : String;           overload;

    function &End : iDAOEntidade<iEntidadeEmpresa>;
  end;

implementation

end.
