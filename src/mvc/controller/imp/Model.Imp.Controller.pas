{*******************************************************}
{                                                       }
{                      ES Sistemas                      }
{                                                       }
{ Empresas de Sistemas 2003-2023 www.bemoreweb.com.br   }
{                     (17)98169-5336                    }
{                                                       }
{*******************************************************}
unit Model.Imp.Controller;

interface

uses
  System.SysUtils,

  Controller.Interfaces,
  Model.Factory.Entidade.Interfaces,
  Model.Imp.Factory.Entidade;

type
  TController = class(TInterfacedObject, iController)
  private
    FFactoryEntidade : iFactoryEntidade;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iController;

    function Entidade : iFactoryEntidade;


  end;

implementation


{ TController }

constructor TController.Create;
begin
  //
end;

destructor TController.Destroy;
begin
  //
  inherited;
end;

class function TController.New: iController;
begin
  Result := Self.Create;
end;

function TController.Entidade: iFactoryEntidade;
begin
  if not Assigned(FFactoryEntidade) then
    FFactoryEntidade := TFactoryEntidade.New;

  Result := FFactoryEntidade;
end;


end.
