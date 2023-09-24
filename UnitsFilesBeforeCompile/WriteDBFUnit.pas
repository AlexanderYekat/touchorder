unit WriteDBFUnit;

interface uses SysUtils, ADODB, DateUtils;

  function RewriteItogDBF(ApplicPath:string; CountOfRecord:LongWord):byte;
  function ClearMassive(MassiveOfValue:pointer):byte;
  function InsertRecordToItogDBF(MassiveOfValue:pointer;
                      AddRecordNoPlan:boolean=false):byte;
  function closeItogDBF():byte;

var
 MassiveOfFields:array of PChar;
 MassiveSizeOfFields:array of byte;
 AddedRecords:integer=0;
 TodayIsDay:TDateTime;
 YearTod, MonthTod, DayToday:Word;

implementation uses ConstUnit;

var
 f:File of byte;
 WritingByte:Byte;
 MassiveOfRazmern: array [0..MAXCOUNTOFFIELDSINSHABLON] of Byte;

function RewriteItogDBF(ApplicPath:string; CountOfRecord:LongWord):byte;
var
 fShabl:File of byte;
 ReadedByte, i:byte;
 ColPoley:Word;
 ColZapiseyPLW:^LongWord;
 ColZapiseyPCh:PChar;
begin
 AddedRecords:=0;
 TodayIsDay:=Today;
 DecodeDate(TodayIsDay, YearTod, MonthTod, DayToday);
 Result:=0;
 AssignFile(f, ApplicPath+'\'+DATABASETEMPDIR+'\'
               +ITOGDBF);

 AssignFile(fShabl, ApplicPath+'\'+
                    OPTIONSONCREATEANDRESIZEDIR+'\'+
                    SHABLONTABLE);
 Reset(fShabl);
 Rewrite(f);
 try
  //создаем заголовок DBF-файла
  //форрмат таблицы DBF
  read(fShabl, ReadedByte);
  ReadedByte:=3;
  write(f, ReadedByte);
  //дата файла
  //год
  read(fShabl, ReadedByte);
  ReadedByte:=YearTod; //год текущий
  write(f, ReadedByte);
  //месяц
  read(fShabl, ReadedByte);
  ReadedByte:=MonthTod; //месяц текущий
  write(f, ReadedByte);
  //день
  read(fShabl, ReadedByte);

  ReadedByte:= DayToday; //день сегодняшеий
  write(f, ReadedByte);


  read(fShabl, ReadedByte);
  read(fShabl, ReadedByte);
  read(fShabl, ReadedByte);
  read(fShabl, ReadedByte);

  GetMem(ColZapiseyPLW, SizeOf(LongWord));

  ColZapiseyPLW^:=CountOfRecord;
  ColZapiseyPCh:=@(ColZapiseyPLW^);

  WritingByte:=Ord(ColZapiseyPCh[0]);
  write(f, WritingByte);
  WritingByte:=Ord(ColZapiseyPCh[1]);
  write(f, WritingByte);
  WritingByte:=Ord(ColZapiseyPCh[2]);
  write(f, WritingByte);
  WritingByte:=Hi(CountOfRecord);
  write(f, WritingByte);

  FreeMem(ColZapiseyPLW, SizeOf(LongWord));
  //прочая чушь
  for i:=9 to 32 do begin
   read(fShabl, ReadedByte);
   write(f, ReadedByte);
  end;
  //создаем поля
  Read(fShabl, ReadedByte);
  //цикла по полям
  ColPoley:=0;
  while (ReadedByte<>13) and not(Eof(fShabl)) do begin
   Write(f, ReadedByte);
   for i:=2 to 17 do begin
    Read(fShabl, ReadedByte);
    Write(f, ReadedByte);
   end;
   MassiveOfRazmern[ColPoley]:=ReadedByte;
   Read(fShabl, ReadedByte);
   Write(f, ReadedByte);
   //if ReadedByte<>0 then
   // MassiveOfRazmern[ColPoley]:=MassiveOfRazmern[ColPoley]+ReadedByte-1;
   for i:=19 to 32 do begin
    Read(fShabl, ReadedByte);
    Write(f, ReadedByte);
   end;
   Inc(ColPoley);
   Read(fShabl, ReadedByte);
  end; //цикла по полям
  //начало записей
  Write(f, ReadedByte);
  //переход к следующей записи
  //Read(fShabl, ReadedByte);

  setLength(MassiveOfFields, ColPoley);
  SetLength(MassiveSizeOfFields, ColPoley);
  for i:=Low(MassiveOfFields) to High(MassiveOfFields) do
  begin
   if i=2 then MassiveOfRazmern[i]:=MassiveOfRazmern[i]+1; //пробуем-и-исправляем исправить глюк
   //if i=8 then MassiveOfRazmern[i]:=MassiveOfRazmern[i]+1; //пробуем-и-исправляем исправить глюк
   GetMem(MassiveOfFields[i], MassiveOfRazmern[i]);
   MassiveSizeOfFields[i]:=MassiveOfRazmern[i];
  end; //цикл for по полям
 except
  Result:=1;
 end;
 closefile(fShabl);
end; //RewriteItogDBF():byte;

function ClearMassive(MassiveOfValue:pointer):byte;
var
 i, j:byte;
 SizeOfZapis:byte;
begin
 for i:=Low(MassiveOfFields) to High(MassiveOfFields) do
 begin
  SizeOfZapis:=MassiveSizeOfFields[i];
  //if (i=2) then SizeOfZapis:=SizeOfZapis-1;
  //if (i=8) then SizeOfZapis:=SizeOfZapis-3;
  for j:=0 to (SizeOfZapis-1) do begin
   //WritingByte:=Ord(MassiveOfFields[i][j]);
   MassiveOfFields[i][j]:='0';
   //if WritingByte=0 then WritingByte:=Ord(' ');
   //write(f, WritingByte);
  end;
 end;
 Result:=0;
end; //ClearMassive(MassiveOfValue:pointer):byte;

function InsertRecordToItogDBF(MassiveOfValue:pointer;
                        AddRecordNoPlan:boolean=false):byte;
var
 i, j:byte;
 SizeOfZapis:byte;
begin
 Result:=0;

 WritingByte:=Ord(' ');
 Write(f, WritingByte);
 SizeOfZapis:=0;

 for i:=Low(MassiveOfFields) to High(MassiveOfFields) do
 begin
  SizeOfZapis:=MassiveSizeOfFields[i];
  if (i=2) then SizeOfZapis:=SizeOfZapis-1;
  //if (i=8) then SizeOfZapis:=SizeOfZapis-3;
  for j:=0 to (SizeOfZapis-1) do begin
   WritingByte:=Ord(MassiveOfFields[i][j]);
   if WritingByte=0 then WritingByte:=Ord(' ');
   write(f, WritingByte);
  end;
 end;
 if AddRecordNoPlan then
  Inc(AddedRecords);
end; //InsertRecordToItogDBF():byte;

function closeItogDBF():byte;
var
 i:word;
begin
 Result:=0;

 for i:=Low(MassiveOfFields) to High(MassiveOfFields) do
 begin
  //try
   FreeMem(MassiveOfFields[i], MassiveSizeOfFields[i]);
  //except
  //end;
 end; //цикл for по полям

 WritingByte:=$1A;
 Write(f, WritingByte);

 closeFile(f);

 //переписываем файл, если добавили
 //лишних записей
 if AddedRecords<>0 then begin

 end;
end; //closeItogDBF():byte;

end.
