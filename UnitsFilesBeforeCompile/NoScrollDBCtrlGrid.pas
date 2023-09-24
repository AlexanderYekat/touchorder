unit NoScrollDBCtrlGrid;

interface

uses
  Windows, SysUtils, Classes, Controls, dbcgrids, Messages, Dialogs, Forms,
    Graphics,
      Menus, DB;

type
  TNoScrollDBCtrlGrid = class(TDBCtrlGrid)
  private
   FBitmapCount:Integer;
   FPanelBitmap: HBitmap;
   FPanelDC: HDC;
   FSaveBitmap: HBitmap;
    //procedure WMPaint(var Message: TWMPaint);
  protected
    { Protected declarations }
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure PaintWindow(DC: HDC); override;
    function GetPanelCur():TDBCtrlPanel;
    procedure WMPosChanging(var Message:TMessage); message WM_WINDOWPOSCHANGING;
    //procedure AdjustSize; override;
  public
    { Public declarations }
    property PanelCurrentDrawing:TDBCtrlPanel read GetPanelCur;
    procedure CreatePanelBitmap;
    procedure DestroyPanelBitmap;
    procedure DrawPanel(DC: HDC; Index: Integer);
    procedure DrawPanelBackground(DC: HDC; const R: TRect; Erase, Selected: Boolean);
  published
    { Published declarations }
  end;

procedure Register;

implementation uses DBConsts, VDBConsts;

procedure Register;
begin
  RegisterComponents('Data Controls', [TNoScrollDBCtrlGrid]);
end;

procedure TNoScrollDBCtrlGrid.WMPosChanging(var Message:TMessage);
var
 WinPos:PWindowPos;
begin
 WinPos:=Pointer(Message.LParam);
 //WinPos.cx:=500;
 SetScrollRange(Handle, 1, 0, 0, false);
end; //

procedure TNoScrollDBCtrlGrid.CreateParams(var Params: TCreateParams);
begin
 inherited CreateParams(Params);

 with Params.WindowClass do
    style := style and not (WS_VSCROLL or WS_HSCROLL);
end; //

procedure TNoScrollDBCtrlGrid.CreateWnd;
begin
 inherited;

 SetScrollRange(Handle, 1, 0, 0, false);
 //SetScrollRange(Panel.Handle, 1, 0, 0, false);
end; //

function TNoScrollDBCtrlGrid.GetPanelCur():TDBCtrlPanel;
begin
 Result:=Panel;
end; //

procedure TNoScrollDBCtrlGrid.DrawPanelBackground(DC: HDC; const R: TRect; Erase, Selected: Boolean);
var
  Brush: HBrush;
begin
  if Erase then
  begin
    if Selected then
     Panel.Brush.Color:=SelectedColor
    else Panel.Brush.Color := Color;
    Brush := CreateSolidBrush(ColorToRGB(Panel.Brush.Color));
    FillRect(DC, R, Brush);
    DeleteObject(Brush);
  end;
  if PanelBorder = gbRaised then
    DrawEdge(DC, PRect(@R)^, BDR_RAISEDINNER, BF_RECT);
end;

procedure TNoScrollDBCtrlGrid.PaintWindow(DC: HDC);
var
  I: Integer;
  Brush: HBrush;
  R:TRect;
begin

  Panel.Width:=Width; //Width;

  Width:=Width+GetSystemMetrics(SM_CXVSCROLL);//Width+17;

  SetWindowPos(Handle, 0, 0, 0, Width-GetSystemMetrics(SM_CXVSCROLL), Height, SWP_NOACTIVATE or
   SWP_NOCOPYBITS or SWP_NOOWNERZORDER or
    SWP_NOREDRAW or SWP_NOSENDCHANGING or SWP_NOMOVE or SWP_NOZORDER);

  Inherited PaintWindow(DC);


  Exit;


  //inherited PaintWindow(DC);

  //exit;
  if csDesigning in ComponentState then
  begin
    Panel.Update;
    Brush := CreateHatchBrush(HS_BDIAGONAL, ColorToRGB(clBtnShadow));
    SetBkColor(DC, ColorToRGB(Color));
    FillRect(DC, ClientRect, Brush);
    DeleteObject(Brush);
    for I := 1 to ColCount * RowCount - 1 do begin
      R:=Panel.ClientRect;
      R.Right:=R.Right-I*10;
      DrawPanelBackground(DC, R, False, False);
    end;
  end else
  //begin
  //  CreatePanelBitmap;
  //  try
  //    for I := 0 to ColCount * RowCount - 1 do
  //      if (PanelCount <> 0) and (I = PanelIndex) then
  //        Panel.Update else
  //       DrawPanel(DC, I);
  //  finally
  //    DestroyPanelBitmap;
  //  end;
  //end;
  { When width or height are not evenly divisible by panel size, fill the gaps }
  if HandleAllocated then
  begin
    if (Height <> Panel.Height * RowCount) then
    begin
      Brush := CreateSolidBrush(ColorToRGB(Color));
      FillRect(DC, Rect(0, Panel.Height * RowCount, Width, Height), Brush);
      DeleteObject(Brush);
    end;
    if (Width <> Panel.Width * ColCount) then
    begin
      Brush := CreateSolidBrush(ColorToRGB(Color));
      FillRect(DC, Rect(Panel.Width * ColCount, 0, Width, Height), Brush);
      DeleteObject(Brush);
    end;
  end;
end; //


procedure TNoScrollDBCtrlGrid.CreatePanelBitmap;
var
  DC: HDC;
begin
  if FBitmapCount = 0 then
  begin
    DC := GetDC(0);
    FPanelBitmap := CreateCompatibleBitmap(DC, Panel.Width, Panel.Height);
    ReleaseDC(0, DC);
    FPanelDC := CreateCompatibleDC(0);
    FSaveBitmap := SelectObject(FPanelDC, FPanelBitmap);
  end;
  Inc(FBitmapCount);
end;

procedure TNoScrollDBCtrlGrid.DestroyPanelBitmap;
begin
  Dec(FBitmapCount);
  if FBitmapCount = 0 then
  begin
    SelectObject(FPanelDC, FSaveBitmap);
    DeleteDC(FPanelDC);
    DeleteObject(FPanelBitmap);
  end;
end;

procedure TNoScrollDBCtrlGrid.DrawPanel(DC: HDC; Index: Integer);
var
  SaveActive: Integer;
  R: TRect;
begin
  R := Panel.ClientRect;
  if Index < PanelCount then
  begin
    //SaveActive := FDataLink.ActiveRecord;
    //FDataLink.ActiveRecord := Index;
    Panel.PaintTo(FPanelDC, 0, 0);
    //FDataLink.ActiveRecord := SaveActive;
  end else
    DrawPanelBackground(FPanelDC, Panel.ClientRect, True, False);
  BitBlt(DC, R.Left, R.Top, R.Right - R.Left, R.Bottom - R.Top,
    FPanelDC, 0, 0, SRCCOPY);
end;

//procedure TNoScrollDBCtrlGrid.WMPaint(var Message: TWMPaint);
//begin
 //Exit;
 // PaintHandler(Message);
//end;

end.


