object dmClient: TdmClient
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 448
  Top = 254
  Height = 341
  Width = 231
  object erpMessage: TROBinMessage
    Left = 64
    Top = 80
  end
  object erpChannel: TROWinInetHTTPChannel
    UserAgent = 'RemObjects SDK'
    TargetURL = 'http://localhost:8527/BIN'
    ServerLocators = <>
    DispatchOptions = []
    Left = 64
    Top = 24
  end
  object erpDataStreamer: TDABin2DataStreamer
    Left = 64
    Top = 184
  end
  object erpRemoteService: TRORemoteService
    Message = erpMessage
    Channel = erpChannel
    ServiceName = 'erpService'
    Left = 64
    Top = 131
  end
  object erpRemoteDataAdapter: TDARemoteDataAdapter
    GetSchemaCall.RemoteService = erpRemoteService
    GetDataCall.RemoteService = erpRemoteService
    UpdateDataCall.RemoteService = erpRemoteService
    GetScriptsCall.RemoteService = erpRemoteService
    RemoteService = erpRemoteService
    DataStreamer = erpDataStreamer
    Left = 64
    Top = 240
  end
  object cdsModules: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'MODALGUID'
        DataType = datString
        Size = 80
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'ID'
        DataType = datString
        Size = 20
      end
      item
        Name = 'NAME'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CAPTION'
        DataType = datString
        Size = 100
      end
      item
        Name = 'FILENAME'
        DataType = datString
        Size = 100
      end
      item
        Name = 'FUNCTIONING'
        DataType = datBlob
        BlobType = dabtTypedBinary
      end
      item
        Name = 'FLAG'
        DataType = datFloat
      end
      item
        Name = 'CREATETIME'
        DataType = datDateTime
      end
      item
        Name = 'USERGUID'
        DataType = datString
        Size = 32
      end
      item
        Name = 'USERID'
        DataType = datString
        Size = 32
      end
      item
        Name = 'ORGANIZATIONALGUID'
        DataType = datString
        Size = 32
      end
      item
        Name = 'PARAM1'
        DataType = datString
        Size = 32
      end
      item
        Name = 'PARAM2'
        DataType = datString
        Size = 32
      end
      item
        Name = 'PARAM3'
        DataType = datString
        Size = 32
      end
      item
        Name = 'PARAM4'
        DataType = datString
        Size = 32
      end
      item
        Name = 'PARAM5'
        DataType = datString
        Size = 32
      end
      item
        Name = 'PARAM6'
        DataType = datString
        Size = 32
      end
      item
        Name = 'PARAM7'
        DataType = datString
        Size = 32
      end
      item
        Name = 'PARAM8'
        DataType = datString
        Size = 32
      end
      item
        Name = 'PARAM9'
        DataType = datString
        Size = 32
      end
      item
        Name = 'PARAM10'
        DataType = datString
        Size = 32
      end
      item
        Name = 'UPDATETIME'
        DataType = datDateTime
      end>
    Params = <>
    StreamingOptions = [soIgnoreStreamSchema]
    RemoteDataAdapter = erpRemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'TSYS_MODALS'
    IndexDefs = <>
    Left = 152
    Top = 32
  end
end
