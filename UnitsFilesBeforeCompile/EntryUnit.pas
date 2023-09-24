unit EntryUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, ImgList, ExtCtrls, FormsClassCurs;

type
  TEntryForm = class(TMyCursorForms)
    XPManifest1: TXPManifest;
    FirmNameEdit: TEdit;
    FirmNameLabel: TLabel;
    LetterImageList: TImageList;
    Image1: TImage;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EntryForm: TEntryForm;

implementation

{$R *.dfm}

procedure TEntryForm.FormCreate(Sender: TObject);
begin
 FirmNameLabel.Top:=FirmNameEdit.Top-Round(0.33*FirmNameEdit.Font.Size)-10;
 FirmNameLabel.Left:=FirmNameEdit.BoundsRect.Right+10;
 
end;

procedure TEntryForm.FormPaint(Sender: TObject);
var
 i:integer;
begin
 for i:=1 to 13 do
  LetterImageList.Draw(Canvas,
   13+12*(i-1)+(i-1)*LetterImageList.Width, 400, (i-1)*2);
 for i:=1 to 11 do
  LetterImageList.Draw(Canvas,
   13+LetterImageList.Width+13+Round(LetterImageList.Width/2)-5+13*(i-1)+
    (i-1)*LetterImageList.Width, 500, 13*2+(i-1)*2);
 for i:=1 to 9 do
  LetterImageList.Draw(Canvas,
   13+LetterImageList.Width+13+2*Round(LetterImageList.Width/2)+5+13*(i-1)+
    (i-1)*LetterImageList.Width, 600, 24*2+(i-1)*2);
end;

procedure TEntryForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 i:integer;
begin
 for i:=1 to 9 do
  LetterImageList.Draw(Canvas,
   13+LetterImageList.Width+13+2*Round(LetterImageList.Width/2)+5+13*(i-1)+
    (i-1)*LetterImageList.Width, 600, 24*2+1+(i-1)*2);
 FirmNameEdit.Text:=FirmNameEdit.Text+Char(Random(255));
end;

procedure TEntryForm.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 Repaint;
end;

procedure TEntryForm.Image2Click(Sender: TObject);
begin
 close;
end;

procedure TEntryForm.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if Length(FirmNameEdit.Text)>0 then
  FirmNameEdit.Text:=Copy(FirmNameEdit.Text,
   0, Length(FirmNameEdit.Text)-1);
end;

end.
