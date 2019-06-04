object fmNewProduct: TfmNewProduct
  Left = 0
  Top = 0
  Caption = #1053#1086#1074#1099#1081' '#1084#1072#1090#1077#1088#1080#1072#1083
  ClientHeight = 163
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object lbName: TLabel
    Left = 24
    Top = 21
    Width = 67
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1085#1080#1077
  end
  object ibMG: TLabel
    Left = 24
    Top = 51
    Width = 37
    Height = 13
    Caption = #1045#1076'. '#1080#1079#1084
  end
  object ibVAT: TLabel
    Left = 24
    Top = 80
    Width = 40
    Height = 13
    Caption = #1053#1044#1057', %'
  end
  object edName: TEdit
    Left = 136
    Top = 21
    Width = 185
    Height = 21
    TabOrder = 0
    Text = 'edName'
    OnChange = edNameChange
  end
  object edMg: TEdit
    Left = 136
    Top = 51
    Width = 185
    Height = 21
    TabOrder = 1
    Text = 'edMg'
    OnChange = edNameChange
  end
  object edVAT: TEdit
    Left = 136
    Top = 78
    Width = 185
    Height = 21
    TabOrder = 2
    Text = 'edVAT'
    OnChange = edNameChange
    OnKeyPress = edVATKeyPress
  end
  object btnCancel: TBitBtn
    Left = 64
    Top = 128
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
  object btnOK: TBitBtn
    Left = 200
    Top = 128
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
  end
end
