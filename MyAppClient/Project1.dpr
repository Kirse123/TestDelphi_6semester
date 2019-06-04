program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {fmMain},
  Unit2 in 'Unit2.pas' {dmMy: TDataModule},
  Unit3 in 'Unit3.pas' {fmProduct},
  Unit4 in 'Unit4.pas' {fmNewProduct},
  Unit5 in 'Unit5.pas' {fsClients},
  Unit6 in 'Unit6.pas' {fmNewClient},
  unitReports in 'unitReports.pas' {fmReport};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmMy, dmMy);
  Application.CreateForm(TfmProduct, fmProduct);
  Application.CreateForm(TfmNewProduct, fmNewProduct);
  Application.CreateForm(TfsClients, fsClients);
  Application.CreateForm(TfmNewClient, fmNewClient);
  Application.CreateForm(TfmReport, fmReport);
  Application.Run;
end.
