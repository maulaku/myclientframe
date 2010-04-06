object ClientDataModule: TClientDataModule
  OldCreateOrder = True
  Left = 439
  Top = 220
  Height = 300
  Width = 300
  object Channel: TROWinInetHTTPChannel
    ServerLocators = <>
    DispatchOptions = []
    UserAgent = 'RemObjects SDK'
    TargetURL = 'http://localhost:8099/BIN'
    Left = 40
    Top = 8
  end
  object Message: TROBinMessage
    Left = 40
    Top = 52
  end
  object RemoteService: TRORemoteService
    Message = Message
    Channel = Channel
    ServiceName = 'iService'
    Left = 40
    Top = 96
  end
  object DataStreamer: TDABinDataStreamer
    Left = 40
    Top = 140
  end
  object RemoteDataAdapter: TDARemoteDataAdapter
    GetSchemaCall.RemoteService = RemoteService
    GetDataCall.RemoteService = RemoteService
    UpdateDataCall.RemoteService = RemoteService
    GetScriptsCall.RemoteService = RemoteService
    RemoteService = RemoteService
    DataStreamer = DataStreamer
    Left = 40
    Top = 184
  end
  object tbl_MyTable: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'aid'
        DataType = datInteger
        BlobType = dabtUnknown
        Required = True
        DisplayWidth = 0
        Alignment = taLeftJustify
        InPrimaryKey = False
        Calculated = False
        Lookup = False
        LookupCache = False
      end
      item
        Name = 'aName'
        DataType = datString
        Size = 50
        BlobType = dabtUnknown
        DisplayWidth = 0
        Alignment = taLeftJustify
        InPrimaryKey = False
        Calculated = False
        Lookup = False
        LookupCache = False
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    ReadOnly = False
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'MyTable'
    IndexDefs = <>
    Left = 128
    Top = 120
  end
  object ds_MyTable: TDADataSource
    DataSet = tbl_MyTable.Dataset
    DataTable = tbl_MyTable
    Left = 136
    Top = 128
  end
end
