unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    changeMainFontBtn: TButton;
    Label2: TLabel;
    changeSecondFontBtn: TButton;
    Label3: TLabel;
    Edit1: TEdit;
    changeMemoColorBtn: TButton;
    Label4: TLabel;
    changeThemeColorBtn: TButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    procedure changeMainFontBtnClick(Sender: TObject);
    procedure changeSecondFontBtnClick(Sender: TObject);
    procedure changeMemoColorBtnClick(Sender: TObject);
    procedure changeThemeColorBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

Uses IniFiles, Unit1;

procedure TForm3.changeMainFontBtnClick(Sender: TObject);
var Ini : TIniFile;
begin
  If FontDialog1.Execute then
  with FontDialog1 do
  begin
    Form1.Font := Font;

    Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\settings.ini');

    Form3.Font := Font;

    Ini.WriteString('Font', 'Name', Font.Name);
    Ini.WriteInteger('Font', 'Size', Font.Size);
    Ini.WriteInteger('Font', 'Charset', Font.Charset);
    Ini.WriteInteger('Font', 'Color', Font.Color);
    Ini.Free;
  end;

end;

procedure TForm3.changeSecondFontBtnClick(Sender: TObject);
var Ini : TIniFile;
begin
  If FontDialog1.Execute then
  with FontDialog1 do
  begin
    Form1.keyFont := Font;

    Label2.Font := Font;

    Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\settings.ini');
    Ini.WriteString('keyFont', 'Name', Font.Name);
    Ini.WriteInteger('keyFont', 'Size', Font.Size);
    Ini.WriteInteger('keyFont', 'Charset', Font.Charset);
    Ini.WriteInteger('keyFont', 'Color', Font.Color);
    Ini.Free;
  end;

end;

procedure TForm3.changeMemoColorBtnClick(Sender: TObject);
var Ini : TIniFile;
begin
  if ColorDialog1.Execute then
  begin
    Form1.RichEdit1.Color := ColorDialog1.Color;
    Form1.ListBox1.Color := ColorDialog1.Color;
    Form1.DBGrid1.Color := ColorDialog1.Color;
    Form1.ComboBox1.Color := ColorDialog1.Color;

    Edit1.Color := ColorDialog1.Color;

    Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\settings.ini');
    Ini.WriteInteger('Colors', 'Memos', ColorDialog1.Color);
    Ini.Free;
  end;
end;

procedure TForm3.changeThemeColorBtnClick(Sender: TObject);
var Ini : TIniFile;
begin
  if ColorDialog1.Execute then
  with ColorDialog1 do
  begin
    Form1.Color := Color;
    Form1.Panel4.Color := Color;
    Form1.GroupBox1.Color := Color;
    Form1.Panel5.Color := Color;
    Form1.GroupBox2.Color := Color;
    Form1.Label5.Color := Color;
    Form1.Panel7.Color := Color;
    Form1.Label3.Color := Color;
    Form1.Label2.Color := Color;
    Form1.Splitter1.Color := Color;
    Form1.Splitter2.Color := Color;
    Form1.Splitter3.Color := Color;
    Form1.Splitter4.Color := Color;
    Form1.taskLabel.Color := Color;
    Form1.GroupBox3.Color := Color;
    Form1.matchPanel.Color := Color;
    Form1.Panel2.Color := Color;
    Form1.Label1.Color := Color;
    Form1.Label4.Color := Color;

    Form3.Color := Color;
    GroupBox1.Color := Color;
    GroupBox2.Color := Color;

    Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\settings.ini');
    Ini.WriteInteger('Colors', 'Panels', ColorDialog1.Color);
    Ini.Free;
  end;
end;

procedure TForm3.FormActivate(Sender: TObject);
var Ini1: TIniFile;
begin
  Form3.Left:= (Screen.WorkAreaWidth - Form3.Width) div 2;
  Form3.Top:= (Screen.WorkAreaHeight - Form3.Height) div 2;
  Ini1 := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\settings.ini');
  Form3.Color := Ini1.ReadInteger('Colors', 'Panels', Form3.Color);
  Form3.Edit1.Color := Ini1.ReadInteger('Colors', 'Memos', Form3.Edit1.Color);
  Form3.Font.Name := Ini1.ReadString('Font', 'Name', Form3.Font.Name);
  Form3.Font.Size := Ini1.ReadInteger('Font', 'Name', Form3.Font.Size);
  Form3.Font.Charset := Ini1.ReadInteger('Font', 'Charset', Form3.Font.Charset);
  Form3.Font.Color := Ini1.ReadInteger('Font', 'Color', Form3.Font.Color);

  Form3.Label2.Font.Name := Ini1.ReadString('keyFont', 'Name', Form3.Font.Name);
  Form3.Label2.Font.Size := Ini1.ReadInteger('keyFont', 'Name', Form3.Font.Size);
  Form3.Label2.Font.Charset := Ini1.ReadInteger('keyFont', 'Charset', Form3.Font.Charset);
  Form3.Label2.Font.Color := Ini1.ReadInteger('keyFont', 'Color', Form3.Font.Color);
  Ini1.Free;
end;

end.
