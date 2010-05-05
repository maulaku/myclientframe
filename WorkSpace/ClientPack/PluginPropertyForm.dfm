object frmPluginProperty: TfrmPluginProperty
  Left = 455
  Top = 307
  BorderStyle = bsDialog
  Caption = #25554#20214
  ClientHeight = 248
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    378
    248)
  PixelsPerInch = 96
  TextHeight = 12
  object pnlButtom: TPanel
    Left = 0
    Top = 207
    Width = 378
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      378
      41)
    object btnOK: TButton
      Left = 213
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = #30830#23450'(&O)'
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 298
      Top = 10
      Width = 72
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = #21462#28040'(&C)'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnPublish: TButton
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      Caption = #21457#24067'(&P)'
      TabOrder = 2
      OnClick = btnPublishClick
    end
    object Button1: TButton
      Left = 104
      Top = 8
      Width = 75
      Height = 25
      Caption = #21047#26032#20449#24687
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object PageControl1: TPageControl
    Left = 16
    Top = 16
    Width = 346
    Height = 190
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #20449#24687
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 30
        Height = 12
        Caption = #21517#31216':'
      end
      object Label2: TLabel
        Left = 8
        Top = 46
        Width = 30
        Height = 12
        Caption = #20316#32773':'
      end
      object Label3: TLabel
        Left = 8
        Top = 127
        Width = 30
        Height = 12
        Caption = #29256#26412':'
      end
      object Label4: TLabel
        Left = 8
        Top = 72
        Width = 30
        Height = 12
        Caption = #25551#36848':'
      end
      object Label5: TLabel
        Left = 164
        Top = 16
        Width = 54
        Height = 12
        Caption = #20013#25991#21517#31216':'
      end
      object edtName: TEdit
        Left = 48
        Top = 12
        Width = 105
        Height = 20
        TabOrder = 0
      end
      object edtCnName: TEdit
        Left = 224
        Top = 12
        Width = 106
        Height = 20
        TabOrder = 1
      end
      object edtAuthor: TEdit
        Left = 48
        Top = 42
        Width = 281
        Height = 20
        TabOrder = 2
      end
      object edtRemark: TRichEdit
        Left = 48
        Top = 72
        Width = 283
        Height = 41
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object edtVersion: TEdit
        Left = 48
        Top = 123
        Width = 281
        Height = 20
        TabOrder = 4
        Text = '1.0.000'
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26435#38480
      ImageIndex = 1
      object clbPurView: TCheckListBox
        Left = 13
        Top = 10
        Width = 313
        Height = 137
        ItemHeight = 12
        Items.Strings = (
          #26597#35810
          #26032#22686
          #21024#38500
          #20462#25913
          #25171#21360
          #39044#35272
          #23548#20986
          #23457#26680
          #20445#23384)
        TabOrder = 0
      end
    end
    object TabSheet4: TTabSheet
      Caption = #24320#21457#21830
      ImageIndex = 3
      object RichEdit1: TRichEdit
        Left = 16
        Top = 8
        Width = 305
        Height = 145
        Enabled = False
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        Lines.Strings = (
          #20316#32773':robert'
          'Q  Q:108454991'
          ''
          #32593#22336':http://www.i-impetus.cn'
          ''
          #22768#26126':'#26412#31995#32479#20857#25480#26435#32473'XXX'#20844#21496#20351#29992','#19981#24471#32763#24405','#38750#27861#22797#21046','
          #36829
          #27861#24517#31350'.')
        ParentFont = False
        TabOrder = 0
      end
    end
  end
end
