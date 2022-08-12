unit create_file;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button: TButton;
    EditNumber: TEdit;
    EditExtension: TEdit;
    procedure ButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ButtonClick(Sender: TObject);
var n, i: integer;
extension, buff: string;
f: File;
begin
  n := StrToInt(EditNumber.Text);
  extension := EditExtension.Text;

  if n < 2 then
    ShowMessage('¬ведите число больше 1');
  if extension[1] = '.' then
  begin
    for i := 2 to Length(extension) do
      buff := buff + extension[i];
    extension := buff;
  end;

  for i := 1 to n do
  begin
    buff := IntToStr(i) + '.' + extension;
    Rewrite(f, buff);
    CloseFile(f);
  end;

end;
end.
