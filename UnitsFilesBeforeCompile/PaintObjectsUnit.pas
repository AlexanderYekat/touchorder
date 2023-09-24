unit PaintObjectsUnit;

interface uses ADODB, DB, SysUtils, Graphics, Classes, Windows;

type

TPaintingObjects = class;

 TWorkWithTPaintingObjects = class
 private
 public

end;

TPaintingObjects = class
 private
  FPaintParent:string;
  FParentObj:TPaintingObjects;
  FObjType:String;
  FValue:double;
  FValueInt:integer;
  FObjDescr:string;
  FValueOrigin:Double;
  FOriginLeft, FOriginTop, FOriginWidth, FOriginHeight:Double;
  FReadedLeft,
  FReadedTop,
  FReadedWidth,
  FReadedHeight:integer;
  FGlobLeft, FGlobTop, FGlobRight, FGlobBottom:integer;
  FLeftInParent, FTopInParent, FRightInParent, FBottomInParent:integer;
  FRealWidth, FRealHeight:integer;
  FColor, FColorSelected, FColorChered:TColor;
  FFontName:TComponentName;
  FFontSize:integer;
  FText:string;
  FAngleRadius:integer;
  FRedCol, FGreenCol, FBlueCol:byte;
  FCheredRedCol, FCheredGreenCol, FCheredBlueCol:byte;
  FSelectRedCol, FSelectGreenCol, FSelectBlueCol:byte;
  FThicknessGlare:TRect;
  procedure SetFRealWidth(Value:integer);
  procedure SetFValue(Value:integer);
 public

  //рисование градинтного прямоугольника
  function PaintGradient(PerCanvas:TCanvas;
          LeftGran:integer=0; RightGran:integer=0;
           LeftColor:TColor=0; RightColor:TColor=0;
            OrientationVert:boolean = true;
             BottomGran:integer=0; TopGran:integer=0;
              InParent:boolean = true):byte;
  property ParentObj:TPaintingObjects read FParentObj;
  property Value:integer read FValueInt write SetFValue;
  property FontSize:integer read FFontSize;
  property FontName:TComponentName read FFontName;
  property Text:string read FText;
  property AngleRadius:integer read FAngleRadius;
  property Color:TColor read FColor;
  property Red:byte read FRedCol;
  property Green:byte read FGreenCol;
  property Blue:byte read FBlueCol;
  property ColorSelected:TColor read FColorSelected;
  property RedSel:byte read FSelectRedCol;
  property GreenSel:byte read FSelectGreenCol;
  property BlueSel:byte read FSelectBlueCol;
  property ColorChered:TColor read FColorChered;
  property RedChered:byte read FCheredRedCol;
  property GreenChered:byte read FCheredGreenCol;
  property BlueChered:byte read FCheredBlueCol;
  property Left:integer read FGlobLeft;
  property Top:integer read FGlobTop;
  property Right:integer read FGlobRight;
  property Bottom:integer read FGlobBottom;
  property Width:integer read FRealWidth write
   SetFRealWidth;
  property Height:integer read FRealHeight;
  property LeftInParent:integer read FLeftInParent;
  property TopInParent:integer read FTopInParent;
  property RightInParent:integer read FRightInParent;
  property BottomInParent:integer read FBottomInParent;
  property ThicknessGlare:TRect read FThicknessGlare;

  constructor Create(Table:TADOQuery;
                     CoeffHoriz, CoeffVert:double;
                      IDInTable:string='');
  destructor Destroy; override;
end;


implementation

constructor TPaintingObjects.Create(Table:TADOQuery;
                CoeffHoriz, CoeffVert:double;
                IDInTable:string=''
                 );
