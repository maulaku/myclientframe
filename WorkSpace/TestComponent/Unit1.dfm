object Form1: TForm1
  Left = 374
  Top = 364
  Width = 394
  Height = 233
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 104
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Person1: TPerson
    age = 0
    AName = #32599#21326#26149
    ID = 0
    Skin = siYellow
    MyState = []
    isYoungMen = False
    OnBirthday = Person1Birthday
    Left = 56
    Top = 16
  end
  object Department1: TDepartment
    ID = 0
    Manager = Person1
    Left = 64
    Top = 72
  end
end
