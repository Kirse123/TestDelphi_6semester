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
    pnlFuturaInfoModify: TPanel;
    dbgFuturaInfo: TDBGrid;
    btnNewFutura: TButton;
    btnDeleteFutura: TButton;
    dsFutura: TDataSource;
    dsFuturaInfo: TDataSource;
    btnAddPoduct: TButton;
    btnDeleteProduct: TButton;
    btnProductSelect: TButton;
    lbProduct: TLabel;
    gbNumbers: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edQuantity: TEdit;
    edPrice: TEdit;
    procedure miProductClick(Sender: TObject);
    procedure miClientClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewFuturaClick(Sender: TObject);
    procedure btnDeleteFuturaClick(Sender: TObject);
    procedure miCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnProductSelectClick(Sender: TObject);
    procedure edQuantityChange(Sender: TObject);
    procedure btnAddPoductClick(Sender: TObject);
    procedure btnDeleteProductClick(Sender: TObject);
    procedure dsFuturaDataChange(Sender: TObject; Field: TField);
    procedure miReport1Click(Sender: TObject);
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

uses unitReports;

procedure TfmMain.btnAddPoductClick(Sender: TObject);
begin
  dmMy.DCOMConnection1.AppServer.smUpdateFuturaInfo(
          ProductID,
          StrToFloat(edQuantity.Text),
          StrToFloat(edPrice.Text),
          dmMy.cdsFuturaID.Value);
  dmMy.cdsFutura.Refresh;
  dmMy.cdsFuturaInfo.Refresh;
end;

