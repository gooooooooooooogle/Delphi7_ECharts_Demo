unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, OleCtrls, SHDocVw;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btn1: TButton;
    wb1: TWebBrowser;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var sl : TStringList;
i : Integer;
PathStr : string;
begin
   sl := TStringList.Create;
   sl.LoadFromFile('./chart.html'); //38��106 �� Ϊ����

   sl[38] := 'data: [67, 529, 5207, 24674, 73680, 110000, 22030, 995, 78, 73, 0],';
   sl[106] := 'data: [0, 529, 5207, 20000, 60000, 80000, 20000, 995, 78, 73, 0],';

   //���ɲ�������ҳ
   PathStr := ExtractFilePath(Application.ExeName) + 'chart.html';
   sl.SaveToFile(PathStr);

   //���ر�����ҳ
   wb1.Navigate(ExtractFileDir(ParamStr(0)) + '\chart.html');
end;

end.
