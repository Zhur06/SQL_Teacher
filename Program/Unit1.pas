unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBTables, Grids, DBGrids, MemDS,
  DBAccess, MyAccess, MyEmbConnection, DAScript, MyScript, ComCtrls,
  ActnList;

type
  Arr = array of string;

  TForm1 = class(TForm)
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    goBtn: TButton;
    GroupBox5: TGroupBox;
    matchPanel: TPanel;
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
    taskLabel: TLabel;
    Splitter4: TSplitter;
    checkBtn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure goBtnClick(Sender: TObject);
    procedure doScriptBtnClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure dbCreateBtnClick(Sender: TObject);
    procedure saveAnswerBtnClick(Sender: TObject);
    procedure dbDeleteBtnClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure showTeacherExecute(Sender: TObject);
    function Find(cDir, FileName: string): Arr;
    procedure checkBtnClick(Sender: TObject);
    procedure fillTaskList;
    procedure CryptFile(key, file_name: string);
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

//----------------- Шифровка файла ---------------------------------------------

procedure TForm1.CryptFile(key, file_name: string);
var
  longkey, res: string;
  i : integer;
  toto, c : char;   
  F : TextFile;   
begin
  AssignFile(F, file_name);
  Reset(F);

  text := '';
  While not EOF(F) do
  begin
    Read(F, c);
    text := text + c;
  end;

  CloseFile(F);

  for i := 0 to (length(text) div length(key)) do  
    longkey := longkey + key;
    
  for i := 1 to length(text) do  
  begin
    toto := chr(ord(text[i]) xor ord(longkey[i]));   
    res := res + toto;
  end;   

  AssignFile(F, file_name);
  Rewrite(F);
  Write(F, res);
  CloseFile(F);

end;

//----------------- Заполнение списка заданий ----------------------------------

procedure TForm1.fillTaskList();
var ii: integer; A: Arr;
begin
  A := Find(ExtractFilePath(ParamStr(0)) + '\teachers', '*.txt');
  for ii := 0 to length(A) - 1 do
    ListBox1.Items.Add(A[ii]);
end;

//----------------- Действия по созданию формы ---------------------------------

procedure TForm1.FormCreate(Sender: TObject);
var Ini: Tinifile; i: integer;
begin

  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\1.ini');
  For i := 1 to Ini.ReadInteger('ComboBox', 'MaxValue', 1) do
    ComboBox1.AddItem(Ini.ReadString('ComboBox', IntToStr(i), ''), Self);
  Ini.Free;

  Form1.Left:= (Screen.WorkAreaWidth - Form1.Width) div 2;
  Form1.Top:= (Screen.WorkAreaHeight - Form1.Height) div 2;

  fillTaskList;
end;

//----------------- Выполнение команды -----------------------------------------

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

//----------------- Выполнение скрипта из файла --------------------------------

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

//----------------- Изменение БД -----------------------------------------------

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  MyEmbConnection1.Connected := false;
  goBtn.Enabled := false;
  Memo1.Enabled := false;
  doScriptBtn.Enabled := false;
  dbDeleteBtn.Enabled := false;
  saveAnswerBtn.Enabled := false;
  doScript.Enabled := false;
  checkBtn.Enabled := false;

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
      checkBtn.Enabled := true;
    except
      MyEmbConnection1.Connected := false;
      ComboBox1.DeleteSelected;
      ComboBox1.ItemIndex := 0;
    end;
  end;
end;

//----------------- Создание БД ------------------------------------------------

procedure TForm1.dbCreateBtnClick(Sender: TObject);
begin
  Form2 := TForm2.Create(Self);
  Form2.Show;
end;

//----------------- Сохранение ответа ------------------------------------------

procedure TForm1.saveAnswerBtnClick(Sender: TObject);
begin
  SaveDialog1.InitialDir := ExtractFilePath(ParamStr(0));
if SaveDialog1.Execute then
  MyQuery1.SaveToXML(SaveDialog1.FileName);
  CryptFile('№', SaveDialog1.FileName);
end;

//----------------- Удаление БД ------------------------------------------------

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

//----------------- Выбор задания ----------------------------------------------

procedure TForm1.ListBox1Click(Sender: TObject);
var F: file of char; c: char;
begin
  Label2.Caption := ListBox1.Items[ListBox1.ItemIndex];

  AssignFile(F, ExtractFilePath(ParamStr(0)) + '\teachers\' + ListBox1.Items[ListBox1.ItemIndex] + '.txt');

  Reset(F);

  taskLabel.Caption := '';

  While not EOF(F) do
  begin
    Read(F, c);
    taskLabel.Caption := taskLabel.Caption + c;
  end;

  CloseFile(F);

  matchPanel.Caption := 'Здесь будет результат проверки (Верно/НеВерно)';
end;

//----------------- Разблокирование вкладки для учителя ------------------------

procedure TForm1.showTeacherExecute(Sender: TObject);
begin
  TabSheet2.TabVisible := not TabSheet2.TabVisible;
end;

//----------------- Вывод названий всех файлов заданного расширения в указ. директории

function TForm1.Find(cDir, FileName: string): Arr;
var
  SearchRec: TSearchRec; // информация о каталоге
  n: LongInt;
  iii: integer;
  A: arr;
begin
 
  n := 0;
  ChDir(cDir); // войти в каталог
try
  if FindFirst(FileName, faArchive, SearchRec) = 0 then
  repeat
    if (SearchRec.Attr and faAnyFile) = SearchRec.Attr then
    begin
      SetLength(a, Length(a) + 1);
      a[n] := (SearchRec.Name);
      n := n + 1;
    end;
  until FindNext(SearchRec) <> 0;
except end;

  SetLength(result, Length(A));

  For n := 0 to Length(A) - 1 do
    For iii := 1 to Length(A[n]) do
      if not (A[n][iii] = '.') then
        result[n] := result[n] + A[n][iii]
      else
        BREAK;

  ChDir(ExtractFilePath(ParamStr(0)));
end;

//----------------- Проверка задания -------------------------------------------

procedure TForm1.checkBtnClick(Sender: TObject);
var F: file of char; c: char; answ, resul: string;
begin
  MyQuery1.SaveToXML('YourResult.xml');

  try
  CryptFile('№', ExtractFilePath(ParamStr(0)) + '\teachers\' + ListBox1.Items[ListBox1.ItemIndex] + '.xml');

  AssignFile(F, ExtractFilePath(ParamStr(0)) + '\teachers\' + ListBox1.Items[ListBox1.ItemIndex] + '.xml');

  Reset(F);

  answ := '';

  While not EOF(F) do
  begin
    Read(F, c);
    answ := answ + c;
  end;

  CloseFile(F);



  AssignFile(F, 'YourResult.xml');

  Reset(F);

  resul := '';

  While not EOF(F) do
  begin
    Read(F, c);
    resul := resul + c;
  end;

  CloseFile(F);

  if answ = resul then
  begin
    matchPanel.Caption := 'Задача решена верно';
  end
  else
  begin
    matchPanel.Caption := 'Задача решена неверно';
  end;

  DeleteFile('YourResult.xml');

  except
    ShowMessage('Ответа на это задание еще нет');
  end;

  CryptFile('№', ExtractFilePath(ParamStr(0)) + '\teachers\' + ListBox1.Items[ListBox1.ItemIndex] + '.xml');
end;
end.
