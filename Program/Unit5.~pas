unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids;

type
  TForm5 = class(TForm)
    StringGrid1: TStringGrid;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

Uses Math, Unit4;

{$R *.dfm}

procedure TForm5.FormActivate(Sender: TObject);
var
  F: file of Unit4.arr;
  data: Unit4.arr;
  i, ii: integer;
  Nul: boolean;
begin
  Left := (Screen.WorkAreaWidth - Width) div 2;
  Top := (Screen.WorkAreaHeight - Height) div 2;

  AssignFile(F, ExtractFilePath(ParamStr(0)) + '\meta_inf\db.txt');

  Reset(F);

  Nul := false;

  If not EOF(F) then
    Read(F, data)
  else Nul := true;

  CloseFile(F);

  // Перенос данных в таблицу
if not Nul then
begin
  StringGrid1.ColCount := Length(data);
  StringGrid1.RowCount := Length(data[1]);

  For i := 0 to Length(data) do
    For ii := 0 to Length(data[i]) do
      StringGrid1.Cols[i][ii] := data[i][ii];
end;
end;

end.
 