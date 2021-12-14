unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBTables, Grids, DBGrids, MemDS,
  DBAccess, MyAccess, MyEmbConnection, DAScript, MyScript, ComCtrls;

type
  TForm1 = class(TForm)
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
    dbCreateBtn: TButton;
    Label3: TLabel;
    saveAnswerBtn: TButton;
    SaveDialog1: TSaveDialog;
    MyEmbConnection1: TMyEmbConnection;
    MyQuery1: TMyQuery;
    MyScript1: TMyScript;
    MyCommand1: TMyCommand;
    Panel4: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    Panel7: TPanel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure goBtnClick(Sender: TObject);
    procedure doScriptBtnClick(Sender: TObject);
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

Uses IniFiles, Unit2;

procedure TForm1.FormCreate(Sender: TObject);
var Ini: Tinifile; i: integer;
begin
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
  MyScript1.SQL.LoadFromFile(OpenDialog1.FileName);
  MyScript1.Execute;
end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  MyEmbConnection1.Connected := false;
  goBtn.Enabled := false;
  Memo1.Enabled := false;

  If not ((ComboBox1.Text[1] = '-') and (ComboBox1.Text[2] = '-')) then
  begin
    try
      MyEmbConnection1.Database := ComboBox1.Text;
      MyEmbConnection1.Connected := true;
      goBtn.Enabled := true;
      Memo1.Enabled := true;
    except
      MyEmbConnection1.Connected := false;
      ComboBox1.DeleteSelected;
      ComboBox1.ItemIndex := 0;
    end;
  end;
end;

procedure TForm1.dbCreateBtnClick(Sender: TObject);
begin
  Form2 := TForm2.Create(Self);
  Form2.Show;
end;

procedure TForm1.saveAnswerBtnClick(Sender: TObject);
begin
if SaveDialog1.Execute then
  MyQuery1.SaveToXML(SaveDialog1.FileName);
end;

end.
