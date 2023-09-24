unit NoScrollUnit;

interface uses Windows, Messages, dbcgrids;

type
  {$IFDEF WIN32}
  WParameter = LongInt;
  {$ELSE}
  WParameter = Word;
  {$ENDIF}
  LParameter = LongInt;

  TPeremOfUnitNoScroll = class
   public
    HandelOfGroups,
     HandleOfSubGropus,
      HandleOfItog,
       HandleOfSchet,
        HandleOfCreatingSchet:hWnd;

    OldWindowProcGropus,
     OldWindowProcSubGropus,
      OldWindowProcItog,
       OldWindowProcSchet,
        OldWindowProcCreatingSchet : Pointer;

    GroupsDBCtrlGrid, ItogDBCtrlGrid,
     SubGroupsDBCtrlGrid, OrderDBCtrlGrid,
      CreatingSchDBCtrlGrid: TDBCtrlGrid;

    PositOfWindow:PWindowPos;
    Orient:TDBCtrlGridOrientation;

    constructor Create;
  end; //class TPeremOfUnitNoScroll
  TNoScrollPanels = class (TDBCtrlGrid)
   public
    property Panel;
  end;

  function NewWindowProc(WindowHandle : hWnd; TheMessage : WParameter;
  ParamW : WParameter; ParamL : LParameter) : LongInt
  {$IFDEF WIN32} stdcall; {$ELSE} ; export; {$ENDIF}


var
 PeremOfUnitNoScroll:TPeremOfUnitNoScroll;

implementation

function NewWindowProc(WindowHandle : hWnd; TheMessage : WParameter;
ParamW : WParameter; ParamL : LParameter) : LongInt
{$IFDEF WIN32} stdcall; {$ELSE} ; export; {$ENDIF}
begin

