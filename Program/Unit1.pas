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
    Label5: TLabel;
    RichEdit1: TRichEdit;
    settingsBtn: TButton;
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
    procedure CryptFile(file_name: string; key: char);
    procedure doCustomizationSettings();
    procedure glowKeyWords(keyWord: string; resFont, normalFont: TFont);
    procedure RichEdit1Change(Sender: TObject);
    procedure settingsBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    keyFont: TFont;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

Uses IniFiles, Unit2, Unit3;

//----------------- ��������� �������� ���� ------------------------------------

Procedure TForm1.glowKeyWords(keyWord: string; resFont, normalFont: TFont);
var
  iill, newLines, pos: integer;
  s: string;
begin
  newLines := 0;
  For iill := 1 to length(RichEdit1.Text) do
  begin
    if AnsiLowerCase(RichEdit1.Text[iill]) = AnsiLowerCase(keyWord[1]) then
    begin
      s := Copy(RichEdit1.Text, iill, length(keyWord));

      if AnsiLowerCase(s) = AnsiLowerCase(keyWord) then
      with RichEdit1 do
      begin
        pos := SelStart;

        SelStart := iill - 1;
        SelLength := length(s);
        with SelAttributes do
        begin
          Color := resFont.Color;
          Charset := resFont.Charset;
          Name := resFont.Name;
          Pitch := resFont.Pitch;
          Style := resFont.Style;
          Size := resFont.Size
        end;

        SelStart := pos;
        SelLength := 0;

        with SelAttributes do
        begin
          Color := normalFont.Color;
          Charset := normalFont.Charset;
          Name := normalFont.Name;
          Pitch := normalFont.Pitch;
          Style := normalFont.Style;
          Size := normalFont.Size
        end;
      end;
    end;

    if RichEdit1.Text[iill] = #10 then
      newLines := newLines + 1;
  end;
end;

//----------------- �������� ����� ---------------------------------------------

procedure TForm1.CryptFile(file_name: string; key: char);
var
  res: string;
  c : char;
  F : TextFile;
begin
  AssignFile(F, file_name);
  Reset(F);

  text := '';
  While not EOF(F) do
  begin
    Read(F, c);
    c := chr(ord(c) xor ord(key));
    res := res + c;
  end;

  CloseFile(F);

  AssignFile(F, file_name);
  Rewrite(F);
  Write(F, res);
  CloseFile(F);

end;

//----------------- ���������� ������ ������� ----------------------------------

procedure TForm1.fillTaskList();
var ii: integer; A: Arr;
begin
  A := Find(ExtractFilePath(ParamStr(0)) + '\teachers', '*.txt');
  for ii := 0 to length(A) - 1 do
    ListBox1.Items.Add(A[ii]);
end;

//----------------- �������� �� �������� ����� ---------------------------------

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
  doCustomizationSettings;
end;

//----------------- ���������� ������� -----------------------------------------

procedure TForm1.goBtnClick(Sender: TObject);
begin
with MyQuery1 do
begin
  Close;
  SQL.Text := RichEdit1.Text;
  Open;
end;
  Label4.Caption := IntToStr(MyQuery1.RecordCount);
end;

//----------------- ���������� ������� �� ����� --------------------------------

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

  RichEdit1.Text := '';

  While not EOF(F) do
  begin
    Read(F, c);
    RichEdit1.Text := RichEdit1.Text + c;
  end;

  CloseFile(F);
end;
end;

//----------------- ��������� �� -----------------------------------------------

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  MyEmbConnection1.Connected := false;
  goBtn.Enabled := false;
  RichEdit1.Enabled := false;
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
      RichEdit1.Enabled := true;
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

//----------------- �������� �� ------------------------------------------------

procedure TForm1.dbCreateBtnClick(Sender: TObject);
begin
  Form2 := TForm2.Create(Self);
  Form2.Show;
end;

//----------------- ���������� ������ ------------------------------------------

