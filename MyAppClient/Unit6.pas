unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfmNewClient = class(TForm)
    ibName: TLabel;
    ibAdress: TLabel;
    edName: TEdit;
    edAdress: TEdit;
    btnCancel: TBitBtn;
    btnOK: TBitBtn;
    procedure edNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNewClient: TfmNewClient;

implementation

{$R *.dfm}

procedure TfmNewClient.edNameChange(Sender: TObject);
begin
  btnOK.Enabled := (edName.Text<>'') and (edAdress.Text <> '');
end;

end.
