object MyServer: TMyServer
  OldCreateOrder = False
  Height = 177
  Width = 462
  object IBDatabase1: TIBDatabase
    ServerType = 'IBServer'
    Left = 24
    Top = 16
  end
  object IBTransaction1: TIBTransaction
    Left = 96
    Top = 16
  end
  object IBTable1: TIBTable
    BufferChunks = 1000
    CachedUpdates = False
    UniDirectional = False
    Left = 24
    Top = 80
  end
  object IBTable2: TIBTable
    BufferChunks = 1000
    CachedUpdates = False
    UniDirectional = False
    Left = 80
    Top = 80
  end
  object IBTable3: TIBTable
    BufferChunks = 1000
    CachedUpdates = False
    UniDirectional = False
    Left = 136
    Top = 80
  end
  object IBTable4: TIBTable
    BufferChunks = 1000
    CachedUpdates = False
    UniDirectional = False
    Left = 192
    Top = 80
  end
  object IBTable5: TIBTable
    BufferChunks = 1000
    CachedUpdates = False
    UniDirectional = False
    Left = 248
    Top = 80
  end
  object IBQuery1: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 168
    Top = 16
  end
end
