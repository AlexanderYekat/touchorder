unit SetCaptionsForGroupsUnit;

interface uses Windows, Graphics, StdCtrls, ExtCtrls, Forms, Classes;

 function DrawTextWithStroke(ImageDC:HDC; PassImage:TImage;
  Text:String;
  LeftCoor, BottomCoor, WidthOfRect:integer;
  TypeOfFont:string; SizeOfFont:integer; ColorFont,
  ColorStroke:TColor; ColorMergeBack:TColor;
  WidhtOfStroke:integer; FomrPar:TForm;
  HeightImage:integer; SaveNameFile:String):byte;

 function DrawTextWithEffectStroke(DC:HDC;
      x, y:integer; WidthStroke:integer; clText:TColor;
      ColorOfStroke, ColorBack:TColor;
      const Text:String; ImWidth:integer=0;
      ImHeight:integer=0;
      Mask:boolean = false):byte;

 function ExistColorOverPoint(DC:HDC; x, y:integer;
             ColFinding:TColor; Range:integer):byte;


implementation uses TemraryPaintUnit;
var
 AfterLabelText:array [0..255] of byte;
 ValidRect:TRect; PValidRect:PRect;

function DoMaskFromImage(ImageDC:HDC; ColTransp:TColor;
  Width, Height:integer; ColorOfImage1:TColor=0; ColorOfImage2:TColor=0;
   ColorOfImage3:TColor=0; ColorOfImage4:TColor=0):byte;
var
 i, j:integer;
begin
 Result:=0;
 for i:=0 to Width-1 do
   for j:=0 to Height-1 do begin
    if (Abs(GetPixel(ImageDC, i, j))=ColTransp) then
    begin
    {if (Abs(GetPixel(ImageDC, i, j))<>ColorOfImage1) and
        (Abs(GetPixel(ImageDC, i, j))<>ColorOfImage2) then begin}
    //if (Abs(GetPixel(ImageDC, i, j)<>ColorOfImage1) then
     SetPixel(ImageDC, i, j, clWhite);
    end
    else begin
     SetPixel(ImageDC, i, j, clBlack);
    end;
   end;
end; //DoMaskFromImage

function DrawTextWithStroke(ImageDC:HDC; PassImage:TImage;
  Text:String;
  LeftCoor, BottomCoor, WidthOfRect:integer;
  TypeOfFont:string; SizeOfFont:integer;
  ColorFont, ColorStroke:TColor; ColorMergeBack:TColor;
  WidhtOfStroke:integer; FomrPar:TForm;
  HeightImage:integer; SaveNameFile:String):byte;
var
 DCTemr, DCOfText, DCOfMaskText:HDC;
 TextBitMap, TextMaskBitMap:HBITMAP;
 CanvaOfText, CanvaOfMaskText:TCanvas;
 RTextSize:TSize;
 SaveTextBitMap, SaveMaskBitMap:HBITMAP;
 TemrMaskLabel, LabelWithStroke:TLabel;
 Image:TImage;
 EndI:integer;
