{*******************************************************}
{                                                       }
{                      ES Sistemas                      }
{                                                       }
{ Empresas de Sistemas 2003-2023 www.bemoreweb.com.br   }
{                     (17)98169-5336                    }
{                                                       }
{*******************************************************}



program APICadastros;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.GBSwagger,
  Horse.Jhonson,
  Horse.Compression,
  Horse.BasicAuthentication,
  Horse.Paginate,
  Horse.Cors,
  Horse.HandleException,
  Controller.Interfaces in 'src\mvc\controller\interfaces\Controller.Interfaces.pas',
  Model.Imp.Controller in 'src\mvc\controller\imp\Model.Imp.Controller.pas',
  Controller.Usuario in 'src\mvc\controller\imp\Controller.Usuario.pas',
  Model.Imp.Conexao.Firedac.MySQL in 'src\mvc\model\conexao\imp\Model.Imp.Conexao.Firedac.MySQL.pas',
  Model.Imp.Query in 'src\mvc\model\conexao\imp\Model.Imp.Query.pas',
  Model.DAO.Imp.Entidade.Usuario in 'src\mvc\model\dao\imp\Model.DAO.Imp.Entidade.Usuario.pas',
  Model.Imp.Factory.Entidade in 'src\mvc\model\entidade\factory\imp\Model.Imp.Factory.Entidade.pas',
  Model.Imp.Entidade.Usuario in 'src\mvc\model\entidade\imp\Model.Imp.Entidade.Usuario.pas',
  Model.imp.Swagger.Usuario in 'src\mvc\model\Swagger\Model.imp.Swagger.Usuario.pas',
  Model.Swagger.Tabela.Usuario in 'src\mvc\model\Swagger\tabelas\Model.Swagger.Tabela.Usuario.pas',
  Model.Imp.Entidade.Empresa in 'src\mvc\model\entidade\imp\Model.Imp.Entidade.Empresa.pas',
  Model.DAO.Imp.Entidade.Empresa in 'src\mvc\model\dao\imp\Model.DAO.Imp.Entidade.Empresa.pas',
  Controller.Empresa in 'src\mvc\controller\imp\Controller.Empresa.pas',
  Model.Swagger.Tabela.Empresa in 'src\mvc\model\Swagger\tabelas\Model.Swagger.Tabela.Empresa.pas',
  Model.imp.Swagger.Empresa in 'src\mvc\model\Swagger\Model.imp.Swagger.Empresa.pas',
  Model.Conexao.Firedac.Interfaces in 'src\mvc\model\conexao\interfaces\Model.Conexao.Firedac.Interfaces.pas',
  Model.Query in 'src\mvc\model\conexao\interfaces\Model.Query.pas',
  Model.DAO.Entidade.Interfaces in 'src\mvc\model\dao\interfaces\Model.DAO.Entidade.Interfaces.pas',
  Model.Entidade.Empresa.Interfaces in 'src\mvc\model\entidade\interfaces\Model.Entidade.Empresa.Interfaces.pas',
  Model.Entidade.Usuario.Interfaces in 'src\mvc\model\entidade\interfaces\Model.Entidade.Usuario.Interfaces.pas',
  Model.Factory.Entidade.Interfaces in 'src\mvc\model\entidade\factory\interfaces\Model.Factory.Entidade.Interfaces.pas',
  Uteis.Tratar.Mensagens in 'src\mvc\uteis\Uteis.Tratar.Mensagens.pas';

begin
   THorse
       .Use(Compression())
       .Use(Jhonson)
       .Use(Paginate)
       .Use(Cors)
       .Use(HorseSwagger)
       .Use(HandleException);
   {
   THorse.Use(HorseBasicAuthentication(
    function(const AUsername, APassword: string): Boolean
    begin
      // Here inside you can access your database and validate if username and password are valid
      Result := AUsername.Equals('eleandro') and APassword.Equals('silva');
    end));
    }
  TControllerUsuario.Registry;
  TControllerEmpresa.Registry;


  //Documentações
  TSwaggerUsuario.SwaggerUsuario;
  TSwaggerEmpresa.SwaggerEmpresa;


  THorse.Listen(9000,
  procedure
  begin
    WriteLn(Format('Servidor rodando na porta %d',[THorse.Port]));
    WriteLn('Recebendo requests');
  end);
end.
