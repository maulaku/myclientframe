inherited frmTest: TfrmTest
  Caption = 'frmTest'
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrd1: TDBGrid [0]
    Left = 0
    Top = 26
    Width = 636
    Height = 295
    Align = alTop
    DataSource = UniDataSource1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton [1]
    Left = 8
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 5
    OnClick = Button1Click
  end
  inherited bmChild: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockControlHeights = (
      0
      0
      26
      0)
  end
  object UniQuery1: TUniQuery
    Left = 16
    Top = 56
  end
  object UniDataSource1: TUniDataSource
    DataSet = UniQuery1
    Left = 56
    Top = 56
  end
end
