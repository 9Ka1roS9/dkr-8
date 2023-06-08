unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
  ExtCtrls, ComCtrls;

type

  { TKalculator }

  TKalculator = class(TForm)
    Button_Clear: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button_Resulte: TSpeedButton;
    Image_Figur: TImage;
    Label_a: TLabel;
    Label_b: TLabel;
    Label_c: TLabel;
    Label_Reshim: TLabel;
    Label_Resulte: TLabel;
    Histori_Resulte: TMemo;
    TapControl1: TTabControl;
    procedure Button_ClearClick(Sender: TObject);
    procedure Button_ResulteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TapControl1Change(Sender: TObject);
  private

  public

  end;

var
  Kalculator: TKalculator;
  a, b, c, otvet:real;
  Vibar: integer;

implementation

{$R *.lfm}

{ TKalculator }

procedure TKalculator.Button_ResulteClick(Sender: TObject);
begin
  if (Vibar = 0) or (Edit1.Text = '') or (Edit2.Text = '') then
  begin
    ShowMessage('Ошибка, заполните строки!!!');
    exit();
  end;
  if Vibar = 1 then
  begin
    a:=StrtoFloat(Edit1.text);
    b:=StrtoFloat(Edit2.text);
    if (Edit3.Text = '') then
    begin
      ShowMessage('Ошибка, заполните строки!!!');
      exit();
    end;
    c:=StrtoFloat(Edit3.text);
    otvet:=a*b*c;
    Label_Resulte.Caption:='Объем прямоугольного паралепипеда = ' + FloatToStr(otvet);
    Histori_Resulte.Lines.Add('Объем прямоугольного паралепипеда = ' + FloatToStr(otvet));
  end;
  if Vibar = 2 then
  begin
    a:=StrtoFloat(Edit1.text);
    b:=StrtoFloat(Edit2.text);
    otvet:=(a*b)/3;
    Label_Resulte.Caption:='Объем пирамиды = ' + FloatToStr(otvet);
    Histori_Resulte.Lines.Add('Объем пирамиды = ' + FloatToStr(otvet));
  end;
  if Vibar = 3 then
  begin
    a:=StrtoFloat(Edit1.text);
    b:=StrtoFloat(Edit2.text);
    otvet:=(a*a)*b*3.14;
    Label_Resulte.Caption:='Объем цилиндра = ' + FloatToStr(otvet);
    Histori_Resulte.Lines.Add('Объем цилиндра = ' + FloatToStr(otvet));
  end;
  if Vibar = 4 then
  begin
    a:=StrtoFloat(Edit1.text);
    b:=StrtoFloat(Edit2.text);
    otvet:=a*b;
    Label_Resulte.Caption:='Объем прямой призмы = ' + FloatToStr(otvet);
    Histori_Resulte.Lines.Add('Объем прямой призмы = ' + FloatToStr(otvet));
  end;
end;

procedure TKalculator.Button_ClearClick(Sender: TObject);
begin
  Histori_Resulte.Clear;
  Histori_Resulte.Lines.Add('История ответов:');
end;

procedure TKalculator.FormCreate(Sender: TObject);
begin
  Vibar:=1;
  Label_Reshim.Caption:='Выбран прямоугольный паралепипед';
  Label_a.Caption:='a';
  Label_b.Caption:='b';
  Label_c.Show;
  Edit3.Show;
  Label_c.Caption:='c';
  Image_Figur.Picture.LoadFromFile('Paralepiped.png');
end;

procedure TKalculator.TapControl1Change(Sender: TObject);
begin
  if TapControl1.Tabindex = 0 then
  begin
    Vibar:=1;
    Label_Reshim.Caption:='Выбран прямоугольный паралепипед';
    Label_a.Caption:='a';
    Label_b.Caption:='b';
    Label_c.Show;
    Edit3.Show;
    Label_c.Caption:='c';
    Image_Figur.Picture.LoadFromFile('Paralepiped.png');
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
  end;
  if TapControl1.Tabindex = 1 then
  begin
    Vibar:=2;
    Label_Reshim.Caption:='Выбрана пирамида';
    Label_a.Caption:='Площадь основания';
    Label_b.Caption:='h';
    Label_c.Hide;
    Edit3.Hide;
    Image_Figur.Picture.LoadFromFile('Piramida.png');
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
  end;
  if TapControl1.Tabindex = 2 then
  begin
    Vibar:=3;
    Label_Reshim.Caption:='Выбран цилиндр';
    Label_a.Caption:='r';
    Label_b.Caption:='h';
    Label_c.Hide;
    Edit3.Hide;
    Image_Figur.Picture.LoadFromFile('Cilindr.png');
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
  end;
  if TapControl1.Tabindex = 3 then
  begin
    Vibar:=4;
    Label_Reshim.Caption:='Выбрана примая призма';
    Label_a.Caption:='Площадь основания';
    Label_b.Caption:='h';
    Label_c.Hide;
    Edit3.Hide;
    Image_Figur.Picture.LoadFromFile('Prisma.png');
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
  end;
end;

end.

