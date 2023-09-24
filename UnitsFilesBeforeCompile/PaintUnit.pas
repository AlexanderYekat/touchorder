unit PaintUnit;

interface uses Windows;
type

TArrOfPoints = Array of TPoint;

function CompileDrawSelected(xLeft, xRight, yTop,
                             yBottom:LongInt; ResArray:pointer;
                             ColPoints:integer=18):byte;
function SetXCoordOfArrayOfPoint(xLeft:LongInt;
       ChangingResArray:pointer; SizeOfArr:integer=18):byte;

implementation

function CompileDrawSelected(xLeft, xRight, yTop,
                             yBottom:LongInt; ResArray:pointer;
                             ColPoints:integer=18):byte;
var
 i:longint;
 PointArr:Array of TPoint;
 ColLeftPoints, ColRightPoints:integer;
 r:LongInt;
begin
 PointArr:=ResArray;
 r:=yBottom-yTop;
 ColLeftPoints  := Round(ColPoints/2);
 ColRightPoints := ColPoints-ColLeftPoints;
 for i:=0 to ColLeftPoints-1 do begin
  PointArr[i].X:=Round(xLeft-r+r*cos(i*(Pi/2)/(ColLeftPoints-1)));
  PointArr[i].Y:=Round(yTop+r*sin(i*(Pi/2)/(ColLeftPoints-1)));
 end;
 for i:=0 to ColRightPoints-1 do begin
  PointArr[ColLeftPoints+i].X:=Round(xRight+r+r*cos(Pi/2+i*(Pi/2)/(ColRightPoints-1)));
  PointArr[ColLeftPoints+i].Y:=Round(yBottom-r+r*sin(Pi/2+i*(Pi/2)/(ColRightPoints-1)));
 end;
 Result:=0;
end; //CompileDrawSelected

function SetXCoordOfArrayOfPoint(xLeft:LongInt;
         ChangingResArray:pointer; SizeOfArr:integer=18):byte;
var
 i:integer;
 PointArr:Array of TPoint;
 ColLeftPoints, ColRightPoints:integer;
 Delta:LongInt;
begin
 PointArr:=ChangingResArray;
 ColLeftPoints:=Round(SizeOfArr/2);
 ColRightPoints := SizeOfArr-ColLeftPoints;
 Delta:=PointArr[0].X-xLeft;
 for i:=0 to SizeOfArr-1 do
  PointArr[i].X:=PointArr[i].X-Delta;
 Result:=0;
end; //SetXCoordOfArrayOfPoint

end.
