{*******************************************************}
{                                                       }
{                      ES Sistemas                      }
{                                                       }
{ Empresas de Sistemas 2003-2023 www.bemoreweb.com.br   }
{                     (17)98169-5336                    }
{                                                       }
{*******************************************************}
unit Model.Imp.Factory.Entidade;

interface

uses
  Model.Factory.Entidade.Interfaces,
  Model.DAO.Entidade.Interfaces,
  Model.Entidade.Usuario.Interfaces,
  Model.DAO.Imp.Entidade.Usuario,
  Model.Imp.Entidade.Usuario,
  Model.Entidade.Empresa.Interfaces,
  Model.DAO.Imp.Entidade.Empresa;

type
  TFactoryEntidade = class(TInterfacedObject, iFactoryEntidade)
    private
      FUsuario : iDAOEntidade<iEntidadeUsuario>;
      FEmpresa : iDAOEntidade<iEntidadeEmpresa>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iFactoryEntidade;

      function Usuario : IDAOEntidade<iEntidadeUsuario>;
      function Empresa : IDAOEntidade<iEntidadeEmpresa>;
  end;

implementation

{ TFactoryEntidade }

constructor TFactoryEntidade.Create;
begin
  //
end;

class function TFactoryEntidade.New: iFactoryEntidade;
begin
  Result := Self.Create;
end;

destructor TFactoryEntidade.Destroy;
begin
  inherited;
end;

function TFactoryEntidade.Empresa: IDAOEntidade<iEntidadeEmpresa>;
begin
  if not Assigned(FEmpresa) then
    FEmpresa := TDAOEmpresa.New;

  Result := FEmpresa;
end;

function TFactoryEntidade.Usuario:IDAOEntidade<iEntidadeUsuario>;
begin
  if not Assigned(FUsuario) then
    FUsuario := TDAOUsuario.New;

  Result := FUsuario;
end;

end.
