unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBAccess, MyAccess, MyEmbConnection, MemDS, Grids,
  DBGrids;

type
  TForm4 = class(TForm)
    Login: TLabel;
    Password: TLabel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    userName: TEdit;
    userPassword: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

USES Unit1;

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  Form1 := TForm1.Create(Self);

   Form1.MyEmbConnection1.Database := 'auth';

  Form1.MyEmbConnection1.Connected := true;

  Form1.MyQuery3.Close;

  Form1.MyQuery3.SQL.Text := 'SELECT * FROM reg WHERE userName = ' + #39 + userName.Text + #39;

  Form1.MyQuery3.Open;

  if DBGrid1.Fields[2].Text = '' then
  begin
    Form1.MyScript1.SQL.Text := 'INSERT INTO reg (userName, userPassword) VALUES (' + #39 + userName.Text + #39 + ', ' + #39 + userPassword.Text + #39 + ')';
    Form1.MyScript1.Execute;
  end;

  if DBGrid1.Fields[2].Text = userPassword.Text then
  begin
    Form1.MyEmbConnection1.Connected := false;
    Form1.user := userName;
    Form1.Show;
  end
  else ShowMessage('Пароль неверный');
end;

end.
