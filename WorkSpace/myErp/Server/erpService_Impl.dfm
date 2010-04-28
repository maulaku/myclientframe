object erpService: TerpService
  OldCreateOrder = True
  SessionManager = ServerDataModule.SessionManager
  ServiceSchema = Schema
  ServiceDataStreamer = DataStreamer
  ExportedDataTables = <>
  Left = 442
  Top = 396
  Height = 143
  Width = 212
  object DataStreamer: TDABin2DataStreamer
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
            ConnectionType = 'Oracle'
            Default = True
            TargetTable = 'TSYS_COLUMNS'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'COLID'
                TableField = 'COLID'
              end
              item
                DatasetField = 'TABGUID'
                TableField = 'TABGUID'
              end
              item
                DatasetField = 'NAME'
                TableField = 'NAME'
              end
              item
                DatasetField = 'CAPTION'
                TableField = 'CAPTION'
              end
              item
                DatasetField = 'CREATETIME'
                TableField = 'CREATETIME'
              end
              item
                DatasetField = 'UPDATETIME'
                TableField = 'UPDATETIME'
              end
              item
                DatasetField = 'USERID'
                TableField = 'USERID'
              end
              item
                DatasetField = 'USERGUID'
                TableField = 'USERGUID'
              end
              item
                DatasetField = 'ORGANIZATIONALGUID'
                TableField = 'ORGANIZATIONALGUID'
              end
              item
                DatasetField = 'FLAG'
                TableField = 'FLAG'
              end>
          end>
        Name = 'TSYS_COLUMNS'
        Fields = <
          item
            Name = 'COLID'
            DataType = datString
            Size = 32
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'TABGUID'
            DataType = datString
            Size = 32
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
            Name = 'CREATETIME'
            DataType = datDateTime
          end
          item
            Name = 'UPDATETIME'
            DataType = datDateTime
          end
          item
            Name = 'USERID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'USERGUID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'ORGANIZATIONALGUID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'FLAG'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            ConnectionType = 'Oracle'
            Default = True
            TargetTable = 'TSYS_COMPANY'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'COMPANYGUID'
                TableField = 'COMPANYGUID'
              end
              item
                DatasetField = 'INCORPORATOR'
                TableField = 'INCORPORATOR'
              end
              item
                DatasetField = 'QUALITY'
                TableField = 'QUALITY'
              end
              item
                DatasetField = 'FUNDING'
                TableField = 'FUNDING'
              end
              item
                DatasetField = 'ADDRESS'
                TableField = 'ADDRESS'
              end
              item
                DatasetField = 'CAPTION'
                TableField = 'CAPTION'
              end
              item
                DatasetField = 'NAME'
                TableField = 'NAME'
              end
              item
                DatasetField = 'CREATETIME'
                TableField = 'CREATETIME'
              end
              item
                DatasetField = 'UPDATETIME'
                TableField = 'UPDATETIME'
              end
              item
                DatasetField = 'PARAM1'
                TableField = 'PARAM1'
              end
              item
                DatasetField = 'PARAM2'
                TableField = 'PARAM2'
              end
              item
                DatasetField = 'PARAM3'
                TableField = 'PARAM3'
              end
              item
                DatasetField = 'PARAM4'
                TableField = 'PARAM4'
              end
              item
                DatasetField = 'PARAM5'
                TableField = 'PARAM5'
              end
              item
                DatasetField = 'PARAM6'
                TableField = 'PARAM6'
              end
              item
                DatasetField = 'PARAM7'
                TableField = 'PARAM7'
              end
              item
                DatasetField = 'PARAM8'
                TableField = 'PARAM8'
              end
              item
                DatasetField = 'PARAM9'
                TableField = 'PARAM9'
              end
              item
                DatasetField = 'PARAM10'
                TableField = 'PARAM10'
              end>
          end>
        Name = 'TSYS_COMPANY'
        Fields = <
          item
            Name = 'COMPANYGUID'
            DataType = datString
            Size = 32
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'INCORPORATOR'
            DataType = datString
            Size = 20
          end
          item
            Name = 'QUALITY'
            DataType = datString
            Size = 20
          end
          item
            Name = 'FUNDING'
            DataType = datFloat
          end
          item
            Name = 'ADDRESS'
            DataType = datString
            Size = 100
          end
          item
            Name = 'CAPTION'
            DataType = datString
            Size = 100
          end
          item
            Name = 'NAME'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CREATETIME'
            DataType = datDateTime
          end
          item
            Name = 'UPDATETIME'
            DataType = datDateTime
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
          end>
      end
      item
        Params = <>
        Statements = <
          item
            ConnectionType = 'Oracle'
            Default = True
            TargetTable = 'TSYS_EMPLOYEE'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'EMPGUID'
                TableField = 'EMPGUID'
              end
              item
                DatasetField = 'OGNGUID'
                TableField = 'OGNGUID'
              end
              item
                DatasetField = 'POSGUID'
                TableField = 'POSGUID'
              end
              item
                DatasetField = 'ID'
                TableField = 'ID'
              end
              item
                DatasetField = 'CAPTION'
                TableField = 'CAPTION'
              end
              item
                DatasetField = 'NAME'
                TableField = 'NAME'
              end
              item
                DatasetField = 'PASSWORD'
                TableField = 'PASSWORD'
              end
              item
                DatasetField = 'ISLOGIN'
                TableField = 'ISLOGIN'
              end
              item
                DatasetField = 'ZZZT'
                TableField = 'ZZZT'
              end
              item
                DatasetField = 'CREATETIME'
                TableField = 'CREATETIME'
              end
              item
                DatasetField = 'UPDATETIME'
                TableField = 'UPDATETIME'
              end
              item
                DatasetField = 'USERID'
                TableField = 'USERID'
              end
              item
                DatasetField = 'USERGUID'
                TableField = 'USERGUID'
              end
              item
                DatasetField = 'ORGANIZATIONALGUID'
                TableField = 'ORGANIZATIONALGUID'
              end
              item
                DatasetField = 'FLAG'
                TableField = 'FLAG'
              end
              item
                DatasetField = 'PARAM1'
                TableField = 'PARAM1'
              end
              item
                DatasetField = 'PARAM2'
                TableField = 'PARAM2'
              end
              item
                DatasetField = 'PARAM3'
                TableField = 'PARAM3'
              end
              item
                DatasetField = 'PARAM4'
                TableField = 'PARAM4'
              end
              item
                DatasetField = 'PARAM5'
                TableField = 'PARAM5'
              end
              item
                DatasetField = 'PARAM6'
                TableField = 'PARAM6'
              end
              item
                DatasetField = 'PARAM7'
                TableField = 'PARAM7'
              end
              item
                DatasetField = 'PARAM8'
                TableField = 'PARAM8'
              end
              item
                DatasetField = 'PARAM9'
                TableField = 'PARAM9'
              end
              item
                DatasetField = 'PARAM10'
                TableField = 'PARAM10'
              end>
          end>
        Name = 'TSYS_EMPLOYEE'
        Fields = <
          item
            Name = 'EMPGUID'
            DataType = datString
            Size = 32
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'OGNGUID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'POSGUID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'ID'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CAPTION'
            DataType = datString
            Size = 100
          end
          item
            Name = 'NAME'
            DataType = datString
            Size = 20
          end
          item
            Name = 'PASSWORD'
            DataType = datString
            Size = 18
          end
          item
            Name = 'ISLOGIN'
            DataType = datFloat
          end
          item
            Name = 'ZZZT'
            DataType = datFloat
          end
          item
            Name = 'CREATETIME'
            DataType = datDateTime
          end
          item
            Name = 'UPDATETIME'
            DataType = datDateTime
          end
          item
            Name = 'USERID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'USERGUID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'ORGANIZATIONALGUID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'FLAG'
            DataType = datFloat
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
          end>
      end
      item
        Params = <>
        Statements = <
          item
            ConnectionType = 'Oracle'
            Default = True
            TargetTable = 'TSYS_FUNCTION'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'UNCGUID'
                TableField = 'UNCGUID'
              end
              item
                DatasetField = 'MENUGUID'
                TableField = 'MENUGUID'
              end
              item
                DatasetField = 'ID'
                TableField = 'ID'
              end
              item
                DatasetField = 'NAME'
                TableField = 'NAME'
              end
              item
                DatasetField = 'CAPTION'
                TableField = 'CAPTION'
              end
              item
                DatasetField = 'CREATETIME'
                TableField = 'CREATETIME'
              end
              item
                DatasetField = 'UPDATETIME'
                TableField = 'UPDATETIME'
              end
              item
                DatasetField = 'USERID'
                TableField = 'USERID'
              end
              item
                DatasetField = 'USERGUID'
                TableField = 'USERGUID'
              end
              item
                DatasetField = 'ORGANIZATIONALGUID'
                TableField = 'ORGANIZATIONALGUID'
              end
              item
                DatasetField = 'FLAG'
                TableField = 'FLAG'
              end
              item
                DatasetField = 'PARAM1'
                TableField = 'PARAM1'
              end
              item
                DatasetField = 'PARAM2'
                TableField = 'PARAM2'
              end
              item
                DatasetField = 'PARAM3'
                TableField = 'PARAM3'
              end
              item
                DatasetField = 'PARAM4'
                TableField = 'PARAM4'
              end
              item
                DatasetField = 'PARAM5'
                TableField = 'PARAM5'
              end
              item
                DatasetField = 'PARAM6'
                TableField = 'PARAM6'
              end
              item
                DatasetField = 'PARAM7'
                TableField = 'PARAM7'
              end
              item
                DatasetField = 'PARAM8'
                TableField = 'PARAM8'
              end
              item
                DatasetField = 'PARAM9'
                TableField = 'PARAM9'
              end
              item
                DatasetField = 'PARAM10'
                TableField = 'PARAM10'
              end>
          end>
        Name = 'TSYS_FUNCTION'
        Fields = <
          item
            Name = 'UNCGUID'
            DataType = datString
            Size = 32
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'MENUGUID'
            DataType = datString
            Size = 32
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
            Name = 'CREATETIME'
            DataType = datDateTime
          end
          item
            Name = 'UPDATETIME'
            DataType = datDateTime
          end
          item
            Name = 'USERID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'USERGUID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'ORGANIZATIONALGUID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'FLAG'
            DataType = datFloat
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
          end>
      end
      item
        Params = <>
        Statements = <
          item
            ConnectionType = 'Oracle'
            Default = True
            TargetTable = 'TSYS_MENUS'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'MENUGUID'
                TableField = 'MENUGUID'
              end
              item
                DatasetField = 'PARENTGUID'
                TableField = 'PARENTGUID'
              end
              item
                DatasetField = 'ID'
                TableField = 'ID'
              end
              item
                DatasetField = 'NAME'
                TableField = 'NAME'
              end
              item
                DatasetField = 'CAPTION'
                TableField = 'CAPTION'
              end
              item
                DatasetField = 'ORDERNO'
                TableField = 'ORDERNO'
              end
              item
                DatasetField = 'AMODULENAME'
                TableField = 'AMODULENAME'
              end
              item
                DatasetField = 'FLAG'
                TableField = 'FLAG'
              end
              item
                DatasetField = 'CREATETIME'
                TableField = 'CREATETIME'
              end
              item
                DatasetField = 'UPDATETIME'
                TableField = 'UPDATETIME'
              end
              item
                DatasetField = 'USERID'
                TableField = 'USERID'
              end
              item
                DatasetField = 'USERGUID'
                TableField = 'USERGUID'
              end
              item
                DatasetField = 'ORGANIZATIONALGUID'
                TableField = 'ORGANIZATIONALGUID'
              end
              item
                DatasetField = 'PARAM1'
                TableField = 'PARAM1'
              end
              item
                DatasetField = 'PARAM2'
                TableField = 'PARAM2'
              end
              item
                DatasetField = 'PARAM3'
                TableField = 'PARAM3'
              end
              item
                DatasetField = 'PARAM4'
                TableField = 'PARAM4'
              end
              item
                DatasetField = 'PARAM5'
                TableField = 'PARAM5'
              end
              item
                DatasetField = 'PARAM6'
                TableField = 'PARAM6'
              end
              item
                DatasetField = 'PARAM7'
                TableField = 'PARAM7'
              end
              item
                DatasetField = 'PARAM8'
                TableField = 'PARAM8'
              end
              item
                DatasetField = 'PARAM9'
                TableField = 'PARAM9'
              end
              item
                DatasetField = 'PARAM10'
                TableField = 'PARAM10'
              end>
          end>
        Name = 'TSYS_MENUS'
        Fields = <
          item
            Name = 'MENUGUID'
            DataType = datString
            Size = 32
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'PARENTGUID'
            DataType = datString
            Size = 32
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
            Name = 'ORDERNO'
            DataType = datFloat
          end
          item
            Name = 'AMODULENAME'
            DataType = datString
            Size = 30
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
            Name = 'UPDATETIME'
            DataType = datDateTime
          end
          item
            Name = 'USERID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'USERGUID'
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
          end>
      end
      item
        Params = <>
        Statements = <
          item
            ConnectionType = 'Oracle'
            Default = True
            TargetTable = 'TSYS_MODALS'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'MODALGUID'
                TableField = 'MODALGUID'
              end
              item
                DatasetField = 'ID'
                TableField = 'ID'
              end
              item
                DatasetField = 'NAME'
                TableField = 'NAME'
              end
              item
                DatasetField = 'CAPTION'
                TableField = 'CAPTION'
              end
              item
                DatasetField = 'FILENAME'
                TableField = 'FILENAME'
              end
              item
                DatasetField = 'FUNCTIONING'
                TableField = 'FUNCTIONING'
              end
              item
                DatasetField = 'FLAG'
                TableField = 'FLAG'
              end
              item
                DatasetField = 'CREATETIME'
                TableField = 'CREATETIME'
              end
              item
                DatasetField = 'USERGUID'
                TableField = 'USERGUID'
              end
              item
                DatasetField = 'USERID'
                TableField = 'USERID'
              end
              item
                DatasetField = 'ORGANIZATIONALGUID'
                TableField = 'ORGANIZATIONALGUID'
              end
              item
                DatasetField = 'PARAM1'
                TableField = 'PARAM1'
              end
              item
                DatasetField = 'PARAM2'
                TableField = 'PARAM2'
              end
              item
                DatasetField = 'PARAM3'
                TableField = 'PARAM3'
              end
              item
                DatasetField = 'PARAM4'
                TableField = 'PARAM4'
              end
              item
                DatasetField = 'PARAM5'
                TableField = 'PARAM5'
              end
              item
                DatasetField = 'PARAM6'
                TableField = 'PARAM6'
              end
              item
                DatasetField = 'PARAM7'
                TableField = 'PARAM7'
              end
              item
                DatasetField = 'PARAM8'
                TableField = 'PARAM8'
              end
              item
                DatasetField = 'PARAM9'
                TableField = 'PARAM9'
              end
              item
                DatasetField = 'PARAM10'
                TableField = 'PARAM10'
              end
              item
                DatasetField = 'UPDATETIME'
                TableField = 'UPDATETIME'
              end>
          end>
        Name = 'TSYS_MODALS'
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
      end
      item
        Params = <>
        Statements = <
          item
            ConnectionType = 'Oracle'
            Default = True
            TargetTable = 'TSYS_ORGANIZATIONAL'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'OGNGUID'
                TableField = 'OGNGUID'
              end
              item
                DatasetField = 'PARENTGUID'
                TableField = 'PARENTGUID'
              end
              item
                DatasetField = 'ID'
                TableField = 'ID'
              end
              item
                DatasetField = 'NAME'
                TableField = 'NAME'
              end
              item
                DatasetField = 'CAPTION'
                TableField = 'CAPTION'
              end
              item
                DatasetField = 'CREATETIME'
                TableField = 'CREATETIME'
              end
              item
                DatasetField = 'UPDATETIME'
                TableField = 'UPDATETIME'
              end
              item
                DatasetField = 'USERID'
                TableField = 'USERID'
              end
              item
                DatasetField = 'USERGUID'
                TableField = 'USERGUID'
              end
              item
                DatasetField = 'ORGANIZATIONALGUID'
                TableField = 'ORGANIZATIONALGUID'
              end
              item
                DatasetField = 'FLAG'
                TableField = 'FLAG'
              end
              item
                DatasetField = 'PARAM1'
                TableField = 'PARAM1'
              end
              item
                DatasetField = 'PARAM2'
                TableField = 'PARAM2'
              end
              item
                DatasetField = 'PARAM3'
                TableField = 'PARAM3'
              end
              item
                DatasetField = 'PARAM4'
                TableField = 'PARAM4'
              end
              item
                DatasetField = 'PARAM5'
                TableField = 'PARAM5'
              end
              item
                DatasetField = 'PARAM6'
                TableField = 'PARAM6'
              end
              item
                DatasetField = 'PARAM7'
                TableField = 'PARAM7'
              end
              item
                DatasetField = 'PARAM8'
                TableField = 'PARAM8'
              end
              item
                DatasetField = 'PARAM9'
                TableField = 'PARAM9'
              end
              item
                DatasetField = 'PARAM10'
                TableField = 'PARAM10'
              end>
          end>
        Name = 'TSYS_ORGANIZATIONAL'
        Fields = <
          item
            Name = 'OGNGUID'
            DataType = datString
            Size = 32
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'PARENTGUID'
            DataType = datString
            Size = 32
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
            Name = 'CREATETIME'
            DataType = datDateTime
          end
          item
            Name = 'UPDATETIME'
            DataType = datDateTime
          end
          item
            Name = 'USERID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'USERGUID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'ORGANIZATIONALGUID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'FLAG'
            DataType = datFloat
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
          end>
      end
      item
        Params = <>
        Statements = <
          item
            ConnectionType = 'Oracle'
            Default = True
            TargetTable = 'TSYS_POSITION'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'POSGUID'
                TableField = 'POSGUID'
              end
              item
                DatasetField = 'PARENTGUID'
                TableField = 'PARENTGUID'
              end
              item
                DatasetField = 'CAPTION'
                TableField = 'CAPTION'
              end
              item
                DatasetField = 'NAME'
                TableField = 'NAME'
              end
              item
                DatasetField = 'CREATETIME'
                TableField = 'CREATETIME'
              end
              item
                DatasetField = 'UPDATETIME'
                TableField = 'UPDATETIME'
              end
              item
                DatasetField = 'USERID'
                TableField = 'USERID'
              end
              item
                DatasetField = 'USERGUID'
                TableField = 'USERGUID'
              end
              item
                DatasetField = 'ORGANIZATIONALGUID'
                TableField = 'ORGANIZATIONALGUID'
              end
              item
                DatasetField = 'FLAG'
                TableField = 'FLAG'
              end
              item
                DatasetField = 'PARAM1'
                TableField = 'PARAM1'
              end
              item
                DatasetField = 'PARAM2'
                TableField = 'PARAM2'
              end
              item
                DatasetField = 'PARAM3'
                TableField = 'PARAM3'
              end
              item
                DatasetField = 'PARAM4'
                TableField = 'PARAM4'
              end
              item
                DatasetField = 'PARAM5'
                TableField = 'PARAM5'
              end
              item
                DatasetField = 'PARAM6'
                TableField = 'PARAM6'
              end
              item
                DatasetField = 'PARAM7'
                TableField = 'PARAM7'
              end
              item
                DatasetField = 'PARAM8'
                TableField = 'PARAM8'
              end
              item
                DatasetField = 'PARAM9'
                TableField = 'PARAM9'
              end
              item
                DatasetField = 'PARAM10'
                TableField = 'PARAM10'
              end>
          end>
        Name = 'TSYS_POSITION'
        Fields = <
          item
            Name = 'POSGUID'
            DataType = datString
            Size = 32
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'PARENTGUID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'CAPTION'
            DataType = datString
            Size = 100
          end
          item
            Name = 'NAME'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CREATETIME'
            DataType = datDateTime
          end
          item
            Name = 'UPDATETIME'
            DataType = datDateTime
          end
          item
            Name = 'USERID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'USERGUID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'ORGANIZATIONALGUID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'FLAG'
            DataType = datFloat
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
          end>
      end
      item
        Params = <>
        Statements = <
          item
            ConnectionType = 'Oracle'
            Default = True
            TargetTable = 'TSYS_POSPURVIEWS'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'EPMGUID'
                TableField = 'EPMGUID'
              end
              item
                DatasetField = 'POSGUID'
                TableField = 'POSGUID'
              end
              item
                DatasetField = 'CREATETIME'
                TableField = 'CREATETIME'
              end
              item
                DatasetField = 'UPDATETIME'
                TableField = 'UPDATETIME'
              end
              item
                DatasetField = 'USERID'
                TableField = 'USERID'
              end
              item
                DatasetField = 'ORGANIZATIONALGUID'
                TableField = 'ORGANIZATIONALGUID'
              end>
          end>
        Name = 'TSYS_POSPURVIEWS'
        Fields = <
          item
            Name = 'EPMGUID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'POSGUID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'CREATETIME'
            DataType = datDateTime
          end
          item
            Name = 'UPDATETIME'
            DataType = datDateTime
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
          end>
      end
      item
        Params = <>
        Statements = <
          item
            ConnectionType = 'Oracle'
            Default = True
            TargetTable = 'TSYS_PURMENUS'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'EPMGUID'
                TableField = 'EPMGUID'
              end
              item
                DatasetField = 'MENUGUID'
                TableField = 'MENUGUID'
              end
              item
                DatasetField = 'UNCGUID'
                TableField = 'UNCGUID'
              end
              item
                DatasetField = 'CREATETIME'
                TableField = 'CREATETIME'
              end
              item
                DatasetField = 'USERGUID'
                TableField = 'USERGUID'
              end
              item
                DatasetField = 'USERID'
                TableField = 'USERID'
              end
              item
                DatasetField = 'ORGANIZATIONALGUID'
                TableField = 'ORGANIZATIONALGUID'
              end
              item
                DatasetField = 'ENABLED'
                TableField = 'ENABLED'
              end
              item
                DatasetField = 'VISIBLED'
                TableField = 'VISIBLED'
              end
              item
                DatasetField = 'FLAG'
                TableField = 'FLAG'
              end>
          end>
        Name = 'TSYS_PURMENUS'
        Fields = <
          item
            Name = 'EPMGUID'
            DataType = datString
            Size = 32
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'MENUGUID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'UNCGUID'
            DataType = datString
            Size = 32
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
            Name = 'ENABLED'
            DataType = datFloat
          end
          item
            Name = 'VISIBLED'
            DataType = datFloat
          end
          item
            Name = 'FLAG'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            ConnectionType = 'Oracle'
            Default = True
            TargetTable = 'TSYS_TABLES'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'TABGUID'
                TableField = 'TABGUID'
              end
              item
                DatasetField = 'NAME'
                TableField = 'NAME'
              end
              item
                DatasetField = 'CAPTION'
                TableField = 'CAPTION'
              end
              item
                DatasetField = 'CREATETIME'
                TableField = 'CREATETIME'
              end
              item
                DatasetField = 'UPDATETIME'
                TableField = 'UPDATETIME'
              end
              item
                DatasetField = 'USERID'
                TableField = 'USERID'
              end
              item
                DatasetField = 'USERGUID'
                TableField = 'USERGUID'
              end
              item
                DatasetField = 'ORGANIZATIONALGUID'
                TableField = 'ORGANIZATIONALGUID'
              end
              item
                DatasetField = 'FLAG'
                TableField = 'FLAG'
              end>
          end>
        Name = 'TSYS_TABLES'
        Fields = <
          item
            Name = 'TABGUID'
            DataType = datString
            Size = 32
            Required = True
            InPrimaryKey = True
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
            Name = 'CREATETIME'
            DataType = datDateTime
          end
          item
            Name = 'UPDATETIME'
            DataType = datDateTime
          end
          item
            Name = 'USERID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'USERGUID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'ORGANIZATIONALGUID'
            DataType = datString
            Size = 32
          end
          item
            Name = 'FLAG'
            DataType = datFloat
          end>
      end>
    JoinDataTables = <>
    UnionDataTables = <>
    Commands = <>
    RelationShips = <>
    UpdateRules = <>
    Version = 0
    Left = 32
    Top = 56
  end
end
