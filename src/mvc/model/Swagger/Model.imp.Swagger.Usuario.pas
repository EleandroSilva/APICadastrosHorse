{*******************************************************}
{                                                       }
{                      ES Sistemas                      }
{                                                       }
{ Empresas de Sistemas 2003-2023 www.bemoreweb.com.br   }
{                     (17)98169-5336                    }
{                                                       }
{*******************************************************}
unit Model.imp.Swagger.Usuario;

interface

uses
  Horse.GBSwagger,
  Model.Swagger.Tabela.Usuario;

type
  TSwaggerUsuario = class
   class procedure SwaggerUsuario;

  end;

implementation

{ TSwaggerUsuario }

class procedure TSwaggerUsuario.SwaggerUsuario;
begin
  //http://localhost:9000/swagger/doc/html   URL
  Swagger
    .Info
      .Title('API ESS cadastros')
      .Description('Documentação da API ESS cadastro usuários')
      .Contact
        .Name('Eleandro Silva')
        .Email('eleandrosilva3107@gmail.com')
        .URL('https://www.bemoreweb.com.br')
      .&End
    .&End
    .BasePath('ess')
    .Path('usuarios')
      .Tag('Usuários')
      .GET('Listar usuários')
        .AddParamQuery('id', 'Id').&End
        .AddParamQuery('nome', 'Nome').&End
        .AddParamQuery('sobrenome', 'Sobrenome').&End
        .AddResponse(200, 'Lista de usuários').Schema(TUsuario).IsArray(True).&End
      .&End
      .POST('Criar um novo usuário')
        .AddParamBody('Dados do usuário').Required(True).Schema(TUsuario).&End
        .AddResponse(201).Schema(TUsuario).&End
        .AddResponse(400).&End
      .&End
    .&End
    .Path('usuarios/{id}')
      .Tag('Usuários')
      .GET('Obter os dados de um usuário específico')
        .AddParamPath('id', 'Id').&End
        .AddResponse(200, 'Dados do usuário').Schema(TUsuario).&End
        .AddResponse(404).&End
      .&End
      .PUT('Alterar os dados de um usuário específico')
        .AddParamPath('id', 'Id').&End
        .AddParamBody('Dados do usuário').Required(True).Schema(TUsuario).&End
        .AddResponse(204).&End
        .AddResponse(400).&End
        .AddResponse(404).&End
      .&End
      .DELETE('Excluir usuário')
        .AddParamPath('id', 'Id').&End
        .AddResponse(204).&End
        .AddResponse(400).&End
        .AddResponse(404).&End
      .&End
    .&End
  .&End;


end;

end.
