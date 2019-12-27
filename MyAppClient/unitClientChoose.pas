unit unitClientChoose;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, unit2, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, unitReports, ComObj, Vcl.Buttons;

type
  TfmClientChoose = class(TForm)
    btnConfirm: TButton;
    Label1: TLabel;
    dtpFrom: TDateTimePicker;
    dtpTill: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbgClientChoose: TDBGrid;
    dspClient: TDataSource;
    bitBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure dtpFromCloseUp(Sender: TObject);
    procedure dtpTillCloseUp(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure ExportToExel(DBGrid1: TDBGrid; page : integer; Client : string; exelapp, book: variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmClientChoose: TfmClientChoose;
  ClientsIDSet: array of integer;

implementation

{$R *.dfm}



procedure TfmClientChoose.btnConfirmClick(Sender: TObject);
var
  i, ClientID : integer;
  tmp: TBookmark;
 // i,j,index: Integer;
  ExcelApp, book, sheet, after: Variant;
begin
  SetLength(ClientsIDSet, dbgClientChoose.SelectedRows.Count);
  if (dbgClientChoose.SelectedRows.Count > 0) then
    with dbgClientChoose.DataSource.DataSet do
      for i:=0 to dbgClientChoose.SelectedRows.Count - 1 do
      begin
        tmp := dbgClientChoose.SelectedRows.Items[i];
        GotoBookmark(tmp);
        ClientsIDSet[i] := FieldByName('ID').Value;
      end;

    //
  if dbgClientChoose.SelectedRows.Count > 0 then
  begin
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.Visible := false;
    book := ExcelApp.WorkBooks.Add(-4167);

    for i := 0 to dbgClientChoose.SelectedRows.Count - 1 do
    begin
        ClientID := ClientsIDSet[i];
        if dmMy.cdsReport.Active then
        begin
          dmMy.cdsReport.CancelUpdates;
          dmMy.cdsReport.Close
        end;

        dmMy.cdsReport.ProviderName := 'dspTMP';
        dmMy.cdsReport.Open;
        dmMy.cdsReport.AddIndex('indx1ID', 'ProductID', [], '', '');
        dmMy.cdsReport.IndexFieldNames := 'ProductID';
        dmMy.cdsOrders.AddIndex('repID', 'ClientID; OrderID', [], '', '');
        dmMy.cdsOrders.IndexFieldNames := 'ClientID; OrderID';
        dmMy.cdsOrders.SetRange([ClientID], [ClientID]);
        dmMy.cdsOrders.First;

        while not (dmMy.cdsOrders.Eof) do
        begin
          if (dmMy.cdsOrdersDATE.Value >= dtpFrom.date) and
             (dmMy.cdSOrdersDATE.value <= dtpTill.date) and
             (dmMy.cdsOrdersSTATUS.Value = 'Ожидает отгрузки') then
          begin
            dmMy.cdsOrdersInfo.First;
            while not dmMy.cdsOrdersInfo.Eof do
            begin
              if dmMy.cdsReport.FindKey([dmMy.cdsOrdersInfoProductID.Value]) then
              begin
                dmMy.cdsReport.Edit;
              end
              else
              begin
                dmMy.cdsReport.Append;
                dmMy.cdsReport.FieldByName('ProductID').value :=
                  dmMy.cdsOrdersInfoProductID.value;
                dmMy.cdsReport.FieldByName('Name').value :=
                  dmMy.cdsOrdersInfoName.value;
                dmMy.cdsReport.FieldByName('Quantity').value := 0;
                dmMy.cdsReport.FieldByName('Summa').value := 0;
              end;
              dmMy.cdsReport.FieldByName('Quantity').Value :=
                dmMy.cdsReport.FieldByName('Quantity').Value +
                dmMy.cdsOrdersInfoQuantity.Value;
              dmMy.cdsReport.FieldByName('Summa').Value :=
                dmMy.cdsReport.FieldByName('Summa').Value +
                dmMy.cdsOrdersInfoSum.Value;
              dmMy.cdsReport.Post;
              dmMy.cdsOrdersInfo.next;
            end;
          end;
          dmMy.cdsOrders.Next;
        end;
        dmMy.cdsReport.FieldByName('ProductID').DisplayLabel := '№';
        dmMy.cdsReport.FieldByName('Name').DisplayLabel := 'Наименование';
        dmMy.cdsReport.FieldByName('Quantity').DisplayLabel := 'Количество';
        dmMy.cdsReport.FieldByName('Summa').DisplayLabel := 'Сумма';
        fmReport.DataSource1.Dataset := dmMy.cdsReport;
        exportToExel(fmReport.DBGrid1, i + 1, dmMy.cdsClientNAME.Value, ExcelApp, book);
        //fmReport.ShowModal;
        dmMy.cdsReport.DeleteIndex('indx1ID');
        dmMy.cdsOrders.DeleteIndex('repID');
        if dmMy.cdsReport.Active then
        begin
          dmMy.cdsReport.CancelUpdates;
          dmMy.cdsReport.Close;
        end;
        dmMy.cdsOrders.IndexFieldNames := 'ORDERID';

         //exel

    end;
    ExcelApp.Visible := true;
  end
  //
end;

procedure TfmClientChoose.dtpFromCloseUp(Sender: TObject);
begin
  dtpTill.MinDate := dtpFrom.date;
end;

procedure TfmClientChoose.dtpTillCloseUp(Sender: TObject);
begin
  dtpFrom.MaxDate := dtpTill.Date;
end;

procedure TfmClientChoose.FormCreate(Sender: TObject);
begin
  dspClient.DataSet := dmMy.cdsClient;
end;

procedure     TfmClientChoose.ExportToExel(DBGrid1: TDBGrid; page: integer;
                                            Client: string; ExelApp, book : variant);
var i,j,index: Integer;
    sheet, after: Variant;

begin
  if page > 1 then
    book.Worksheets.Add(After := book.Worksheets
[book.Worksheets.Count]);

  book.WorkSheets[page].name := Client;
  sheet:=book.WorkSheets[Client];
  index:=3;
  DBGrid1.DataSource.DataSet.First;
  for i:=0 to DBGrid1.DataSource.DataSet.RecordCount - 1 do
  begin
    for j:=1 to DBGrid1.FieldCount - 1do
      sheet.cells[index,j]:=DBGrid1.fields[j].asstring;
    inc(index);
    DBGrid1.DataSource.DataSet.Next;
  end;
end;

end.
