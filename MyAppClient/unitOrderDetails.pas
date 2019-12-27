unit unitOrderDetails;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, unit2,
  Vcl.ComCtrls;

type
  TfmOrderDetails = class(TForm)
    cbxPaymentType: TComboBox;
    Label1: TLabel;
    edPrepayment: TEdit;
    lbPrepayment: TLabel;
    btnCancel: TBitBtn;
    btnConfirm: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    lbDate: TLabel;
    procedure edPrepaymentKeyPress(Sender: TObject; var Key: Char);
    procedure cbxPaymentTypeChange(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmOrderDetails: TfmOrderDetails;

implementation

{$R *.dfm}

procedure TfmOrderDetails.btnConfirmClick(Sender: TObject);
  var status: string;
begin

  if (StrToFloat(edPrepayment.Text) >= dmMy.cdsOrdersSUMMA.Value * 0.3) then
    begin
      status := 'ќжидает отгрузки';
    end
  else 
    status := 'ќжидает предоплаты';
  dmMy.DCOMConnection1.AppServer.smUpdateOrders(dmMy.cdsOrdersORDERID.Value,
                                                dmMy.cdsOrdersCLIENTID.Value,
                                                cbxPaymentType.Text,
                                                StrToFloat(edPrepayment.Text),
                                                dmMy.cdsOrdersSUMMA.Value,
                                                status,
                                                DateTimePicker1.Date
                                                );
  dmMy.cdsOrders.Refresh;
  close;
end;

procedure TfmOrderDetails.cbxPaymentTypeChange(Sender: TObject);
begin
  if (btnConfirm.Enabled = false) then
    btnConfirm.Enabled := true;
end;

procedure TfmOrderDetails.edPrepaymentKeyPress(Sender: TObject; var Key: Char);
begin
  if((Key < '0')or (Key > '9')) and (Key <> #8) then
  begin
    if (Key <> FormatSettings.DecimalSeparator) or
        (pos(FormatSettings.DecimalSeparator, edPrepayment.Text) > 0)then
        Key := #0;
  end;
end;

end.
