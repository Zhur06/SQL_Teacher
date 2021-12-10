object Form1: TForm1
  Left = 440
  Top = 236
  Width = 1218
  Height = 775
  Align = alClient
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter3: TSplitter
    Left = 989
    Top = 0
    Height = 736
    Align = alRight
    OnMoved = Splitter3Moved
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 0
    Width = 989
    Height = 736
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 2
      Top = 131
      Width = 985
      Height = 3
      Cursor = crVSplit
      Align = alTop
      OnMoved = Splitter1Moved
    end
    object Splitter2: TSplitter
      Left = 2
      Top = 297
      Width = 985
      Height = 3
      Cursor = crVSplit
      Align = alTop
      OnMoved = Splitter2Moved
    end
    object GroupBox3: TGroupBox
      Left = 2
      Top = 134
      Width = 985
      Height = 163
      Align = alTop
      Caption = '  SQL '#1082#1086#1076'  '
      TabOrder = 0
      object Memo1: TMemo
        Left = 2
        Top = 18
        Width = 981
        Height = 143
        Align = alClient
        Lines.Strings = (
          'SELECT *'
          'FROM pc;')
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
      Width = 985
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
      object Splitter5: TSplitter
        Left = 2
        Top = 62
        Width = 981
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Panel1: TPanel
        Left = 2
        Top = 65
        Width = 981
        Height = 46
        Align = alClient
        Caption = #1047#1076#1077#1089#1100' '#1073#1091#1076#1077#1090' '#1091#1089#1083#1086#1074#1080#1077
        TabOrder = 0
      end
      object GroupBox6: TGroupBox
        Left = 2
        Top = 18
        Width = 981
        Height = 44
        Align = alTop
        TabOrder = 1
        object Label1: TLabel
          Left = 2
          Top = 18
          Width = 195
          Height = 24
          Align = alLeft
          Caption = '  '#1042#1099#1073#1077#1088#1080#1090#1077' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084#1091#1102' '#1041#1044':'
        end
        object Label2: TLabel
          Left = 8
          Top = 48
          Width = 427
          Height = 16
          Caption = #1063#1090#1086' '#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1041#1044' '#1074#1074#1077#1076#1080#1090#1077' '#1080#1084#1103' '#1080' '#1086#1090#1082#1088#1086#1081#1090#1077' '#1089#1082#1088#1080#1087#1090' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1041#1044':'
        end
        object ComboBox1: TComboBox
          Left = 208
          Top = 16
          Width = 769
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          TabOrder = 0
          OnChange = ComboBox1Change
          Items.Strings = (
            'Computer')
        end
        object dbCreateBtn: TButton
          Left = 872
          Top = 44
          Width = 105
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1041#1044
          TabOrder = 1
          OnClick = dbCreateBtnClick
        end
        object dbName: TEdit
          Left = 440
          Top = 44
          Width = 417
          Height = 24
          TabOrder = 2
        end
      end
    end
    object GroupBox5: TGroupBox
      Left = 2
      Top = 300
      Width = 985
      Height = 434
      Align = alClient
      Caption = '  '#1056#1077#1079#1091#1083#1100#1090#1072#1090'  '
      TabOrder = 2
      object Splitter4: TSplitter
        Left = 2
        Top = 353
        Width = 981
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object Panel3: TPanel
        Left = 2
        Top = 356
        Width = 981
        Height = 76
        Align = alBottom
        Caption = #1047#1076#1077#1089#1100' '#1073#1091#1076#1077#1090' '#1088#1077#1079#1091#1083#1100#1090#1072#1090' '#1087#1088#1086#1074#1077#1088#1082#1080' ('#1042#1077#1088#1085#1086'/'#1053#1077#1042#1077#1088#1085#1086')'
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 18
        Width = 981
        Height = 335
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
    Left = 992
    Top = 0
    Width = 210
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
      Width = 193
      Height = 25
      Caption = '1'
      TabOrder = 0
    end
    object doScriptBtn: TButton
      Left = 8
      Top = 704
      Width = 193
      Height = 25
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1089#1082#1088#1080#1087#1090' '#1080#1079' '#1092#1072#1081#1083#1072
      TabOrder = 1
      OnClick = doScriptBtnClick
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
  object OpenDialog1: TOpenDialog
    Left = 114
    Top = 18
  end
end
