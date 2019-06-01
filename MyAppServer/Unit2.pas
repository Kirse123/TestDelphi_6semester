unit Unit2;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, Project1_TLB, StdVcl, IBX.IBQuery, Data.DB, IBX.IBCustomDataSet,
  IBX.IBTable, IBX.IBDatabase, Datasnap.Provider, IBX.IBStoredProc;

type
  TMyServer = class(TRemoteDataModule, IMyServer)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    ibtClient: TIBTable;
    ibtProduct: TIBTable;
    ibtFutura: TIBTable;
    ibtFuturaInfo: TIBTable;
    ibtTMP: TIBTable;
    IBQuery1: TIBQuery;
    dspClient: TDataSetProvider;
    dspProduct: TDataSetProvider;
    dspFutura: TDataSetProvider;
    dspFuturaInfo: TDataSetProvider;
    dspTMP: TDataSetProvider;
    dspQuery: TDataSetProvider;
    ibspUpdateClient: TIBStoredProc;
    ibspDeleteClient: TIBStoredProc;
    ibspUpdateProduct: TIBStoredProc;
    ibspDeleteProduct: TIBStoredProc;
    ibspUpdateFutura: TIBStoredProc;
    ibspDeleteFutura: TIBStoredProc;
    ibspUpdateFuturaInfo: TIBStoredProc;
    ibspDeleteFuturaInfo: TIBStoredProc;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure smUpdateClient(ID: Integer; const NAME, ADRESS: WideString); safecall;
    procedure smDeleteClient(ID: Integer); safecall;
    procedure smDeleteFutura(ID: Integer); safecall;
    procedure smDeleteFuturaInfo(FuturaID, ProductID: Integer); safecall;
    procedure smDeleteProdut(ID: Integer); safecall;
    procedure smUpdateFutura(ID, ClientID: Integer; TotalSum: Double); safecall;
    procedure smUpdateFuturaInfo(FuturaID, ProductID: Integer; Quantity, Price: Double);
          safecall;
    procedure smUpdateProduct(ID: Integer; const NAME, MG: WideString; VAT: Double); safecall;
    procedure smSQLAddString(const str: WideString); safecall;
    procedure smSQLClear; safecall;
    procedure smSQLExecute; safecall;

  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TMyServer.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TMyServer.smUpdateClient(ID: Integer; const NAME, ADRESS: WideString);
begin
  if ibspUpdateClient.Transaction.InTransaction then
    ibspUpdateClient.Transaction.Commit;
  ibspUpdateClient.Params[0].Value := ID;
  ibspUpdateClient.Params[1].Value := NAME;
  ibspUpdateClient.Params[2].Value := ADRESS;
  ibspUpdateClient.ExecProc;
  if ibspUpdateClient.Transaction.InTransaction then
    ibspUpdateClient.Transaction.Commit;
end;

procedure TMyServer.smDeleteClient(ID: Integer);
begin
  if ibspDeleteClient.Transaction.InTransaction then
    ibspDeleteClient.Transaction.Commit;
  ibspDeleteClient.Params[0].Value := ID;
  ibspDeleteClient.ExecProc;
  if ibspDeleteClient.Transaction.InTransaction then
    ibspDeleteClient.Transaction.Commit;
end;

procedure TMyServer.smDeleteFutura(ID: Integer);
begin
  if ibspDeleteFutura.Transaction.InTransaction then
    ibspDeleteFutura.Transaction.Commit;
  ibspDeleteFutura.Params[0].Value := ID;
  ibspDeleteFutura.ExecProc;
  if ibspDeleteFutura.Transaction.InTransaction then
    ibspDeleteFutura.Transaction.Commit;
end;

procedure TMyServer.smDeleteFuturaInfo(FuturaID, ProductID: Integer);
begin
  if ibspDeleteFuturaInfo.Transaction.InTransaction then
    ibspDeleteFuturaInfo.Transaction.Commit;
  ibspDeleteFuturaInfo.Params[0].Value := FuturaID;
  ibspDeleteFuturaInfo.Params[1].Value := ProductID;
  if ibspDeleteFuturaInfo.Transaction.InTransaction then
    ibspDeleteFuturaInfo.Transaction.Commit;
end;

procedure TMyServer.smDeleteProdut(ID: Integer);
begin
  if ibspDeleteProduct.Transaction.InTransaction then
    ibspDeleteProduct.Transaction.Commit;
  ibspDeleteProduct.Params[0].Value := ID;
  ibspDeleteProduct.ExecProc;
  if ibspDeleteProduct.Transaction.InTransaction then
    ibspDeleteProduct.Transaction.Commit;
end;

procedure TMyServer.smUpdateFutura(ID, ClientID: Integer; TotalSum: Double);
begin
  if ibspUpdateFutura.Transaction.InTransaction then
    ibspUpdateFutura.Transaction.Commit;
  ibspUpdateFutura.Params[0].Value := ID;
  ibspUpdateFutura.Params[1].Value := ClientID;
  ibspUpdateFutura.Params[2].Value := TotalSum;
  ibspUpdateFutura.ExecProc;
  if ibspUpdateFutura.Transaction.InTransaction then
    ibspUpdateFutura.Transaction.Commit;
end;

procedure TMyServer.smUpdateFuturaInfo(FuturaID, ProductID: Integer; Quantity, Price: Double);

begin
  if ibspUpdateFuturaInfo.Transaction.InTransaction then
    ibspUpdateFuturaInfo.Transaction.Commit;
  ibspUpdateFuturaInfo.Params[0].Value := FuturaID;
  ibspUpdateFuturaInfo.Params[1].Value := ProductID;
  ibspUpdateFuturaInfo.Params[2].Value := Quantity;
  ibspUpdateFuturaInfo.Params[3].Value := Price;
  ibspUpdateFuturaInfo.ExecProc;
  if ibspUpdateFuturaInfo.Transaction.InTransaction then
    ibspUpdateFuturaInfo.Transaction.Commit;
end;

procedure TMyServer.smUpdateProduct(ID: Integer; const NAME, MG: WideString; VAT: Double);

begin
  if ibspUpdateProduct.Transaction.InTransaction then
    ibspUpdateProduct.Transaction.Commit;
  ibspUpdateProduct.Params[0].Value := ID;
  ibspUpdateProduct.Params[1].Value := NAME;
  ibspUpdateProduct.Params[2].Value := MG;
  ibspUpdateProduct.Params[3].Value := VAT;
  ibspUpdateProduct.ExecProc;
  if ibspUpdateProduct.Transaction.InTransaction then
    ibspUpdateProduct.Transaction.Commit;
end;

procedure TMyServer.smSQLAddString(const str: WideString);
begin
  IBQuery1.SQL.Add(str);
end;

procedure TMyServer.smSQLClear;
begin
  if IBQuery1.Transaction.InTransaction then
    IBQuery1.Transaction.Commit;
  IBQuery1.Close;

  IBQuery1.SQL.Clear;
end;

procedure TMyServer.smSQLExecute;
begin
  IBQuery1.Open;
  if IBQuery1.Transaction.InTransaction then
    IBQuery1.Transaction.Commit;
end;

initialization
  TComponentFactory.Create(ComServer, TMyServer,
    Class_MyServer, ciMultiInstance, tmSingle);
end.
