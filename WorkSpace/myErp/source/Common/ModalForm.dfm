inherited frmModal: TfrmModal
  Left = 453
  Top = 365
  Width = 635
  Caption = #27169#24577#31383#20307
  Font.Charset = ANSI_CHARSET
  Font.Height = -12
  Font.Name = #23435#20307
  KeyPreview = True
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 12
  object pnlBottom: TPanel [0]
    Left = 0
    Top = 368
    Width = 627
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      627
      41)
    object btnOK: TBitBtn
      Left = 455
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #30830#23450'(&O)'
      TabOrder = 0
    end
    object btnCancel: TBitBtn
      Left = 543
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #21462#28040'(&C)'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox [1]
    Left = 16
    Top = 16
    Width = 601
    Height = 337
    Caption = #20449#24687
    TabOrder = 1
  end
  inherited ilBase: TImageList
    Left = 576
  end
end
