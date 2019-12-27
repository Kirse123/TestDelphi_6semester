object fmClientChoose: TfmClientChoose
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1082#1083#1080#1077#1085#1090#1072' '#1080' '#1087#1077#1088#1080#1086#1076' '#1074#1088#1077#1084#1077#1085#1080
  ClientHeight = 189
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 21
    Width = 223
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1086#1076#1085#1086#1075#1086' '#1080#1083#1080' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1093' '#1082#1083#1080#1077#1085#1090#1086#1074
  end
  object Label2: TLabel
    Left = 248
    Top = 45
    Width = 14
    Height = 13
    Caption = #1054#1090
  end
  object Label3: TLabel
    Left = 272
    Top = 21
    Width = 142
    Height = 13
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1074#1088#1077#1084#1077#1085#1085#1086#1081' '#1087#1077#1088#1080#1086#1076
  end
  object Label4: TLabel
    Left = 248
    Top = 91
    Width = 14
    Height = 13
    Caption = #1044#1086
  end
  object btnConfirm: TButton
    Left = 272
    Top = 156
    Width = 130
    Height = 25
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    TabOrder = 0
    OnClick = btnConfirmClick
  end
  object dtpFrom: TDateTimePicker
    Left = 248
    Top = 64
    Width = 186
    Height = 21
    Date = 43624.000000000000000000
    Time = 0.630854884257132700
    TabOrder = 1
    OnCloseUp = dtpFromCloseUp
  end
  object dtpTill: TDateTimePicker
    Left = 248
    Top = 110
    Width = 186
    Height = 21
    Date = 43624.000000000000000000
    Time = 0.557038483799260600
    TabOrder = 2
    OnCloseUp = dtpTillCloseUp
  end
  object dbgClientChoose: TDBGrid
    Left = 8
    Top = 40
    Width = 223
    Height = 109
    DataSource = dspClient
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object bitBtnCancel: TBitBtn
    Left = 64
    Top = 156
    Width = 130
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
  end
  object dspClient: TDataSource
    Top = 160
  end
end
