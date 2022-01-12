object Form4: TForm4
  Left = 591
  Top = 307
  Width = 278
  Height = 268
  Caption = #1042#1093#1086#1076
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  OnActivate = FormActivate
  DesignSize = (
    262
    229)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 7
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  object Label2: TLabel
    Left = 7
    Top = 33
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object userName: TEdit
    Left = 65
    Top = 7
    Width = 188
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object userPassword: TEdit
    Left = 65
    Top = 33
    Width = 188
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object Button1: TButton
    Left = 7
    Top = 199
    Width = 246
    Height = 20
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Sign  in / up'
    TabOrder = 2
    OnClick = Button1Click
  end
end
