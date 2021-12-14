unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

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

procedure TForm2.Button1Click(Sender: TObject);
begin
  if Form1.OpenDialog1.Execute then
  begin
    dbWay.Caption := Form1.OpenDialog1.FileName;
  end;

  Button1.Left := dbWay.Left + dbWay.Width + 10;
end;

procedure TForm2.Button2Click(Sender: TObject);
var Ini: Tinifile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\1.ini');
  Ini.WriteInteger('ComboBox', 'MaxValue', Ini.ReadInteger('ComboBox','MaxValue',0) + 1);
  Ini.WriteString('ComboBox', IntToStr(Ini.ReadInteger('ComboBox','MaxValue',0)), dbName.Text);

  Form1.ComboBox1.AddItem(dbName.Text, Self);
  Ini.Free;

  Form1.MyScript1.SQL.LoadFromFile(dbWay.Caption);
  Form1.MyScript1.Execute();

end;

end.
