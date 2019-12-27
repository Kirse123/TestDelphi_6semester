object fmOrders: TfmOrders
  Left = 0
  Top = 0
  Caption = #1047#1072#1082#1072#1079#1099
  ClientHeight = 457
  ClientWidth = 1238
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlOrders: TPanel
    Left = 0
    Top = 0
    Width = 1238
    Height = 273
    Align = alTop
    TabOrder = 0
    object pnlOrdersModify: TPanel
      Left = 1
      Top = 212
      Width = 1236
      Height = 60
      Align = alBottom
      BevelWidth = 5
      TabOrder = 0
      object btnNewOrder: TButton
        Left = 16
        Top = 16
        Width = 130
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079
        TabOrder = 0
        OnClick = btnNewOrderClick
      end
      object btnDeleteOrder: TButton
        Left = 320
        Top = 16
        Width = 130
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1082#1072#1079
        TabOrder = 1
        OnClick = btnDeleteOrderClick
      end
      object btnChangeOrder: TButton
        Left = 168
        Top = 16
        Width = 130
        Height = 25
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1082#1072#1079
        TabOrder = 2
        OnClick = btnChangeOrderClick
      end
      object btnConfirmOrder: TButton
        Left = 472
        Top = 16
        Width = 130
        Height = 25
        Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1086#1090#1075#1088#1091#1079#1082#1091
        Enabled = False
        TabOrder = 3
        OnClick = btnConfirmOrderClick
      end
      object btnExportMSWord: TButton
        Left = 776
        Top = 16
        Width = 130
        Height = 25
        Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' MS Word'
        Enabled = False
        TabOrder = 4
        OnClick = btnExportMSWordClick
      end
      object btnConfirmPayment: TButton
        Left = 624
        Top = 16
        Width = 130
        Height = 25
        Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1086#1087#1083#1072#1090#1091
        Enabled = False
        TabOrder = 5
        OnClick = btnConfirmPaymentClick
      end
    end
    object dbgOrders: TDBGrid
      Left = 1
      Top = 1
      Width = 1236
      Height = 211
      Align = alClient
      DataSource = dsOrders
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object pnlOrdersInfo: TPanel
    Left = 0
    Top = 273
    Width = 1238
    Height = 184
    Align = alClient
    TabOrder = 1
    object pnlOrdersInfoModify: TPanel
      Left = 1
      Top = 83
      Width = 1236
      Height = 100
      Align = alBottom
      BevelOuter = bvLowered
      BevelWidth = 5
      TabOrder = 0
      object lbProduct: TLabel
        Left = 16
        Top = 31
        Width = 45
        Height = 13
        Alignment = taCenter
        Caption = 'lbProduct'
      end
      object btnAddProduct: TButton
        Left = 408
        Top = 33
        Width = 130
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1074#1072#1088
        Enabled = False
        TabOrder = 0
        OnClick = btnAddProductClick
      end
      object btnDeleteProduct: TButton
        Left = 408
        Top = 64
        Width = 130
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1086#1074#1072#1088
        Enabled = False
        TabOrder = 1
      end
      object btnProductSelect: TButton
        Left = 16
        Top = 50
        Width = 75
        Height = 25
        Caption = #1058#1086#1074#1072#1088
        TabOrder = 2
        OnClick = btnProductSelectClick
      end
      object gbNumbers: TGroupBox
        Left = 137
        Top = 14
        Width = 249
        Height = 79
        Caption = #1059#1082#1072#1078#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
        TabOrder = 3
        Visible = False
        object Label1: TLabel
          Left = 10
          Top = 21
          Width = 60
          Height = 13
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        end
        object Label2: TLabel
          Left = 10
          Top = 48
          Width = 26
          Height = 13
          Caption = #1062#1077#1085#1072
        end
        object edPrice: TEdit
          Left = 83
          Top = 48
          Width = 150
          Height = 21
          TabOrder = 0
          Text = 'edPrice'
          OnChange = edQuantityChange
        end
        object edQuantity: TEdit
          Left = 83
          Top = 21
          Width = 150
          Height = 21
          TabOrder = 1
          Text = 'edQuantity'
          OnChange = edQuantityChange
        end
      end
    end
    object dbgOrdersInfo: TDBGrid
      Left = 1
      Top = 1
      Width = 1236
      Height = 82
      Align = alClient
      DataSource = dsOrdersInfo
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object MainMenu1: TMainMenu
    Left = 40
    object miData: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object N4: TMenuItem
        Caption = #1050#1083#1080#1077#1085#1090#1099
        OnClick = N4Click
      end
      object miProduct: TMenuItem
        Caption = #1058#1086#1074#1072#1088#1099
        OnClick = miProductClick
      end
      object miFutura: TMenuItem
        Caption = #1053#1072#1082#1083#1072#1076#1085#1099#1077
        OnClick = miFuturaClick
      end
    end
    object miReports: TMenuItem
      Caption = #1054#1090#1095#1077#1090#1085#1086#1089#1090#1100
      object miReport: TMenuItem
        Caption = #1054#1090#1095#1077#1090
        OnClick = miReportClick
      end
      object miGraphic: TMenuItem
        Caption = #1043#1088#1072#1092#1080#1082
        OnClick = miGraphicClick
      end
    end
    object miClose: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = miCloseClick
    end
  end
  object dsOrders: TDataSource
    OnDataChange = dsOrdersDataChange
    Left = 96
  end
  object dsOrdersInfo: TDataSource
    Left = 160
  end
end
