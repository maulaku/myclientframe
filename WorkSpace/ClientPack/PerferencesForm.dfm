object frmPerferences: TfrmPerferences
  Left = 449
  Top = 291
  Width = 480
  Height = 332
  BorderIcons = [biSystemMenu]
  Caption = #39318#36873#39033
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object pcPerferances: TPageControl
    Left = 16
    Top = 16
    Width = 433
    Height = 241
    ActivePage = tsVariables
    TabOrder = 0
    object tsVariables: TTabSheet
      Caption = #29615#22659#21464#37327
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 60
        Height = 12
        Caption = #39033#30446#26681#30446#24405
      end
      object spSpecificallyRoot: TSpeedButton
        Left = 384
        Top = 29
        Width = 23
        Height = 22
        Caption = '...'
        Flat = True
        OnClick = spSpecificallyRootClick
      end
      object EdtRoot: TEdit
        Left = 16
        Top = 32
        Width = 360
        Height = 20
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 64
        Width = 392
        Height = 137
        Caption = #35814#32454#20449#24687
        TabOrder = 1
        object Label2: TLabel
          Left = 30
          Top = 24
          Width = 30
          Height = 12
          Caption = #32534#35793':'
        end
        object Label3: TLabel
          Left = 36
          Top = 46
          Width = 24
          Height = 12
          Caption = 'Dcu:'
        end
        object Label4: TLabel
          Left = 18
          Top = 68
          Width = 42
          Height = 12
          Caption = #28304#20195#30721':'
        end
        object Label5: TLabel
          Left = 30
          Top = 90
          Width = 30
          Height = 12
          Caption = #25253#34920':'
        end
        object Label6: TLabel
          Left = 6
          Top = 112
          Width = 54
          Height = 12
          Caption = #22270#24418#25991#20214':'
        end
        object lblBin: TLabel
          Left = 70
          Top = 24
          Width = 36
          Height = 12
          Caption = 'lblBin'
        end
        object lblDcu: TLabel
          Left = 70
          Top = 46
          Width = 36
          Height = 12
          Caption = 'lblDcu'
        end
        object lblSource: TLabel
          Left = 70
          Top = 68
          Width = 54
          Height = 12
          Caption = 'lblSource'
        end
        object lblReport: TLabel
          Left = 70
          Top = 90
          Width = 54
          Height = 12
          Caption = 'lblReport'
        end
        object lblImages: TLabel
          Left = 70
          Top = 112
          Width = 54
          Height = 12
          Caption = 'lblImages'
        end
      end
    end
    object tsProject: TTabSheet
      Caption = #24037#31243#35774#32622
      ImageIndex = 1
      object GroupBox3: TGroupBox
        Left = 16
        Top = 8
        Width = 392
        Height = 187
        Caption = #35814#32454#20449#24687
        TabOrder = 0
        object Label12: TLabel
          Left = 20
          Top = 24
          Width = 54
          Height = 12
          Caption = #39033#30446#21517#31216':'
        end
        object Label18: TLabel
          Left = 169
          Top = 24
          Width = 54
          Height = 12
          Caption = #20013#25991#21517#31216':'
        end
        object Label19: TLabel
          Left = 20
          Top = 84
          Width = 54
          Height = 12
          Caption = #24320' '#21457' '#21830':'
        end
        object Label20: TLabel
          Left = 20
          Top = 114
          Width = 54
          Height = 12
          Caption = #20316'    '#32773':'
        end
        object Label21: TLabel
          Left = 20
          Top = 144
          Width = 54
          Height = 12
          Caption = #29256' '#26412' '#21495':'
        end
        object edtProjectName: TEdit
          Left = 81
          Top = 20
          Width = 80
          Height = 20
          TabOrder = 0
          Text = 'myerp'
        end
        object edtSoftWareName: TEdit
          Left = 230
          Top = 20
          Width = 154
          Height = 20
          TabOrder = 1
          Text = #21160#21147#20225#19994#36164#28304#35745#21010#31649#29702#31995#32479
        end
        object edtDeveloperName: TEdit
          Left = 81
          Top = 80
          Width = 290
          Height = 20
          TabOrder = 2
        end
        object edtAuthor: TEdit
          Left = 81
          Top = 110
          Width = 290
          Height = 20
          TabOrder = 3
        end
        object edtVersion: TEdit
          Left = 81
          Top = 140
          Width = 290
          Height = 20
          TabOrder = 4
        end
      end
    end
    object tsServer: TTabSheet
      Caption = #26381#21153#22120#37197#32622
      ImageIndex = 2
      object GroupBox2: TGroupBox
        Left = 16
        Top = 8
        Width = 392
        Height = 193
        Caption = #35814#32454#20449#24687
        TabOrder = 0
        object Label13: TLabel
          Left = 14
          Top = 20
          Width = 42
          Height = 12
          Caption = #22320'  '#22336':'
        end
        object Label14: TLabel
          Left = 277
          Top = 20
          Width = 30
          Height = 12
          Caption = #31471#21475':'
        end
        object edtPort: TEdit
          Left = 317
          Top = 16
          Width = 56
          Height = 20
          TabOrder = 0
        end
        object cbbAddress: TComboBox
          Left = 64
          Top = 16
          Width = 201
          Height = 20
          ItemHeight = 12
          TabOrder = 1
        end
      end
    end
    object tsAbout: TTabSheet
      Caption = #20851#20110
      ImageIndex = 4
      object Label24: TLabel
        Left = 24
        Top = 117
        Width = 84
        Height = 12
        Caption = #29256#26435' 2009-2010'
      end
      object Label25: TLabel
        Left = 24
        Top = 59
        Width = 36
        Height = 12
        Caption = #20225#19994#29256
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #26032#23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label26: TLabel
        Left = 24
        Top = 32
        Width = 290
        Height = 21
        Caption = #23458#25143#31471#25554#20214'(Client Plugin)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label27: TLabel
        Left = 24
        Top = 18
        Width = 49
        Height = 12
        Caption = 'IMPETUS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #26032#23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label28: TLabel
        Left = 24
        Top = 101
        Width = 48
        Height = 12
        Caption = #29256#26412' 1.0'
      end
      object Label29: TLabel
        Left = 24
        Top = 133
        Width = 84
        Height = 12
        Caption = #21160#21147#36719#20214#24037#20316#23460
      end
      object Label30: TLabel
        Left = 24
        Top = 149
        Width = 132
        Height = 12
        Caption = 'Http://www.impetus.com'
      end
      object Bevel1: TBevel
        Left = 24
        Top = 88
        Width = 369
        Height = 2
      end
      object Label31: TLabel
        Left = 24
        Top = 168
        Width = 198
        Height = 12
        Caption = 'Email:ehuae@163.com QQ:108454991 '
      end
    end
  end
  object BtnOK: TButton
    Left = 285
    Top = 266
    Width = 75
    Height = 25
    Caption = #30830#23450'(&O)'
    TabOrder = 1
    OnClick = BtnOKClick
  end
  object btnCancel: TButton
    Left = 373
    Top = 266
    Width = 75
    Height = 25
    Caption = #21462#28040'(&C)'
    TabOrder = 2
    OnClick = btnCancelClick
  end
end
