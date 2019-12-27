unit unitOrders;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Menus, unit2,  ComObj;

type
  TfmOrders = class(TForm)
    MainMenu1: TMainMenu;
    miData: TMenuItem;
    miReports: TMenuItem;
    miClose: TMenuItem;
    pnlOrders: TPanel;
    pnlOrdersInfo: TPanel;
    pnlOrdersModify: TPanel;
    dbgOrders: TDBGrid;
    pnlOrdersInfoModify: TPanel;
    dbgOrdersInfo: TDBGrid;
    btnNewOrder: TButton;
    btnDeleteOrder: TButton;
    dsOrders: TDataSource;
    dsOrdersInfo: TDataSource;
    N4: TMenuItem;
    miProduct: TMenuItem;
    btnChangeOrder: TButton;
    lbProduct: TLabel;
    btnAddProduct: TButton;
    btnDeleteProduct: TButton;
    btnProductSelect: TButton;
    gbNumbers: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edPrice: TEdit;
    edQuantity: TEdit;
    btnConfirmOrder: TButton;
    btnExportMSWord: TButton;
    miReport: TMenuItem;
    miFutura: TMenuItem;
    btnConfirmPayment: TButton;
    miGraphic: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miProductClick(Sender: TObject);
    procedure miCloseClick(Sender: TObject);
    procedure btnNewOrderClick(Sender: TObject);
    procedure btnDeleteOrderClick(Sender: TObject);
    procedure btnChangeOrderClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnProductSelectClick(Sender: TObject);
    procedure edQuantityChange(Sender: TObject);
    procedure btnAddProductClick(Sender: TObject);
    procedure dsOrdersDataChange(Sender: TObject; Field: TField);
    procedure btnConfirmOrderClick(Sender: TObject);
    procedure btnExportMSWordClick(Sender: TObject);
    procedure miReportClick(Sender: TObject);
    procedure miFuturaClick(Sender: TObject);
    procedure btnConfirmPaymentClick(Sender: TObject);
    procedure miGraphicClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
    var ProductID: integer;
  public
    { Public declarations }
  end;

var
  fmOrders: TfmOrders;

implementation

{$R *.dfm}

uses Unit3, Unit1, Unit5, unitOrderDetails, unitReports, unitClientChoose,
  Unit8;

procedure TfmOrders.btnAddProductClick(Sender: TObject);
begin
  dmMy.DCOMConnection1.AppServer.smUpdateOrdersInfo(
                        dmMy.cdsOrdersORDERID.Value,
                        ProductID,
                        StrToFloat(edQuantity.Text),
                        StrToFloat(edPrice.text));
  dmMy.cdsOrders.Refresh;
  dmMy.cdsOrdersInfo.Refresh;
end;

procedure TfmOrders.btnChangeOrderClick(Sender: TObject);
begin
  if dmMy.cdsOrdersSUMMA.Value > 0 then
  begin
    fmOrderDetails.edPrepayment.Text := dmMy.cdsOrdersPREPAY.Value.ToString;
    fmOrderDetails.DateTimePicker1.Date := dmMy.cdsOrdersDATE.Value;
    fmOrderDetails.showmodal
  end
  else
    MessageDlg('В заказе нет товаров.', mtWarning, [mbOk], 0);
end;

procedure TfmOrders.btnConfirmOrderClick(Sender: TObject);
begin
  if MessageDlg('Подтвердить отправку заказа №' + dmMy.cdsOrdersORDERID.AsString +'?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmMy.DCOMConnection1.AppServer.smUpdateFutura(0,
                                                  dmMy.cdsOrdersClientID.Value,
                                                  dmMy.cdsOrdersSUMMA.Value,
                                                  dmMy.cdsOrdersORDERID.Value);
    dmMy.cdsFutura.Refresh;

    dmMy.DCOMConnection1.AppServer.smUpdateOrders(dmMy.cdsOrdersORDERID.Value,
                                                dmMy.cdsOrdersCLIENTID.Value,
                                                dmMy.cdsOrdersPAYMENT_TYPE.Value,
                                                dmMy.cdsOrdersPREPAY.Value,
                                                dmMy.cdsOrdersSUMMA.Value,
                                                'Заказ отгружен',
                                                dmMy.cdsOrdersDATE.Value
                                                );
    dmMy.cdsOrders.Refresh;
  end

end;

