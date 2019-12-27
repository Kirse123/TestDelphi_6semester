object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1076#1072#1078#1080
  ClientHeight = 454
  ClientWidth = 772
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFutura: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 249
    Align = alTop
    TabOrder = 0
    object pnlFuturaMofify: TPanel
      Left = 1
      Top = 203
      Width = 770
      Height = 45
      Align = alBottom
      BevelWidth = 5
      TabOrder = 0
      ExplicitTop = 188
    end
    object dbgFutura: TDBGrid
      Left = 1
      Top = 1
      Width = 770
      Height = 202
      Align = alClient
      DataSource = dsFutura
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object pnlFuturaInfo: TPanel
    Left = 0
    Top = 249
    Width = 772
    Height = 205
    Align = alClient
    TabOrder = 1
    object dbgFuturaInfo: TDBGrid
      Left = 1
      Top = 1
      Width = 770
      Height = 203
      Align = alClient
      DataSource = dsFuturaInfo
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 144
    object miData: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object miProduct: TMenuItem
        Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
        OnClick = miProductClick
      end
      object miClient: TMenuItem
        Caption = #1050#1083#1080#1077#1085#1090#1099
        OnClick = miClientClick
      end
      object miOrders: TMenuItem
        Caption = #1047#1072#1082#1072#1079#1099
        OnClick = miOrdersClick
      end
    end
    object miReport: TMenuItem
      Caption = #1054#1090#1095#1077#1090#1085#1086#1089#1090#1100
      object miReport1: TMenuItem
        Caption = #1054#1090#1095#1077#1090#1085#1086#1089#1090#1100'1'
      end
      object miReport2: TMenuItem
        Caption = #1054#1090#1095#1077#1090#1085#1086#1089#1090#1100'2'
      end
    end
    object miClose: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = miCloseClick
    end
  end
  object dsFutura: TDataSource
    Left = 88
    Top = 146
  end
  object dsFuturaInfo: TDataSource
    Left = 88
    Top = 258
  end
end