//var
// Zakladka:TBookmark;
begin
 inherited Create;

 if not(Table.Locate('OBJECTNAME', IDInTable, [loCaseInsensitive]))
  then
 if IDInTable<>'' then begin
  Table.First;
  while (Trim(Table.FieldByName('OBJECTNAME').AsString)<>
        IDInTable) and
         not(Table.Eof) and
          (Table.RecNo<>Table.RecordCount) do
   Table.Next;
 end;

 ////запоминаем текущую позицию в таблице
 //Zakladka:=Table.GetBookmark;

 //считываем данные из полей текущей записи
 FPaintParent:=Trim(Table.FieldByName('PARENT').AsString);
 FObjType:=Trim(Table.FieldByName('OBJECTTYPE').AsString);
 FFontName:=Trim(Table.FieldByName('COMMENTS').AsString);
 FText:=Trim(Table.FieldByName('OBJECTDESC').AsString);

 //высота текста или ничего
 FValueOrigin:=Table.FieldByName('VALUE').AsFloat;
 FValue:=CoeffVert*Table.FieldByName('VALUE').AsFloat;

 if FFontName='Радиус закругления на углах' then
  FValue:=((CoeffHoriz+CoeffVert)/2)*Table.FieldByName('VALUE').AsFloat;

 if FFontName='Расстояние между картинками' then
  FValue:=CoeffHoriz*Table.FieldByName('VALUE').AsFloat;
 if FFontName='Расстояние между объектами' then
  FValue:=CoeffHoriz*Table.FieldByName('VALUE').AsFloat;
 if FFontName='Расстояние на которое передвинется, без поддгрупп' then
  FValue:=CoeffVert*Table.FieldByName('VALUE').AsFloat;
 if FFontName='Ширина всей панели для картинки' then
  FValue:=CoeffHoriz*Table.FieldByName('VALUE').AsFloat;
 FValueInt:=Round(FValue);
 
 FFontSize:=FValueInt;
 FAngleRadius:=Round(FValue*3);

 FObjDescr:=Trim(Table.FieldByName('OBJECTDESC').AsString);

 //цвет
 FRedCol:=Table.FieldByName('REDCOLOR').AsInteger;
 FGreenCol:=Table.FieldByName('GREENCOLOR').AsInteger;
 FBlueCol:=Table.FieldByName('BLUECOLOR').AsInteger;
 FColor:=RGB(FRedCol, FGreenCol, FBlueCol);

 //чередующийся цвет для таблиц
 FCheredRedCol:=Table.FieldByName('CHERRED').AsInteger;
 FCheredGreenCol:=Table.FieldByName('CHERGREEN').AsInteger;
 FCheredBlueCol:=Table.FieldByName('CHERBLUE').AsInteger;
 FColorChered:=RGB(FCheredRedCol, FCheredGreenCol, FCheredBlueCol);

 //цвет при фокусе
 FSelectRedCol:=Table.FieldByName('SELRED').AsInteger;
 FSelectGreenCol:=Table.FieldByName('SELGREEN').AsInteger;
 FSelectBlueCol:=Table.FieldByName('SELBLUE').AsInteger;
 FColorSelected:=RGB(FSelectRedCol, FSelectGreenCol, FSelectBlueCol);

 //координаты
 FOriginLeft:=Table.FieldByName('LEFT').AsFloat;
 FOriginTop:=Table.FieldByName('TOP').AsFloat;
 FOriginWidth:=Table.FieldByName('WIDTH').AsFloat;
 FOriginHeight:=Table.FieldByName('HEIGTH').AsFloat;
 FReadedLeft:=Round(CoeffHoriz*Table.FieldByName('LEFT').AsFloat);
 FReadedTop:=Round(CoeffVert*Table.FieldByName('TOP').AsFloat);
 FReadedWidth:=Round(CoeffHoriz*Table.FieldByName('WIDTH').AsFloat);
 FReadedHeight:=Round(CoeffVert*Table.FieldByName('HEIGTH').AsFloat);

 //толщина бликов
 FThicknessGlare.Left:=Round(CoeffHoriz*Table.FieldByName('BLLEFT').AsFloat);
 FThicknessGlare.Top:=Round(CoeffVert*Table.FieldByName('BLTOP').AsFloat);
 FThicknessGlare.Right:=Round(CoeffHoriz*Table.FieldByName('BLRIGHT').AsFloat);
 FThicknessGlare.Bottom:=Round(CoeffVert*Table.FieldByName('BLBOTTOM').AsFloat);

 if FPaintParent<>'' then
  FParentObj:=TPaintingObjects.Create(Table, CoeffHoriz, CoeffVert, FPaintParent)
 else
  FParentObj:=self;

 //левая координата объекта
 if FOriginLeft<0 then begin
  FGlobLeft:=FParentObj.Right+FReadedLeft-FReadedWidth;
  FLeftInParent:=FGlobLeft-FParentObj.Left;
 end
 else begin
  FGlobLeft:=FParentObj.Left+FReadedLeft;
  FLeftInParent:=FReadedLeft;
 end;
 //верхняя координата
 if FOriginTop<0 then begin
  FGlobTop:=FParentObj.Bottom+FReadedTop-FReadedHeight;
  FTopInParent:=FGlobTop-FParentObj.Top;
  if FObjType='Text' then begin
   FGlobTop:=FGlobTop-Trunc(0.36*FFontSize);
   FTopInParent:=FTopInParent-Trunc(0.36*FFontSize);
  end;
 end
 else begin
  FGlobTop:=FParentObj.Top+FReadedTop;
  FTopInParent:=FReadedTop;
  if FObjType='Text' then begin
   FGlobTop:=FParentObj.Top+FReadedTop-Trunc(0.36*FFontSize);
   FTopInParent:=FReadedTop-Trunc(0.36*FFontSize);
  end;
 end;
 //ширина объекта
 if FOriginWidth<=0 then
  FRealWidth:=FParentObj.Right+FReadedWidth-FGlobLeft
 else
  FRealWidth:=FReadedWidth;
 //высота объекта
 if FOriginHeight<=0 then
  FRealHeight:=FParentObj.Bottom+FReadedHeight-FGlobTop
 else
  FRealHeight:=FReadedHeight;
 //правая координата объекта
 FGlobRight:=FGlobLeft+FRealWidth;
 FRightInParent:=FLeftInParent+FRealWidth;
 //нижняя координата
 FGlobBottom:=FGlobTop+FRealHeight;
 FBottomInParent:=FTopInParent+FRealHeight;

 ////возвращаемся на запомненную позицию в таблице
 //Table.GotoBookmark(Zakladka);
