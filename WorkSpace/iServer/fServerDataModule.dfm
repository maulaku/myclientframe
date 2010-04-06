object ServerDataModule: TServerDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 368
  Top = 267
  Height = 207
  Width = 352
  object Server: TROIndyHTTPServer
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
    OnServerException = MessageServerException
    Left = 32
    Top = 56
  end
  object ConnectionManager: TDAConnectionManager
    OnConnectionTimedOut = ConnectionManagerConnectionTimedOut
    OnConnectionCreated = ConnectionManagerConnectionCreated
    OnConnectionFailure = ConnectionManagerConnectionFailure
    OnConnectionReleased = ConnectionManagerConnectionReleased
    Connections = <
      item
        Name = 'iConnection'
        ConnectionString = 
          'ADO?AuxDriver=SQLOLEDB.1;Server=localhost;Database=rm_pa;UserID=' +
          'sa;Password=111111;Integrated Security=SSPI;'
        Default = True
        Tag = 0
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
  object ADODriver: TDAADODriver
    Left = 216
    Top = 16
  end
  object IBXDriver: TDAIBXDriver
    Left = 216
    Top = 64
  end
  object DataDictionary: TDADataDictionary
    Fields = <>
    Left = 32
    Top = 104
  end
  object SessionManager: TROInMemorySessionManager
    OnSessionCreated = SessionManagerSessionCreated
    OnSessionDeleted = SessionManagerSessionDeleted
    OnException = SessionManagerException
    Left = 136
    Top = 104
  end
end
