{*******************************************************}
{                                                       }
{                      ES Sistemas                      }
{                                                       }
{ Empresas de Sistemas 2003-2023 www.bemoreweb.com.br   }
{                     (17)98169-5336                    }
{                                                       }
{*******************************************************}
unit Model.Query;

interface

uses
  Data.DB;

type
  iQuery = interface
    ['{4C2DEA28-82A5-4B93-ABE0-8DB6E0EAB964}']
    function DataSet(aDataSource : TDataSource): iQuery; overload;
    function DataSet : TDataSet; overload;
    function Params(aParams : String; Value : Variant) : iQuery; overload;
    function Params(aParams : String): Variant; overload;
    function SQL(aValue : String) : iQuery; overload;
    function ExecSQL              : iQuery;
    function Clear                : iQuery;
    function Close                : iQuery;
    function Open                 : iQuery;
  end;

implementation

end.