procedure TForm1.saveAnswerBtnClick(Sender: TObject);
begin
  SaveDialog1.InitialDir := ExtractFilePath(ParamStr(0));
if SaveDialog1.Execute then
  MyQuery1.SaveToXML(SaveDialog1.FileName);
  CryptFile(SaveDialog1.FileName, '�');
end;

//----------------- �������� �� ------------------------------------------------

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
    Ini.Free;
  end;
end;

//----------------- ����� ������� ----------------------------------------------

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

  matchPanel.Caption := '����� ����� ��������� �������� (�����/�������)';
end;

//----------------- ��������������� ������� ��� ������� ------------------------

procedure TForm1.showTeacherExecute(Sender: TObject);
begin
  TabSheet2.TabVisible := not TabSheet2.TabVisible;
end;

//----------------- ����� �������� ���� ������ ��������� ���������� � ����. ����������

function TForm1.Find(cDir, FileName: string): Arr;
var
  SearchRec: TSearchRec; // ���������� � ��������
  n: LongInt;
  iii: integer;
  A: arr;
begin

  n := 0;
  ChDir(cDir); // ����� � �������
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

//----------------- �������� ������� -------------------------------------------

procedure TForm1.checkBtnClick(Sender: TObject);
var F: file of char; c: char; answ, resul: string;
begin
  MyQuery1.SaveToXML('YourResult.xml');

  try
  CryptFile(ExtractFilePath(ParamStr(0)) + '\teachers\' + ListBox1.Items[ListBox1.ItemIndex] + '.xml', '�');

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
    matchPanel.Caption := '������ ������ �����';
  end
  else
  begin
    matchPanel.Caption := '������ ������ �������';
  end;

  DeleteFile('YourResult.xml');

  CryptFile(ExtractFilePath(ParamStr(0)) + '\teachers\' + ListBox1.Items[ListBox1.ItemIndex] + '.xml', '�');

  except
    ShowMessage('������ �� ��� ������� ��� ���');
  end;
end;

//----------------- ���������� ���������������� �������� -----------------------

procedure TForm1.doCustomizationSettings;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\settings.ini');

  Form1.Font.Name := Ini.ReadString('Font', 'Name', Form1.Font.Name);
  Form1.Font.Size := Ini.ReadInteger('Font', 'Size', Form1.Font.Size);
  Form1.Font.Charset := Ini.ReadInteger('Font', 'Charset', Form1.Font.Charset);
  Form1.Font.Color := Ini.ReadInteger('Font', 'Color', Form1.Font.Color);

  keyFont := TFont.Create;
  keyFont.Assign(RichEdit1.Font);

  keyFont.Name := Ini.ReadString('Font', 'Name', Form1.Font.Name);
  keyFont.Size := Ini.ReadInteger('Font', 'Size', Form1.Font.Size);
  keyFont.Charset := Ini.ReadInteger('Font', 'Charset', Form1.Font.Charset);
  keyFont.Color := Ini.ReadInteger('Font', 'Color', Form1.Font.Color);

  Panel2.Width := Canvas.TextWidth('����� �����: 999') + 16;
  Panel2.Height := Canvas.TextHeight('����� �����: 999') + 8;
  goBtn.Width := Panel2.Width;
  goBtn.Height := Panel2.Height;
  checkBtn.Width := Panel2.Width;
  checkBtn.Height := Panel2.Height;
  Label4.Left := Label1.Left + Label1.Width + 2;
  Label2.Left := Label3.Left + Label3.Width + 2;

  dbCreateBtn.Height := Panel2.Height;
  doScriptBtn.Height := Panel2.Height;
  saveAnswerBtn.Height := Panel2.Height;
  dbDeleteBtn.Height := Panel2.Height;
  settingsBtn.Height := Panel2.Height;

  dbDeleteBtn.Top := 4 + (Panel2.Height + 8);
  doScriptBtn.Top := 4 + (Panel2.Height + 8) * 2;
  saveAnswerBtn.Top  := 4 + (Panel2.Height + 8) * 3;

  RichEdit1.Color := Ini.ReadInteger('Colors', 'Memos', clWindow);
  ListBox1.Color := Ini.ReadInteger('Colors', 'Memos', clWindow);
  DBGrid1.Color := Ini.ReadInteger('Colors', 'Memos', clWindow);
  ComboBox1.Color := Ini.ReadInteger('Colors', 'Memos', clWindow);

  Form1.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);
  Panel4.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);
  GroupBox1.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);
  Panel5.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);
  GroupBox2.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);
  Label5.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);
  Panel7.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);
  Label3.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);
  Label2.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);;
  Splitter1.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);
  Splitter2.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);
  Splitter3.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);
  Splitter4.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);
  taskLabel.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);
  GroupBox3.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);
  matchPanel.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);
  Panel2.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);
  Label1.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);
  Label4.Color := Ini.ReadInteger('Colors', 'Panels', clBtnFace);

  Ini.Free;
