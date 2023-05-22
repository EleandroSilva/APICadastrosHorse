{*******************************************************}
{                                                       }
{                      ES Sistemas                      }
{                                                       }
{ Empresas de Sistemas 2003-2023 www.bemoreweb.com.br   }
{                     (17)98169-5336                    }
{                                                       }
{*******************************************************}
unit Model.Swagger.Tabela.Usuario;

interface

type
  TUsuario = class
    private
      Fid        : Integer;{bigint(20) }
      FidEmpresa : Integer;{bigint(20) }
      FNome      : String;{40 caracter }
      FSobreNome : String;{40 caracter }
      FEmail     : String;{100 caracter}
      FSenha     : String;{20 caracter }
    public
      property id        : Integer read Fid        write Fid;
      property idEmpresa : Integer read Fidempresa write Fidempresa;
      property Nome      : String  read FNome      write FNome;
      property SobreNome : String  read FSobreNome write FSobreNome;
      property Email     : String  read FEmail     write FEmail;
      property Senha     : String  read FSenha     write FSenha;
  end;

implementation



end.
