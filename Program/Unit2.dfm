object Form2: TForm2
  Left = 658
  Top = 355
  Width = 458
  Height = 315
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1041#1044
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 53
    Height = 16
    Caption = #1048#1084#1103' '#1041#1044': '
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 118
    Height = 16
    Caption = #1057#1082#1088#1080#1087#1090' '#1089#1086#1079#1076#1072#1085#1080#1103': '
  end
  object dbWay: TLabel
    Left = 128
    Top = 32
    Width = 78
    Height = 16
    Caption = #1053#1077' '#1074#1099#1073#1088#1072#1085#1086
  end
  object dbName: TEdit
    Left = 128
    Top = 8
    Width = 121
    Height = 24
    TabOrder = 0
    OnChange = dbNameChange
  end
  object Button1: TButton
    Left = 232
    Top = 32
    Width = 17
    Height = 16
    Caption = '...'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 56
    Width = 241
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100
    TabOrder = 2
    OnClick = Button2Click
  end
end
