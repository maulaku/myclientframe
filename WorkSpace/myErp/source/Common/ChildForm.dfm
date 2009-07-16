inherited frmChild: TfrmChild
  Left = 490
  Top = 326
  Caption = #23376#31383#20307
  FormStyle = fsMDIChild
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited ilBase: TImageList
    Left = 560
    Top = 40
  end
  object bmChild: TdxBarManager
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
        Caption = #24037#20855#26465
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 604
        FloatTop = 357
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = bbFind
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbPrint
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbExport
            Visible = True
          end
          item
            BeginGroup = True
            Item = bbNew
            Visible = True
          end
          item
            Item = bbDelete
            Visible = True
          end
          item
            Item = bbModify
            Visible = True
          end>
        Name = #24037#20855#26465
        OneOnRow = True
        Row = 0
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
    Images = ilBase
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    Style = bmsFlat
    UseSystemFont = True
    Left = 528
    Top = 40
    DockControlHeights = (
      0
      0
      26
      0)
    object bbDelete: TdxBarButton
      Action = act_Delete
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbModify: TdxBarButton
      Action = act_Edit
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbExport: TdxBarButton
      Action = act_Export
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPrint: TdxBarButton
      Action = act_print
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbFind: TdxBarButton
      Action = act_Find
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbNew: TdxBarButton
      Action = act_new
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object alChild: TActionList
    Images = ilBase
    Left = 600
    Top = 40
    object act_new: TAction
      Caption = #26032#22686
      ImageIndex = 17
    end
    object act_Delete: TAction
      Caption = #21024#38500
      ImageIndex = 18
    end
    object act_Edit: TAction
      Caption = #20462#25913
      ImageIndex = 19
    end
    object act_Find: TAction
      Caption = #26597#35810
      ImageIndex = 16
    end
    object act_Export: TAction
      Caption = #23548#20986
      ImageIndex = 13
    end
    object act_print: TAction
      Caption = #25171#21360
      ImageIndex = 12
    end
  end
end
