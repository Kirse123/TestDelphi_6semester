object fmNewClient: TfmNewClient
  Left = 0
  Top = 0
  Caption = #1044#1072#1085#1085#1099#1077' '#1082#1083#1080#1077#1085#1090#1072
  ClientHeight = 104
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ibName: TLabel
    Left = 32
    Top = 16
    Width = 73
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object ibAdress: TLabel
    Left = 32
    Top = 40
    Width = 31
    Height = 13
    Caption = #1040#1076#1088#1077#1089
  end
  object edName: TEdit
    Left = 144
    Top = 8
    Width = 249
    Height = 21
    TabOrder = 0
    Text = 'edit'
    OnChange = edNameChange
  end
  object edAdress: TEdit
    Left = 144
    Top = 35
    Width = 249
    Height = 21
    TabOrder = 1
    OnChange = edNameChange
  end
  object btnCancel: TBitBtn
    Left = 88
    Top = 72
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object btnOK: TBitBtn
    Left = 264
    Top = 71
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
  end
end
