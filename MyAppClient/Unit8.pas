unit Unit8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls, unit2;

type
  TfmDatesGraphic = class(TForm)
    dtpFrom: TDateTimePicker;
    dtpTill: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    btnConfirm: TButton;
    BitBtn1: TBitBtn;
    procedure btnConfirmClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDatesGraphic: TfmDatesGraphic;

implementation

{$R *.dfm}

uses unitReports, unitDiogram, unitCanvas;

procedure TfmDatesGraphic.btnConfirmClick(Sender: TObject);
var
  fromDate, tillDate: TDate;
begin
  fromDate := dtpFrom.Date;
  tillDate := dtpTill.Date;
  if dmMy.cdsOrders.RecordCount > 0 then
  begin
    if dmMy.cdsReport.Active then
    begin
      dmMy.cdsReport.CancelUpdates;
      dmMy.cdsReport.Close;
    end;
    FormatSettings.DateSeparator := '.';
    dmMy.DCOMConnection1.AppServer.smSQLClear;

    dmMy.DCOMConnection1.AppServer.smSQLAddString('select sum("SUMMA"), "DATE" FROM ORDERS WHERE "STATUS" = ''Заказ отгружен'' AND "DATE" BETWEEN ''' + DateToStr(fromDate) +''' AND ''' + DateToStr(tillDate) + ''' GROUP BY "DATE";');
    dmMy.DCOMConnection1.AppServer.smSQLExecute;
    dmMy.cdsReport.ProviderName := 'dspQuery';
    dmMy.cdsReport.Open;
    fmReport.Datasource1.dataset := dmMy.cdsReport;
    //fmReport.ShowModal;
    fmGraph.DataSource1.DataSet := dmMy.cdsReport;
    if dmMy.cdsReport.RecordCount > 1 then
      begin;
        //fmGraph.showmodal;
        fmCanvas.ShowModal;
      end;
    if dmMy.cdsReport.Active then
      dmMy.cdsReport.Close;
    dmMy.DCOMConnection1.AppServer.smSQLClear;
  end;
end;

end.
