unit TextEffectGroupUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    RunButton: TButton;
    UnderImage: TImage;
    GroupImage: TImage;
    NameOfGropuEdit: TEdit;
    NadpMaskLabel: TLabel;
    NadpPictLabel: TLabel;
    procedure RunButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function DrawTextWithEffectStroke(DC:HDC;
      x, y:integer; WidthStroke:integer; clText:TColor;
      ColorOfStroke, ColorBack:TColor;
      const Text:String; Mask:boolean = false):byte;
    function ExistColorOverPoint(DC:HDC; x, y:integer;
             ColFinding:TColor; Range:integer):byte;
  end;

var
  Form1: TForm1;
  R:TRect; p:integer;

implementation

{$R *.dfm}

function TForm1.ExistColorOverPoint(DC:HDC; x, y:integer;
             ColFinding:TColor; Range:integer):byte;
var
 i, j:integer;
 k:integer;
 Res:byte;
begin
 Res:=0;
 k:=0;
 for i:=0 to Range do begin
  //if i=Range then k:=1;
  for j:=-i+k to i-k do begin
   if GetPixel(DC, x+j, y-i)=ColFinding then
   begin
    if i<Range then
     Res:=1;
    if i=Range then begin
     case Abs(j) of
      0: Res:=1;
      1: if Res<>1 then Res:=2;
      2: if (Res<>1) and (Res<>2) then Res:=3;
     end;
    end;
   end;
   if GetPixel(DC, x-i, y+j)=ColFinding then
   begin
    if i<Range then
     Res:=1;
    if i=Range then begin
     case Abs(j) of
      0: Res:=1;
      1: if Res<>1 then Res:=2;
      2: if (Res<>1) and (Res<>2) then Res:=3;
     end;
    end;
   end;
   if GetPixel(DC, x+j, y+i)=ColFinding then
   begin
    if i<Range then
     Res:=1;
    if i=Range then begin
     case Abs(j) of
      0: Res:=1;
      1: if Res<>1 then Res:=2;
      2: if (Res<>1) and (Res<>2) then Res:=3;
     end;
    end;
   end;
   if GetPixel(DC, x+i, y+j)=ColFinding then
   begin
    if i<Range then
     Res:=1;
    if i=Range then begin
     case Abs(j) of
      0: Res:=1;
      1: if Res<>1 then Res:=2;
      2: if (Res<>1) and (Res<>2) then Res:=3;
     end;
    end;
   end;
  end; {for}
 end; {for}
 Result:=Res;
end;

function TForm1.DrawTextWithEffectStroke(DC:HDC;
      x, y:integer; WidthStroke:integer; clText:TColor;
      ColorOfStroke, ColorBack:TColor;
      const Text:String; Mask:boolean = false):byte;
var
 i, j:integer;
 Res:byte;
 ResSize:TSize;
begin
 GetTextExtentPoint32(DC, PChar(Text), Length(Text), ResSize);
 for i:=-WidthStroke to ResSize.cX-1+WidthStroke do
  for j:=-WidthStroke to ResSize.cY-1+WidthStroke do begin
   if GetPixel(DC, x+i, y+j)<>clText then begin
    Res:=ExistColorOverPoint(DC, x+i, y+j, clText,
        WidthStroke);
    if Res=1 then
     SetPixel(DC, x+i, y+j, ColorOfStroke);
    if Res=2 then begin
     SetPixel(DC, x+i, y+j, RGB(
      Round(GetRValue(ColorOfStroke)+(GetRValue(ColorBack)-GetRValue(ColorOfStroke))/3),
      Round(GetGValue(ColorOfStroke)+(GetGValue(ColorBack)-GetGValue(ColorOfStroke))/3),
      Round(GetBValue(ColorOfStroke)+(GetBValue(ColorBack)-GetBValue(ColorOfStroke))/3)
     ));
    end;
    if Res=3 then
     SetPixel(DC, x+i, y+j, RGB(
      Round(GetRValue(ColorOfStroke)+2*(GetRValue(ColorBack)-GetRValue(ColorOfStroke))/3),
      Round(GetGValue(ColorOfStroke)+2*(GetGValue(ColorBack)-GetGValue(ColorOfStroke))/3),
      Round(GetBValue(ColorOfStroke)+2*(GetBValue(ColorBack)-GetBValue(ColorOfStroke))/3)
     ));
   end;
 end;

 if Mask then begin
  for i:=-WidthStroke to ResSize.cX-1+WidthStroke do
   for j:=-WidthStroke to ResSize.cY-1+WidthStroke do begin
    if GetPixel(DC, x+i, y+j)<>ColorBack then begin
     SetPixel(DC, x+i, y+j, clBlack);
    end
    else begin
     SetPixel(DC, x+i, y+j, clWhite);
    end;
   end;
 end;

 Result:=0;
