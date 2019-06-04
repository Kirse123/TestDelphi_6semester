unit Unit2;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient,
  Datasnap.Win.MConnect, Variants;

type
  TdmMy = class(TDataModule)
    DCOMConnection1: TDCOMConnection;
    cdsProduct: TClientDataSet;
    cdsFutura: TClientDataSet;
    cdsReport: TClientDataSet;
    cdsFuturaInfo: TClientDataSet;
    cdsClient: TClientDataSet;
    cdsProductID: TIntegerField;
    cdsProductNAME: TWideStringField;
    cdsProductMG: TWideStringField;
    cdsProductVAT: TFloatField;
    cdsClientID: TIntegerField;
    cdsClientNAME: TWideStringField;
    cdsClientADRESS: TWideStringField;
    cdsFuturaID: TIntegerField;
    cdsFuturaCLIENTID: TIntegerField;
    cdsFuturaTOTALSUM: TFloatField;
    cdsFuturaClientName: TStringField;
    cdsFuturaClientAdress: TStringField;
    cdsFuturaInfoFUTURAID: TIntegerField;
    cdsFuturaInfoPRODUCTID: TIntegerField;
    cdsFuturaInfoQUANTITY: TFloatField;
    cdsFuturaInfoPRICE: TFloatField;
    cdsFuturaInfoName: TStringField;
    cdsFuturaInfoMg: TStringField;
    cdsFuturaInfoSumma: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsFuturaCalcFields(DataSet: TDataSet);
    procedure cdsFuturaInfoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMy: TdmMy;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmMy.cdsFuturaCalcFields(DataSet: TDataSet);
begin
  if cdsClient.Locate('ID',
                      VarArrayOf([cdsFuturaCLIENTID.Value]),
                      []) then
  begin
    cdsFuturaClientName.Value := cdsClientNAME.Value;
    cdsFuturaClientAdress.Value := cdsClientADRESS.Value;
  end;

end;

procedure TdmMy.cdsFuturaInfoCalcFields(DataSet: TDataSet);
begin
  cdsFuturaInfoSumma.Value:=cdsFuturaInfoQUANTITY.Value * cdsFuturaInfoPRICE.Value;
end;

procedure TdmMy.DataModuleCreate(Sender: TObject);
begin
  cdsClient.Open;
  cdsProduct.Open;
  cdsFutura.Open;
  cdsFuturaInfo.Open;
  cdsFutura.AddIndex('indxID', 'ID', [], '', '');
  cdsFutura.IndexFieldNames := 'ID';
  cdsFuturaInfo.AddIndex('indxID', 'FuturaID;ProductID', [], '', '');
  cdsFuturaInfo.IndexFieldNames := 'FuturaID;ProductID';
end;

procedure TdmMy.DataModuleDestroy(Sender: TObject);
begin
  DCOMConnection1.Close;
end;

end.
