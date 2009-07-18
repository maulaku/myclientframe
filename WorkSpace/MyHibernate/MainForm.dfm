object frmMain: TfrmMain
  Left = 605
  Top = 400
  Width = 630
  Height = 493
  Caption = #20027#31383#20307'[MyHibernate]'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    622
    461)
  PixelsPerInch = 96
  TextHeight = 12
  object pcMain: TPageControl
    Left = 16
    Top = 16
    Width = 591
    Height = 389
    ActivePage = tsTableAndColumn
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object tsDataBase: TTabSheet
      Caption = #39318#36873#39033
      object GroupBox1: TGroupBox
        Left = 8
        Top = 16
        Width = 393
        Height = 161
        Caption = #25968#25454#24211
        TabOrder = 0
        object Label3: TLabel
          Left = 16
          Top = 92
          Width = 36
          Height = 12
          Caption = #23494'  '#30721
        end
        object Label2: TLabel
          Left = 16
          Top = 56
          Width = 36
          Height = 12
          Caption = #29992#25143#21517
        end
        object Label1: TLabel
          Left = 16
          Top = 20
          Width = 36
          Height = 12
          Caption = #25968#25454#24211
        end
        object btnConnection: TButton
          Left = 16
          Top = 120
          Width = 201
          Height = 25
          Caption = #36830#25509#27979#35797
          TabOrder = 0
          OnClick = btnConnectionClick
        end
        object edtPassWord: TEdit
          Left = 64
          Top = 88
          Width = 153
          Height = 20
          PasswordChar = '*'
          TabOrder = 3
          Text = 'developer'
        end
        object edtUserName: TEdit
          Left = 64
          Top = 52
          Width = 153
          Height = 20
          TabOrder = 2
          Text = 'developer'
        end
        object cbbDataBase: TComboBox
          Left = 64
          Top = 16
          Width = 153
          Height = 20
          ItemHeight = 12
          TabOrder = 1
          Text = '192.168.1.252'
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 192
        Width = 393
        Height = 81
        Caption = #30446#24405#37197#32622
        TabOrder = 1
        object Label6: TLabel
          Left = 11
          Top = 24
          Width = 72
          Height = 12
          Caption = #25991#20214#20445#23384#22320#22336
        end
        object btnSelectDirectory: TSpeedButton
          Left = 363
          Top = 44
          Width = 23
          Height = 22
          Caption = '...'
          Flat = True
          OnClick = btnSelectDirectoryClick
        end
        object edtDirectory: TEdit
          Left = 16
          Top = 45
          Width = 342
          Height = 20
          TabOrder = 0
        end
      end
      object btnSave: TButton
        Left = 16
        Top = 288
        Width = 385
        Height = 25
        Caption = #20445#23384'(&S)'
        TabOrder = 2
        OnClick = btnSaveClick
      end
    end
    object tsTableAndColumn: TTabSheet
      Caption = #34920'/'#23383#27573#20449#24687
      ImageIndex = 1
      object lbColumn: TListBox
        Left = 280
        Top = 8
        Width = 293
        Height = 320
        ItemHeight = 12
        TabOrder = 0
      end
      object btnGetTableList: TButton
        Left = 8
        Top = 333
        Width = 161
        Height = 25
        Caption = #21462#24471#21015#34920
        TabOrder = 1
        OnClick = btnGetTableListClick
      end
      object lbTables: TCheckListBox
        Left = 8
        Top = 8
        Width = 257
        Height = 319
        ItemHeight = 12
        TabOrder = 2
        OnClick = lbTablesClick
      end
      object btnExport: TButton
        Left = 386
        Top = 333
        Width = 185
        Height = 25
        Caption = #23548#20986
        TabOrder = 3
        OnClick = btnExportClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = #20851#20110
      ImageIndex = 3
      object Label4: TLabel
        Left = 16
        Top = 56
        Width = 90
        Height = 12
        Caption = #34920'/'#23545#35937#29983#25104#24037#20855
      end
      object Label5: TLabel
        Left = 16
        Top = 32
        Width = 24
        Height = 12
        Caption = 'v1.0'
      end
    end
  end
  object sbMain: TStatusBar
    Left = 0
    Top = 442
    Width = 622
    Height = 19
    Panels = <
      item
        Text = #29366#24577
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object btnClose: TButton
    Left = 418
    Top = 409
    Width = 187
    Height = 25
    Caption = #20851#38381'(&C)'
    TabOrder = 2
    OnClick = btnCloseClick
  end
  object UCMain: TUniConnection
    AfterConnect = UCMainAfterConnect
    Left = 396
    Top = 55
  end
  object OracleUniProvider1: TOracleUniProvider
    Left = 308
    Top = 55
  end
end
