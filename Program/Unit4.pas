unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    userName: TEdit;
    userPassword: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Math, Unit1;

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
var
  F1: file of Uch;
  F2: file of Tas;
  data1: array of uch;
  data2: array of tas;
  i, i1: integer;
  NameExists, Nul: boolean;
begin
  AssignFile(F1, ExtractFilePath(ParamStr(0)) + '\meta_inf\uch');

  Reset(F1);

  Nul := false;

  While not EOF(F1) do
  begin
    SetLength(data1, Length(data1) + 1);
    Read(F1, data1[Length(data1) - 1]);
  end;

  CloseFile(F1);

  AssignFile(F2, ExtractFilePath(ParamStr(0)) + '\meta_inf\tas');

  Reset(F2);

  While not EOF(F2) do
  begin
    SetLength(data2, Length(data2) + 1);
    Read(F2, data2[Length(data2)]);
  end;

  CloseFile(F2);

  NameExists := false;

  if Length(data1) > 0 then                                                     // ????
  For i := 1 to Length(data1) do
  begin
    if data1[i].uchName = userName.Text then
    begin
      NameExists := true;

      if userPassword.Text = data1[i].uchPassword then
      begin
        //??? ??
        Form1.Label7.Caption := userName.Text;
        Form4.Close;

        BREAK;
      end
      else
      begin
        ShowMessage('?????? ????????');
        userPassword.Text := '';
      end;
    end;

  end;

  if not NameExists then
  begin
  SetLength(data1, Length(data1) + 1);
  data1[Length(data1) - 1].uchName := userName.Text;
  data1[Length(data1) - 1].uchPassword := userPassword.Text;;

  Rewrite(F1);

  For i := 0 to Length(data1) do
    Write(F1, data1[i]);

  CloseFile(F1);

  Form1.Label7.Caption := userName.Text;
  Form4.Close;
  end; 
end;

procedure TForm4.FormActivate(Sender: TObject);
begin
  Left := (Screen.WorkAreaWidth - Width) div 2;
  Top := (Screen.WorkAreaHeight - Height) div 2;
end;

end.
