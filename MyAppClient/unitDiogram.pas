unit unitDiogram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, VclTee.TeeGDIPlus, Data.DB,
  VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, Vcl.ExtCtrls,
  VCLTee.Series, unit2;

type
  TfmGraph = class(TForm)
    Panel1: TPanel;
    dbChart: TDBChart;
    DataSource1: TDataSource;
    Series1: TLineSeries;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmGraph: TfmGraph;

implementation

{$R *.dfm}

procedure TfmGraph.FormActivate(Sender: TObject);
begin
  DataSource1 := dmMy.cdsReport.DataSource;
  DBChart.Series[0].XValues.DateTime:= true;
  DBChart.Series[0].Clear;
  dmMy.cdsReport.first;
  while not dmMy.cdsReport.Eof do begin
    DBChart.Series[0].Add(dmMy.cdsReport.Fields[0].Value, dmMy.cdsReport.Fields[1].Value);
    dmMy.cdsReport.Next;
  end;
  dbChart.RefreshData;
  dbChart.CheckDatasource(DBChart.Series[0]);
end;

end.
