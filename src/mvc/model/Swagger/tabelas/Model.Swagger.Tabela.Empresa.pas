{*******************************************************}
{                                                       }
{                      ES Sistemas                      }
{                                                       }
{ Empresas de Sistemas 2003-2023 www.bemoreweb.com.br   }
{                     (17)98169-5336                    }
{                                                       }
{*******************************************************}
unit Model.Swagger.Tabela.Empresa;

interface


type
  TEmpresa = class
    private
      Fid              : Integer;{bigint(20)}
      FCNPJ            : String; {10.971.730/0001-93}{varchar(20)}
      FIE              : String; {451.119.471.114}{varchar(16)}
      FNomeEmpresarial : String; {varchar(120)}
      FNomeFantasia    : String; {varchar(120)}
      FDD              : String; {char(2)}
      FCelular         : String; {varchar(10)}
    public
      property id              : Integer read Fid              write Fid;
      property CNPJ            : String  read FCNPJ            write FCNPJ;
      property IE              : String  read FIE              write FIE;
      property NomeEmpresarial : String  read FNomeEmpresarial write FNomeEmpresarial;
      property NomeFantasia    : String  read FNomeFantasia    write FNomeFantasia;
      property DD              : String  read FDD              write FDD;
      property Celular         : String  read FCelular         write FCelular;
  end;

implementation

end.