if Assigned(PeremOfUnitNoScroll) then
with PeremOfUnitNoScroll do begin
 if (TheMessage = WM_WINDOWPOSCHANGING) then begin
  //ParamW:=0; ParamL:=0;
  //GetWindowPos(
  //SetWindowPos(WindowHandle, 0, 0, 0, 10, 20,
  //  SWP_NOZORDER + SWP_NOACTIVATE + SWP_NOREDRAW);
  if ParamW<>0 then
   PositOfWindow:=Pointer(ParamW);
  if ParamL<>0 then begin
   PositOfWindow:=Pointer(ParamL);
   if (PositOfWindow.cx>0) and (PositOfWindow.cx<1000) then
   begin
    if Assigned(ItogDBCtrlGrid) then begin
     //TNoScrollPanels(DelphiAndc1.ItogDBCtrlGrid).FOrientation:=goHorizontal;
     //TNoScrollPanels(DelphiAndc1.ItogDBCtrlGrid).Orientation:=
     // goHorizontal;
     //Orient:=TNoScrollPanels(DelphiAndc1.ItogDBCtrlGrid).Orientation;
     //DelphiAndc1.ItogDBCtrlGrid.Orientation:=goHorizontal;
     //DelphiAndc1.ItogDBCtrlGrid.Orientation:=goVertical;
     //PositOfWindow.cx:=DelphiEx_v15.DelphiAndc1.PriceTable.Width;
     //DelphiAndc1.PriceTable:=DelphiAndc1.PriceTable.ControlStyle + [csOpaque];
    end;
     //PositOfWindow.cx-GetSystemMetrics(SM_CXVSCROLL);
   end;
  end;
  SetScrollRange(WindowHandle,
                1, 0, 0, true);
 end;
 //if (TheMessage = WM_NCCALCSIZE) then begin
 // SetScrollRange(WindowHandle,
 //               1, 0, 0, false);
 //end;
 //if (TheMessage = WM_WINDOWPOSCHANGED) then begin
 // SetScrollRange(WindowHandle,
 //               1, 0, 0, false);
 //end;
 //if (TheMessage = WM_SIZE) then begin
 // SetScrollRange(WindowHandle,
 //               1, 0, 0, false);
 //end;
 if TheMessage = WM_PAINT then begin

  if WindowHandle=HandelOfGroups then begin
   GroupsDBCtrlGrid.Width:=
    GroupsDBCtrlGrid.Width+
     GetSystemMetrics(SM_CXVSCROLL);
   SetWindowPos(WindowHandle, 0, 0, 0,
    GroupsDBCtrlGrid.Width
     -GetSystemMetrics(SM_CXVSCROLL),
      GroupsDBCtrlGrid.Height,
       SWP_NOACTIVATE or
        SWP_NOCOPYBITS or SWP_NOOWNERZORDER or
         SWP_NOREDRAW or SWP_NOSENDCHANGING or SWP_NOMOVE or SWP_NOZORDER);
  end;

  if WindowHandle=HandleOfSubGropus then begin
   SubGroupsDBCtrlGrid.Width:=
    SubGroupsDBCtrlGrid.Width+
     GetSystemMetrics(SM_CXVSCROLL);
   SetWindowPos(WindowHandle, 0, 0, 0,
    SubGroupsDBCtrlGrid.Width
     -GetSystemMetrics(SM_CXVSCROLL),
      SubGroupsDBCtrlGrid.Height,
       SWP_NOACTIVATE or
        SWP_NOCOPYBITS or SWP_NOOWNERZORDER or
         SWP_NOREDRAW or SWP_NOSENDCHANGING or SWP_NOMOVE or SWP_NOZORDER);
  end;

  if WindowHandle=HandleOfItog then begin
   ItogDBCtrlGrid.Width:=
    ItogDBCtrlGrid.Width+
     GetSystemMetrics(SM_CXVSCROLL);

   SetWindowPos(WindowHandle, 0, 0, 0,
    ItogDBCtrlGrid.Width
     -GetSystemMetrics(SM_CXVSCROLL),
      ItogDBCtrlGrid.Height,
       SWP_NOACTIVATE or
        SWP_NOCOPYBITS or SWP_NOOWNERZORDER or
         SWP_NOREDRAW or SWP_NOSENDCHANGING or SWP_NOMOVE or SWP_NOZORDER);
  end;

  if WindowHandle=HandleOfSchet then begin
   OrderDBCtrlGrid.Width:=
    OrderDBCtrlGrid.Width+
     GetSystemMetrics(SM_CXVSCROLL);
   SetWindowPos(WindowHandle, 0, 0, 0,
    OrderDBCtrlGrid.Width
     -GetSystemMetrics(SM_CXVSCROLL),
      OrderDBCtrlGrid.Height,
       SWP_NOACTIVATE or
        SWP_NOCOPYBITS or SWP_NOOWNERZORDER or
         SWP_NOREDRAW or SWP_NOSENDCHANGING or SWP_NOMOVE or SWP_NOZORDER);
  end;

  if WindowHandle=HandleOfCreatingSchet then begin
   CreatingSchDBCtrlGrid.Width:=
    CreatingSchDBCtrlGrid.Width+
     GetSystemMetrics(SM_CXVSCROLL);
   SetWindowPos(WindowHandle, 0, 0, 0,
    CreatingSchDBCtrlGrid.Width
     -GetSystemMetrics(SM_CXVSCROLL),
      CreatingSchDBCtrlGrid.Height,
       SWP_NOACTIVATE or
        SWP_NOCOPYBITS or SWP_NOOWNERZORDER or
         SWP_NOREDRAW or SWP_NOSENDCHANGING or SWP_NOMOVE or SWP_NOZORDER);
  end;

 end; {WM_PAINT}

 if WindowHandle=HandelOfGroups then
  NewWindowProc := CallWindowProc(OldWindowProcGropus, WindowHandle,
   TheMessage, ParamW, ParamL);

 if WindowHandle=HandleOfSubGropus then
  NewWindowProc := CallWindowProc(OldWindowProcSubGropus, WindowHandle,
   TheMessage, ParamW, ParamL);

 if WindowHandle=HandleOfItog then
  NewWindowProc := CallWindowProc(OldWindowProcItog, WindowHandle,
   TheMessage, ParamW, ParamL);

 if WindowHandle=HandleOfSchet then
  NewWindowProc := CallWindowProc(OldWindowProcSchet, WindowHandle,
   TheMessage, ParamW, ParamL);

 if WindowHandle=HandleOfCreatingSchet then
  NewWindowProc := CallWindowProc(OldWindowProcCreatingSchet, WindowHandle,
   TheMessage, ParamW, ParamL);

end; {with PeremOfUnitNoScroll}

end; //NewWindowProc

{TPeremOfUnitNoScroll}

constructor TPeremOfUnitNoScroll.Create;
begin
inherited Create;

 HandleOfCreatingSchet:=0;
end; //TPeremOfUnitNoScroll.Create

end.
