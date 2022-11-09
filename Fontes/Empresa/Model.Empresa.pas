unit Model.Empresa;

interface

uses System.SysUtils;

type
  TModelEmpresa = class
  private
    FIdEmpresa: integer;
    FRazaoSocial: string;
    FNomeFantasia: string;
  public
    constructor Create; overload;
    constructor Create(AIdEmpresa : Integer; ARazaoSocial, ANomeFantasia : string); overload;
    property IdEmpresa: integer  read FIdEmpresa write FIdEmpresa;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property NomeFantasia: string read FNomeFantasia write FNomeFantasia;
    procedure Validar;
  end;

implementation

{ TModelEmpresa }


{ TModelEmpresa }

constructor TModelEmpresa.Create;
begin

end;

constructor TModelEmpresa.Create(AIdEmpresa: Integer; ARazaoSocial, ANomeFantasia: string);
begin
   FIdEmpresa    := AIdEmpresa;
   FRazaoSocial  := ARazaoSocial;
   FNomeFantasia := ANomeFantasia;
end;

procedure TModelEmpresa.Validar;
begin
   if (FRazaoSocial.IsEmpty) then
       raise Exception.Create('Raz�o social � obrigat�rio!');

   if (RazaoSocial.Length > 50) then
       raise Exception.Create('N�o � permitido a Raz�o Social com mais 50 car�cteres!');

   if (FNomeFantasia.IsEmpty) then
       raise Exception.Create('Nome de fsntasia � obrigat�rio!');

   if (FNomeFantasia.Length > 50) then
       raise Exception.Create('N�o � permitido o nome de fantasia com mais 50 car�cteres!');
end;

end.
