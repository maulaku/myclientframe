inherited frmConfig: TfrmConfig
  Left = 555
  Top = 353
  Width = 514
  Height = 320
  Caption = #25968#25454#37197#32622
  PixelsPerInch = 96
  TextHeight = 12
  inherited pnlBottom: TPanel
    Top = 249
    Width = 489
    inherited btnOK: TBitBtn
      Left = 327
      OnClick = btnOKClick
    end
    inherited btnCancel: TBitBtn
      Left = 415
    end
  end
  inherited GroupBox1: TGroupBox
    Width = 473
    Height = 233
    object PageControl1: TPageControl
      Left = 16
      Top = 26
      Width = 439
      Height = 185
      ActivePage = TabSheet1
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #25968#25454#24211#20449#24687
        object Label1: TLabel
          Left = 16
          Top = 24
          Width = 24
          Height = 12
          Caption = #31867#22411
        end
        object Label2: TLabel
          Left = 16
          Top = 55
          Width = 24
          Height = 12
          Caption = #22320#22336
        end
        object Label3: TLabel
          Left = 16
          Top = 85
          Width = 36
          Height = 12
          Caption = #29992#25143#21517
        end
        object Label4: TLabel
          Left = 16
          Top = 116
          Width = 24
          Height = 12
          Caption = #23494#30721
        end
        object Label6: TLabel
          Left = 176
          Top = 55
          Width = 24
          Height = 12
          Caption = #31471#21475
        end
        object cbbType: TComboBox
          Left = 64
          Top = 20
          Width = 193
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          ItemIndex = 0
          TabOrder = 0
          Text = 'ORACLE'
          Items.Strings = (
            'ORACLE'
            'SQL SERVER'
            'MYSQL'
            'DB2')
        end
        object edtAddress: TEdit
          Left = 64
          Top = 51
          Width = 99
          Height = 20
          TabOrder = 1
          Text = '127.000.000.100'
        end
        object edtUserName: TEdit
          Left = 64
          Top = 81
          Width = 193
          Height = 20
          TabOrder = 2
        end
        object edtPassWord: TEdit
          Left = 64
          Top = 112
          Width = 193
          Height = 20
          PasswordChar = '*'
          TabOrder = 3
        end
        object edtPort: TSpinEdit
          Left = 208
          Top = 50
          Width = 49
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 4
          Value = 1234
        end
      end
    end
  end
end
