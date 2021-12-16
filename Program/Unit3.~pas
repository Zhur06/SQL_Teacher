unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    newTaskBtn: TButton;
    deleteBtn: TButton;
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.ComboBox1Change(Sender: TObject);
begin
  deleteBtn.Enabled := false;
  If not ((ComboBox1.Text[1] = '-') and (ComboBox1.Text[2] = '-')) then
  begin
    deleteBtn.Enabled := true;
  end;
end;

end.
