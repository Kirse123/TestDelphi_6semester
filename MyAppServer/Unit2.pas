unit Unit2;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, Project1_TLB, StdVcl, IBX.IBQuery, Data.DB, IBX.IBCustomDataSet,
  IBX.IBTable, IBX.IBDatabase;

type
  TMyServer = class(TRemoteDataModule, IMyServer)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBTable1: TIBTable;
    IBTable2: TIBTable;
    IBTable3: TIBTable;
    IBTable4: TIBTable;
    IBTable5: TIBTable;
    IBQuery1: TIBQuery;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
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

initialization
  TComponentFactory.Create(ComServer, TMyServer,
    Class_MyServer, ciMultiInstance, tmSingle);
end.
