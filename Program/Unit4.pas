unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    dbDeleteBtn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure dbDeleteBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

Uses Unit1, IniFiles;

procedure TForm4.FormCreate(Sender: TObject);
begin
  ComboBox1.Items := Form1.ComboBox1.Items;
end;

procedure TForm4.ComboBox1Change(Sender: TObject);
begin
  dbDeleteBtn.Enabled := false;
  If not ((ComboBox1.Text[1] = '-') and (ComboBox1.Text[2] = '-')) then
  begin
    dbDeleteBtn.Enabled := true;
  end;
end;

procedure TForm4.dbDeleteBtnClick(Sender: TObject);
var elIndx, i: integer; Ini: Tinifile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\meta_inf\1.ini');
  For i := 1 to Ini.ReadInteger('ComboBox', 'MaxValue', 1) do
    if Ini.ReadString('ComboBox', IntToStr(i), '') = ComboBox1.Text then
      elIndx := i;
end;

end.
