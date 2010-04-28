object ClientDataModule: TClientDataModule
  OldCreateOrder = True
  Left = 439
  Top = 220
  Height = 300
  Width = 300
  object Channel: TROWinInetHTTPChannel
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
    ServiceName = 'erpService'
    Left = 40
    Top = 96
  end
  object DataStreamer: TDABin2DataStreamer
    Left = 40
    Top = 140
  end
  object RemoteDataAdapter: TDARemoteDataAdapter
    Left = 40
    Top = 184
    DataStreamer = DataStreamer
    RemoteService = RemoteService
  end
end
