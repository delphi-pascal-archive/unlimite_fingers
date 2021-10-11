unit Unit1;
   //  автор идеи реализации функции UnlimiteFingers - Gordeev.
 //e-mail: gordeev@smtp.ru
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)


    Button1: TButton;
    Memo1: TMemo;
    ListBox1: TListBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;

    procedure Button1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
function UnlimiteFingers(Symbols:String;Number:Integer) : String;
 //  автор идеи алгоритма функции UnlimiteFingers - Gordeev.
 //e-mail: gordeev@smtp.ru
var g,f,s:Integer;  DF,GH,ML:string;
begin
  ML:=Symbols;
  f:=Number mod Length(ML);
  if Number<Length(ML) then
   Result:=ML[f+1]
   else
   while Number>=Length(ML) do begin
 Number:=Number div Length(ML);
 g:=Number mod Length(ML);
 DF:=DF+ML[g+1];
 GH:=ML[f+1]+DF;
  end;
for s:=Length(GH) downto  1 do
  Result:=Result+GH[s];
 end;



procedure TForm1.Button1Click(Sender: TObject);
begin
  if  Length(Memo1.Text)>1 then
   ListBox1.Items.Add(UnlimiteFingers(Memo1.Text,StrToInt(Edit1.Text)))
   else
    MessageDlg('В эту систему счисления мы ещё не умеем переводить', mtInformation, [mbOK], 0)
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
  Form1.Button1.Caption:= 'Переводим из десятичной системы счистения в '+IntToStr(Length(Memo1.Text))+'-ичную';
end;

end.
