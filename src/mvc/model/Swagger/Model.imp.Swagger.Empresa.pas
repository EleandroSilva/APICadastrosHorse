{*******************************************************}
{                                                       }
{                      ES Sistemas                      }
{                                                       }
{ Empresas de Sistemas 2003-2023 www.bemoreweb.com.br   }
{                     (17)98169-5336                    }
{                                                       }
{*******************************************************}
unit Model.imp.Swagger.Empresa;

interface

uses
  Horse.GBSwagger,
  Model.Swagger.Tabela.Empresa;

type
  TSwaggerEmpresa = class
   private
   public
     class procedure SwaggerEmpresa;
  end;

implementation

{ TSwaggerUsuario }

class procedure TSwaggerEmpresa.SwaggerEmpresa;
begin
  //http://localhost:9000/swagger/doc/html   URL
  Swagger
    .Info
      .Title('API ESS cadastros')
      .Description('Documentação da API ESS cadastros')
       .Contact
        .Name('Eleandro Silva')
        .Email('eleandrosilva3107@gmail.com')
        .URL('https://www.bemoreweb.com.br')
      .&End
    .&End
    .BasePath('ess')
    .Path('empresas')
      .Tag('Empresas')
      .GET('Listar Empresas')
        .AddParamQuery('id', 'Id').&End
        .AddParamQuery('cnpj', 'cnpj').&End
        .AddParamQuery('nomeempresarial', 'nomeempresarial').&End
        .AddParamQuery('nomefantasia', 'nomefantasia').&End
        .AddResponse(200, 'Lista de Empresas').Schema(TEmpresa).IsArray(True).&End
      .&End
      .POST('Criar uma nova empresa')
        .AddParamBody('Dados da empresa').Required(True).Schema(TEmpresa).&End
        .AddResponse(201).Schema(TEmpresa).&End
        .AddResponse(400).&End
      .&End
    .&End
    .Path('empresas/{id}')
      .Tag('Empresas')
      .GET('Obter os dados de uma empresa específico')
        .AddParamPath('id', 'Id').&End
        .AddResponse(200, 'Dados da empresa').Schema(TEmpresa).&End
        .AddResponse(404).&End
      .&End
      .PUT('Alterar os dados de uma empresa específico')
        .AddParamPath('id', 'Id').&End
        .AddParamBody('Dados da empresa').Required(True).Schema(TEmpresa).&End
        .AddResponse(204).&End
        .AddResponse(400).&End
        .AddResponse(404).&End
      .&End
      .DELETE('Excluir empresa')
        .AddParamPath('id', 'Id').&End
        .AddResponse(204).&End
        .AddResponse(400).&End
        .AddResponse(404).&End
      .&End
    .&End
  .&End;
end;

end.
