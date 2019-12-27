object MyServer: TMyServer
  OldCreateOrder = True
  Height = 399
  Width = 685
  object IBDatabase1: TIBDatabase
    DatabaseName = 'E:\FIREBIRD_DB\TEST\MY_DB.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 24
    Top = 16
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 96
    Top = 16
  end
  object ibtClient: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CLIENT'
    UniDirectional = False
    Left = 24
    Top = 80
  end
  object ibtProduct: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PRODUCT'
    UniDirectional = False
    Left = 104
    Top = 80
  end
  object ibtFutura: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'FUTURA'
    UniDirectional = False
    Left = 184
    Top = 80
  end
  object ibtFuturaInfo: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'FUTURAINFO'
    UniDirectional = False
    Left = 256
    Top = 80
  end
  object ibtTMP: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TMP'
    UniDirectional = False
    Left = 328
    Top = 80
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 544
    Top = 80
  end
  object dspClient: TDataSetProvider
    DataSet = ibtClient
    Left = 24
    Top = 144
  end
  object dspProduct: TDataSetProvider
    DataSet = ibtProduct
    Left = 104
    Top = 144
  end
  object dspFutura: TDataSetProvider
    DataSet = ibtFutura
    Left = 184
    Top = 144
  end
  object dspFuturaInfo: TDataSetProvider
    DataSet = ibtFuturaInfo
    Left = 256
    Top = 144
  end
  object dspTMP: TDataSetProvider
    DataSet = ibtTMP
    Left = 328
    Top = 144
  end
  object dspQuery: TDataSetProvider
    DataSet = IBQuery1
    Left = 544
    Top = 144
  end
  object ibspUpdateClient: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UpdateClient'
    Left = 40
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID                           '
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'INNAME                         '
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'INADRESS                       '
        ParamType = ptInput
      end>
  end
  object ibspDeleteClient: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DeleteClient'
    Left = 136
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID                           '
        ParamType = ptInput
      end>
  end
  object ibspUpdateProduct: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UpdateProduct'
    Left = 248
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'INNAME'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'INMG'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INVAT'
        ParamType = ptInput
      end>
  end
  object ibspDeleteProduct: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DeleteProduct'
    Left = 360
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end>
  end
  object ibspUpdateFutura: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UpdateFutura'
    Left = 40
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INCLIENTID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INTOTALSUM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INORDERID'
        ParamType = ptInput
      end>
  end
  object ibspDeleteFutura: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DeleteFutura'
    Left = 136
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end>
  end
  object ibspUpdateFuturaInfo: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UpdateFuturaInfo'
    Left = 248
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INFUTURAID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INPRODUCTID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INQUANTITY'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INPRICE'
        ParamType = ptInput
      end>
  end
  object ibspDeleteFuturaInfo: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DeleteFuturaInfo'
    Left = 360
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INFUTURAID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INPRODUCTID'
        ParamType = ptInput
      end>
  end
  object ibtOrders: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ORDERS'
    UniDirectional = False
    Left = 400
    Top = 80
  end
  object ibtOrdersInfo: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ORDERSINFO'
    UniDirectional = False
    Left = 472
    Top = 80
  end
  object dspOrders: TDataSetProvider
    DataSet = ibtOrders
    Left = 400
    Top = 144
  end
  object dspOrdersInfo: TDataSetProvider
    DataSet = ibtOrdersInfo
    Left = 472
    Top = 144
  end
  object ibspUpdateOrders: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UpdateOrders'
    Left = 480
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INORDERID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INCLIENTID'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'INPAYMAENTTYPE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INPREPAY'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INTOTALSUM'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'INSTATUS'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'INDATE'
        ParamType = ptInput
      end>
  end
  object ibspDeleteOrders: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DeleteOrders'
    Left = 600
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INORDERID                      '
        ParamType = ptInput
      end>
  end
  object ibspUpdateOrdersInfo: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UpdateOrdersInfo'
    Left = 480
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INORDERID                      '
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INPRODUCTID                    '
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INQUANTITY                     '
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INPRICE                        '
        ParamType = ptInput
      end>
  end
  object ibspDeleteOrdersInfo: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DeleteOrdersInfo'
    Left = 600
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INORDERID                      '
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INPRODUCTID                    '
        ParamType = ptInput
      end>
  end
  object ibspCreateFuturaInfo: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'CreateFuturaInfo'
    Left = 40
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INFUTURAID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INORDERID'
        ParamType = ptInput
      end>
  end
end
