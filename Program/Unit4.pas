unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  arr = array[0..51] { ���-�� ����� + 2 } of array[0..39] { ���-�� �������� } of string[50] { ����� ���� �/��� ������ };

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
  F: file of arr;
  data: arr;
  i, i1: integer;
  NameExists, Nul: boolean;
begin
  AssignFile(F, ExtractFilePath(ParamStr(0)) + '\meta_inf\db.txt');

  Reset(F);

  Nul := false;

  If not EOF(F) then
    Read(F, data)
  else Nul := true;

  CloseFile(F);

//  ��������� data
//
//  UserName - Password - ������
//  0          1          2..

  NameExists := false;

  if not Nul then                                                     // ����
  For i := 1 to Min(Length(data[0]), Length(data[1])) do
  begin
    if data[0][i] = userName.Text then
    begin
      NameExists := true;

      if userPassword.Text = data[1][i] then
      begin
        //��� ��
        Form1.Label7.Caption := userName.Text;
        Form4.Close;

        BREAK;
      end
      else
      begin
        ShowMessage('������ ��������');
        userPassword.Text := '';
      end;
    end;

  end;

  if not NameExists then
  begin
  if Nul then                                                               // �����������
  begin
    data[0][0] := 'UserName';
    data[1][0] := 'UserPassword';

    For i := 2 to Length(data) - 1 do
    begin
      For i1 := 1 to Length(data[i]) - 1 do
      begin
        data[i][i1] := '�������';
      end;
    end;
  end;

    For i := 1  to Length(data[0]) do
      if data[0][i] = '' Then BREAK;

    data[0][i] := userName.Text;
    data[1][i] := userPassword.Text;
          {
    For i := 2 to Length(data) do
    begin
      data[i][Length(data[1]) + 1] := '�������';
    end;  }


  Reset(F);

  Write(F, data);

  CloseFile(F);

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