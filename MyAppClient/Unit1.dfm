object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1076#1072#1078#1080
  ClientHeight = 376
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
    Height = 170
    Align = alTop
    TabOrder = 0
    object pnlFuturaMofify: TPanel
      Left = 1
      Top = 109
      Width = 770
      Height = 60
      Align = alBottom
      BevelWidth = 5
      TabOrder = 0
      object btnNewFutura: TButton
        Left = 144
        Top = 16
        Width = 130
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
        TabOrder = 0
        OnClick = btnNewFuturaClick
      end
      object btnDeleteFutura: TButton
        Left = 328
        Top = 16
        Width = 130
        Height = 25
        Caption = #1059#1076#1072#1083#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
        TabOrder = 1
        OnClick = btnDeleteFuturaClick
      end
    end
    object dbgFutura: TDBGrid
      Left = 1
      Top = 1
      Width = 770
      Height = 108
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
    Top = 170
    Width = 772
    Height = 206
    Align = alClient
    TabOrder = 1
    object pnlFuturaInfoModify: TPanel
      Left = 1
      Top = 105
      Width = 770
      Height = 100
      Align = alBottom
      BevelOuter = bvLowered
      BevelWidth = 5
      TabOrder = 0
      object lbProduct: TLabel
        Left = 34
        Top = 23
        Width = 3
        Height = 13
      end
      object btnAddPoduct: TButton
        Left = 453
        Top = 27
        Width = 130
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083
        Enabled = False
        TabOrder = 0
        OnClick = btnAddPoductClick
      end
      object btnDeleteProduct: TButton
        Left = 453
        Top = 58
        Width = 130
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083
        Enabled = False
        TabOrder = 1
        OnClick = btnDeleteProductClick
      end
      object btnProductSelect: TButton
        Left = 18
        Top = 42
        Width = 75
        Height = 25
        Caption = #1052#1072#1090#1077#1088#1080#1072#1083
        TabOrder = 2
        OnClick = btnProductSelectClick
      end
    end
    object dbgFuturaInfo: TDBGrid
      Left = 1
      Top = 1
      Width = 770
      Height = 104
      Align = alClient
      DataSource = dsFuturaInfo
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object gbNumbers: TGroupBox
      Left = 129
      Top = 111
      Width = 288
      Height = 78
      Caption = #1059#1082#1072#1078#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
      TabOrder = 2
      Visible = False
      object Label1: TLabel
        Left = 16
        Top = 25
        Width = 60
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      end
      object Label2: TLabel
        Left = 16
        Top = 56
        Width = 26
        Height = 13
        Caption = #1062#1077#1085#1072
      end
      object edQuantity: TEdit
        Left = 104
        Top = 24
        Width = 177
        Height = 21
        TabOrder = 0
        Text = 'edQuantity'
        OnChange = edQuantityChange
      end
      object edPrice: TEdit
        Left = 104
        Top = 51
        Width = 177
        Height = 21
        TabOrder = 1
        Text = 'edPrice'
        OnChange = edQuantityChange
      end
    end
  end
  object MainMenu1: TMainMenu
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
    end
    object miReport: TMenuItem
      Caption = #1054#1090#1095#1077#1090#1085#1086#1089#1090#1100
      object miReport1: TMenuItem
        Caption = #1054#1090#1095#1077#1090#1085#1086#1089#1090#1100'1'
        OnClick = miReport1Click
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
    OnDataChange = dsFuturaDataChange
    Left = 472
    Top = 2
  end
  object dsFuturaInfo: TDataSource
    Left = 544
    Top = 2
  end
end
