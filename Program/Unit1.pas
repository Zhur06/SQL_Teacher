unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBTables, Grids, DBGrids, MemDS,
  DBAccess, MyAccess, MyEmbConnection;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Memo1: TMemo;
    goBtn: TButton;
    GroupBox5: TGroupBox;
    Panel3: TPanel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    doScriptBtn: TButton;
    OpenDialog1: TOpenDialog;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    Splitter5: TSplitter;
    ComboBox1: TComboBox;
    dbCreateBtn: TButton;
    Label2: TLabel;
    dbName: TEdit;
    GroupBox7: TGroupBox;
    Label3: TLabel;
    Panel2: TPanel;
    saveAnswerBtn: TButton;
    SaveDialog1: TSaveDialog;
    MyEmbConnection1: TMyEmbConnection;
    MyQuery1: TMyQuery;
    procedure FormCreate(Sender: TObject);
    procedure goBtnClick(Sender: TObject);
    procedure doScriptBtnClick(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure Splitter2Moved(Sender: TObject);
    procedure Splitter3Moved(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure dbCreateBtnClick(Sender: TObject);
    procedure saveAnswerBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

Uses IniFiles;

procedure btnPositioning();
begin
  Form1.goBtn.Left := Form1.GroupBox3.Width - Form1.goBtn.Width - 5;
  Form1.goBtn.Top := Form1.GroupBox3.Height - Form1.goBtn.Height - 5;

  Form1.doScriptBtn.Top := Form1.GroupBox1.Height - Form1.doScriptBtn.Height - 5;

  Form1.ComboBox1.Width := Form1.GroupBox6.Width - Form1.ComboBox1.Left - 5;

  Form1.saveAnswerBtn.Left := Form1.GroupBox7.Width - Form1.saveAnswerBtn.Width - 5;
end;

procedure TForm1.FormCreate(Sender: TObject);
var Ini: Tinifile; i: integer;
begin
  btnPositioning;

  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\1.ini');
  For i := 1 to Ini.ReadInteger('ComboBox', 'MaxValue', 1) do
  ComboBox1.AddItem(Ini.ReadString('ComboBox', IntToStr(i), ''), Self);
end;

procedure TForm1.goBtnClick(Sender: TObject);
begin
with MyQuery1 do
begin
  Close;
  SQL.Text := Memo1.Text;
  Open;
end;
end;

procedure TForm1.doScriptBtnClick(Sender: TObject);
begin
if OpenDialog1.Execute then
begin
  MyQuery1.Close;
  MyQuery1.SQL.LoadFromFile(OpenDialog1.FileName);
  MyQuery1.Open;
end;
end;

procedure TForm1.Splitter1Moved(Sender: TObject);
begin
  btnPositioning;
end;

procedure TForm1.Splitter2Moved(Sender: TObject);
begin
  btnPositioning;
end;

procedure TForm1.Splitter3Moved(Sender: TObject);
begin
  btnPositioning;
end;

procedure TForm1.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  btnPositioning;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  MyQuery1.Close;
  MyQuery1.SQL.Text := 'USE ' + ComboBox1.Text;
  MyQuery1.Open;
end;

procedure TForm1.dbCreateBtnClick(Sender: TObject);
var Ini: Tinifile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\1.ini');
  Ini.WriteInteger('ComboBox', 'MaxValue', Ini.ReadInteger('ComboBox','MaxValue',0) + 1);
  Ini.WriteString('ComboBox', IntToStr(Ini.ReadInteger('ComboBox','MaxValue',0)), dbName.Text);
  ComboBox1.AddItem(dbName.Text, Self);
  Ini.Free; 

if OpenDialog1.Execute then
begin
  MyQuery1.Close;
  MyQuery1.SQL.LoadFromFile(OpenDialog1.FileName);
  MyQuery1.Open;
end;
end;

procedure TForm1.saveAnswerBtnClick(Sender: TObject);
begin
if SaveDialog1.Execute then
  MyQuery1.SaveToXML(SaveDialog1.FileName);
end;

end.
