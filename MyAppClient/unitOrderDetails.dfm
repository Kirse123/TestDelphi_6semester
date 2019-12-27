object fmOrderDetails: TfmOrderDetails
  Left = 0
  Top = 0
  Caption = #1044#1077#1090#1072#1083#1080' '#1079#1072#1082#1072#1079#1072
  ClientHeight = 168
  ClientWidth = 324
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
    Left = 24
    Top = 24
    Width = 77
    Height = 13
    Caption = #1057#1087#1086#1089#1086#1073' '#1086#1087#1083#1072#1090#1099
  end
  object lbPrepayment: TLabel
    Left = 24
    Top = 54
    Width = 99
    Height = 13
    Caption = #1054#1073#1098#1077#1084' '#1087#1088#1085#1076#1086#1087#1083#1072#1090#1099
  end
  object lbDate: TLabel
    Left = 24
    Top = 86
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object cbxPaymentType: TComboBox
    Left = 144
    Top = 24
    Width = 145
    Height = 21
    TabOrder = 0
    Text = #1059#1082#1072#1078#1080#1090#1077' '#1089#1087#1086#1089#1086#1073' '#1086#1087#1083#1072#1090#1099
    OnChange = cbxPaymentTypeChange
    Items.Strings = (
      #1053#1072#1083#1080#1095#1085#1099#1084#1080' '#1074' '#1082#1072#1089#1089#1091
      #1055#1077#1088#1077#1074#1086#1076#1086#1084)
  end
  object edPrepayment: TEdit
    Left = 144
    Top = 51
    Width = 145
    Height = 21
    TabOrder = 1
    Text = '0'
    OnKeyPress = edPrepaymentKeyPress
  end
  object btnCancel: TBitBtn
    Left = 192
    Top = 120
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
  end
  object btnConfirm: TBitBtn
    Left = 48
    Top = 120
    Width = 75
    Height = 25
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    Enabled = False
    TabOrder = 3
    OnClick = btnConfirmClick
  end
  object DateTimePicker1: TDateTimePicker
    Left = 81
    Top = 78
    Width = 208
    Height = 21
    Date = 43623.000000000000000000
    Time = 0.473508240742376100
    TabOrder = 4
  end
end
