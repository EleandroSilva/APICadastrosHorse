{*******************************************************}
{                                                       }
{                      ES Sistemas                      }
{                                                       }
{ Empresas de Sistemas 2003-2023 www.bemoreweb.com.br   }
{                     (17)98169-5336                    }
{                                                       }
{*******************************************************}

unit Controller.Interfaces;

interface

uses
  Model.Factory.Entidade.Interfaces;

type
  iController = interface
    ['{026301D8-53C5-4AFA-9F45-34479FB39389}']
    function Entidade : iFactoryEntidade;
  end;

implementation

end.
