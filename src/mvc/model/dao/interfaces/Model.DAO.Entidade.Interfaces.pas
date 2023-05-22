{*******************************************************}
{                                                       }
{                      ES Sistemas                      }
{                                                       }
{ Empresas de Sistemas 2003-2023 www.bemoreweb.com.br   }
{                     (17)98169-5336                    }
{                                                       }
{*******************************************************}
unit Model.DAO.Entidade.Interfaces;

interface

uses
  System.JSON,

  Data.DB;

type
  iDAOEntidade<T> = interface
    ['{98F33D04-9A99-4C56-8CE4-5C6988F5E35D}']
    function DataSet(aDataSource : TDataSource)  : iDAOEntidade<T>; overload;
    function DataSet                             : TDataSet;        overload;
    function GetAll(aValue : String)             : iDAOEntidade<T>; overload;
    function GetAll                              : TJSONArray;      overload;
    function GetbyId(aId : Variant)              : iDAOEntidade<T>;
    function GetbyParams(aField : String; aValue : Variant) : iDAOEntidade<T>;
    function Post                                : iDAOEntidade<T>;
    function Put                                 : iDAOEntidade<T>;
    function Delete                              : iDAOEntidade<T>;

    function This : T;
  end;

implementation

end.