begin
 Image:=PassImage;
 if PassImage=nil then Image:=TemraryPaintForm.TemraryImage;
 TemrMaskLabel:=TLabel.Create(TemraryPaintForm);
 LabelWithStroke:=TLabel.Create(TemraryPaintForm);
 LabelWithStroke.WordWrap:=true;
 TemrMaskLabel.WordWrap:=true;
 LabelWithStroke.Width:=WidthOfRect;
 TemrMaskLabel.Width:=WidthOfRect;
 //LabelWithStroke.Constraints.MaxWidth:=WidthOfRect;
 //TemrMaskLabel.Constraints.MaxWidth:=WidthOfRect;
 LabelWithStroke.Height:=HeightImage;
 TemrMaskLabel.Height:=HeightImage;
 LabelWithStroke.Transparent:=false;
 TemrMaskLabel.Transparent:=false;
 LabelWithStroke.Layout:=tlTop;
 TemrMaskLabel.Layout:=tlTop;
 LabelWithStroke.Alignment:=taCenter;
 TemrMaskLabel.Alignment:=taCenter;

 LabelWithStroke.Parent:=TemraryPaintForm;
 TemrMaskLabel.Parent:=TemraryPaintForm;
 Image.Parent:=TemraryPaintForm;

 //TemrLabel.AutoSize:=true;
 TemrMaskLabel.Font.Name:=TypeOfFont;
 LabelWithStroke.Font.Name:=TypeOfFont;
 TemrMaskLabel.Font.Size:=SizeOfFont;
 LabelWithStroke.Font.Size:=SizeOfFont;
 TemrMaskLabel.Color:=clWhite;
 LabelWithStroke.Color:=clBlack;
 TemrMaskLabel.Font.Color:=clBlack;
 LabelWithStroke.Font.Color:=ColorFont;
 TemrMaskLabel.Width:=WidthOfRect;
 LabelWithStroke.Width:=WidthOfRect;
 TemrMaskLabel.Caption:=Text;
 LabelWithStroke.Caption:=Text;

 TemrMaskLabel.AutoSize:=false;
 LabelWithStroke.AutoSize:=false;
 TemrMaskLabel.AutoSize:=true;
 LabelWithStroke.AutoSize:=true;

 EndI:=0;
 while (EndI<20) and (TemrMaskLabel.Width>WidthOfRect) do
 begin
  TemrMaskLabel.Font.Size:=Round(9*TemrMaskLabel.Font.Size/10);
  TemrMaskLabel.AutoSize:=true;
  Inc(EndI);
 end;
 EndI:=0;
 while (EndI<20) and (TemrMaskLabel.Height>HeightImage) do
 begin
  TemrMaskLabel.Font.Size:=Round(9*TemrMaskLabel.Font.Size/10);
  TemrMaskLabel.AutoSize:=true;
  Inc(EndI);
 end;


 if TemrMaskLabel.Font.Size<>LabelWithStroke.Font.Size then begin
  LabelWithStroke.Font.Size:=TemrMaskLabel.Font.Size;
  LabelWithStroke.AutoSize:=true;
 end;

 TemrMaskLabel.Width:=TemrMaskLabel.Width+2*WidhtOfStroke;
 LabelWithStroke.Width:=LabelWithStroke.Width+2*WidhtOfStroke;
 TemrMaskLabel.Height:=TemrMaskLabel.Height+2*WidhtOfStroke;
 LabelWithStroke.Height:=LabelWithStroke.Height+2*WidhtOfStroke;

 LabelWithStroke.Left:=TemrMaskLabel.Left+TemrMaskLabel.Width+1;
 Image.Left:=LabelWithStroke.Left+LabelWithStroke.Width+1;
 Image.Top:=0;

 RTextSize.cx:=TemrMaskLabel.Width;
 RTextSize.cy:=TemrMaskLabel.Height;
 Image.AutoSize:=false;
 Image.Picture:=nil;
 Image.Width:=TemrMaskLabel.Width;
 Image.Height:=TemrMaskLabel.Height;

 LabelWithStroke.GetTextBuf(@AfterLabelText, SizeOf(AfterLabelText));

 DCTemr:=GetDC(0);
 TextBitMap:=CreateCompatibleBitmap(DCTemr,
                  RTextSize.cx, RTextSize.cy);
 TextMaskBitMap:=CreateCompatibleBitmap(DCTemr,
                  RTextSize.cx, RTextSize.cy);
 ReleaseDC(0, DCTemr);
 DCOfText:=CreateCompatibleDC(0);
 DCOfMaskText:=CreateCompatibleDC(0);
 SaveTextBitMap:=SelectObject(DCOfText, TextBitMap);
 SaveMaskBitMap:=SelectObject(DCOfMaskText, TextMaskBitMap);
 CanvaOfText:=TCanvas.Create;
 CanvaOfMaskText:=TCanvas.Create;
 try
  //TemrMaskLabel.Refresh;
  //LabelWithStroke.Refresh;
  TemrMaskLabel.Repaint;
  LabelWithStroke.Repaint;
  //Image.Refresh;
  DrawTextWithEffectStroke(LabelWithStroke.Canvas.Handle,
   0, 0, WidhtOfStroke, ColorFont, ColorStroke, ColorMergeBack, Text,
    RTextSize.cx, RTextSize.cy);
  BitBlt(TemrMaskLabel.Canvas.Handle, 0, 0,
           TemrMaskLabel.Width, TemrMaskLabel.Height,
            LabelWithStroke.Canvas.Handle, 0, 0, SRCCOPY);
  DoMaskFromImage(TemrMaskLabel.Canvas.Handle, clBlack,
                  RTextSize.cx, RTextSize.cy);
  {BitBlt(Image.Canvas.Handle, LeftCoor,
          BottomCoor-TemrMaskLabel.Height,
           TemrMaskLabel.Width, TemrMaskLabel.Height,
            TemrMaskLabel.Canvas.Handle, 0, 0, SRCAND);}
  (*BitBlt(Image.Canvas.Handle, 0, 0,
           TemrMaskLabel.Width, TemrMaskLabel.Height,
            TemrMaskLabel.Canvas.Handle, 0, 0, SRCAND);
  //Image.Update;
  {BitBlt(Image.Canvas.Handle, LeftCoor,
          BottomCoor-LabelWithStroke.Height,
           LabelWithStroke.Width, LabelWithStroke.Height,
            LabelWithStroke.Canvas.Handle, 0 , 0, SRCPAINT);}
  BitBlt(Image.Canvas.Handle, 0, 0,
           LabelWithStroke.Width, LabelWithStroke.Height,
            LabelWithStroke.Canvas.Handle, 0 , 0, SRCPAINT);*)
  BitBlt(Image.Canvas.Handle, 0, 0,
           LabelWithStroke.Width, LabelWithStroke.Height,
            LabelWithStroke.Canvas.Handle, 0 , 0, SRCCOPY);
  //Image.Refresh;
  //Image.Update;
  Image.Picture.SaveToFile(SaveNameFile);
 finally
  SelectObject(DCOfMaskText, TextMaskBitMap);
  DeleteDC(DCOfMaskText);
  DeleteObject(TextMaskBitMap);

  SelectObject(DCOfText, TextBitMap);
  DeleteDC(DCOfText);
  DeleteObject(TextBitMap);

  CanvaOfText.Destroy;
  CanvaOfMaskText.Destroy;
  LabelWithStroke.Parent:=nil;
  TemrMaskLabel.Parent:=nil;
  TemrMaskLabel.Destroy;
  LabelWithStroke.Destroy;
 end;

 Result:=0;