procedure TfmMain.btnDeleteFuturaClick(Sender: TObject);
begin
  if MessageDlg('Вы дйствительно хотите удалить накладную №' +
   dmMy.cdsFuturaID.AsString + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmMy.DCOMConnection1.AppServer.smDeleteFutura(dmMy.cdsFuturaID.Value);
    dmMy.cdsFutura.Refresh;
    btnDeleteFutura.Enabled := dmMy.cdsFutura.RecordCount > 0;
    pnlFuturaMofify.Visible := btnDeleteFutura.Enabled;
  end;
end;

procedure TfmMain.btnDeleteProductClick(Sender: TObject);
begin
  if MessageDlg('Удалить материал ' + dmMy.cdsFuturaInfoName.AsString +
  '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmMy.DCOMConnection1.AppServer.smDeleteFuturaInfo(
    dmMy.cdsFuturaInfoFUTURAID.Value,
    dmMy.cdsFuturaInfoPRODUCTID.Value);
    dmMy.cdsFuturaInfo.Refresh;
  end;

end;

procedure TfmMain.btnNewFuturaClick(Sender: TObject);
begin
  fsClients.ShowModal;
  if dmMy.cdsClient.RecordCount > 0 then
    dmMy.DCOMConnection1.AppServer.smUpdateFutura(
      0,
      dmMy.cdsClientID.Value,
      0);
  dmMy.cdsFutura.Refresh;
  btnDeleteFutura.Enabled := dmMy.cdsFutura.RecordCount > 0;
  pnlFuturaInfoModify.Visible := btnDeleteFutura.Enabled;
end;

procedure TfmMain.btnProductSelectClick(Sender: TObject);
begin
  fmProduct.ShowModal;
  ProductID := 0;
  lbProduct.Caption := '';
  if dmMy.cdsProduct.RecordCount > 0 then
  begin
    ProductID := dmMy.cdsProductID.Value;
    lbProduct.Caption := dmMy.cdsProductNAME.AsString;
  end;
  gbNumbers.Visible := ProductID > 0;
  edPrice.Text := '0';
  edQuantity.Text := '0';
  btnAddPoduct.Enabled := false;
end;

procedure TfmMain.dsFuturaDataChange(Sender: TObject; Field: TField);
begin
  btnDeleteProduct.Enabled := dmMy.cdsFuturaInfo.RecordCount > 0;
end;

procedure TfmMain.edQuantityChange(Sender: TObject);
begin
  try
    StrToFloat(edPrice.Text);
    StrToFloat(edQuantity.Text);
    btnAddPoduct.Enabled := true;
  except
    btnAddPoduct.Enabled := false;
  end;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  pnlFutura.Height := fmMain.ClientHeight div 2;
  dsFutura.DataSet := dmMy.cdsFutura;
  dsFuturaInfo.DataSet := dmMy.cdsFuturaInfo;
  dmMy.cdsFuturaInfo.MasterSource := dsFutura;
  dmMy.cdsFuturaInfo.MasterFields := 'ID';
  btnDeleteFutura.Enabled := dmMy.cdsFutura.RecordCount > 0;
  pnlFuturaInfoModify.Visible:=btnDeleteFutura.Enabled;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmMy.cdsFuturaInfo.MasterFields := '';
  dmMy.cdsFuturaInfo.MasterSource := nil;
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

procedure TfmMain.miProductClick(Sender: TObject);
begin
  fmProduct.ShowModal;
end;

procedure TfmMain.miReport1Click(Sender: TObject);
var
  ClientID: Integer;
begin
  fsClients.ShowModal;
  if dmMy.cdsClient.RecordCount > 0 then
  begin
    ClientID := dmMy.cdsClientID.Value;
    if dmMy.cdsReport.Active then
    begin
      dmMy.cdsReport.CancelUpdates;
      dmMy.cdsReport.Close;
    end;
    dmMy.cdsReport.ProviderName := 'dspTMP';
    dmMy.cdsReport.Open;
    dmMy.cdsReport.AddIndex('indxID', 'ProductID', [], '', '');
    dmMy.cdsReport.IndexFieldNames := 'ProductID';
    dmMy.cdsFutura.AddIndex('repID', 'ClientID;ID', [], '', '');
    dmMy.cdsFutura.IndexFieldNames := 'ClientID;ID';
    dmMy.cdsFutura.SetRange([ClientID], [ClientID]);
    dmMy.cdsFutura.First;
    while not dmMy.cdsFutura.Eof do
    begin
      dmMy.cdsFuturaInfo.First;
      while not dmMy.cdsFuturaInfo.Eof do
      begin
        if dmMy.cdsReport.FindKey([dmMy.cdsFuturaInfoPRODUCTID.Value]) then
        begin
          dmMy.cdsReport.Edit;
        end
        else
        begin
          dmMy.cdsReport.Append;
          dmMy.cdsReport.FieldByName('ProductID').Value :=
  dmMy.cdsFuturaInfoPRODUCTID.Value;
          dmMy.cdsReport.FieldByName('Name').Value :=
  dmMy.cdsFuturaInfoName.Value;
          dmMy.cdsReport.FieldByName('Quantity').Value := 0;
          dmMy.cdsReport.FieldByName('Summa').Value := 0;
        end;
        dmMy.cdsReport.FieldByName('Quantity').Value :=
  dmMy.cdsReport.FieldByName('Quantity').Value + dmMy.cdsFuturaInfoQUANTITY.Value;
        dmMy.cdsReport.FieldByName('Summa').Value :=
  dmMy.cdsReport.FieldByName('Summa').Value + dmMy.cdsFuturaInfoSumma.Value;
        dmMy.cdsReport.Post;
        dmMy.cdsFuturaInfo.Next;
      end;
      dmMy.cdsFutura.Next;
    end;
    dmMy.cdsReport.FieldByName('ProductID').DisplayLabel := '№';
    dmMy.cdsReport.FieldByName('Name').DisplayLabel := 'Материал';
    dmMy.cdsReport.FieldByName('Name').DisplayWidth := 50;
    dmMy.cdsReport.FieldByName('Quantity').DisplayLabel := 'Количество';
    dmMy.cdsReport.FieldByName('Quantity').DisplayWidth := 15;
    dmMy.cdsReport.FieldByName('Summa').DisplayLabel := 'Сумма';
    dmMy.cdsReport.FieldByName('Summa').DisplayWidth := 15;
    fmReport.DataSource1.DataSet := dmMy.cdsReport;
    fmReport.Showmodal;
    if dmMy.cdsReport.Active then
    begin
      dmMy.cdsReport.CancelUpdates;
      dmMy.cdsReport.Close;
    end;
    dmMy.cdsFutura.IndexFieldNames := 'ID';
  end;
end;

end.
