object frmMain: TfrmMain
  Left = 265
  Top = 151
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
  DesignSize = (
    622
    466)
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
      Caption = #25968#25454#24211
      object Label1: TLabel
        Left = 16
        Top = 20
        Width = 36
        Height = 12
        Caption = #25968#25454#24211
      end
      object Label2: TLabel
        Left = 16
        Top = 56
        Width = 36
        Height = 12
        Caption = #29992#25143#21517
      end
      object Label3: TLabel
        Left = 16
        Top = 92
        Width = 36
        Height = 12
        Caption = #23494'  '#30721
      end
      object cbbDataBase: TComboBox
        Left = 64
        Top = 16
        Width = 153
        Height = 20
        ItemHeight = 12
        TabOrder = 0
        Text = '114'
      end
      object edtUserName: TEdit
        Left = 64
        Top = 52
        Width = 153
        Height = 20
        TabOrder = 1
        Text = 'hstwcorp'
      end
      object edtPassWord: TEdit
        Left = 64
        Top = 88
        Width = 153
        Height = 20
        PasswordChar = '*'
        TabOrder = 2
        Text = 'hstwcorp'
      end
      object btnConnection: TButton
        Left = 8
        Top = 328
        Width = 145
        Height = 25
        Caption = #36830#25509#27979#35797
        TabOrder = 3
        OnClick = btnConnectionClick
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
    Top = 447
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
  object Button1: TButton
    Left = 418
    Top = 417
    Width = 187
    Height = 25
    Caption = #20851#38381'(&C)'
    TabOrder = 2
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
