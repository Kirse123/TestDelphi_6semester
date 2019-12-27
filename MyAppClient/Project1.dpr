program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {fmMain},
  Unit2 in 'Unit2.pas' {dmMy: TDataModule},
  Unit3 in 'Unit3.pas' {fmProduct},
  Unit4 in 'Unit4.pas' {fmNewProduct},
  Unit5 in 'Unit5.pas' {fsClients},
  Unit6 in 'Unit6.pas' {fmNewClient},
  unitReports in 'unitReports.pas' {fmReport},
  unitOrders in 'unitOrders.pas' {fmOrders},
  unitOrderDetails in 'unitOrderDetails.pas' {fmOrderDetails},
  unitClientChoose in 'unitClientChoose.pas' {fmClientChoose},
  unitDiogram in 'unitDiogram.pas' {fmGraph},
  Unit8 in 'Unit8.pas' {fmDatesGraphic},
  unitCanvas in 'unitCanvas.pas' {fmCanvas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmOrders, fmOrders);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmMy, dmMy);
  Application.CreateForm(TfmProduct, fmProduct);
  Application.CreateForm(TfmNewProduct, fmNewProduct);
  Application.CreateForm(TfsClients, fsClients);
  Application.CreateForm(TfmNewClient, fmNewClient);
  Application.CreateForm(TfmReport, fmReport);
  Application.CreateForm(TfmOrderDetails, fmOrderDetails);
  Application.CreateForm(TfmClientChoose, fmClientChoose);
  Application.CreateForm(TfmGraph, fmGraph);
  Application.CreateForm(TfmDatesGraphic, fmDatesGraphic);
  Application.CreateForm(TfmCanvas, fmCanvas);
  Application.Run;
end.
