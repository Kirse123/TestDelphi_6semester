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
    cdsOrders: TClientDataSet;
    cdsOrdersInfo: TClientDataSet;
    cdsOrdersORDERID: TIntegerField;
    cdsOrdersCLIENTID: TIntegerField;
    cdsOrdersPAYMENT_TYPE: TWideStringField;
    cdsOrdersSTATUS: TWideStringField;
    cdsOrdersPREPAY: TFloatField;
    cdsOrdersSUMMA: TFloatField;
    cdsOrdersInfoORDERID: TIntegerField;
    cdsOrdersInfoPRODUCTID: TIntegerField;
    cdsOrdersClientName: TStringField;
    cdsOrdersInfoName: TStringField;
    cdsOrdersInfoMg: TStringField;
    cdsOrdersInfoSum: TFloatField;
    cdsOrdersInfoPRICE: TFloatField;
    cdsOrdersInfoQUANTITY: TFloatField;
    cdsFuturaInfoFUTURAID: TIntegerField;
    cdsFuturaInfoPRODUCTID: TIntegerField;
    cdsFuturaInfoQUANTITY: TFloatField;
    cdsFuturaInfoPRICE: TFloatField;
    cdsFuturaORDERID: TIntegerField;
    cdsOrdersDATE: TDateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsFuturaCalcFields(DataSet: TDataSet);
    procedure cdsFuturaInfoCalcFields(DataSet: TDataSet);
    procedure cdsOrdersCalcFields(DataSet: TDataSet);
    procedure cdsOrdersInfoCalcFields(DataSet: TDataSet);
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
  //cdsFuturaInfoSumma.Value:=cdsFuturaInfoQUANTITY.Value * cdsFuturaInfoPRICE.Value;
end;

procedure TdmMy.cdsOrdersCalcFields(DataSet: TDataSet);
begin
  if cdsClient.Locate('ID', VarArrayOf([cdsOrdersClientID.Value]), []) then
    begin
      cdsOrdersClientName.Value := cdsClientNAME.Value;
    end;
end;

procedure TdmMy.cdsOrdersInfoCalcFields(DataSet: TDataSet);
begin
 cdsOrdersInfoSum.Value := cdsOrdersInfoQUANTITY.Value * cdsOrdersInfoPRICE.Value;
end;

procedure TdmMy.DataModuleCreate(Sender: TObject);
begin
  cdsClient.Open;
  cdsProduct.Open;
  cdsFutura.Open;
  cdsFuturaInfo.Open;
  cdsOrders.Open;
  cdsOrdersInfo.Open;
  //индексы для накладной
  cdsFutura.AddIndex('indxID', 'ORDERID', [], '', '');
  cdsFutura.IndexFieldNames := 'ORDERID';
  cdsOrdersInfo.AddIndex('indxID', 'OrderID;ProductID', [], '', '');
  cdsOrdersInfo.IndexFieldNames := 'OrderID;ProductID';
  //индексы для заказов
  cdsOrders.AddIndex('order_indxID', 'ORDERID', [], '', '');
  cdsOrders.IndexFieldNames := 'ORDERID';
  cdsOrdersInfo.AddIndex('order_indxID', 'OrderID;ProductID', [], '', '');
  cdsOrdersInfo.IndexFieldNames := 'OrderID;ProductID';
end;

procedure TdmMy.DataModuleDestroy(Sender: TObject);
begin
  DCOMConnection1.Close;
  //удаляем ненужные индексы
  cdsOrders.DeleteIndex('order_indxID');
  cdsOrdersInfo.DeleteIndex('order_indxID');
  cdsFutura.DeleteIndex('indxID');
  cdsOrdersInfo.DeleteIndex('indxID');
end;

end.
