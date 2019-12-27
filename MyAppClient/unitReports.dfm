object fmReport: TfmReport
  Left = 0
  Top = 0
  Caption = #1054#1090#1095#1077#1090#1085#1086#1089#1090#1100
  ClientHeight = 491
  ClientWidth = 671
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 35
    Width = 671
    Height = 456
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 671
    Height = 35
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 96
      Height = 13
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1050#1083#1080#1077#1085#1090#1072
    end
    object ComboBox1: TComboBox
      Left = 144
      Top = 5
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'ComboBox1'
    end
  end
  object DataSource1: TDataSource
    Left = 632
    Top = 48
  end
end
