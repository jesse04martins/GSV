unit Model.PlanoContas;

interface

uses System.SysUtils, Model.Enum;
type
  TModelPlanoContas = class
  private
    FPlano: string;
    FTipo: TTipoPlanoConta;
    FidPlano: Integer;
  public
    constructor Create; overload;
    constructor Create(AIdPlano : Integer; APlano : string; ATipo : TTipoPlanoConta); overload;
    property IdPlano : Integer read FidPlano write FidPlano;
    property Plano : string  read FPlano write FPlano;
    property Tipo: TTipoPlanoConta  read FTipo write FTipo;
    procedure Validar;
  end;

implementation

{ TPlanoContas }

constructor TModelPlanoContas.Create;
begin

end;

constructor TModelPlanoContas.Create(AIdPlano: Integer; APlano: string; ATipo: TTipoPlanoConta);
begin
  FidPlano := AIdPlano;
  FPlano  := APlano;
  FTipo   := ATipo;
end;

procedure TModelPlanoContas.Validar;
begin
   if (FPlano.IsEmpty) then
       raise Exception.Create('Descrição do plano é obritatório!');

   if (FPlano.Length > 50) then
       raise Exception.Create('Não é permitido a decrição com mais de 50 carácteres!');
end;

end.
