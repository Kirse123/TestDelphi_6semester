unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfmNewProduct = class(TForm)
    lbName: TLabel;
    ibMG: TLabel;
    ibVAT: TLabel;
    edName: TEdit;
    edMg: TEdit;
    edVAT: TEdit;
    btnCancel: TBitBtn;
    btnOK: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure edVATKeyPress(Sender: TObject; var Key: Char);
    procedure edNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNewProduct: TfmNewProduct;

implementation

{$R *.dfm}



procedure TfmNewProduct.edNameChange(Sender: TObject);
var
  i: integer;
begin
  btnOk.Enabled := True;
  for i := 0 to ComponentCount-1 do
    if Components[i] is TEdit then
      btnOK.Enabled := btnOk.Enabled and ((Components[i] as TEdit).text <> '');
end;

procedure TfmNewProduct.edVATKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key<'0') or (Key>'9')) and (Key <> #8) then
  begin
    if (Key <> FormatSettings.DecimalSeparator) or
       (pos(FormatSettings.DecimalSeparator, edVAT.Text) > 0) then
       Key:=#0;

  end;
end;

procedure TfmNewProduct.FormActivate(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to ComponentCount-1 do
    if Components[i] is TEdit then
      (Components[i] as TEdit).Text := '';
  btnOk.Enabled := False;
end;

end.
