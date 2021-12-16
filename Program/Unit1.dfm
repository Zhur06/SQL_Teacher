object Form1: TForm1
  Left = 477
  Top = 226
  Width = 1218
  Height = 775
  Align = alCustom
  Caption = 'SQLTeacher'
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
  object Splitter1: TSplitter
    Left = 943
    Top = 0
    Width = 9
    Height = 736
    Align = alRight
  end
  object Panel4: TPanel
    Left = 952
    Top = 0
    Width = 250
    Height = 736
    Align = alRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 57
      Width = 248
      Height = 678
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #1047#1072#1076#1072#1085#1080#1103
        object ListBox1: TListBox
          Left = 0
          Top = 0
          Width = 240
          Height = 647
          Align = alClient
          ItemHeight = 16
          Items.Strings = (
            '1'
            '2')
          TabOrder = 0
          OnClick = ListBox1Click
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1044#1083#1103' '#1091#1095#1080#1090#1077#1083#1103
        ImageIndex = 1
        TabVisible = False
        DesignSize = (
          240
          647)
        object dbCreateBtn: TButton
          Left = 7
          Top = 4
          Width = 227
          Height = 37
          Anchors = [akLeft, akTop, akRight]
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1041#1044
          TabOrder = 0
          OnClick = dbCreateBtnClick
        end
        object doScriptBtn: TButton
          Left = 6
          Top = 114
          Width = 227
          Height = 37
          Anchors = [akLeft, akTop, akRight]
          Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1089#1082#1088#1080#1087#1090' '#1080#1079' '#1092#1072#1081#1083#1072
          Enabled = False
          TabOrder = 1
          OnClick = doScriptBtnClick
        end
        object saveAnswerBtn: TButton
          Left = 7
          Top = 168
          Width = 227
          Height = 37
          Anchors = [akLeft, akTop, akRight]
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1086#1090#1074#1077#1090
          Enabled = False
          TabOrder = 2
          OnClick = saveAnswerBtnClick
        end
        object dbDeleteBtn: TButton
          Left = 8
          Top = 64
          Width = 225
          Height = 33
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1041#1044
          Enabled = False
          TabOrder = 3
          OnClick = dbDeleteBtnClick
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 248
      Height = 56
      Align = alTop
      Caption = '  '#1048#1089#1087#1086#1083#1100#1079#1091#1077#1084#1072#1103' '#1041#1044'  '
      TabOrder = 1
      DesignSize = (
        248
        56)
      object ComboBox1: TComboBox
        Left = 8
        Top = 24
        Width = 233
        Height = 24
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 16
        ItemIndex = 0
        TabOrder = 0
        Text = '-- '#1053#1077' '#1074#1099#1073#1088#1072#1085#1072' --'
        OnChange = ComboBox1Change
        Items.Strings = (
          '-- '#1053#1077' '#1074#1099#1073#1088#1072#1085#1072' --')
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 943
    Height = 736
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 1
      Top = 129
      Width = 941
      Height = 9
      Cursor = crVSplit
      Align = alTop
    end
    object Splitter3: TSplitter
      Left = 1
      Top = 301
      Width = 941
      Height = 9
      Cursor = crVSplit
      Align = alTop
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 941
      Height = 128
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
      TabOrder = 0
      object Panel1: TPanel
        Left = 2
        Top = 57
        Width = 937
        Height = 69
        Align = alClient
        Caption = #1047#1076#1077#1089#1100' '#1073#1091#1076#1077#1090' '#1091#1089#1083#1086#1074#1080#1077
        TabOrder = 0
      end
      object Panel7: TPanel
        Left = 2
        Top = 18
        Width = 937
        Height = 39
        Align = alTop
        TabOrder = 1
        object Label3: TLabel
          Left = 8
          Top = 11
          Width = 119
          Height = 16
          Caption = #1058#1077#1082#1091#1097#1077#1077' '#1079#1072#1076#1072#1085#1080#1077':'
        end
        object Label2: TLabel
          Left = 136
          Top = 9
          Width = 4
          Height = 20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 138
      Width = 941
      Height = 163
      Align = alTop
      Caption = '  SQL '#1082#1086#1076'  '
      TabOrder = 1
      DesignSize = (
        941
        163)
      object Memo1: TMemo
        Left = 2
        Top = 18
        Width = 937
        Height = 143
        Align = alClient
        Enabled = False
        Lines.Strings = (
          'SELECT *'
          'FROM ')
        TabOrder = 0
      end
      object goBtn: TButton
        Left = 796
        Top = 131
        Width = 137
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
        Enabled = False
        TabOrder = 1
        OnClick = goBtnClick
      end
    end
    object GroupBox5: TGroupBox
      Left = 1
      Top = 310
      Width = 941
      Height = 425
      Align = alClient
      Caption = '  '#1056#1077#1079#1091#1083#1100#1090#1072#1090'  '
      TabOrder = 2
      DesignSize = (
        941
        425)
      object Panel3: TPanel
        Left = 2
        Top = 347
        Width = 937
        Height = 76
        Align = alBottom
        Caption = #1047#1076#1077#1089#1100' '#1073#1091#1076#1077#1090' '#1088#1077#1079#1091#1083#1100#1090#1072#1090' '#1087#1088#1086#1074#1077#1088#1082#1080' ('#1042#1077#1088#1085#1086'/'#1053#1077#1042#1077#1088#1085#1086')'
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 18
        Width = 937
        Height = 329
        Align = alClient
        DataSource = DataSource1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Panel2: TPanel
        Left = 792
        Top = 304
        Width = 137
        Height = 33
        Anchors = [akRight, akBottom]
        TabOrder = 2
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 84
          Height = 16
          Caption = #1042#1089#1077#1075#1086' '#1089#1090#1088#1086#1082': '
        end
        object Label4: TLabel
          Left = 96
          Top = 8
          Width = 3
          Height = 16
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = MyQuery1
    Left = 226
    Top = 522
  end
  object OpenDialog1: TOpenDialog
    InitialDir = 'ExtractFilePath(ParamStr(0))'
    Left = 258
    Top = 522
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xml'
    Filter = 'xml|*.xml'
    Left = 296
    Top = 520
  end
  object MyEmbConnection1: TMyEmbConnection
    Options.AllowImplicitConnect = False
    Options.Charset = 'cp1251'
    Params.Strings = (
      '--basedir=.'
      '--datadir=data')
    Username = 'root'
    LoginPrompt = False
    Left = 152
    Top = 520
  end
  object MyQuery1: TMyQuery
    Connection = MyEmbConnection1
    Left = 184
    Top = 520
  end
  object MyScript1: TMyScript
    Connection = MyEmbConnection1
    Left = 152
    Top = 560
  end
  object MyCommand1: TMyCommand
    Connection = MyEmbConnection1
    Left = 184
    Top = 560
  end
  object ActionList1: TActionList
    Left = 185
    Top = 486
    object doScript: TAction
      Caption = 'doScript'
      Enabled = False
      ShortCut = 16397
      OnExecute = goBtnClick
    end
    object showTeacher: TAction
      Caption = 'showTeacher'
      ShortCut = 112
      OnExecute = showTeacherExecute
    end
  end
end
