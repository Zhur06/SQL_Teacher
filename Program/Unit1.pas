unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBTables, Grids, DBGrids, MemDS,
  DBAccess, MyAccess, MyEmbConnection, DAScript, MyScript, ComCtrls,
  ActnList;

type
  Arr = array of string;

  Uch = record
    uchName: string[50];
    uchPassword: string[50];
  end;

  Tas = record
    uchName: string[50];
    taskName: string[50];
  end;

  TForm1 = class(TForm)
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
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
    trueAnsw: TAction;
    DBGrid2: TDBGrid;
    Splitter5: TSplitter;
    DataSource2: TDataSource;
    MyQuery2: TMyQuery;
    goBtn: TButton;
    Panel1: TPanel;
    GroupBox4: TGroupBox;
    GroupBox6: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Button1: TButton;
    Splitter6: TSplitter;
    Button2: TButton;
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
    procedure changeWordFont(var keyWord, txt: string; iill: integer; resFont, normalFont: TFont);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure trueAnswExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

Uses Math, IniFiles, Unit2, Unit3, Unit4, Unit5;

//----------------- ????????? ?????? -------------------------------------------

procedure TForm1.changeWordFont(var keyWord, txt: string; iill: integer; resFont, normalFont: TFont);
var
  s: string;
  pos: integer;
begin
    if AnsiLowerCase(txt[iill]) = AnsiLowerCase(keyWord[1]) then
    begin
      s := Copy(txt, iill, length(keyWord));

      if AnsiLowerCase(s) = AnsiLowerCase(keyWord) then
      with RichEdit1 do
      begin
        pos := SelStart;

        if keyWord[1] = #13 then
          SelStart := iill
        else SelStart := iill - 1;
        SelLength := length(s) - 2;
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
end;

//----------------- ????????? ???????? ???? ------------------------------------

Procedure TForm1.glowKeyWords(keyWord: string; resFont, normalFont: TFont);
var
  iill: integer;
  k1, k2, k3, k4, txt: string;
  Ini: TIniFile;
begin
  txt := ' ' + RichEdit1.Text + ' ';

  k1 := ' ' + keyWord + ' ';
  k2 := ' ' + keyWord + #13 + #10;
  k3 := #13 + #10 + keyWord + ' ';
  k4 := #13 + #10 + keyWord + #13 + #10;
                                 
  //RichEdit1.SelStart := 0;
  //RichEdit1.SelLength := length(RichEdit1.Text);

  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\settings.ini');
  RichEdit1.SelAttributes.Name := Ini.ReadString('Font', 'Name', RichEdit1.SelAttributes.Name);
  RichEdit1.SelAttributes.Size := Ini.ReadInteger('Font', 'Size', RichEdit1.SelAttributes.Size);
  RichEdit1.SelAttributes.Charset := Ini.ReadInteger('Font', 'Charset', RichEdit1.SelAttributes.Charset);
  RichEdit1.SelAttributes.Color := Ini.ReadInteger('Font', 'Color', RichEdit1.SelAttributes.Color);
  Ini.Free;

  //RichEdit1.SelLength := 0;
  //RichEdit1.SelStart := pos1;

  For iill := 1 to length(RichEdit1.Text) do
  begin
    changeWordFont(k1, txt, iill, resFont, normalFont);
    changeWordFont(k2, txt, iill, resFont, normalFont);
    changeWordFont(k3, txt, iill, resFont, normalFont);
    changeWordFont(k4, txt, iill, resFont, normalFont);
  end;
end;

//----------------- ???????? ????? ---------------------------------------------

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

//----------------- ?????????? ?????? ??????? ----------------------------------

procedure TForm1.fillTaskList();
var
  ii: integer;
  A: Arr;
begin
  A := Find(ExtractFilePath(ParamStr(0)) + '\teachers', '*.txt');
  for ii := 0 to length(A) - 1 do
  begin
    ListBox1.Items.Add(A[ii]);
  end;
end;

//----------------- ???????? ?? ???????? ????? ---------------------------------

procedure TForm1.FormCreate(Sender: TObject);
var Ini: Tinifile; i: integer;
begin

  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\1.ini');
  For i := 1 to Ini.ReadInteger('ComboBox', 'MaxValue', 1) do
    ComboBox1.AddItem(Ini.ReadString('ComboBox', IntToStr(i), ''), Self);

  Form1.Left := Ini.ReadInteger('MainForm', 'Left', (Screen.WorkAreaWidth - Form1.Width) div 2);
  Form1.Top := Ini.ReadInteger('MainForm', 'Top', (Screen.WorkAreaHeight - Form1.Height) div 2);
  Form1.Width := Ini.ReadInteger('MainForm', 'Width', Form1.Width);
  Form1.Height := Ini.ReadInteger('MainForm', 'Height', Form1.Height);
  Ini.Free;

  fillTaskList;
  doCustomizationSettings;
