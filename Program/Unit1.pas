unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBTables, Grids, DBGrids, MemDS,
  DBAccess, MyAccess, MyEmbConnection, DAScript, MyScript, ComCtrls,
  ActnList;

type
  TForm1 = class(TForm)
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
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
    dbDeleteBtn: TButton;
    ListBox1: TListBox;
    ActionList1: TActionList;
    doScript: TAction;
    showTeacher: TAction;
    Panel2: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure goBtnClick(Sender: TObject);
    procedure doScriptBtnClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure dbCreateBtnClick(Sender: TObject);
    procedure saveAnswerBtnClick(Sender: TObject);
    procedure dbDeleteBtnClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure showTeacherExecute(Sender: TObject);
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
  Ini.Free;

  Form1.Left:= (Screen.WorkAreaWidth - Form1.Width) div 2;
  Form1.Top:= (Screen.WorkAreaHeight - Form1.Height) div 2;
end;

procedure TForm1.goBtnClick(Sender: TObject);
begin
with MyQuery1 do
begin
  Close;
  SQL.Text := Memo1.Text;
  Open;
end;
  Label4.Caption := IntToStr(MyQuery1.RecordCount);
end;

procedure TForm1.doScriptBtnClick(Sender: TObject);
var F: file of char; c: char;
begin
  OpenDialog1.InitialDir := ExtractFilePath(ParamStr(0));
if OpenDialog1.Execute then
begin
  MyQuery1.Close;
  MyQuery1.SQL.LoadFromFile(OpenDialog1.FileName);
  MyQuery1.Open;

  AssignFile(F, OpenDialog1.FileName);
  Reset(F);

  Memo1.Text := '';

  While not EOF(F) do
  begin
    Read(F, c);
    Memo1.Text := Memo1.Text + c;
  end;

  CloseFile(F);
end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  MyEmbConnection1.Connected := false;
  goBtn.Enabled := false;
  Memo1.Enabled := false;
  doScriptBtn.Enabled := false;
  dbDeleteBtn.Enabled := false;
  saveAnswerBtn.Enabled := false;
  doScript.Enabled := false;

  If not ((ComboBox1.Text[1] = '-') and (ComboBox1.Text[2] = '-')) then
  begin
    try
      MyEmbConnection1.Database := ComboBox1.Text;
      MyEmbConnection1.Connected := true;
      goBtn.Enabled := true;
      Memo1.Enabled := true;
      doScriptBtn.Enabled := true;
      dbDeleteBtn.Enabled := true;
      saveAnswerBtn.Enabled := true;
      doScript.Enabled := true;
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
  SaveDialog1.InitialDir := ExtractFilePath(ParamStr(0));
if SaveDialog1.Execute then
  MyQuery1.SaveToXML(SaveDialog1.FileName);
end;

procedure TForm1.dbDeleteBtnClick(Sender: TObject);
var Ini: Tinifile; i, elIndx: integer;
begin
  if MyEmbConnection1.Connected = true then
  begin
    MyScript1.SQL.Text := 'DROP DATABASE ' + ComboBox1.Items[ComboBox1.ItemIndex];
    MyScript1.Execute;

    elIndx := ComboBox1.ItemIndex;
    ComboBox1.DeleteSelected;
    ComboBox1.ItemIndex := 0;

    Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\1.ini');
    For i := elIndx to Ini.ReadInteger('ComboBox', 'MaxValue', 1) do
      Ini.WriteString('ComboBox', IntToStr(i), Ini.ReadString('ComboBox', intToStr(i + 1), ''));
  end;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  Label2.Caption := ListBox1.Items[ListBox1.ItemIndex];
end;

procedure TForm1.showTeacherExecute(Sender: TObject);
begin
  TabSheet2.TabVisible := not TabSheet2.TabVisible;
end;

end.