end; //constructor TPaintingObjects

procedure TPaintingObjects.SetFRealWidth(Value:integer);
begin
 //if FObjType<>'DataView and Image' then Exit;
 if Value<>FRealWidth then begin
  FRealWidth:=Value;
  FGlobRight:=FGlobLeft+FRealWidth;
  FRightInParent:=FLeftInParent+FRealWidth;
 end;
end; //SetFRealWidth

procedure TPaintingObjects.SetFValue(Value:integer);
begin
 if Value<>FValueInt then begin
  FValueInt:=Value;
  if FObjType='Image or DataView' then
   if FFontName='Ширина всей панели для картинки' then begin
    FLeftInParent:=Round((Value-FRealWidth)/2);
    FRightInParent:=FLeftInParent+FRealWidth;
    FGlobLeft:=FParentObj.Left+FLeftInParent;
    FGlobRight:=FGlobLeft+FRealWidth;
   end;
 end;
end; //SetFValue

//рисование градинтного прямоугольника
function TPaintingObjects.PaintGradient(PerCanvas:TCanvas;
          LeftGran:integer=0; RightGran:integer=0;
           LeftColor:TColor=0; RightColor:TColor=0;
            OrientationVert:boolean = true;
             BottomGran:integer=0; TopGran:integer=0;
              InParent:boolean = true):byte;
var
 i:integer;
 RedLeft, GreenLeft, BlueLeft:Byte;
 RedRight, GreenRight, BlueRight:byte;
 RC, GC, BC:byte;
 LeftGranCur, RightGranCur, SubOfGranHoriz:integer;
 TopGranCur, BottomGranCur, SubOfGranVert:integer;
 GranLeftCvet, GranRightCvet:TColor;
begin
 LeftGranCur:=FLeftInParent;
 if InParent=false then
  LeftGranCur:=FGlobLeft;
 if LeftGran<>0 then
  LeftGranCur:=LeftGran;
 RightGranCur:=FRightInParent;
 if InParent=false then
  RightGranCur:=FGlobRight;
 if RightGran<>0 then
  RightGranCur:=RightGran;
 SubOfGranHoriz:=RightGranCur-LeftGranCur;

 TopGranCur:=FTopInParent;
 if InParent=false then
  TopGranCur:=FGlobTop;
 if TopGran<>0 then
  TopGranCur:=TopGran;
 BottomGranCur:=FBottomInParent;
 if InParent=false then
  BottomGranCur:=FGlobBottom;
 if BottomGran<>0 then
  BottomGranCur:=BottomGran;
 SubOfGranVert:=BottomGran-TopGranCur;

 GranLeftCvet:=FColor;
 if LeftColor<>0 then
  GranLeftCvet:=LeftColor;
 GranRightCvet:=FColorChered;
 if RightColor<>0 then
  GranRightCvet:=RightColor;
 RedLeft:=GetRValue(GranLeftCvet);
 GreenLeft:=GetGValue(GranLeftCvet);
 BlueLeft:=GetBValue(GranLeftCvet);
 RedRight:=GetRValue(GranRightCvet);
 GreenRight:=GetGValue(GranRightCvet);
 BlueRight:=GetBValue(GranRightCvet);
 //подгруппы, градиентный цвет для фона картинок
 if OrientationVert then
  for i:=LeftGranCur to RightGranCur do begin
   RC:=Round(RedLeft+(i-LeftGranCur)*
    (RedRight-RedLeft)/SubOfGranHoriz);
   GC:=Round(GreenLeft+(i-LeftGranCur)*
    (GreenRight-GreenLeft)/SubOfGranHoriz);
   BC:=Round(BlueLeft+(i-LeftGranCur)*
    (BlueRight-BlueLeft)/SubOfGranHoriz);

   PerCanvas.Pen.Color:=RGB(RC, GC, BC);
   PerCanvas.MoveTo(i, TopGranCur);
   PerCanvas.LineTo(i,
    BottomGranCur);
  end //for рисования градиента по вертикали
 else
  for i:=TopGranCur to BottomGranCur do begin
   RC:=Round(RedLeft+(i-TopGranCur)*
    (RedRight-RedLeft)/SubOfGranVert);
   GC:=Round(GreenLeft+(i-TopGranCur)*
    (GreenRight-GreenLeft)/SubOfGranVert);
   BC:=Round(BlueLeft+(i-TopGranCur)*
    (BlueRight-BlueLeft)/SubOfGranVert);

   PerCanvas.Pen.Color:=RGB(RC, GC, BC);
   PerCanvas.MoveTo(LeftGranCur, i);
   PerCanvas.LineTo(RightGranCur,
    i);
  end; //for рисования градиента по горизонтали

end; //PaintGradient//рисование градинтного прямоугольника

destructor TPaintingObjects.Destroy;
begin
 if FPaintParent<>'' then
  FParentObj.Destroy;

 inherited Destroy;
end; //destructor TPaintingObjects
end.
