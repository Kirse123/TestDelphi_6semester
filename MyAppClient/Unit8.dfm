object fmDatesGraphic: TfmDatesGraphic
  Left = 0
  Top = 0
  Caption = #1059#1082#1072#1078#1080#1090#1077' '#1076#1072#1090#1099
  ClientHeight = 112
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 23
    Top = 16
    Width = 7
    Height = 13
    Caption = #1057
  end
  object Label2: TLabel
    Left = 19
    Top = 48
    Width = 14
    Height = 13
    Caption = #1044#1086
  end
  object dtpFrom: TDateTimePicker
    Left = 39
    Top = 8
    Width = 186
    Height = 21
    Date = 43624.000000000000000000
    Time = 0.828917858794739000
    TabOrder = 0
  end
  object dtpTill: TDateTimePicker
    Left = 39
    Top = 40
    Width = 186
    Height = 21
    Date = 43624.000000000000000000
    Time = 0.828918749997683300
    TabOrder = 1
  end
  object btnConfirm: TButton
    Left = 150
    Top = 79
    Width = 75
    Height = 25
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    TabOrder = 2
    OnClick = btnConfirmClick
  end
  object BitBtn1: TBitBtn
    Left = 23
    Top = 79
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
end
