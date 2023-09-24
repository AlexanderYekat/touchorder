unit WithBaseWorkAnyProcUnit;

interface uses SysUtils, ADODB, DB, Classes,
               Graphics, StdCtrls;

type
 PBoolean = ^boolean;

//получаем список групп спрятанных за экраном
function PoluchitSpisokGroupAfterClick(const CurForm:TComponent;
                 var sLeft, sRight:string;
                 LabelCompL, LabelCompR:TLabel;
                 CurPanelInd:integer; BaseGroups:TCustomADODataSet;
                 CountPanInCtrGr:integer;
                 ChangingSystemGr:PBoolean):byte;

//подстройка ширины Label по необходимую ширину
function TweakingByWidth(LabelComp:TFont; var Nadpis:string;
                         WidthOfLab:integer; LeftNadp:boolean = true):byte;

var
 CloneGroupsTable:TCustomADODataSet;

implementation

//подстройка ширины Label по необходимую ширину
function TweakingByWidth(LabelComp:TFont; var Nadpis:string;
                         WidthOfLab:integer; LeftNadp:boolean = true):byte;
var
 Canva:TLabel;
 WidthOneChar:Double;
 CountOfChar:integer;
 FirstStr:string; PChFirst:PChar; CharFirst:Char;
 PosOfSpaceBar:integer;
 ShortageChars:integer;
 i:integer;
 ShelpL, ShelpR:string;
 PosFindedInCaption:boolean;
begin
 Result:=0;
 Canva:=TLabel.Create(nil);
 Canva.Font:=LabelComp;
 Canva.Caption:=Nadpis;
 Canva.AutoSize:=false;
 Canva.AutoSize:=true;
 if Canva.Width<=WidthOfLab then Exit;

 WidthOneChar:=0;
 if Length(Canva.Caption)<>0 then
  WidthOneChar:=Canva.Width/Length(Canva.Caption);

 CountOfChar:=0;
 if WidthOneChar<>0 then begin
  CountOfChar:=Trunc((Canva.Width-WidthOfLab)/WidthOneChar);
  if Trunc((Canva.Width-WidthOfLab)/WidthOneChar)<
   ((Canva.Width-WidthOfLab)/WidthOneChar) then
  CountOfChar:=Trunc((Canva.Width-WidthOfLab)/WidthOneChar)+1;
 end;

 if CountOfChar>0 then begin
  if LeftNadp then begin
   Canva.Caption:=copy(Canva.Caption, 1,
    Length(Canva.Caption)-CountOfChar-3);
   Canva.Caption:=Canva.Caption+'...'
  end else begin
   Canva.Caption:=copy(Canva.Caption, CountOfChar+3+1,
    Length(Canva.Caption)-CountOfChar-3);
   FirstStr:=Canva.Caption;
   PChFirst:=PChar(FirstStr);
   CharFirst:=PChFirst^;
   if ('A'<=CharFirst) and (CharFirst<='Я') or
      (CharFirst='Ё') or (CharFirst=' ') then
    Canva.Caption:='...'+Canva.Caption
   else begin
    PosOfSpaceBar:=Pos(' ', Canva.Caption);
    if PosOfSpaceBar>0 then begin
     Canva.Caption:=copy(Canva.Caption, PosOfSpaceBar+1,
      Length(Canva.Caption)-PosOfSpaceBar);
     FirstStr:=Canva.Caption;
     PChFirst:=Pointer(FirstStr); CharFirst:=PChFirst^;
     if ('A'<=CharFirst) and (CharFirst<='Я') or
       (CharFirst='Ё') or (CharFirst=' ') then
      Canva.Caption:='...'+Canva.Caption
     else begin
      PosOfSpaceBar:=Pos(' ', Canva.Caption);
      if PosOfSpaceBar>0 then begin
       Canva.Caption:=copy(Canva.Caption, PosOfSpaceBar+1,
        Length(Canva.Caption)-PosOfSpaceBar);
       FirstStr:=Canva.Caption;
       PChFirst:=Pointer(FirstStr); CharFirst:=PChFirst^;
       if ('A'<=CharFirst) and (CharFirst<='Я') or
         (CharFirst='Ё') or (CharFirst=' ') then
        Canva.Caption:='...'+Canva.Caption
      end;
     end;
    end; //если нашли пробел
   end; //для правой надписи
  end; //левая или правая надпись
 end; //CountOfChar>0 - есть сиволы за пределами видмости

 if not(LeftNadp) then begin
  ShortageChars:=0;
  if WidthOneChar<>0 then
   ShortageChars:=Trunc((WidthOfLab-Canva.Width)/WidthOneChar);
  ShelpR:=''; ShelpL:='';
  while ShortageChars>1 do begin
   //for i:=0 to 3 do begin
    PosFindedInCaption:=true;
    if ShelpR='' then
     PosOfSpaceBar:=Pos('  ', Canva.Caption)
    else begin
     PosOfSpaceBar:=Pos('  ', ShelpR);
     if PosOfSpaceBar>0 then PosFindedInCaption:=false;
    end;
    if PosOfSpaceBar=0 then begin
     if ShelpR='' then
      PosOfSpaceBar:=Pos(' ', Canva.Caption)
     else begin
      PosOfSpaceBar:=Pos(' ', ShelpR);
      if PosOfSpaceBar>0 then PosFindedInCaption:=false;
     end;
    end;
    if (ShelpR<>'') and (PosOfSpaceBar=0) then begin
     PosOfSpaceBar:=Pos('  ', Canva.Caption);
    end;

    if PosOfSpaceBar=0 then Break;

    if PosOfSpaceBar>0 then begin
     if not(PosFindedInCaption) then
      PosOfSpaceBar:=Length(ShelpL)+PosOfSpaceBar;
     ShelpL:=copy(Canva.Caption, 1,
        PosOfSpaceBar);
     ShelpR:=copy(Canva.Caption, PosOfSpaceBar+1,
        Length(Canva.Caption)-PosOfSpaceBar);
     Canva.Caption:=ShelpL+' '+ShelpR;
     ShelpL:=ShelpL+' ';
     PosOfSpaceBar:=Pos(' ', ShelpR);
     while (Length(ShelpR)>2) and (PosOfSpaceBar=1) do
     begin
      ShelpL:=ShelpL+copy(ShelpR, 1, 1);
      ShelpR:=copy(ShelpR, 2,
                   Length(ShelpR)-1);
      PosOfSpaceBar:=Pos(' ', ShelpR);
     end;
    end; {Pos пробелов >0}
    ShortageChars:=Trunc((WidthOfLab-Canva.Width)/WidthOneChar);
   //end; {for}
  end; {while}
 end; {}
 Nadpis:=Canva.Caption;

 Canva.Destroy;