procedure TfmOrders.btnConfirmPaymentClick(Sender: TObject);
begin
  if MessageDlg('Подтвердить оплату заказа №' + dmMy.cdsOrdersORDERID.AsString +' и сформировать накладную?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmMy.DCOMConnection1.AppServer.smUpdateOrders(dmMy.cdsOrdersORDERID.Value,
                                                dmMy.cdsOrdersCLIENTID.Value,
                                                dmMy.cdsOrdersPAYMENT_TYPE.Value,
                                                dmMy.cdsOrdersPREPAY.Value,
                                                dmMy.cdsOrdersSUMMA.Value,
                                                'Заказ оплачен',
                                                dmMy.cdsOrdersDATE.Value
                                                );
    dmMy.cdsOrders.Refresh;
    fmMain.ShowModal;
  end


end;

procedure TfmOrders.btnDeleteOrderClick(Sender: TObject);
begin
  if MessageDlg('Удалить заказ №' + dmMy.cdsOrdersORDERID.AsString +'?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmMy.DCOMConnection1.AppServer.smDeleteOrders(dmMy.cdsOrdersORDERID.Value);
    dmMy.cdsOrders.Refresh;
    btnDeleteOrder.Enabled := dmMy.cdsOrders.RecordCount > 0;
    btnChangeOrder.Enabled := btnDeleteOrder.Enabled;
    pnlOrdersInfoModify.Visible := btnDeleteOrder.Enabled;
    dmMy.cdsFutura.Refresh;
  end;
end;

procedure TfmOrders.btnExportMSWordClick(Sender: TObject);
const
  wdAlignParagraphCenter = 1;
  wdAlignParagraphLeft = 0;
  wdAlignParagraphRight = 2;

  wdLineStyleSingle = 1;
var
  wdApp, wdDoc, wdRng, wdTable, table : Variant;
  i, j, Res, number : Integer;
  sum: double;
  D : TDateTime;
  Bm : TBookMark;
  number_str: string;
begin
  number := dmMy.cdsOrdersORDERID.Value;
  number_str := number.ToString;
  sum := dmMy.cdsOrdersSUMMA.Value;
  //Попытка запустить MS Word.
  try
    wdApp := CreateOleObject('Word.Application');
  except
    MessageBox(0, 'Не удалось запустить MS Word. Действие отменено.'
      ,'Внимание!', MB_OK + MB_ICONERROR + MB_APPLMODAL);
    Exit;
  end;

  //Делаем видимым окно MS Word. На постоянной основе или на время отладки.
  wdApp.Visible := True;
  //Создаём новый документ.
  wdDoc := wdApp.Documents.Add;
  //На случай, если очень много данных и wdApp.Visible := True - тогда
  //для ускорения работы отключаем перерисовку окна MS Word.
  wdApp.ScreenUpdating := False;

  wdRng := wdDoc.Content; //Диапазон, охватывающий всё содержимое документа.

  //Параграф 1. Заголовок отчёта.

  //Заголовок отчёта и перевод строки.
  wdRng.InsertAfter('Договор №' + number_str + #13#10);
  //Выравнивание по центру.
  wdRng.ParagraphFormat.Alignment := wdAlignParagraphCenter;
  //Параметры шрифта.
  wdRng.Font.Name := 'Times New Roman';
  wdRng.Font.Bold := True;
  wdRng.Font.Size := 14;

  //Параграф 2. Общие сведения.

  //Формируем диапазон нового параграфа непосредственно за текущим диапазоном.
  wdRng.Start := wdRng.End;
  wdRng.InsertAfter(#13#10);
  D := Now;
  //Сброс параметров параграфа.
  wdRng.ParagraphFormat.Reset;
  //Выравнивание по левому краю.
  wdRng.ParagraphFormat.Alignment := wdAlignParagraphLeft;
  //Отступ слева на 2 сантиметра. Размер отступа задаётся в типографских
  //единицах - в пунктах. 1 пункт = 0.035 сантиметра.
  //При записи в поле LeftIndent, отступ отсчитывается от левого поля на странице.
  //wdRng.ParagraphFormat.LeftIndent := 2 / 0.035;
  //Параметры шрифта.
  wdRng.Font.Reset; //Сброс параметров шрифта.
  wdRng.Font.Size := 12;
  wdRng.Font.Bold := True;

  //Заголовок таблицы.
  wdRng.Start := wdRng.End;
  number_str:=sum.ToString;
  wdRng.InsertAfter(#13#10);
  wdRng.InsertAfter('Сумма заказа: ' + number_str + #13#10);
  wdRng.ParagraphFormat.Reset;

  //Клиент
  wdRng.Start := wdRng.End;
  number_str:=sum.ToString;
  wdRng.InsertAfter(#13#10);
  wdRng.InsertAfter(dmMy.cdsOrdersClientName.value + #13#10);
  wdRng.ParagraphFormat.Reset;

  wdRng.Start := wdRng.End;
  //wdRng.InsertAfter(#13#10);
  wdRng.InsertAfter('Перечень товаров в заказе'#13#10);
  wdRng.ParagraphFormat.Reset;
  {wdRng.Font.Reset;
  wdRng.Font.Size := 12;
  wdRng.Font.Bold := False;}



  wdRng.Start := wdRng.End;

  wdRng.Font.Reset; //Сброс параметров шрифта.
  wdRng.Font.Size := 12;
  wdRng.Font.Bold := false;

  wdDoc.Tables.Add(wdRng,
  dbgOrdersInfo.DataSource.DataSet.RecordCount + 1, dbgOrdersInfo.DataSource.DataSet.FieldCount - 2);
  Table:=wdDoc.Tables.Item(1);

  for i := 0 to dbgOrdersInfo.DataSource.DataSet.FieldCount - 3 do
    Table.Cell(1,i+1).Range.InsertBefore(dbgOrdersInfo.DataSource.DataSet.Fields[i].DisplayName);


  Table.Columns.AutoFit;

  Table.Style:='Сетка таблицы';
  dbgOrdersInfo.DataSource.DataSet.First;
  for i:=1 to dbgOrdersInfo.DataSource.DataSet.RecordCount do
  begin
    for j:=0 to dbgOrdersInfo.DataSource.DataSet.FieldCount - 3 do
    begin
      if (dbgOrdersInfo.DataSource.DataSet.Fields[j].Visible) then
      begin
      Table.Cell(i+1,j+1).Range.InsertBefore(dbgOrdersInfo.DataSource.DataSet.Fields[j].AsString);
      Table.Cell(i+1,j+1).Select;
      wdApp.Selection.Font.Size:=12;
      wdApp.Selection.Font.Bold := false;
      end;
    end;
    dbgOrdersInfo.DataSource.DataSet.Next;
  end;wdApp.Visible:=True;

  wdApp.ScreenUpdating := True;
end;

procedure TfmOrders.btnNewOrderClick(Sender: TObject);
begin
  fsClients.Showmodal;
  if dmMy.cdsClient.RecordCount > 0 then
    dmMy.DCOMConnection1.AppServer.smUpdateOrders(0,
                                                  dmMy.cdsClientID.Value,
                                                  'Укажите способ оплаты',
                                                  0,
                                                  0,
                                                  'Обрабатывается',
                                                  Date);
  dmMy.cdsOrders.Refresh;
  btnDeleteOrder.Enabled := dmMy.cdsOrders.RecordCount > 0;
  btnChangeOrder.Enabled := dmMy.cdsOrders.RecordCount > 0;
  pnlOrdersModify.Visible := dmMy.cdsOrders.RecordCount > 0;
  pnlOrdersInfoModify.Visible := dmMy.cdsOrders.RecordCount > 0;
end;

procedure TfmOrders.btnProductSelectClick(Sender: TObject);
begin
  fmProduct.ShowModal;
  ProductID := 0;
  lbProduct.Caption :='';
  if dmMy.cdsProduct.RecordCount > 0 then
  begin
    ProductID := dmMy.cdsProductID.Value;
    lbProduct.Caption := dmMy.cdsProductNAME.AsString;
  end;
  gbNumbers.Visible := ProductID>0;
  edPrice.Text := '';
  edQuantity.Text := '';
  btnAddProduct.Enabled := false;
end;

procedure TfmOrders.dsOrdersDataChange(Sender: TObject; Field: TField);
begin
  btnDeleteProduct.Enabled := dmMy.cdsOrdersInfo.RecordCount > 0;

  if dmMy.cdsOrdersSTATUS.Value = 'Ожидает отгрузки' then
  begin
    btnConfirmOrder.Enabled := true;
  end
  else
  begin
    btnExportMSWord.Enabled := false;
  end;
  if  (dmMy.cdsOrdersSTATUS.Value = 'Ожидает отгрузки') or
      (dmMy.cdsOrdersSTATUS.Value = 'Отправлен') or
      (dmMy.cdsOrdersSTATUS.Value = 'Заказ отгружен') then
  begin
    btnProductSelect.Enabled := false;
    btnExportMSWord.Enabled := true;
    //btnDeleteOrder.enabled := false
  end
  else
  begin
    btnExportMSWord.Enabled := false;
    //btnDeleteOrder.enabled := false;
    btnProductSelect.Enabled := true;
  end;
  btnConfirmPayment.Enabled := dmMy.cdsOrdersSTATUS.Value = 'Заказ отгружен';
end;

procedure TfmOrders.edQuantityChange(Sender: TObject);
begin
  try
    StrToFloat(edPrice.Text);
    StrToFloat(edQuantity.Text);
    btnAddProduct.Enabled := true;
  except
    btnAddProduct.Enabled := false;
  end;
end;

procedure TfmOrders.FormActivate(Sender: TObject);
begin
  dsOrders.DataSet := dmMy.cdsOrders;
  dsOrdersInfo.DataSet := dmMy.cdsOrdersInfo;
  dmMy.cdsOrdersInfo.MasterSource := dsOrders;
  dmMy.cdsOrdersInfo.MasterFields := 'ORDERID';
  btnDeleteOrder.Enabled := dmMy.cdsOrders.RecordCount > 0;
  pnlOrdersInfoModify.Visible := btnDeleteOrder.Enabled;

end;

procedure TfmOrders.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsOrders.DataSet := nil;
  dsOrdersInfo.DataSet := nil;
end;

procedure TfmOrders.FormCreate(Sender: TObject);
begin
  ProductID := 0;
  lbProduct.Caption := '<Выберите товар>';
end;

procedure TfmOrders.miCloseClick(Sender: TObject);
begin
  fmOrders.Close;
end;


procedure TfmOrders.miFuturaClick(Sender: TObject);
begin
  fmMain.ShowModal;
end;


procedure TfmOrders.miGraphicClick(Sender: TObject);
var
  fromeDate, tilldDate: TDate;
begin
  fmDatesGraphic.ShowModal;
end;

procedure TfmOrders.miProductClick(Sender: TObject);
begin
  fmProduct.ShowModal;
end;

procedure TfmOrders.miReportClick(Sender: TObject);
var ClientID: array of integer;
begin
  fmClientChoose.ShowModal;
  {
  fsClients.ShowModal;
  if dmMy.cdsClient.RecordCount > 0 then
  begin
    ClientID := dmMy.cdsClientID.value;
    if dmMy.cdsReport.Active then
    begin
      dmMy.cdsReport.CancelUpdates;
      dmMy.cdsReport.close
    end;
    dmMy.cdsReport.ProviderName := 'dspTMP';
    dmMy.cdsReport.open;
    dmMy.cdsReport.AddIndex('indx1ID', 'ProductID', [], '', '');
    dmMy.cdsReport.IndexFieldNames := 'ProductID';
    dmMy.cdsFutura.AddIndex('repID', 'ClientID; OrderID', [], '', '');
    dmMy.cdsFutura.IndexFieldNames := 'ClientID; OrderID';
    dmMy.cdsFutura.SetRange([ClientID], [ClientID]);
    dmMy.cdsFutura.First;
    while not dmMy.cdsFutura.Eof do
    begin
      dmMy.cdsOrdersInfo.first;
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
      dmMy.cdsFutura.Next;
    end;
    dmMy.cdsReport.FieldByName('ProductID').DisplayLabel := '№';
    dmMy.cdsReport.FieldByName('Name').DisplayLabel := 'Наименование';
    dmMy.cdsReport.FieldByName('Quantity').DisplayLabel := 'Количество';
    dmMy.cdsReport.FieldByName('Summa').DisplayLabel := 'Сумма';
    fmReport.DataSource1.Dataset := dmMy.cdsReport;
    fmReport.ShowModal;
    if dmMy.cdsReport.Active then
    begin
      dmMy.cdsReport.CancelUpdates;
      dmMy.cdsReport.Close;
    end;
    dmMy.cdsFutura.IndexFieldNames := 'ORDERID';
  end
  }
end;

procedure TfmOrders.N4Click(Sender: TObject);
begin
  fsClients.ShowModal;
end;

end.
