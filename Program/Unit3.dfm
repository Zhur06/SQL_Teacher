object Form3: TForm3
  Left = 358
  Top = 359
  Width = 784
  Height = 441
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 185
    Top = 0
    Width = 5
    Height = 402
  end
  object Splitter2: TSplitter
    Left = 374
    Top = 0
    Height = 402
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 185
    Height = 402
    Align = alLeft
    Caption = '  '#1064#1088#1080#1092#1090'  '
    TabOrder = 0
    DesignSize = (
      185
      402)
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 111
      Height = 16
      Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1096#1088#1080#1092#1090
    end
    object Label2: TLabel
      Left = 8
      Top = 96
      Width = 121
      Height = 16
      Caption = #1064#1088#1080#1092#1090' '#1042#1099#1076#1077#1083#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object changeMainFontBtn: TButton
      Left = 8
      Top = 48
      Width = 169
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 0
      OnClick = changeMainFontBtnClick
    end
    object changeSecondFontBtn: TButton
      Left = 8
      Top = 120
      Width = 169
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = changeSecondFontBtnClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 190
    Top = 0
    Width = 184
    Height = 402
    Align = alLeft
    Caption = '  '#1062#1074#1077#1090#1072'  '
    TabOrder = 1
    DesignSize = (
      184
      402)
    object Label3: TLabel
      Left = 8
      Top = 24
      Width = 76
      Height = 16
      Caption = 'Memo, Edit...'
    end
    object Label4: TLabel
      Left = 8
      Top = 128
      Width = 70
      Height = 16
      Caption = #1062#1074#1077#1090' '#1092#1086#1085#1072
    end
    object Edit1: TEdit
      Left = 8
      Top = 48
      Width = 169
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      AutoSelect = False
      AutoSize = False
      Enabled = False
      TabOrder = 0
    end
    object changeMemoColorBtn: TButton
      Left = 8
      Top = 80
      Width = 169
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = changeMemoColorBtnClick
    end
    object changeThemeColorBtn: TButton
      Left = 8
      Top = 152
      Width = 169
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 2
      OnClick = changeThemeColorBtnClick
    end
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 72
    Top = 336
  end
  object ColorDialog1: TColorDialog
    Left = 224
    Top = 344
  end
end
