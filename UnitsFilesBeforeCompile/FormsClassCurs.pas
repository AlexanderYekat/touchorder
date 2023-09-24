unit FormsClassCurs;

interface uses Forms, ExtCtrls, Controls;

type
TMyCursorForms = class (TForm)
 private
 protected
  FCursorVisible:boolean;
  procedure SetCursorZnach(Cont:TWinControl; Znach:integer);
 public
  procedure Show(CurrentCursorVisible:boolean);
  function SetCurrentCursor(CurrentCursorVisible:boolean):integer;
  //ShowModal
end;

implementation


function TMyCursorForms.SetCurrentCursor(CurrentCursorVisible
                                         :boolean):integer;
var
 i:integer;
begin
 Result:=Cursor;
 //if FCursorVisible<>CurrentCursorVisible then begin
  FCursorVisible:=CurrentCursorVisible;
  if (FCursorVisible) and (Cursor=-1) then begin
   Cursor:=0;
   DragCursor:=crDrag;
   for i:=0 to ControlCount-1 do begin
    Controls[i].Cursor:=0;
    if (Controls[i] is TImage) then
     (Controls[i] as TImage).DragCursor:=crDrag;
    if Controls[i] is TWinControl then
     SetCursorZnach((Controls[i] as TWinControl), 0);
   end;
  end; //if FCursorVisible=true

  if (FCursorVisible=false) and (Cursor=0) then begin
   Cursor:=-1;
   DragCursor:=-1;
   for i:=0 to ControlCount-1 do begin
    Controls[i].Cursor:=-1;
    if (Controls[i] is TImage) then
     (Controls[i] as TImage).DragCursor:=-1;
    if Controls[i] is TWinControl then begin
     SetCursorZnach((Controls[i] as TWinControl), -1);
    end;
   end;
  end;
 //end;
end; //

procedure TMyCursorForms.Show(CurrentCursorVisible:boolean);
begin
 SetCurrentCursor(CurrentCursorVisible);

 inherited Show;
end;

procedure TMyCursorForms.SetCursorZnach(Cont:TWinControl; Znach:integer);
var
 i:integer;
begin
 for i:=0 to Cont.ControlCount-1 do begin
  Cont.Controls[i].Cursor:=Znach;
  if Znach=-1 then
   if (Controls[i] is TImage) then
     (Controls[i] as TImage).DragCursor:=-1;
  if Znach<>-1 then if (Controls[i] is TImage) then
     (Controls[i] as TImage).DragCursor:=crDrag;
  if Cont.Controls[i] is TWinControl then
   SetCursorZnach((Cont.Controls[i] as TWinControl), Znach);
 end;
end; //


end.
