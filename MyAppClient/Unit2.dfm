object dmMy: TdmMy
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 180
  Width = 407
  object DCOMConnection1: TDCOMConnection
    Connected = True
    ServerGUID = '{F59886F2-9963-4365-BA60-53D0D5468134}'
    ComputerName = 'localhost'
    Left = 40
    Top = 24
  end
  object cdsProduct: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduct'
    RemoteServer = DCOMConnection1
    Left = 232
    Top = 24
    object cdsProductID: TIntegerField
      Alignment = taCenter
      DisplayLabel = #8470
      FieldName = 'ID'
      Required = True
    end
    object cdsProductNAME: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'NAME'
      Size = 100
    end
    object cdsProductMG: TWideStringField
      Alignment = taCenter
      DisplayLabel = #1045#1076'. '#1080#1079#1084
      FieldName = 'MG'
      Size = 10
    end
    object cdsProductVAT: TFloatField
      DisplayLabel = #1053#1044#1057', %'
      FieldName = 'VAT'
      DisplayFormat = ',0.00'
    end
  end
  object cdsFutura: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFutura'
    RemoteServer = DCOMConnection1
    OnCalcFields = cdsFuturaCalcFields
    Left = 40
    Top = 96
    object cdsFuturaID: TIntegerField
      Alignment = taCenter
      DisplayLabel = #8470
      FieldName = 'ID'
      Required = True
    end
    object cdsFuturaCLIENTID: TIntegerField
      FieldName = 'CLIENTID'
      Visible = False
    end
    object cdsFuturaTOTALSUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 15
      FieldName = 'TOTALSUM'
      DisplayFormat = ',0.00'
    end
    object cdsFuturaClientName: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      DisplayWidth = 50
      FieldKind = fkInternalCalc
      FieldName = 'ClientName'
      Size = 100
    end
    object cdsFuturaClientAdress: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 100
      FieldKind = fkCalculated
      FieldName = 'ClientAdress'
      Size = 255
      Calculated = True
    end
    object cdsFuturaORDERID: TIntegerField
      FieldName = 'ORDERID'
    end
  end
  object cdsReport: TClientDataSet
    Aggregates = <>
    Params = <>
    RemoteServer = DCOMConnection1
    Left = 232
    Top = 96
  end
  object cdsFuturaInfo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFuturaInfo'
    RemoteServer = DCOMConnection1
    OnCalcFields = cdsFuturaInfoCalcFields
    Left = 144
    Top = 96
    object cdsFuturaInfoFUTURAID: TIntegerField
      FieldName = 'FUTURAID'
      Required = True
    end
    object cdsFuturaInfoPRODUCTID: TIntegerField
      FieldName = 'PRODUCTID'
    end
    object cdsFuturaInfoQUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object cdsFuturaInfoPRICE: TFloatField
      FieldName = 'PRICE'
    end
  end
  object cdsClient: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClient'
    RemoteServer = DCOMConnection1
    Left = 144
    Top = 24
    object cdsClientID: TIntegerField
      Alignment = taCenter
      DisplayLabel = #8470
      FieldName = 'ID'
      Required = True
    end
    object cdsClientNAME: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'NAME'
      Size = 100
    end
    object cdsClientADRESS: TWideStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'ADRESS'
      Size = 255
    end
  end
  object cdsOrders: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrders'
    RemoteServer = DCOMConnection1
    OnCalcFields = cdsOrdersCalcFields
    Left = 312
    Top = 24
    object cdsOrdersORDERID: TIntegerField
      Alignment = taCenter
      DisplayLabel = #8470
      FieldName = 'ORDERID'
      Origin = '"ORDERS"."ORDERID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrdersClientName: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      DisplayWidth = 50
      FieldKind = fkInternalCalc
      FieldName = 'ClientName'
      Size = 100
    end
    object cdsOrdersCLIENTID: TIntegerField
      FieldName = 'CLIENTID'
      Origin = '"ORDERS"."CLIENTID"'
      Visible = False
    end
    object cdsOrdersPAYMENT_TYPE: TWideStringField
      DisplayLabel = #1057#1087#1086#1089#1086#1073' '#1086#1087#1083#1072#1090#1099
      FieldName = 'PAYMENT_TYPE'
      Origin = '"ORDERS"."PAYMENT_TYPE"'
      Size = 32
    end
    object cdsOrdersSTATUS: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072
      FieldName = 'STATUS'
      Origin = '"ORDERS"."STATUS"'
      Size = 64
    end
    object cdsOrdersDATE: TDateField
      Alignment = taCenter
      DisplayLabel = #1044#1072#1090#1072' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103
      DisplayWidth = 15
      FieldName = 'DATE'
    end
    object cdsOrdersPREPAY: TFloatField
      DisplayLabel = #1055#1088#1077#1076#1086#1087#1083#1072#1090#1072
      DisplayWidth = 15
      FieldName = 'PREPAY'
      Origin = '"ORDERS"."PREPAY"'
      DisplayFormat = ',0.00'
    end
    object cdsOrdersSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = '"ORDERS"."SUMMA"'
      DisplayFormat = ',0.00'
    end
  end
  object cdsOrdersInfo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrdersInfo'
    RemoteServer = DCOMConnection1
    OnCalcFields = cdsOrdersInfoCalcFields
    Left = 312
    Top = 96
    object cdsOrdersInfoName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'Name'
      LookupDataSet = cdsProduct
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'PRODUCTID'
      Size = 100
      Lookup = True
    end
    object cdsOrdersInfoMg: TStringField
      DisplayLabel = #1045#1076'. '#1080#1079#1084
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Mg'
      LookupDataSet = cdsProduct
      LookupKeyFields = 'ID'
      LookupResultField = 'MG'
      KeyFields = 'PRODUCTID'
      Lookup = True
    end
    object cdsOrdersInfoPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 15
      FieldName = 'PRICE'
      DisplayFormat = ',0.00'
    end
    object cdsOrdersInfoQUANTITY: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      DisplayWidth = 15
      FieldName = 'QUANTITY'
      DisplayFormat = ',0.00'
    end
    object cdsOrdersInfoSum: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'Sum'
      Calculated = True
    end
    object cdsOrdersInfoPRODUCTID: TIntegerField
      FieldName = 'PRODUCTID'
      Required = True
      Visible = False
    end
    object cdsOrdersInfoORDERID: TIntegerField
      FieldName = 'ORDERID'
      Required = True
      Visible = False
    end
  end
end