end; //DrawTextWithStorkeByImage

function ExistColorOverPoint(DC:HDC; x, y:integer;
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
   if Abs(GetPixel(DC, x+j, y-i))=ColFinding then
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
   if Abs(GetPixel(DC, x-i, y+j))=ColFinding then
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
   if Abs(GetPixel(DC, x+j, y+i))=ColFinding then
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
   if Abs(GetPixel(DC, x+i, y+j))=ColFinding then
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
end; //ExistColorOverPoint


function DrawTextWithEffectStroke(DC:HDC;
      x, y:integer; WidthStroke:integer; clText:TColor;
      ColorOfStroke, ColorBack:TColor;
      const Text:String; ImWidth:integer=0;
      ImHeight:integer=0; Mask:boolean = false):byte;
var
 i, j:integer;
 Res:byte;
 ResSize:TSize;
 LeftGran, TopGran, WidthOfImage, HeightOfImage:integer;
begin
 GetTextExtentPoint32(DC, PChar(Text), Length(Text), ResSize);
 LeftGran:=-WidthStroke;
 WidthOfImage:=ResSize.cX-1+WidthStroke;
 if ImWidth>0 then begin
  LeftGran:=0;
  WidthOfImage:=ImWidth-1;
 end;
 TopGran:=-WidthStroke;
 HeightOfImage:=ResSize.cY-1+WidthStroke;
 if ImHeight>0 then begin
  TopGran:=0;
  HeightOfImage:=ImHeight-1;
 end;
 for i:=LeftGran to WidthOfImage do
  for j:=TopGran to HeightOfImage do begin
   //if Abs(GetPixel(DC, x+i, y+j))<>clText then begin
   if Abs(GetPixel(DC, x+i, y+j))=clBlack then begin
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
  for i:=LeftGran to WidthOfImage do
   for j:=TopGran to HeightOfImage do begin
    if Abs(GetPixel(DC, x+i, y+j))<>ColorBack then begin
     SetPixel(DC, x+i, y+j, clBlack);
    end
    else begin
     SetPixel(DC, x+i, y+j, clWhite);
    end;
   end;
 end;

 Result:=0;
end; //DrawTextWithEffectStroke

end.
