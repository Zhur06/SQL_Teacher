object Form1: TForm1
  Left = 412
  Top = 237
  Width = 1218
  Height = 775
  Caption = 'SQLTeacher'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 947
    Top = 0
    Width = 5
    Height = 736
    Align = alRight
  end
  object Panel4: TPanel
    Left = 952
    Top = 0
    Width = 250
    Height = 736
    Align = alRight
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
        TabVisible = False
        DesignSize = (
          240
          668)
        object ListBox1: TListBox
          Left = 0
          Top = 0
          Width = 240
          Height = 668
          Align = alClient
          ItemHeight = 16
          TabOrder = 0
          OnClick = ListBox1Click
        end
        object settingsBtn: TButton
          Left = 8
          Top = 637
          Width = 225
          Height = 25
          Anchors = [akLeft, akRight, akBottom]
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
          TabOrder = 1
          OnClick = settingsBtnClick
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1044#1083#1103' '#1091#1095#1080#1090#1077#1083#1103
        ImageIndex = 1
        TabVisible = False
        DesignSize = (
          240
          668)
        object dbCreateBtn: TButton
          Left = 8
          Top = 5
          Width = 222
          Height = 37
          Anchors = [akLeft, akRight]
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1041#1044
          TabOrder = 0
          OnClick = dbCreateBtnClick
        end
        object doScriptBtn: TButton
          Left = 8
          Top = 118
          Width = 222
          Height = 37
          Anchors = [akLeft, akRight]
          Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1089#1082#1088#1080#1087#1090' '#1080#1079' '#1092#1072#1081#1083#1072
          Enabled = False
          TabOrder = 1
          OnClick = doScriptBtnClick
        end
        object saveAnswerBtn: TButton
          Left = 8
          Top = 174
          Width = 222
          Height = 37
          Anchors = [akLeft, akRight]
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1086#1090#1074#1077#1090
          Enabled = False
          TabOrder = 2
          OnClick = saveAnswerBtnClick
        end
        object dbDeleteBtn: TButton
          Left = 8
          Top = 67
          Width = 222
          Height = 37
          Anchors = [akLeft, akRight]
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
    Width = 947
    Height = 736
    Align = alClient
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 1
      Top = 129
      Width = 945
      Height = 5
      Cursor = crVSplit
      Align = alTop
    end
    object Splitter3: TSplitter
      Left = 1
      Top = 297
      Width = 945
      Height = 5
      Cursor = crVSplit
      Align = alTop
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 945
      Height = 128
      Align = alTop
      BiDiMode = bdLeftToRight
      Caption = '  '#1059#1089#1083#1086#1074#1080#1077'  '
      ParentBiDiMode = False
      TabOrder = 0
      object taskLabel: TLabel
        Left = 6
        Top = 62
        Width = 937
        Height = 64
        Align = alClient
        Caption = #1047#1076#1077#1089#1100' '#1073#1091#1076#1077#1090' '#1079#1072#1076#1072#1085#1080#1077
      end
      object Splitter4: TSplitter
        Left = 2
        Top = 57
        Width = 941
        Height = 5
        Cursor = crVSplit
        Align = alTop
      end
      object Label5: TLabel
        Left = 2
        Top = 62
        Width = 4
        Height = 64
        Align = alLeft
        AutoSize = False
      end
      object Panel7: TPanel
        Left = 2
        Top = 18
        Width = 941
        Height = 39
        Align = alTop
        TabOrder = 0
        object Label3: TLabel
          Left = 8
          Top = 11
          Width = 119
          Height = 16
          Caption = #1058#1077#1082#1091#1097#1077#1077' '#1079#1072#1076#1072#1085#1080#1077':'
        end
        object Label2: TLabel
          Left = 136
          Top = 11
          Width = 3
          Height = 16
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 134
      Width = 945
      Height = 163
      Align = alTop
      Caption = '  SQL '#1082#1086#1076'  '
      TabOrder = 1
      object Splitter5: TSplitter
        Left = 779
        Top = 18
        Width = 5
        Height = 143
        Align = alRight
      end
      object Panel1: TPanel
        Left = 2
        Top = 18
        Width = 777
        Height = 143
        Align = alClient
        TabOrder = 0
        DesignSize = (
          777
          143)
        object RichEdit1: TRichEdit
          Left = 1
          Top = 1
          Width = 775
          Height = 141
          Align = alClient
          Enabled = False
          TabOrder = 0
          OnChange = RichEdit1Change
        end
        object goBtn: TButton
          Left = 648
          Top = 110
          Width = 137
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
          Enabled = False
          TabOrder = 1
          OnClick = goBtnClick
        end
      end
      object GroupBox4: TGroupBox
        Left = 784
        Top = 18
        Width = 159
        Height = 143
        Align = alRight
        Caption = '  '#1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1058#1072#1073#1083#1080#1094#1099'  '
        TabOrder = 1
        object DBGrid2: TDBGrid
          Left = 2
          Top = 18
          Width = 155
          Height = 123
          Align = alClient
          DataSource = DataSource2
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
    object GroupBox5: TGroupBox
      Left = 1
      Top = 302
      Width = 945
      Height = 433
      Align = alClient
      Caption = '  '#1056#1077#1079#1091#1083#1100#1090#1072#1090'  '
      TabOrder = 2
      object matchPanel: TPanel
        Left = 2
        Top = 355
        Width = 941
        Height = 76
        Align = alBottom
        Caption = #1047#1076#1077#1089#1100' '#1073#1091#1076#1077#1090' '#1088#1077#1079#1091#1083#1100#1090#1072#1090' '#1087#1088#1086#1074#1077#1088#1082#1080' ('#1042#1077#1088#1085#1086'/'#1053#1077#1042#1077#1088#1085#1086')'
        TabOrder = 0
        DesignSize = (
          941
          76)
        object checkBtn: TButton
          Left = 4
          Top = 4
          Width = 137
          Height = 25
          Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100
          Enabled = False
          TabOrder = 0
          OnClick = checkBtnClick
        end
        object Panel2: TPanel
          Left = 800
          Top = 4
          Width = 137
          Height = 27
          Anchors = [akTop, akRight]
          TabOrder = 1
          object Label1: TLabel
            Left = 8
            Top = 4
            Width = 84
            Height = 16
            Caption = #1042#1089#1077#1075#1086' '#1089#1090#1088#1086#1082': '
          end
          object Label4: TLabel
            Left = 96
            Top = 4
            Width = 7
            Height = 16
            Caption = '0'
          end
        end
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 18
        Width = 941
        Height = 337
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
    object trueAnsw: TAction
      Caption = 'trueAnsw'
      ShortCut = 16468
      OnExecute = trueAnswExecute
    end
  end
  object DataSource2: TDataSource
    DataSet = MyQuery2
    Left = 657
    Top = 534
  end
  object MyQuery2: TMyQuery
    Connection = MyEmbConnection1
    Left = 697
    Top = 534
  end
end
