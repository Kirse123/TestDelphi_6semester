unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, Vcl.Grids,
  Vcl.DBGrids, unit2, unit6, Vcl.StdCtrls;

type
  TfsClients = class(TForm)
    MainMenu1: TMainMenu;
    DBGrid1: TDBGrid;
    miNew: TMenuItem;
    miChange: TMenuItem;
    miDelete: TMenuItem;
    miClose: TMenuItem;
    DataSource1: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miNewClick(Sender: TObject);
    procedure miChangeClick(Sender: TObject);
    procedure miDeleteClick(Sender: TObject);
    procedure miCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fsClients: TfsClients;

implementation

{$R *.dfm}


procedure TfsClients.FormActivate(Sender: TObject);
begin
  DataSource1.DataSet := dmMy.cdsClient;
end;

procedure TfsClients.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataSource1.DataSet := nil;
end;

procedure TfsClients.miChangeClick(Sender: TObject);
begin
  with fmNewClient do
  begin
    edName.Text := dmMy.cdsClientNAME.Value;
    edAdress.Text := dmMy.cdsClientADRESS.Value;
    ShowModal;
    begin
      try
        dmMy.DCOMConnection1.AppServer.smUpdateClient(
        dmMy.cdsClientID.Value,
        fmNewClient.edName.Text,
        fmNewClient.edAdress.Text);
      except
        MessageDlg('Ошибка записи данных в БД', mtError, [mbOK], 0)
      end;
      dmMy.cdsClient.Refresh;
    end;
  end;
end;

procedure TfsClients.miCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfsClients.miDeleteClick(Sender: TObject);
begin
  if (dmMy.cdsClient.RecordCount > 0) and
     (MessageDlg('Удалить клиента ' + dmMy.cdsClientNAME.AsString + '?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    dmMy.DCOMConnection1.AppServer.smDeleteClient(dmMy.cdsClientID.Value);
    dmMy.cdsClient.Refresh;
  end;

end;

procedure TfsClients.miNewClick(Sender: TObject);
var i: integer;
begin
  with fmNewClient do
  begin
    for i := 0 to ComponentCount - 1 do
      if Components[i] is TEdit then
        (Components[i] as TEdit).text := '';
    ShowModal;
    if ModalResult = mrOK then
    begin
      try
        dmMy.DCOMConnection1.AppServer.smUpdateClient(
        0, fmNewClient.edName.Text, fmNewClient.edAdress.Text);
      except
        MessageDlg('Ошибка записи данных в БД', mtError, [mbOK], 0);
      end;
      dmMy.cdsClient.Refresh;
    end;

  end;
end;

end.
