inherited frmMain: TfrmMain
  Left = 451
  Top = 354
  Width = 838
  Height = 454
  Caption = #20027#31383#20307
  Position = poDesigned
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object statMain: TStatusBar [0]
    Left = 0
    Top = 408
    Width = 830
    Height = 19
    Panels = <>
    ParentColor = True
  end
  object Page: TcxPageControl [1]
    Left = 0
    Top = 49
    Width = 830
    Height = 359
    ActivePage = tsMainPage
    Align = alClient
    TabOrder = 5
    ClientRectBottom = 359
    ClientRectRight = 830
    ClientRectTop = 23
    object tsMainPage: TcxTabSheet
      Caption = #20027#39029
      ImageIndex = 0
    end
  end
  inherited ilMain: TImageList
    Left = 136
    Top = 64
  end
  object mbMain: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = #20027#33756#21333#26639
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 604
        FloatTop = 354
        FloatClientWidth = 23
        FloatClientHeight = 22
        IsMainMenu = True
        ItemLinks = <
          item
            Item = bsiSystem
            Visible = True
          end>
        MultiLine = True
        Name = #20027#33756#21333#26639
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = #24037#20855#26639
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 23
        DockingStyle = dsTop
        FloatLeft = 565
        FloatTop = 452
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = bbClose
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbCloseAll
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbTest
            Visible = True
          end
          item
            Item = dxBarButton1
            Visible = True
          end>
        Name = #24037#20855#26639
        OneOnRow = True
        Row = 1
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Images = ilMain
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    Style = bmsFlat
    UseSystemFont = True
    Left = 40
    Top = 64
    DockControlHeights = (
      0
      0
      49
      0)
    object bsiSystem: TdxBarSubItem
      Caption = #31995#32479
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = bbLock
          Visible = True
        end
        item
          BeginGroup = True
          Item = bbReLogin
          Visible = True
        end
        item
          BeginGroup = True
          Item = bbConfig
          Visible = True
        end
        item
          BeginGroup = True
          Item = bbClose
          Visible = True
        end
        item
          Item = bbCloseAll
          Visible = True
        end
        item
          BeginGroup = True
          Item = bbExit
          Visible = True
        end>
    end
    object bbCloseAll: TdxBarButton
      Action = act_CloseAll
      Category = 0
      ImageIndex = 7
      PaintStyle = psCaptionGlyph
    end
    object bbExit: TdxBarButton
      Action = Act_Exit
      Category = 0
      ImageIndex = 0
    end
    object bbReLogin: TdxBarButton
      Action = act_reLogin
      Category = 0
    end
    object bbLock: TdxBarButton
      Action = act_Lock
      Category = 0
      ImageIndex = 24
    end
    object bbClose: TdxBarButton
      Action = act_Close
      Category = 0
      ImageIndex = 6
      PaintStyle = psCaptionGlyph
    end
    object bbConfig: TdxBarButton
      Action = act_Config
      Category = 0
      ImageIndex = 2
    end
    object bbTest: TdxBarButton
      Action = Act_Test
      Category = 0
      Hint = #27979#35797' C'
      ImageIndex = 26
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton1: TdxBarButton
      Action = act_Test1
      Caption = #27979#35797' o'
      Category = 0
      Hint = #27979#35797' o'
    end
  end
  object alMain: TActionList
    Left = 88
    Top = 64
    object act_Close: TAction
      Category = #31995#32479
      Caption = #20851#38381
      ImageIndex = 0
      OnExecute = act_CloseExecute
    end
    object act_CloseAll: TAction
      Category = #31995#32479
      Caption = #20851#38381#25152#26377
      ImageIndex = 1
      OnExecute = act_CloseAllExecute
    end
    object Act_Exit: TAction
      Category = #31995#32479
      Caption = #36864#20986
      ImageIndex = 2
      OnExecute = Act_ExitExecute
    end
    object act_reLogin: TAction
      Category = #31995#32479
      Caption = #37325#30331#38470
    end
    object act_Lock: TAction
      Category = #31995#32479
      Caption = #38145#23450
      ImageIndex = 3
    end
    object act_About: TAction
      Category = #24110#21161
      Caption = #20851#20110
    end
    object act_Access: TAction
      Category = #24110#21161
      Caption = #35775#38382
    end
    object act_Config: TAction
      Category = #31995#32479
      Caption = #37197#32622#25968#25454
      ImageIndex = 6
      OnExecute = act_ConfigExecute
    end
    object Act_Test: TAction
      Category = #31995#32479
      Caption = #27979#35797' C'
      ImageIndex = 23
      OnExecute = Act_TestExecute
    end
    object act_Test1: TAction
      Category = #31995#32479
      Caption = #27979#35797'h'
      OnExecute = act_Test1Execute
    end
  end
end
