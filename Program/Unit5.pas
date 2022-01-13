unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TForm5 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

Uses Math, Unit1;

{$R *.dfm}

procedure TForm5.FormActivate(Sender: TObject);
var
  F2: file of Tas;
  data2: array of tas;
  i: integer;
begin
  Left := (Screen.WorkAreaWidth - Width) div 2;
  Top := (Screen.WorkAreaHeight - Height) div 2;

  AssignFile(F2, ExtractFilePath(ParamStr(0)) + '\meta_inf\tas');

  Reset(F2);

  While not EOF(F2) do
  begin
    SetLength(data2, Length(data2) + 1);
    Read(F2, data2[Length(data2) - 1]);
  end;

  CloseFile(F2);

  // Перенос данных в таблицу

if Length(data2) >= 1 then
begin
  StringGrid1.ColCount := 2;
  StringGrid1.RowCount := Length(data2);

  StringGrid1.Cols[0][0] := 'Ученик';
  StringGrid1.Cols[1][0] := 'Сделанное задание';

  For i := 0 to Length(data2) do
  begin
    StringGrid1.Cols[0][i + 1] := data2[i].uchName;
    StringGrid1.Cols[1][i + 1] := data2[i].taskName;
  end;
end;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
  StringGrid1.DefaultColWidth := StringGrid1.DefaultColWidth + 16;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  StringGrid1.DefaultColWidth := StringGrid1.DefaultColWidth - 16;
end;

end.
 