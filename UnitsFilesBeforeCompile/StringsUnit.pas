unit StringsUnit;

interface uses SysUtils;

//извлекаем из конца строки единицу измерения для товара
function GetLastNameAndChislo(const str:string;
 var Edin:string; var Chislo:double; GetNext:boolean = false):byte;
//читаем текстовый фапй и возварщаем строку
function GetLoadFromFileString(FileNameWithPath:String):WideString;
//форматируем по своему предствление числа
function MyFormatOfNumber(Number:Double):string;

implementation

//извлекаем из конца строки единицу измерения
function GetLastNameAndChislo(const str:string;
 var Edin:string; var Chislo:double; GetNext:boolean = false):byte;
var
 sim:string[1];
 StrTemp, ShisloStr:string;
 ChisloDoble:double;
 codeOsh:integer;
begin
 Result:=0;
 Chislo:=1;
 StrTemp:=str;
 sim:=copy(StrTemp, Length(StrTemp)-1, 1);
 while (sim<>' ') and (Length(StrTemp)>0) do begin
  StrTemp:=copy(StrTemp, 1, Length(StrTemp)-1);
  sim:=copy(StrTemp, Length(StrTemp)-1, 1);
 end; //извлекаем единицу
 Edin:=copy(str, Length(StrTemp), Length(str)-Length(StrTemp)+1);

 StrTemp:=copy(StrTemp, 1, Length(StrTemp)-1);
 sim:=copy(StrTemp, Length(StrTemp)-1, 1);
 while (sim<>' ') and (Length(StrTemp)>0) do begin
  StrTemp:=copy(StrTemp, 1, Length(StrTemp)-1);
  sim:=copy(StrTemp, Length(StrTemp)-1, 1);
 end; //извлекаем число
 ShisloStr:=copy(str, Length(StrTemp), Length(str)-Length(StrTemp)-Length(Edin));
 val(ShisloStr, ChisloDoble, CodeOsh);
 if CodeOsh=0 then Chislo:=ChisloDoble;
end; //GetLastNameAndChislo

//читаем текстовый фапй и возварщаем строку
function GetLoadFromFileString(FileNameWithPath:String):WideString;
var
 f:TextFile;
 sLine, sFullFile:WideString;
begin
 Result:='';
 AssignFile(f, FileNameWithPath);
 try
  Reset(f);
 except
  exit;
 end;
 try
  sFullFile:=''; sLine:='';
  while not(Eof(f)) do begin
   Readln(f, sLine);
   if sFullFile='' then
    sFullFile:=sLine
   else
    sFullFile:=sFullFile+CHR(13)+CHR(10)+sLine;
  end;
 finally
  closefile(f);
 end;
 Result:=sFullFile;
end; //GetLoadFromFileString

//форматируем по своему предствление числа
function MyFormatOfNumber(Number:Double):string;
begin
 Result:=FloatToStr(Number);
end; //MyFormatOfNumber

end.
