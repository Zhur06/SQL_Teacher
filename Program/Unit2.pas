unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  DAScript, MyScript;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    dbName: TEdit;
    Label2: TLabel;
    dbWay: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnPlacement;
    procedure dbNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

Uses Unit1, IniFiles;

procedure TForm2.btnPlacement;
begin
  dbName.Left := Label2.Left + Label2.Width + 4;
  dbWay.Left := dbName.Left;

  if (dbWay.Width + Button1.Width + 4) >= dbName.Width then
    dbName.Width := dbWay.Width + Button1.Width + 4;

  Button1.Left := dbName.Left + dbName.Width - Button1.Width;
  Button2.Width := dbName.Left + dbName.Width - Button2.Left;

  dbName.Height := Label1.Height + 8;
  Label2.Top := Label1.Top + Label1.Height + 8;
  dbWay.Top := Label2.Top;
  Button1.Top := Label2.Top;
  Button2.Top := Label2.Top + Label2.Height + 4;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  Form1.OpenDialog1.InitialDir := ExtractFilePath(ParamStr(0));

  if Form1.OpenDialog1.Execute then
  begin
    dbWay.Caption := Form1.OpenDialog1.FileName;
  end;

  Button1.Left := dbWay.Left + dbWay.Width + 10;

  btnPlacement;
end;

procedure TForm2.Button2Click(Sender: TObject);
var Ini: Tinifile; i: integer;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\1.ini');
  If not (Ini.ReadString('ComboBox', IntToStr(Ini.ReadInteger('ComboBox','MaxValue',0)), '') = '') then
  begin
    Ini.WriteInteger('ComboBox', 'MaxValue', Ini.ReadInteger('ComboBox','MaxValue',0) + 1);
    Ini.WriteString('ComboBox', IntToStr(Ini.ReadInteger('ComboBox','MaxValue',0)), dbName.Text);
  end
  else
    For i := Ini.ReadInteger('ComboBox','MaxValue', 1) downto 1 do
    begin
      if Ini.ReadString('ComboBox', IntToStr(i - 1), '') <> '' then
      begin
        Ini.WriteInteger('ComboBox', 'MaxValue', i);
        Ini.WriteString('ComboBox', IntToStr(i), dbName.Text);
        BREAK;
      end;
    end;

  Form1.ComboBox1.AddItem(dbName.Text, Self);
  Ini.Free;

  Form1.MyScript1.SQL.Clear;

  Form1.MyScript1.SQL.Text := 'CREATE DATABASE IF NOT EXISTS ' + dbName.Text + ' CHARACTER SET cp1251 COLLATE cp1251_general_cs;';
  Form1.MyScript1.Execute();

  Form1.MyEmbConnection1.Database := dbName.Text;

  Form1.MyScript1.SQL.LoadFromFile(dbWay.Caption);

  Form1.MyScript1.Execute();

  Form1.ComboBox1.ItemIndex := Form1.ComboBox1.Items.Count - 1;
  Form1.ComboBox1Change(Self);

end;

procedure TForm2.FormActivate(Sender: TObject);
var Ini: TIniFile;
begin
  Form2.Left:= (Screen.WorkAreaWidth - Form2.Width) div 2;
  Form2.Top:= (Screen.WorkAreaHeight - Form2.Height) div 2;

  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\settings.ini');
  Form2.Color := Ini.ReadInteger('Colors', 'Panels', Form2.Color);
  Form2.Font.Name := Ini.ReadString('Font', 'Name', Form2.Font.Name);
  Form2.Font.Size := Ini.ReadInteger('Font', 'Size', Form2.Font.Size);
  Form2.Font.Charset := Ini.ReadInteger('Font', 'Charset', Form2.Font.Charset);
  Form2.Font.Color := Ini.ReadInteger('Font', 'Color', Form2.Font.Color);
  Form2.dbName.Color := Ini.ReadInteger('Colors', 'Memos', Form2.dbName.Color);
  Ini.Free;

  btnPlacement;
end;

procedure TForm2.dbNameChange(Sender: TObject);
begin
  dbName.Width := Canvas.TextWidth(dbName.Text) + 4;

  btnPlacement;
end;

end.