end; //TweakingByWidth

//получаем список групп спрятанных за экраном
function PoluchitSpisokGroupAfterClick(const CurForm:TComponent;
                 var sLeft, sRight:string;
                 LabelCompL, LabelCompR:TLabel;
                 CurPanelInd:integer; BaseGroups:TCustomADODataSet;
                 CountPanInCtrGr:integer;
                 ChangingSystemGr:PBoolean):byte;
var
 RecNomCon:integer;

 //Sdvig:integer;
 ColZapiLeft, ColZapRight:integer;
 i:integer;

 LabelWidth, AddLabelWidth:TLabel;
 WidthOneChar:Double;
 CountOfChar:integer;

 ExcessBool:boolean;
 SeparatorStr:String;
 AddNadpStr:String;
begin
 if Not(Assigned(CloneGroupsTable)) then
  CloneGroupsTable:=TCustomADODataSet.Create(CurForm);
 CloneGroupsTable.Clone(BaseGroups);
 Result:=0;
 SeparatorStr:='   ';

 {Sdvig:=CurPanelInd+1-Round(CountPanInCtrGr/2);}
 ColZapiLeft:=BaseGroups.RecNo-(CurPanelInd+1);
 ColZapRight:=BaseGroups.RecordCount-ColZapiLeft-CountPanInCtrGr;

 {if (Sdvig>0) and (ColZapRight<Sdvig) then Sdvig:=ColZapRight;
 if (Sdvig<0) and (ColZapiLeft<Abs(Sdvig)) then Sdvig:=-ColZapiLeft;}

 {if ((Sdvig<>0) or ((sLeft='Nothing') and (sRight='Nothing'))) then begin}
  sLeft:='';
  sRight:='';
  {RecNomCon:=ColZapiLeft+Sdvig;}
  RecNomCon:=ColZapiLeft; //
  CloneGroupsTable.First;
  CloneGroupsTable.MoveBy(RecNomCon-1);
  i:=RecNomCon;
  LabelWidth:=TLabel.Create(nil);
  AddLabelWidth:=TLabel.Create(nil);
  LabelWidth.Font:=LabelCompL.Font;
  AddLabelWidth.Font:=LabelCompL.Font;
  LabelWidth.Caption:='';
  AddLabelWidth.Caption:='';
  LabelWidth.AutoSize:=true;
  AddLabelWidth.AutoSize:=true;
  ExcessBool:=false;
  AddNadpStr:='';
  WidthOneChar:=0; CountOfChar:=0;
  while (i>=1) do begin
   if sLeft='' then sLeft:='<<';
   if sLeft<>'' then sLeft:=sLeft+SeparatorStr;
   {if not(ExcessBool) then
    if LabelWidth.Width>LabelCompL.Constraints.MaxWidth then begin
     sLeft:=Copy(sLeft, 1, Length(sLeft)-Length(SeparatorStr))+'...';
     ExcessBool:=true;
    end;}
   if not(ExcessBool) then begin
    AddNadpStr:=Trim(CloneGroupsTable.FieldByName('DESCR').AsString);
    AddLabelWidth.Caption:=AddNadpStr;
    sLeft:=sLeft+AddNadpStr;
   end;
   LabelWidth.Caption:=sLeft;
   {if not(ExcessBool) then
    if LabelWidth.Width>LabelCompL.Constraints.MaxWidth then begin
     CountOfChar:=0;
     if Length(AddLabelWidth.Caption)<>0 then
      WidthOneChar:=AddLabelWidth.Width/Length(AddLabelWidth.Caption);
     if WidthOneChar<>0 then
      CountOfChar:=Trunc((LabelWidth.Width-LabelCompL.Constraints.MaxWidth)/
                          WidthOneChar);
     sLeft:=Copy(sLeft, 1, Length(sLeft)-
      Length(AddNadpStr));
     if CountOfChar>3 then
      AddNadpStr:=Copy(AddNadpStr, 1, CountOfChar-3)
     else AddNadpStr:='';
     sLeft:=sLeft+AddNadpStr;
     LabelWidth.Caption:=sLeft;
     if CountOfChar=2 then sLeft:=Copy(sLeft, 1, Length(sLeft)-1);
     if CountOfChar=1 then sLeft:=Copy(sLeft, 1, Length(sLeft)-2);
     if CountOfChar=0 then sLeft:=Copy(sLeft, 1, Length(sLeft)-3);
     sLeft:=sLeft+'...';
     ExcessBool:=true;
    end; //}
   CloneGroupsTable.Prior;
   Dec(i);
  end;
  {RecNomCon:=CloneGroupsTable.RecordCount-ColZapRight+Sdvig+1;}
  RecNomCon:=CloneGroupsTable.RecordCount-ColZapRight+1; //
  while (CloneGroupsTable.RecNo<RecNomCon) and not(CloneGroupsTable.Eof)
         and (CloneGroupsTable.RecNo<=CloneGroupsTable.RecordCount) do
   CloneGroupsTable.Next;
  while not(CloneGroupsTable.Eof) and
      (CloneGroupsTable.RecNo<=CloneGroupsTable.RecordCount) do begin
   if sRight='' then sRight:='>>';
   if sRight<>'' then sRight:=SeparatorStr+sRight;
   sRight:=Trim(CloneGroupsTable.FieldByName('DESCR').AsString)
           +sRight;
   CloneGroupsTable.Next;
  end;
  AddLabelWidth.Destroy;
  LabelWidth.Destroy;
 //CloneGroupsTable.Destroy;

end; //function PoluchitSpisokGroupAfterClick

end.
