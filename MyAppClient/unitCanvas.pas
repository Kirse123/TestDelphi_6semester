unit unitCanvas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, unit2;
type
  TfmCanvas = class(TForm)
    Image1: TImage;
    procedure FormActivate(Sender: TObject);
    procedure Postroenie;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCanvas: TfmCanvas;

implementation

{$R *.dfm}

procedure tfmCanvas.Postroenie;  // строит график
var

  shag:real;     // приращение аргумента
  l,b:integer;   // левый нижний угол области вывода графика
  w,h:integer;   // ширина и высота области вывода графика
  my, y1, y2:real;    // масштаб по осям X и Y
  x0,y0, x, y:integer; // точка - начало координат
  i : integer;
  value :integer;
begin
  // область вывода графика
  l:=10;                     // X - координата левого нижнего угла
  b:=fmCanvas.Image1.Height-20;  // Y - координата левого нижнего угла
  h:=fmCanvas.Image1.Height-40;  // высота
  w:=fmCanvas.Image1.Width-40;         // ширина


  shag:=w / dmMy.cdsReport.RecordCount;  // шаг X

  // найдем максимальное и минимальное значения
  dmMy.cdsReport.first;
  y1:=dmMy.cdsReport.FieldS[0].Value; // минимум
  y2:=dmMy.cdsReport.FieldS[0].Value; // максимум
  dmMy.cdsReport.next;
  for i := 1 to dmMy.cdsReport.RecordCount - 1 do
  begin
    y := dmMy.cdsReport.FieldS[0].Value;
    if y < y1 then y1:=y;
    if y > y2 then y2:=y;
    dmMy.cdsReport.next;
  end;

   // вычислим масштаб
  my:=h/y2;  // масштаб по оси Y

  // оси
  x0:=l;
  y0:=b-Abs(Round(y1*my));

  with fmCanvas.Image1.Canvas do
  begin
    //очистка
    pen.Style := psSolid;
    pen.color:= clBlack;
    Rectangle(0,0, Width, Height);
    // оси
    //y
    MoveTo(l,b);  LineTo(l,0);
    //x
    MoveTo(x0,b - 10);  LineTo(x0 + w + 5, b - 10);
    TextOut(l+15, b-h - 10, 'РУБ');
    TextOut(l+10, b + 5, 'Дата');

    // построение графика
    pen.color:= clRed;
    dmMy.cdsReport.first;
    y0 := b - 10;
    For i:= 0 to dmMy.cdsReport.RecordCount - 1 do
    begin
      y := Round(b - 10 - real(dmMy.cdsReport.Fields[0].Value) * my) ;
      x := Round(x0 + shag);
      //штрихи
      pen.Style := psDash;
      pen.color:= clBlack;
      MoveTo(x,y);  LineTo(x, b - 10);
      //график
      pen.Style := psSolid;
      pen.color:= clRed;
      MoveTo(x0,y0);  LineTo(x, y);
      if (i > 0) then
      begin
        TextOut(x0 + 10, y0 - 10, FloatToStr(value));
      end;
      TextOut(X-30, b+5, DateToStr(dmMy.cdsReport.Fields[1].Value));
      value := dmMy.cdsReport.Fields[0].Value;
      dmMy.cdsReport.next;
      x0 := x;
      y0 := y;
    end;
    TextOut(x0 - 15, y0 - 15, FloatToStr(value));
  end;
end;

procedure TfmCanvas.FormActivate(Sender: TObject);
begin
  fmCanvas.Postroenie;
end;

end.
