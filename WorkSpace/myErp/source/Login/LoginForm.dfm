inherited frmLogin: TfrmLogin
  Left = 655
  Top = 423
  Width = 408
  Height = 299
  Caption = #30331#38470
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 12
  inherited pnlBottom: TPanel
    Top = 231
    Width = 400
    inherited btnOK: TBitBtn
      Left = 200
      OnClick = btnOKClick
    end
    inherited btnCancel: TBitBtn
      Left = 280
      Anchors = [akLeft, akTop, akBottom]
    end
  end
  inherited GroupBox1: TGroupBox
    Width = 369
    Height = 193
    Caption = ''
    object Label1: TLabel
      Left = 32
      Top = 76
      Width = 36
      Height = 12
      Caption = #29992#25143#21517
    end
    object Label2: TLabel
      Left = 44
      Top = 107
      Width = 24
      Height = 12
      Caption = #23494#30721
    end
    object Label3: TLabel
      Left = 20
      Top = 138
      Width = 48
      Height = 12
      Caption = #30456#20851#20449#24687
    end
    object Label4: TLabel
      Left = 88
      Top = 24
      Width = 168
      Height = 21
      Caption = #27426#36814#30331#38470'XXX'#31995#32479
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtUserName: TEdit
      Left = 82
      Top = 72
      Width = 249
      Height = 20
      TabOrder = 0
    end
    object edtPassWord: TEdit
      Left = 82
      Top = 103
      Width = 249
      Height = 20
      TabOrder = 1
    end
    object edtInformation: TEdit
      Left = 82
      Top = 134
      Width = 249
      Height = 20
      TabOrder = 2
    end
  end
end
