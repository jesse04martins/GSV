unit View.FormBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TFrmBase = class(TForm)
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBase: TFrmBase;

implementation

{$R *.dfm}

procedure TFrmBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #27) then begin
       Key := #0;
       Perform(WM_NEXTDLGCTL, 0, 1);
   end;

   if (Key = #13) then begin
       Key := #0;
       Perform(WM_NEXTDLGCTL, 0,0);
   end;
end;

end.