end;

//----------------- ?????????? ??????? -----------------------------------------

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

//----------------- ?????????? ??????? ?? ????? --------------------------------

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

//----------------- ????????? ?? -----------------------------------------------

procedure TForm1.ComboBox1Change(Sender: TObject);
var Ini: Tinifile; i, val: integer;
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

      MyQuery2.Close;
      MyQuery2.SQL.Text := 'SELECT DISTINCT TABLE_NAME AS ??????? FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = ' + #39 + ComboBox1.Text + #39;
      MyQuery2.Open;

    except
      MyEmbConnection1.Connected := false;

      Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\1.ini');
      val := Ini.ReadInteger('ComboBox', 'MaxValue', 1);
      For i := 1 to Ini.ReadInteger('ComboBox', 'MaxValue', 1) do
        if Ini.ReadString('ComboBox', IntToStr(i), '') = ComboBox1.Text then
        begin
          Ini.DeleteKey('ComboBox', IntToStr(i));
          val := val - 1;
        end;
      Ini.WriteInteger('ComboBox', 'MaxValue', val);
      Ini.Free;

      ComboBox1.DeleteSelected;
      ComboBox1.ItemIndex := 0;
    end;
  end;
end;

//----------------- ???????? ?? ------------------------------------------------

procedure TForm1.dbCreateBtnClick(Sender: TObject);
begin
  Form2 := TForm2.Create(Self);
  Form2.Show;
end;

//----------------- ?????????? ?????? ------------------------------------------

