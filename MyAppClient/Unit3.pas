unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Unit2, Unit4;

type
  TfmProduct = class(TForm)
    MainMenu1: TMainMenu;
    miAdd: TMenuItem;
    miDelete: TMenuItem;
    miClose: TMenuItem;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miCloseClick(Sender: TObject);
    procedure miAddClick(Sender: TObject);
    procedure miDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmProduct: TfmProduct;

implementation

{$R *.dfm}

procedure TfmProduct.FormActivate(Sender: TObject);
begin
  DataSource1.DataSet := dmMy.cdsProduct;
end;

procedure TfmProduct.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataSource1.DataSet := nil;
end;

procedure TfmProduct.miAddClick(Sender: TObject);
begin
  fmNewProduct.ShowModal;
  if fmNewProduct.ModalResult = mrOK then
  begin
    try
      dmMy.DCOMConnection1.AppServer.smUpdateProduct(
        0, fmNewProduct.edName.Text, fmNewProduct.edMg.Text,
        StrToFloat(fmNewProduct.edVAT.Text));

    except
      MessageDlg('Ошибка записи в БД', mtError, [mbOK], 0)
    end;
    dmMy.cdsProduct.Refresh;
  end;
end;

procedure TfmProduct.miCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmProduct.miDeleteClick(Sender: TObject);
begin
  if (dmMy.cdsProduct.RecordCount > 0) and
      (MessageDlg(
      'Удалить материал ' + dmMy.cdsProductNAME.AsString + ' ?',
      mtConfirmation,
      [mbYes, mbNo], 0) = mrYes) then
  begin
    dmMy.DCOMConnection1.AppServer.smDeleteProduct(dmMy.cdsProductID.Value);
    dmMy.cdsProduct.Refresh;
  end;
end;

end.
