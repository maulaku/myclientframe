inherited frmTest: TfrmTest
  Left = 620
  Top = 128
  Caption = 'frmTest'
  PixelsPerInch = 96
  TextHeight = 12
  object DBGrid1: TDBGrid [0]
    Left = 64
    Top = 40
    Width = 433
    Height = 145
    DataSource = UniDataSource1
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
  end
  object Button1: TButton [1]
    Left = 24
    Top = 216
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
    Top = 72
  end
  object UniDataSource1: TUniDataSource
    DataSet = UniQuery1
    Left = 16
    Top = 40
  end
end