procedure TForm1.saveAnswerBtnClick(Sender: TObject);
begin
  MyQuery1.SaveToXML(ExtractFilePath(ParamStr(0)) + '\teachers\' + ListBox1.Items[ListBox1.ItemIndex] + '.xml');
  CryptFile(ExtractFilePath(ParamStr(0)) + '\teachers\' + ListBox1.Items[ListBox1.ItemIndex] + '.xml', '?');
end;

//----------------- ???????? ?? ------------------------------------------------

procedure TForm1.dbDeleteBtnClick(Sender: TObject);
var Ini: Tinifile; i, val: integer;
begin
  if MyEmbConnection1.Connected = true then
  begin
    MyScript1.SQL.Text := 'DROP DATABASE ' + ComboBox1.Items[ComboBox1.ItemIndex];
    MyScript1.Execute;

    Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\1.ini');
    val := Ini.ReadInteger('ComboBox', 'MaxValue', 1);
    For i := 1 to Ini.ReadInteger('ComboBox', 'MaxValue', 1) do
      if Ini.ReadString('ComboBox', IntToStr(i), '') = ComboBox1.Text then
      begin
        Ini.DeleteKey('ComboBox', IntToStr(i));
        val := val - 1;
      end;
    Ini.WriteInteger('ComboBox', 'MaxValue', val);
    Ini.Free;
     
    ComboBox1.DeleteSelected;
    ComboBox1.ItemIndex := 0;
    ComboBox1Change(Self);
  end;
end;

//----------------- ????? ??????? ----------------------------------------------

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

  matchPanel.Caption := '????? ????? ????????? ???????? (?????/???????)';
end;

//----------------- ??????????????? ??????? ??? ??????? ------------------------

procedure TForm1.showTeacherExecute(Sender: TObject);
begin
  //TabSheet2.TabVisible := not TabSheet2.TabVisible;
  with PageControl1 do
  begin
    case ActivePageIndex of
      0: ActivePageIndex := 1;
      1: ActivePageIndex := 0;
    end;
  end;

end;

//----------------- ????? ???????? ???? ?????? ????????? ?????????? ? ????. ??????????

function TForm1.Find(cDir, FileName: string): Arr;
var
  SearchRec: TSearchRec; // ?????????? ? ????????
  n: LongInt;
  iii: integer;
  A: arr;
begin

  n := 0;
  ChDir(cDir); // ????? ? ???????
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

//----------------- ???????? ??????? -------------------------------------------

procedure TForm1.checkBtnClick(Sender: TObject);
var
  F: file of char;
  c: char;
  answ, resul: string;

  F1: File of Uch;
  F2: File of Tas;
  data1: Array of uch;
  data2: Array of tas;
  i: integer;
begin
  MyQuery1.SaveToXML('YourResult.xml');

  try
  CryptFile(ExtractFilePath(ParamStr(0)) + '\teachers\' + ListBox1.Items[ListBox1.ItemIndex] + '.xml', '?');

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
    matchPanel.Caption := '?????? ?????? ?????';

    if Label7.Caption <> '???? ?? ????????' then
    begin
      AssignFile(F1, ExtractFilePath(ParamStr(0)) + '\meta_inf\uch');
      AssignFile(F2, ExtractFilePath(ParamStr(0)) + '\meta_inf\tas');

      Reset(F1);
      Reset(F2);

      While not EOF(F1) do
      begin
        SetLength(data1, Length(data1) + 1);
        Read(F1, data1[Length(data1)]);
      end;

      While not EOF(F2) do
      begin
        SetLength(data2, Length(data2) + 1);
        Read(F2, data2[Length(data2)]);
      end;

      CloseFile(F1);
      CloseFile(F2);

      SetLength(data2, length(data2) + 1);

      data2[length(data2)].uchName := Label7.Caption;
      data2[length(data2)].taskName := ListBox1.Items[ListBox1.ItemIndex];

      Rewrite(F2);

      For i := 0 to Length(data2) do
        Write(F2, data2[i]);

      CloseFile(F2);
    end;
  end
  else
  begin
    matchPanel.Caption := '?????? ?????? ???????';
  end;

  DeleteFile('YourResult.xml');

  CryptFile(ExtractFilePath(ParamStr(0)) + '\teachers\' + ListBox1.Items[ListBox1.ItemIndex] + '.xml', '?');

  except
    ShowMessage('?????? ?? ??? ??????? ??? ???');
  end;
end;
procedure TForm1.trueAnswExecute(Sender: TObject);
var
  F1: File of Uch;
  F2: File of Tas;
  data1: Array of uch;
  data2: Array of tas;
  i: integer;
begin
  matchPanel.Caption := '?????? ?????? ?????';
if Label7.Caption <> '???? ?? ????????' then
begin
    AssignFile(F1, ExtractFilePath(ParamStr(0)) + '\meta_inf\uch');
      AssignFile(F2, ExtractFilePath(ParamStr(0)) + '\meta_inf\tas');

      Reset(F1);
      Reset(F2);

      While not EOF(F1) do
      begin
        SetLength(data1, Length(data1) + 1);
        Read(F1, data1[Length(data1)]);
      end;

      While not EOF(F2) do
      begin
        SetLength(data2, Length(data2) + 1);
        Read(F2, data2[Length(data2)]);
      end;

      CloseFile(F1);
      CloseFile(F2);

      SetLength(data2, length(data2) + 1);

      data2[length(data2) - 1].uchName := Label7.Caption;
      data2[length(data2) - 1].taskName := ListBox1.Items[ListBox1.ItemIndex];

      Rewrite(F2);

      For i := 0 to Length(data2) do
        Write(F2, data2[i]);

      CloseFile(F2);
end;
end;

//----------------- ?????????? ???????????????? ???????? -----------------------

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

  keyFont.Name := Ini.ReadString('keyFont', 'Name', Form1.Font.Name);
  keyFont.Size := Ini.ReadInteger('keyFont', 'Size', Form1.Font.Size);
  keyFont.Charset := Ini.ReadInteger('keyFont', 'Charset', Form1.Font.Charset);
  keyFont.Color := Ini.ReadInteger('keyFont', 'Color', Form1.Font.Color);

  Panel2.Width := Canvas.TextWidth('????? ?????: 999') + 16;
  Panel2.Height := Canvas.TextHeight('????? ?????: 999') + 8;
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
  Button2.Height := Panel2.Height;

  dbDeleteBtn.Top := 4 + (Panel2.Height + 8);
  doScriptBtn.Top := 4 + (Panel2.Height + 8) * 2;
  saveAnswerBtn.Top := 4 + (Panel2.Height + 8) * 3;
  Button2.Top := 4 + (Panel2.Height + 8) * 4;

  Label7.Left := Label6.Left + Label6.Width + 4;

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

//----------------- ???? ?????? ------------------------------------------------

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

  matchPanel.Caption := '????? ????? ????????? ???????? (?????/???????)';
end;

//----------------- ????? ???? ???????? ----------------------------------------

procedure TForm1.settingsBtnClick(Sender: TObject);
begin
  Form3 := TForm3.Create(Self);
  Form3.Show;
end;

//----------------- ???????? ???? ----------------------------------------------

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\1.ini');
  Ini.WriteInteger('MainForm', 'Left', Form1.Left);
  Ini.WriteInteger('MainForm', 'Top', Form1.Top);
  Ini.WriteInteger('MainForm', 'Width', Form1.Width);
  Ini.WriteInteger('MainForm', 'Height', Form1.Height);
  Ini.Free;
end;

//----------------- ???????? ???? ??????????? ----------------------------------

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form4 := TForm4.Create(Self);

  with Form4 do
  begin
    Font.Assign(Form1.Font);
    userPassword.Left := Form4.Label2.Left + Form4.Label2.Width + 4;
    userName.Left := userPassword.Left;

    userPassword.Top := userName.Height + userName.Top + 8;
    Form4.Label2.Top := userPassword.Top;

    Button1.Height := userPassword.Height;
  end;

  Form4.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 Form5 := TForm5.Create(Self);
 Form5.Font.Assign(Form1.Font);

 Form5.Show;
end;

end.