end;

procedure TForm1.RichEdit1Change(Sender: TObject);
begin
  glowKeyWords('SELECT', keyFont, RichEdit1.Font);
  glowKeyWords('FROM', keyFont, RichEdit1.Font);
  glowKeyWords('WHERE', keyFont, RichEdit1.Font);
  glowKeyWords('GROUP BY', keyFont, RichEdit1.Font);
  glowKeyWords('HAVING', keyFont, RichEdit1.Font);
  glowKeyWords('ORDER BY', keyFont, RichEdit1.Font);
  glowKeyWords('LIMIT', keyFont, RichEdit1.Font);
  glowKeyWords('IF', keyFont, RichEdit1.Font);
  glowKeyWords('THEN', keyFont, RichEdit1.Font);
  glowKeyWords('ELSE', keyFont, RichEdit1.Font);
  glowKeyWords('NOT', keyFont, RichEdit1.Font);
  glowKeyWords('OR', keyFont, RichEdit1.Font);
  glowKeyWords('AND', keyFont, RichEdit1.Font);
  glowKeyWords('DISTINCT', keyFont, RichEdit1.Font);
  glowKeyWords('ALL', keyFont, RichEdit1.Font);
  glowKeyWords('AS', keyFont, RichEdit1.Font);
  glowKeyWords('INNER', keyFont, RichEdit1.Font);
  glowKeyWords('LEFT', keyFont, RichEdit1.Font);
  glowKeyWords('RIGHT', keyFont, RichEdit1.Font);
  glowKeyWords('FULL', keyFont, RichEdit1.Font);
  glowKeyWords('JOIN', keyFont, RichEdit1.Font);
  glowKeyWords('ON', keyFont, RichEdit1.Font);
  glowKeyWords('ANY', keyFont, RichEdit1.Font);
  glowKeyWords('BETWEEN', keyFont, RichEdit1.Font);
  glowKeyWords('LIKE', keyFont, RichEdit1.Font);
  glowKeyWords('IS', keyFont, RichEdit1.Font);
  glowKeyWords('NULL', keyFont, RichEdit1.Font);
  glowKeyWords('EXIST', keyFont, RichEdit1.Font);
  glowKeyWords('UNIQUE', keyFont, RichEdit1.Font);
  glowKeyWords('COUNT', keyFont, RichEdit1.Font);
  glowKeyWords('MAX', keyFont, RichEdit1.Font);
  glowKeyWords('MIN', keyFont, RichEdit1.Font);
  glowKeyWords('SUM', keyFont, RichEdit1.Font);
  glowKeyWords('AVG', keyFont, RichEdit1.Font);
  glowKeyWords('UNION', keyFont, RichEdit1.Font);
end;
                 
procedure TForm1.settingsBtnClick(Sender: TObject);
begin
  Form3 := TForm3.Create(Self);
  Form3.Show;
end;

end.
