object fmGraph: TfmGraph
  Left = 0
  Top = 0
  Caption = 'fmGraph'
  ClientHeight = 467
  ClientWidth = 754
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitLeft = 144
    ExplicitTop = 40
    ExplicitWidth = 185
  end
  object dbChart: TDBChart
    Left = 0
    Top = 41
    Width = 754
    Height = 426
    View3D = False
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 200
    ExplicitTop = 153
    ExplicitWidth = 400
    ExplicitHeight = 250
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      21
      15
      21)
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      Cursor = crAppStart
      SeriesColor = clBlue
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        011900000000000000004DE5400000000000D4874000000000204DE540000000
        0000408A4000000000404DE5400000000000AC8C4000000000604DE540000000
        0000F0894000000000804DE5400000000000C8894000000000A04DE540000000
        000028894000000000C04DE540000000000010884000000000E04DE540000000
        0000308B4000000000004EE5400000000000B08D4000000000204EE540000000
        0000E88C4000000000404EE5400000000000908F4000000000604EE540000000
        0000BC8B4000000000804EE5400000000000908A4000000000A04EE540000000
        0000648E4000000000C04EE5400000000000488C4000000000E04EE540000000
        0000048A4000000000004FE540000000000070874000000000204FE540000000
        000024884000000000404FE5400000000000448B4000000000604FE540000000
        0000EC884000000000804FE54000000000009C884000000000A04FE540000000
        0000A8864000000000C04FE5400000000000E0854000000000E04FE540000000
        00003C8440000000000050E5400000000000988240}
      Detail = {0000000000}
    end
  end
  object DataSource1: TDataSource
    Left = 8
    Top = 9
  end
end
