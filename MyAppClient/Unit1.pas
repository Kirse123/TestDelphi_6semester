unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, unit3, unit5, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, unit2;

type
  TfmMain = class(TForm)
    MainMenu1: TMainMenu;
    miData: TMenuItem;
    miProduct: TMenuItem;
    miClient: TMenuItem;
    miReport: TMenuItem;
    miReport1: TMenuItem;
    miReport2: TMenuItem;
    miClose: TMenuItem;
    pnlFutura: TPanel;
    pnlFuturaInfo: TPanel;
    pnlFuturaMofify: TPanel;
    dbgFutura: TDBGrid;
    dbgFuturaInfo: TDBGrid;
    dsFutura: TDataSource;
    dsFuturaInfo: TDataSource;
    miOrders: TMenuItem;
    procedure miProductClick(Sender: TObject);
    procedure miClientClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miOrdersClick(Sender: TObject);
  private
    { Private declarations }
    var ProductID: integer;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

uses unitReports, unitOrders;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  pnlFutura.Height := fmMain.ClientHeight div 2;
  dsFutura.DataSet := dmMy.cdsFutura;
  dsFuturaInfo.DataSet := dmMy.cdsOrdersInfo;

  dmMy.cdsOrdersInfo.MasterSource := dsFutura;
  dmMy.cdsOrdersInfo.MasterFields := 'ORDERID';
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmMy.cdsOrdersInfo.MasterFields := 'ORDERID';
  dmMy.cdsOrdersInfo.MasterSource := fmOrders.dsOrders;
  dsFutura.DataSet := nil;
  dsFuturaInfo.DataSet := nil;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  ProductID := 0;
end;

procedure TfmMain.miClientClick(Sender: TObject);
begin
  fsClients.ShowModal;
end;

procedure TfmMain.miCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.miOrdersClick(Sender: TObject);
begin
  fmOrders.ShowModal;
end;

procedure TfmMain.miProductClick(Sender: TObject);
begin
  fmProduct.ShowModal;
end;


end.
