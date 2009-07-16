object frmConfig: TfrmConfig
  Left = 999
  Top = 443
  Width = 360
  Height = 506
  Caption = #25968#25454#24211#37197#32622
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
    352
    474)
  PixelsPerInch = 96
  TextHeight = 12
  object grp1: TGroupBox
    Left = 16
    Top = 16
    Width = 320
    Height = 420
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #25968#25454#24211#20449#24687
    TabOrder = 0
    object lbl1: TLabel
      Left = 24
      Top = 32
      Width = 42
      Height = 12
      Caption = #31867'  '#22411':'
    end
    object lbl2: TLabel
      Left = 24
      Top = 91
      Width = 42
      Height = 12
      Caption = #29992#25143#21517':'
    end
    object lbl3: TLabel
      Left = 24
      Top = 120
      Width = 42
      Height = 12
      Caption = #23494'  '#30721':'
    end
    object lbl4: TLabel
      Left = 24
      Top = 61
      Width = 42
      Height = 12
      Caption = #26381#21153#22120':'
    end
    object lbl5: TLabel
      Left = 24
      Top = 152
      Width = 42
      Height = 12
      Caption = #31471'  '#21475':'
    end
    object cbbType: TComboBox
      Left = 88
      Top = 24
      Width = 200
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 0
      Items.Strings = (
        'ORACLE'
        'SQL SERVER')
    end
    object edtUserName: TEdit
      Left = 88
      Top = 87
      Width = 200
      Height = 20
      TabOrder = 1
    end
    object edtPassWord: TEdit
      Left = 88
      Top = 116
      Width = 200
      Height = 20
      PasswordChar = '*'
      TabOrder = 2
    end
    object edtServerName: TEdit
      Left = 88
      Top = 57
      Width = 200
      Height = 20
      TabOrder = 3
    end
    object sePort: TSpinEdit
      Left = 88
      Top = 144
      Width = 121
      Height = 21
      MaxValue = 0
      MinValue = 0
      TabOrder = 4
      Value = 0
    end
    object dbgrd1: TDBGrid
      Left = 32
      Top = 248
      Width = 265
      Height = 145
      DataSource = UniDataSource1
      TabOrder = 5
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 433
    Width = 352
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      352
      41)
    object btnOK: TButton
      Left = 263
      Top = 8
      Width = 74
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #30830#23450'(&O)'
      TabOrder = 0
      OnClick = btnOKClick
    end
    object Button1: TButton
      Left = 104
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object UniQuery1: TUniQuery
    Left = 48
    Top = 224
  end
  object UniDataSource1: TUniDataSource
    DataSet = UniQuery1
    Left = 88
    Top = 224
  end
end
