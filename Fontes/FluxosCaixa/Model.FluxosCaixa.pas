unit Model.FluxosCaixa;

interface

uses System.SysUtils;

type
   TModelFluxosCaixa = class
   private
    FIdPlanoConta: integer;
    FHora: TTime;
    FIdEmpresa: Integer;
    FData: TDateTime;
    FIdCaixa: Integer;
    FDescricaoLanc: string;
    FValor: Extended;

   public
     constructor Create;
     property IdCaixa: Integer read FIdCaixa write FIdCaixa;
     property Data: TDateTime read FData write FData;
     property Hora: TTime  read FHora write FHora;
     property IdPlanoConta: integer  read FIdPlanoConta write FIdPlanoConta;
     property IdEmpresa: Integer  read FIdEmpresa write FIdEmpresa;
     property DescricaoLanc: string  read FDescricaoLanc write FDescricaoLanc;
     property Valor: Extended read FValor write FValor;
     procedure Validar;

   end;

implementation

{ TModelFluxosCaixa }

constructor TModelFluxosCaixa.Create;
begin

end;

procedure TModelFluxosCaixa.Validar;
begin
   if (FIdPlanoConta = 0) then
       raise Exception.Create('O plano de contas n�o foi informado!');

   if (FIdEmpresa = 0) then
       raise Exception.Create('A empresa n�o foi informado!');

   if (FDescricaoLanc.IsEmpty) then
       raise Exception.Create('A descri��o do lan�amento � obrigat�rio!');

    if (FDescricaoLanc.Length > 255) then
        raise Exception.Create('N�o � permitido a descri��o com mais de 255 car�cteres! ');

   if (FValor <=0) then
       raise Exception.Create('Valor menor ou igual a Zero n�o � permitido!');
end;

end.
