object Form3: TForm3
  Left = 232
  Top = 171
  Width = 468
  Height = 150
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1079#1072#1076#1072#1085#1080#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 262
    Height = 16
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1079#1072#1076#1072#1085#1080#1077' '#1076#1083#1103' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103
  end
  object Label2: TLabel
    Left = 296
    Top = 8
    Width = 26
    Height = 16
    Caption = #1048#1083#1080
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 32
    Width = 265
    Height = 24
    Style = csDropDownList
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 0
    Text = '-- '#1053#1077' '#1074#1099#1073#1088#1072#1085#1086' --'
    OnChange = ComboBox1Change
    Items.Strings = (
      '-- '#1053#1077' '#1074#1099#1073#1088#1072#1085#1086' --')
  end
  object newTaskBtn: TButton
    Left = 296
    Top = 32
    Width = 145
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1077
    TabOrder = 1
  end
  object deleteBtn: TButton
    Left = 8
    Top = 64
    Width = 265
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1076#1072#1085#1080#1077
    Enabled = False
    TabOrder = 2
  end
end
