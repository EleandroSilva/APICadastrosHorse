{*******************************************************}
{                                                       }
{                      ES Sistemas                      }
{                                                       }
{ Empresas de Sistemas 2003-2023 www.bemoreweb.com.br   }
{                     (17)98169-5336                    }
{                                                       }
{*******************************************************}
unit Model.Imp.Entidade.Usuario;

interface

uses
  System.SysUtils,
  System.Classes,
  GBSwagger.Model.Attributes,
  Model.Entidade.Usuario.Interfaces,
  Model.DAO.Entidade.Interfaces;

type
  TEntidadeUsuario = class(TInterfacedObject, iEntidadeUsuario)
    private
      [weak]
      FParent    : iDAOEntidade<iEntidadeUsuario>;
      FId        : Integer;
      FIdEmpresa : Integer;
      FNome      : String;
      FSobreNome : String;
      FEMail     : String;
      FSenha     : String;
    public
      constructor Create(aParent : iDAOEntidade<iEntidadeUsuario>);
      destructor Destroy; override;
      class function New(aParent : iDAOEntidade<iEntidadeUsuario>): iEntidadeUsuario;

      function Id(aValue : Integer)        : iEntidadeUsuario; overload;
      function Id                          : Integer;          overload;
      function IdEmpresa(aValue : Integer) : iEntidadeUsuario; overload;
      function IdEmpresa                   : Integer;          overload;
      function Nome(aValue : String)       : iEntidadeUsuario; overload;
      function Nome                        : String;           overload;
      function SobreNome(aValue : String)  : iEntidadeUsuario; overload;
      function SobreNome                   : String;           overload;
      function EMail(aValue : String)      : iEntidadeUsuario; overload;
      function EMail                       : String;           overload;
      function Senha(aValue : String)      : iEntidadeUsuario; overload;
      function Senha                       : String;           overload;


      function &End : iDAOEntidade<iEntidadeUsuario>;
  end;


implementation

{ TEntidadeUsuario }

constructor TEntidadeUsuario.Create(aParent: iDAOEntidade<iEntidadeUsuario>);
begin
  FParent := aParent;
end;

class function TEntidadeUsuario.New(aParent: iDAOEntidade<iEntidadeUsuario>): iEntidadeUsuario;
begin
  Result := Self.Create(aParent);
end;

function TEntidadeUsuario.&End: iDAOEntidade<iEntidadeUsuario>;
begin
  Result := FParent;
end;

destructor TEntidadeUsuario.Destroy;
begin
  inherited;
end;

function TEntidadeUsuario.Id(aValue: Integer): iEntidadeUsuario;
begin
  Result := Self;
  FId := aValue;
end;

function TEntidadeUsuario.Id: Integer;
begin
  Result := FId;
end;

function TEntidadeUsuario.IdEmpresa(aValue: Integer): iEntidadeUsuario;
begin
  Result := Self;
  FIdEmpresa := aValue;
end;

function TEntidadeUsuario.IdEmpresa: Integer;
begin
  Result := FIdEmpresa;
end;

function TEntidadeUsuario.Nome(aValue: String): iEntidadeUsuario;
begin
  Result := Self;
  FNome := aValue;
end;

function TEntidadeUsuario.Nome: String;
begin
  Result := FNome;
end;

function TEntidadeUsuario.SobreNome(aValue: String): iEntidadeUsuario;
begin
  Result := Self;
  FSobreNome := aValue;
end;

function TEntidadeUsuario.SobreNome: String;
begin
  Result := FSobreNome;
end;

function TEntidadeUsuario.EMail(aValue: String): iEntidadeUsuario;
begin
  Result := Self;
  FEMail := aValue;
end;

function TEntidadeUsuario.EMail: String;
begin
  Result := FEmail;
end;

function TEntidadeUsuario.Senha(aValue: String): iEntidadeUsuario;
begin
  Result := Self;
  FSenha := aValue;
end;

function TEntidadeUsuario.Senha: String;
begin
  Result := FSenha;
end;

end.
