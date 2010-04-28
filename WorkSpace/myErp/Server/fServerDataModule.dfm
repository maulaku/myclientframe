object ServerDataModule: TServerDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 428
  Top = 340
  Height = 207
  Width = 298
  object Server: TROIndyHTTPServer
    Encryption.UseCompression = True
    Dispatchers = <
      item
        Name = 'Message'
        Message = Message
        Enabled = True
        PathInfo = 'Bin'
      end>
    IndyServer.Bindings = <>
    IndyServer.CommandHandlers = <>
    IndyServer.DefaultPort = 8527
    IndyServer.Greeting.NumericCode = 0
    IndyServer.MaxConnectionReply.NumericCode = 0
    IndyServer.ReplyExceptionCode = 0
    IndyServer.ReplyTexts = <>
    IndyServer.ReplyUnknownCommand.NumericCode = 0
    Port = 8527
    Left = 32
    Top = 8
  end
  object Message: TROBinMessage
    Left = 32
    Top = 56
  end
  object ConnectionManager: TDAConnectionManager
    Connections = <
      item
        Name = 'ConnectErp'
        ConnectionString = 
          'ODAC?Server=orcl;Database=myerp;UserID=dev;Password=dev;Net=192.' +
          '168.0.5'
        ConnectionType = 'Oracle'
        Default = True
      end>
    DriverManager = DriverManager
    PoolingEnabled = True
    Left = 136
    Top = 56
  end
  object DriverManager: TDADriverManager
    DriverDirectory = '%SYSTEM%\'
    TraceActive = False
    TraceFlags = []
    Left = 136
    Top = 10
  end
  object DataDictionary: TDADataDictionary
    Fields = <>
    Left = 32
    Top = 104
  end
  object SessionManager: TROInMemorySessionManager
    Left = 136
    Top = 104
  end
  object DAODACDriver: TDAODACDriver
    Left = 232
    Top = 8
  end
end
