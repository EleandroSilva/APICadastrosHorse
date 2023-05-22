{*******************************************************}
{                                                       }
{                      ES Sistemas                      }
{                                                       }
{ Empresas de Sistemas 2003-2023 www.bemoreweb.com.br   }
{                     (17)98169-5336                    }
{                                                       }
{*******************************************************}
unit Controller.Empresa;

interface

uses
  System.SysUtils,

  System.JSON,

  Data.DB,
  FireDAC.Comp.Client,

  DataSet.Serialize,
  Horse,
  Horse.BasicAuthentication,

  Controller.Interfaces,
  Model.Imp.Controller;

type
  TControllerEmpresa = class
  private
    class procedure Create;
    class procedure Destroy;

    class function  Fields(aField : String) :String;
    class procedure GetAll(Req: THorseRequest; Res: THorseResponse);
    class procedure GetbyId(Req: THorseRequest; Res: THorseResponse);
    class procedure Post(Req: THorseRequest; Res: THorseResponse);
    class procedure Put(Req: THorseRequest; Res: THorseResponse);
    class procedure Delete(Req: THorseRequest; Res: THorseResponse);

    class procedure GetbyParams(aField : String; aValue : Variant);
  public
    class procedure Registry;
  end;

implementation

var
  FController : iController;
  FJSONArray  : TJSONArray;
  FBody       : TJSONValue;
  FDataSource : TDataSource;
  FTexto      : String;
  FField      : String;
  FId         : Int64;

class procedure TControllerEmpresa.Create;
begin
  FController := TController.New;
  FDataSource := TDataSource.Create(nil);
end;

class procedure TControllerEmpresa.Destroy;
begin
  FreeAndNil(FDataSource);
end;

class function TControllerEmpresa.Fields(aField: String): String;
begin
  Result := aField;
end;

class procedure TControllerEmpresa.GetAll(Req: THorseRequest; Res: THorseResponse);
begin
  Create;
   Try
     if TControllerEmpresa.Fields(Req.Query.Field('cnpj').AsString) <>'' then
       TControllerEmpresa.GetbyParams('cnpj', Req.Query.Field('cnpj').AsString)
     else
     if TControllerEmpresa.Fields(Req.Query.Field('nomeempresarial').AsString) <>'' then
       TControllerEmpresa.GetbyParams('nomeempresarial', Req.Query.Field('nomeempresarial').AsString)
     else
     if TControllerEmpresa.Fields(Req.Query.Field('nomefantasia').AsString) <>'' then
       TControllerEmpresa.GetbyParams('nomefantasia', Req.Query.Field('nomefantasia').AsString)
     else
     TControllerEmpresa.GetbyParams('', '');

     FJSONArray := FDataSource.DataSet.ToJSONArray();
     FTexto     := FJsonArray.ToString;
     Res.Send<TJSONArray>(FJSONArray);
   Finally
     Destroy;
   End;
end;

class procedure TControllerEmpresa.GetbyId(Req: THorseRequest; Res: THorseResponse);
begin
  Create;
   Try
     FId := Req.Params['id'].ToInt64;
     FController
               .Entidade
               .Empresa
               .GetbyId(FId)
               .DataSet(FDataSource);

     FJSONArray := FDataSource.DataSet.ToJSONArray();
     Res.Send<TJSONArray>(FJSONArray);
   Finally
     Destroy;
   End;
end;

class procedure TControllerEmpresa.Post(Req: THorseRequest; Res: THorseResponse);
begin
  Create;
  try
    FBody := Req.Body<TJSONObject>;

    FController
             .Entidade
             .Empresa
             .This
               .CNPJ(FBody.GetValue<string>('cnpj'))
               .IE(FBody.GetValue<string>('ie'))
               .NomeEmpresarial(FBody.GetValue<String>('nomeempresarial'))
               .NomeFantasia(FBody.GetValue<String>('nomefantasia'))
               .DD(FBody.GetValue<String>('dd'))
               .Celular(FBody.GetValue<String>('celular'))
               .&End
             .Post
             .DataSet(FDataSource);
  finally
    Destroy;
  end;
end;

class procedure TControllerEmpresa.Put(Req: THorseRequest; Res: THorseResponse);
begin
  Create;
  try
    FId   := Req.Params['id'].ToInt64;
    FBody := Req.Body<TJSONObject>;

    FController
             .Entidade
             .Empresa
             .This
               .Id(FID)
               .CNPJ(FBody.GetValue<String>('cnpj'))
               .IE(FBody.GetValue<String>('ie'))
               .NomeEmpresarial(FBody.GetValue<String>('nomeempresarial'))
               .NomeFantasia(FBody.GetValue<String>('nomefantasia'))
               .DD(FBody.GetValue<String>('dd'))
               .Celular(FBody.GetValue<String>('celular'))
               .&End
             .Put
             .DataSet(FDataSource);
  finally
    Destroy;
  end;
end;

class procedure TControllerEmpresa.Delete(Req: THorseRequest; Res: THorseResponse);
begin
  Create;
   Try
     FId := Req.Params['id'].ToInt64;
     FController
               .Entidade
               .Empresa
                 .This
                 .Id(FId)
                 .&End
               .Delete
               .DataSet(FDataSource);
   Finally
     Destroy;
   End;
end;

class procedure TControllerEmpresa.GetbyParams(aField: String; aValue: Variant);
begin
  FField := aField;
  if aValue='' then
    FController
            .Entidade
             .Empresa
              .GetAll('')
              .DataSet(FDataSource)
  else
    FController
              .Entidade
               .Empresa
               .GetbyParams(aField, aValue)
               .DataSet(FDataSource);
end;

class procedure TControllerEmpresa.Registry;
begin
  THorse
      .Group
      .Prefix('ess')
         .Get('/empresas'     ,TControllerEmpresa.GetAll)
         .Get('/empresas/:id' ,TControllerEmpresa.GetbyId)
        .Post('empresas'      ,TControllerEmpresa.Post)
         .Put('empresas/:id'  ,TControllerEmpresa.Put)
      .Delete('empresas/:id'  ,TControllerEmpresa.Delete);
end;

end.