object Form1: TForm1
  Left = 155
  Top = 0
  Width = 1218
  Height = 775
  Anchors = [akRight, akBottom]
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox4: TGroupBox
    Left = 0
    Top = 0
    Width = 1015
    Height = 736
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object GroupBox3: TGroupBox
      Left = 2
      Top = 131
      Width = 1011
      Height = 100
      Align = alTop
      Caption = '  SQL '#1082#1086#1076'  '
      TabOrder = 0
      object Memo1: TMemo
        Left = 2
        Top = 18
        Width = 1007
        Height = 80
        Align = alClient
        Lines.Strings = (
          'CREATE DATABASE DB_TEST;'
          ''
          'CREATE TABLE DB_TEST.TEST_TABLE ('
          '    `ID` int(11) NOT NULL AUTO_INCREMENT,'
          '    `NAME` varchar(50) DEFAULT NULL,'
          '    PRIMARY KEY (`ID`)'
          ') ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;'
          ''
          'INSERT INTO DB_TEST.TEST_TABLE VALUES'
          '    (10, '#39#1047#1072#1087#1080#1089#1100' 10'#39'),'
          '    (20, '#39#1047#1072#1087#1080#1089#1100' 20'#39'),'
          '    (30, '#39#1047#1072#1087#1080#1089#1100' 30'#39'),'
          '    (40, '#39#1047#1072#1087#1080#1089#1100' 40'#39'),'
          '    (50, '#39#1047#1072#1087#1080#1089#1100' 50'#39');')
        TabOrder = 0
      end
      object goBtn: TButton
        Left = 1093
        Top = 67
        Width = 83
        Height = 25
        Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
        TabOrder = 1
        OnClick = goBtnClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 18
      Width = 1011
      Height = 113
      Align = alTop
      BiDiMode = bdLeftToRight
      Caption = '  '#1059#1089#1083#1086#1074#1080#1077'  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
      object Panel1: TPanel
        Left = 2
        Top = 18
        Width = 1007
        Height = 93
        Align = alClient
        Caption = #1047#1076#1077#1089#1100' '#1073#1091#1076#1077#1090' '#1091#1089#1083#1086#1074#1080#1077
        TabOrder = 0
      end
    end
    object GroupBox5: TGroupBox
      Left = 2
      Top = 231
      Width = 1011
      Height = 503
      Align = alClient
      Caption = '  '#1056#1077#1079#1091#1083#1100#1090#1072#1090'  '
      TabOrder = 2
      object Panel3: TPanel
        Left = 2
        Top = 425
        Width = 1007
        Height = 76
        Align = alBottom
        Caption = #1047#1076#1077#1089#1100' '#1073#1091#1076#1077#1090' '#1088#1077#1079#1091#1083#1100#1090#1072#1090' '#1087#1088#1086#1074#1077#1088#1082#1080' ('#1042#1077#1088#1085#1086'/'#1053#1077#1042#1077#1088#1085#1086')'
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 18
        Width = 1007
        Height = 407
        Align = alClient
        DataSource = DataSource1
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 1015
    Top = 0
    Width = 187
    Height = 736
    Align = alRight
    Caption = '  '#1047#1072#1076#1072#1085#1080#1103'  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Button1: TButton
      Left = 8
      Top = 24
      Width = 161
      Height = 25
      Caption = '1'
      TabOrder = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = MyQuery1
    Left = 82
    Top = 18
  end
  object MyEmbConnection1: TMyEmbConnection
    Options.Charset = 'cp1251'
    Params.Strings = (
      '--basedir=.'
      '--datadir=data'
      '--skip-innodb')
    Username = 'root'
    Left = 10
    Top = 18
  end
  object MyQuery1: TMyQuery
    Connection = MyEmbConnection1
    Left = 42
    Top = 18
  end
end
