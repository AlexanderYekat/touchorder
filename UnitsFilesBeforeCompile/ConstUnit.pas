unit ConstUnit;

interface

const
 //д р е к т о р и и
  //картинки для групп
  IMAGESGROUPSDIR = 'Images\ImageOfGroups';
  //картинки для под групп
  IMAGESSUBGROUPSDIR = 'Images\ImagesSubGruops';
  //картинки для товаров
  IMAGESGOODS = 'Images\ImageOfGoods';
  //картинки для интерфейса
  INTERFACEIMAGEDIR = 'InterfaceImage';
  //настройки различного рода
  OPTIONSONCREATEANDRESIZEDIR = 'Options';
  //временные базы данных
  DATABASETEMPDIR = 'DataBaseTemp';
  //директория заявок
  ORDERDIR = 'UserData\Orders';
  //директория SQL - запросов
  QUERYSQLDIR = 'SQLQuery';
  //прайса
  //PRICEEXCELNAMEFILE = 'Price';

 //и м е н а    ф а й л о в
  ITOGDBF = 'Itog.dbf';
  SHABLONTABLE = 'ShablonTable.dbf';
  PAINTOPTIONSFILE = 'ResizeingObjects';
  PAINTCALCULATOROPTIONSFILE = 'Clava';
  ADMINOPTIONSFILE = 'AdmOptiopns.txt';
  CONFIGOFBASEFILE = '1cconfig.txt';
  CURRENTOREDERFILE = 'CurrentOrder';
  CREATETOREDERFILE = 'NewOrder';
  CONNECTWITH1CFILE = 'ConnFor1cBase';
  LOCALBASECONNECTTEMPTFILE = 'LocalTemprBase';
 //имена файлов картинок для интерфеса
  ARROWLEFTIMAGEFILE = 'ArrowLeftGroups';
  ARROWRIGHTIMAGEFILE = 'ArrowRightGroups';
  ARROWSUBLEFTIMAGEFILE = 'ArrowLeftSubGroups';
  ARROWSUBRIGHTIMAGEFILE = 'ArrowRightSubGroups';
  SCROLLBEGUNIMAGEFILE = 'BegunOfScroll_Small';
  ADDBUTTONIMAGEFILE = 'ButtonAdd';
  SCROLLUPBUTTONIMAGEFILE = 'ScrollUpButton';
  SCROLLDOWNBUTTONIMAGEFILE = 'ScrollDownButton';
  ALLDELETEBUTTONIMAGEFILE = 'AllDelete';
  DELETEONEBUTTONIMAGEFILE = 'DeleteOne';
  CREATESCHETBUTTONIMAGE = 'CreateSchet';
  PAGEUPPRICEBUTTONIMAGEFILE = 'PageUpPrice';
  PAGEDOWNPRICEBUTTONIMAGEFILE = 'PageDownPrice';
  ROWUPPRICEBUTTONIMAGEFILE = 'RowUpPrice';
  ROWDOWNPRICEBUTTONIMAGEFILE = 'RowDownPrice';
  ROWUPSCHETBUTTONIMAGEFILE = 'RowUpSchet';
  ROWDOWNSCHETBUTTONIMAGEFILE = 'RowDownSchet';
  CHOOSEAMOUNTPRICEIMAGEFILE = 'ChooseAmount';
  INFOPRICEIMAGEFILE = 'InfoButton';
  SHOWADDBUTSPRICEIMAGEFILE = 'ShowAddButs';
  CALCFONBUTTONIMAGEFILE = 'CalculatorPanel';
  TABLOCALCIMAGEFILE = 'Tablo';
  CLEARBUTCALCULIMAGEFILE = 'ClearButton';
  OKCALCBUTTONIMAGEFILE = 'OkButton';
  ZEROCALCBUTTONIMAGEFILE = 'ZeroButton';
  ONECALCBUTTONIMAGEFILE = 'OneButton';
  TWOCALCBUTTONIMAGEFILE = 'TwoButton';
  THREECALCBUTTONIMAGEFILE = 'ThreeButton';
  FOURCALCBUTTONIMAGEFILE = 'FourButton';
  FIVECALCBUTTONIMAGEFILE = 'FiveButton';
  SIXCALCBUTTONIMAGEFILE = 'SixButton';
  SEVENCALCBUTTONIMAGEFILE = 'SevenButton';
  EIGHTCALCBUTTONIMAGEFILE = 'EightButton';
  NINECALCBUTTONIMAGEFILE = 'NineButton';
 //имена файлов SQL - запросов
  GROUPSSQLQUERY = 'groups.txt';
  GENFIRMSQLQUERY = 'GeneralFirm.txt';
  TYPESOFPRICESQLQUERY = 'TypesOfPrice.txt';
  CONTRACTORSSQLQUERY = 'Contractors.txt';
  SUBGROUPSSQLQUERY = 'SubGroups.txt';
  SUBSUBGROUPSSQLQUERY = 'SubSubGroups.txt';
  REZERVSQLQUERY = 'Rezerv.txt';
  PRICESQLQUERY = 'Price.txt';
  ITOGSQLQUERY = 'Itog.txt';
  ADDINITOGRECSQLQUERY = 'CommandInsertInItog.txt';
  ADDINSCHETRECSQLQUERY = 'CommandInsertInSchet.txt';
  CONDITIONSQLFILE = 'ConditionParent.txt';
  SCHETCREATEDSQLFILE = 'SchetCreated.txt';
  SEARCHGROUPSQLFILE = 'SearchGroup.txt';
 //п р о ч е е
  //параметры таблицы шаблона
  MAXCOUNTOFFIELDSINSHABLON = 50;
  MAXCOUNTINNUMBER = 7;

function GetApplicationPath():string;

var
 ApplicPath:string ='';

implementation {uses DelphiEx_v51_02;}

function GetApplicationPath():string;
var
 s:string;
begin
 if ApplicPath='' then begin
  GetDir(0, s);
  Result:=s;
 end else
  Result:=ApplicPath;
end; //

end.