end; //DrawTextWithEffectStroke

procedure TForm1.RunButtonClick(Sender: TObject);
var
 DC, FPanelDC:HDC;
 FPanelBitmap, FSaveBitmap:HBitmap;
 Canv, CanvMaski:TCanvas;
 RTextSize:TSize;
 MaskBitMap, SaveMaskBitMap:HBITMAP;
 FMaskDC:HDC;
begin
 DC := GetDC(0);
 Canvas.Font.Size:=20;
 Canv:=TCanvas.Create;
 CanvMaski:=TCanvas.Create;
 Canv.Font.Color:=clWhite;
 Canv.Font.Name:='Tahoma';
 Canv.Font.Size:=12;
 Canvas.Font:=Canv.Font;
 CanvMaski.Font:=Canv.Font;
 RTextSize:=Canvas.TextExtent(NameOfGropuEdit.Text);
 FPanelBitmap := CreateCompatibleBitmap(DC, RTextSize.cx, RTextSize.cy);
 MaskBitMap := CreateCompatibleBitmap(DC, RTextSize.cx, RTextSize.cy);
 ReleaseDC(0, DC);
 FPanelDC := CreateCompatibleDC(0);
 FMaskDC := CreateCompatibleDC(0);
 FSaveBitmap := SelectObject(FPanelDC, FPanelBitmap);
 SaveMaskBitMap := SelectObject(FMaskDC, MaskBitMap);
 try
     Canv.Handle:=FPanelDC;
     CanvMaski.Handle:=FMaskDC;
     CanvMaski.Brush.Color:=clBlack;
     Canv.Brush.Color:=clBlack;
     Canv.TextOut(0, 0, NameOfGropuEdit.Text);
     CanvMaski.TextOut(0, 0, NameOfGropuEdit.Text);
     DrawTextWithEffectStroke(CanvMaski.Handle, 0, 0, 2, clWhite,
                              RGB(66, 112, 183), clBlack, NameOfGropuEdit.Text,
                              true);
     DrawTextWithEffectStroke(Canv.Handle, 0, 0, 2, clWhite,
                              RGB(66, 112, 183), clBlack, NameOfGropuEdit.Text);
     BitBlt(GetDC(Handle), 0, 0, RTextSize.cx, RTextSize.cy,
                                 CanvMaski.Handle, 0, 0, SRCCOPY);
     BitBlt(UnderImage.Canvas.Handle, 0, 0, RTextSize.cx, RTextSize.cy,
                                 Canv.Handle, 0, 0, SRCCOPY);
     UnderImage.Refresh;
     BitBlt(GroupImage.Canvas.Handle, 8, 50,
            RTextSize.cx, RTextSize.cy, CanvMaski.Handle, 0, 0, SRCAND);
     BitBlt(GroupImage.Canvas.Handle, 8, 50,
            RTextSize.cx, RTextSize.cy, Canv.Handle, 0, 0, SRCPAINT	);

     GroupImage.Refresh;
     UnderImage.Stretch:=true;
     GroupImage.Picture.SaveToFile('c:\MyBitMap2.bmp');
     UnderImage.Picture.SaveToFile('c:\MyBitMap.bmp');
 finally
     SelectObject(FMaskDC, SaveMaskBitMap);
     DeleteDC(FMaskDC);
     DeleteObject(MaskBitMap);

     SelectObject(FPanelDC, FSaveBitmap);
     DeleteDC(FPanelDC);
     DeleteObject(FPanelBitmap);

     CanvMaski.Destroy;
     Canv.Destroy;
 end;

end;

end.
