object iService: TiService
  OldCreateOrder = True
  SessionManager = ServerDataModule.SessionManager
  ServiceSchema = Schema
  ServiceDataStreamer = DataStreamer
  ExportedDataTables = <>
  Left = 357
  Top = 213
  Height = 212
  Width = 216
  object DataStreamer: TDABinDataStreamer
    Left = 32
    Top = 8
  end
  object Schema: TDASchema
    ConnectionManager = ServerDataModule.ConnectionManager
    DataDictionary = ServerDataModule.DataDictionary
    Datasets = <
      item
        Params = <>
        Statements = <
          item
            Connection = 'iConnection'
            TargetTable = 'MyTable'
            SQL = 'SELECT '#10'    aid, aName'#10'  FROM'#10'    MyTable'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'aid'
                TableField = 'aid'
              end
              item
                DatasetField = 'aName'
                TableField = 'aName'
              end>
          end>
        Name = 'MyTable'
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
        BusinessRulesClient.ScriptLanguage = rslPascalScript
        BusinessRulesServer.ScriptLanguage = rslPascalScript
      end>
    Commands = <>
    RelationShips = <>
    UpdateRules = <>
    Left = 32
    Top = 56
  end
end
