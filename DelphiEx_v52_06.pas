unit DelphiEx_v52_06;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, ValEdit, DBCtrls, ADODB,
  dbcgrids, ExtCtrls, Math, Buttons, jpeg, PaintObjectsUnit, ImgList,
  StrUtils, XPMan;

const
 PixelCountMax = 32768;
 TIMEOFDARKENINGINSEC = 5;

type
  pRGBArray = ^TRGBArray;
  TRGBArray = ARRAY[0..PixelCountMax-1] OF TRGBTriple;

  TBaseObj = class(TObject)
   protected
    FPathToBase:string;
    procedure SetPathToBase(Value:string);
   public
    property PathToBase:string read FPathToBase
     write SetPathToBase;
    constructor Create;
  end; //class TBaseObj
  TRPoplavok = record
   FHeight:integer;
   FTopParent:Integer;
   FTop:Integer;
   FMaxHeight:integer;
   FMinHeight:integer;
   FVisivle:boolean;
  end; //запись TRPoplavok

  TDelphiAndc1 = class(TForm)
    DataBaseADOConnection: TADOConnection;
    GroupsADOQuery: TADOQuery;
    GroupsDataSource: TDataSource;
    GroupsDBText: TDBText;
    SubGroupsDataSource: TDataSource;
    SubGroupsDBCtrlGrid: TDBCtrlGrid;
    SubGroupsDBText2: TDBText;
    AvtorizPanel: TPanel;
    ContragComboBox: TComboBox;
    PriceADOQuery: TADOQuery;
    ItogDataSource: TDataSource;
    SubGroupsADOQuery: TADOQuery;
    ItogDBCtrlGrid: TDBCtrlGrid;
    DescrItDBText: TDBText;
    LeftImage: TImage;
    RightImage: TImage;
    LeftGroupsLabel: TLabel;
    RightGrLabel: TLabel;
    LeftSubImage: TImage;
    SubRightImage: TImage;
    GroupImage: TImage;
    OptionsADOConnection: TADOConnection;
    PaintOptionADOQuery: TADOQuery;
    SubGroupImage: TImage;
    Add10Image: TImage;
    GroupsImageList: TImageList;
    Add5Image: TImage;
    Add1Image: TImage;
    NalychStaticText: TLabel;
    EdItogStaticText: TLabel;
    PriceItStaticText: TLabel;
    HistDateStaticText: TLabel;
    ColItStaticText: TLabel;
    UserADOConnection: TADOConnection;
    OrderADODataSet: TADODataSet;
    OrderADOCommand: TADOCommand;
    OrderDataSource: TDataSource;
    TempOrderADODataSet: TADODataSet;
    OrderADOTable: TADOTable;
    OrderDBCtrlGrid: TDBCtrlGrid;
    AllDeleteImage: TImage;
    NameOfSchetDBText: TDBText;
    PriceOfSchetDBText: TDBText;
    SummDBText: TDBText;
    CountAndEdSchetLabel: TLabel;
    OneDeleteImage: TImage;
    CreateSchUpLabel: TLabel;
    CreateSchDownLabel: TLabel;
    GroupsDBCtrlGrid: TDBCtrlGrid;
    SubGroupsDBText: TLabel;
    ScrollBarImage: TImage;
    ScrollBegunImage: TImage;
    ScrollUpButtonImage: TImage;
    ScrollDownButtonImage: TImage;
    FirmaADOQuery: TADOQuery;
    ContagentADOQuery: TADOQuery;
    TypeOfCenADOQuery: TADOQuery;
    SubSubGroupsADOQuery: TADOQuery;
    SubSubGroupsDataSource: TDataSource;
    RezervADOQuery: TADOQuery;
    ItogADOQuery: TADOQuery;
    ItogAddADOCommand: TADOCommand;
    ItogDeleteADOCommand: TADOCommand;
    LocalADOConnection: TADOConnection;
    SummItogSchetLabel: TLabel;
    NadpSummItogSchetLabel: TLabel;
    CreateSchetImage: TImage;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    XPManifest: TXPManifest;
    NadpWeigthItogSchetLabel: TLabel;
    WeightItogSchetLabel: TLabel;
    NadpBulkItogSchetLabel: TLabel;
    BulkItogSchetLabel: TLabel;
    PageUpPriceImage: TImage;
    PageDownPriceImage: TImage;
    RowUpPriceImage: TImage;
    RowDownPriceImage: TImage;
    RowUpSchetImage: TImage;
    RowDownSchetImage: TImage;
    PageUpDownPriceLabel: TLabel;
    RowUpDownPriceLabel: TLabel;
    ChooseAmountImage: TImage;
    InfoPriceImage: TImage;
    ShowAddButImage: TImage;
    SubPanelBlickTopImage: TImage;
    NameOfGroupImage: TImage;
    DefineWidthOfNameTovLabel: TLabel;
    ColOfButtonsShape: TShape;
    DefineWidthSubGroupNameLabel: TLabel;
    SearchTovADOQuery: TADOQuery;
    SearchSubGrADOQuery: TADOQuery;
    SearchGroupADOQuery: TADOQuery;
    DarkeningTimer: TTimer;
    EntryImage: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LeftGropuBitBtnClick(Sender: TObject);
    procedure RightGroupBitBtnClick(Sender: TObject);
    procedure GroupsDataSourceDataChange(Sender: TObject; Field: TField);
    procedure SubGroupsDataSourceDataChange(Sender: TObject;
      Field: TField);
    procedure LeftImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LeftImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RightImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RightImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LeftSubImageClick(Sender: TObject);
    procedure SubRightImageClick(Sender: TObject);
    procedure GroupsDBCtrlGridPaintPanel(DBCtrlGrid: TDBCtrlGrid;
      Index: Integer);
    procedure ItogDBCtrlGridPaintPanel(DBCtrlGrid: TDBCtrlGrid;
      Index: Integer);
    procedure FormPaint(Sender: TObject);
    procedure LeftSubImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LeftSubImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SubRightImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SubRightImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure Add1ImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure OrderDBCtrlGridPaintPanel(DBCtrlGrid: TDBCtrlGrid;
      Index: Integer);
    procedure AllDeleteImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure OneDeleteImageClick(Sender: TObject);
    procedure SubGroupsDBCtrlGridPaintPanel(DBCtrlGrid: TDBCtrlGrid;
      Index: Integer);
    procedure ItogDataSourceDataChange(Sender: TObject; Field: TField);
    procedure ScrollBegunImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ScrollBegunImageMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ScrollBegunImageMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure ScrollUpButtonImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ScrollDownButtonImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ScrollBegunImageDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure ScrollBarImageDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ItogDBCtrlGridDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure OrderDBCtrlGridDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure ScrollBarImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Add1ImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ScrollUpButtonImageMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ScrollDownButtonImageMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AllDeleteImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OneDeleteImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OneDeleteImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CreateSchetImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure CreateSchetImageMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure GroupsDBCtrlGridMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OrderDataSourceDataChange(Sender: TObject; Field: TField);
    procedure PageUpPriceImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PageUpPriceImageMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PageDownPriceImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PageDownPriceImageMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RowUpPriceImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RowUpPriceImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RowDownPriceImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RowDownPriceImageMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RowUpSchetImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RowUpSchetImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RowDownSchetImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RowDownSchetImageMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ChooseAmountImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ChooseAmountImageMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure InfoPriceImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure InfoPriceImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ShowAddButImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ShowAddButImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ItogDBCtrlGridMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OrderDBCtrlGridMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OrderDBCtrlGridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure NameOfSchetDBTextClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GroupImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure NameOfGroupImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RightGrLabelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SubGroupImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SubGroupsDBTextMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DefineWidthSubGroupNameLabelMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SummItogSchetLabelMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure NadpSummItogSchetLabelMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BulkItogSchetLabelMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure NadpWeigthItogSchetLabelMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure NadpBulkItogSchetLabelMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SubGroupsDBCtrlGridMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DarkeningTimerTimer(Sender: TObject);
    procedure EntryImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
  protected
   FBaseObj:TBaseObj;
   FCursorVisible:boolean;
   FRPoplavok:TRPoplavok;
   procedure SetBaseObj(Value:TBaseObj);
   function GetBaseObj:TBaseObj;
   procedure SetCursorVisible(Value:boolean);
  public
    { Private declarations }
    General, PanelOfGroups, PanelOfAllOther,
    ArrowLeft, ArrowRight, GroupsImage, ArrowLeftSub,
    ArrowRightSub, SubGroupsImage, SubGroupImageAndText,
    TextSubGroup, PriceTable, HeadOfPrice,
    NameHeadTextPrice, NalEdHeadTextPrice, PriceHeadTextPrice,
    HistHeadTextPrice, PanelOfSchet, ZagolScheta,
    SchetTable, HeadOfSchet, NameHeadTextSchet,
    ColHeadTextSchet, PriceHeadTextSchet, SummHeadTextSchet,
    AllDeleteHeadButton, BarPrice, BegunBarPrice,
    RowOfPrice, ColNameOfPrice, NameTextOfPrice,
    ColNalEdOfPrice, NalichTextOfPrice, EdinTextOfPrice,
    ColPriceOfPrice, PriceTextOfPrice, ColHistoryOfPrice,
    DateOfPokupOfPrice, ColichPokupOfPrice,
    ColButtonsOfPrice, ButtonAdd1OfPrice, ButtonAdd5OfPrice,
    ButtonAdd10OfPrice, RowOfSchet, ColNameOfSchet,
    NameTextOfSchet, ColColichOfSchet, ColichOfSchet,
    ColPriceOfSchet, PriceTextOfSchet, ColSummOfSchet,
    SummTextOfSchet, ButtonDeleteRow, SummTextItog,
    MassaTextItog, ObymTextItog, ZnachSummItog,
    ZnachMassyItog, ZnachObyemItog, ButtonCreateSchet,
    GroupsImages, SubGroupsImages, ShetTableFon,
    CreateSchetText, ScrollButtons, NandpHideGroups,
    UnderSchetRect,  UnderPriceRect, UpPagePrice,
    DownPagePrice, UpRowPrice, DownRowPrice,
    UpRowSchet, DownRowSchet, SubGroupPanel,
    NadpPageUpDownPrice, NadpRowUpDownPrice,
    ButtonAddAllOfPrice, ButtonInfoPrice,
    ButtonShowAddButtons, GroupNameText,
    PoplavokScroll, BegunPoplavka

    :TPaintingObjects;

    //переменная для постепенного затемнения экрана
    DarkeningPict:byte;

    function SmodelirovatyClick(DownNacg:boolean; Im:TImage; LeftKn:boolean):byte;
    function SetOfCoordinatesOfObjects(WidClientPix, HeiClientPix
                                                : integer):byte;
    function PaintSdvigAllObjects():byte;
    function ConectWithBase():boolean;
    function TryCoonectWithCurrentBase():boolean;

    function GetSpisokOfGroup():byte;

    //посылка запросов к базе
    function ReportDoPriceAllTovar():byte;
    function RezervyReportDo():byte;
    function HistoryOfOrdersGood():byte;
    //форматирование результотов запросов в одну таблицу
    function ShowResultsOfQueryes():byte;
    //переходим на следующую запись
    function NextRecordGoOf(q:TADOQuery; const FieldNum:Integer):byte;
    //пересчитать сумму, вес и объем в счете
    function RecountSchetItog(var
          Summ, Weight, Capacity:Double):Byte;
    //показ предупредительных сообщений
    function ShowMyMessage(Mes:string):byte;
    //запись в лог-файл полседней ошибки
    function WriteInLogLastError():byte;
    //утсановка названий для групп
    function SetCaptionsOfGroups(WidClientPix, HeiClientPix
                                                : integer):byte;
    //ищем и устанавливаем текущий в прайсе товар
    function FindeAndSetTovar(Descr, code, Group_DescrE:string;
                                       Group_IDe:integer):Integer;
    function FindeAndSetTovarDBF(IdTov, IdGropy:string):Integer;
    //получить количество товара в заявке
    function GetCountGoodInOrder(RelativelyItoTable:boolean):Double;
    //добавить товар в заявку
    function AddInOrderTovar(CountGood:Double; AddCountBool:boolean;
                             const CurrentOrder:boolean=false):Double;

    property BaseObj:TBaseObj read GetBaseObj
     write SetBaseObj;
    property CursorVisible:boolean read FCursorVisible
     write SetCursorVisible;
  end;

function GetApplicationPath():string;

var

  DelphiAndc1: TDelphiAndc1;
  SelectedGroup, SelectedSubGr:PChar;

  //необходимые переменные для базы
  AllSelectedGroups:PChar; SizeOfPeremSelecGr:integer;
  SpisGroupStr:String;
  OsnovnayFirma, OpredelTypeOfCen:PChar; //
  ColOfTov:LongWord;
  FieldValStr:string;

  TopOfMainGrid:Integer; TopOfMainGridBoolChanged:boolean = false;
  PredydSdvigExist:boolean = false; BeforeResize:boolean = true;
  ZagruzkaTovaraIzPrice:boolean=false;

  ApplicPath:string ='';
  {Temprary perem} SProjName:string;

  ChangingSystemGr:boolean = false;
  LeftChopkaIzm:boolean = false;

  MoveFromNotTable:boolean = false;

  HorizCoeffPaint, VertCoeffPaint:double;
  NomerOfScheta:string; GlukWithPaintPanel:HDC;

  SelectedFigureSide:Array of TPoint;

  ScrollingPriceTable:boolean=false; //скролинг прайс таблицы
  LastCoordinatesOfMouseX, LastCoordinatesOfMouseY:integer;

  SummItogSchetZnach, WeightItogSchetZnach,
   CapacityItogSchetZanch:Double;
  SummStrItogSchetZnach, WeightStrItogSchetZnach,
   CapacityStrItogSchetZanch:string;

  OnEntX, OnEntY:integer;

  RePaintRect:TRect; //перерисовываемый прямоугольник
  //отформатированное сообщение об ошибке
  ErrorLastMes:PAnsiChar;
  //авторизация проведена
  AuthoRizationDid:boolean = false;
  //если обновление корневой группы
  UpdateRootGroups:boolean = false;

  ParProv:TParameter; Prov2, Prov3:TRect; Prov4:integer;
  Prov5:integer;

  CurrentPanelInItog:LongInt = -10;
  NoClickInOrder:boolean = true;
  SetCaptionsOfGroupsBool:boolean = false;
  RepaintTwo:boolean = false; //второе перерисовывание панели
  SizeS:integer; //глюк

  //строка для добавление к имени файла разрешения экрана
  SizeScreenText:string = '1280x1024';

implementation uses
//, NapisanChislaUnit,
 ConstUnit, StringsUnit, WithBaseWorkAnyProcUnit,
  NoScrollUnit, PaintUnit, WriteDBFUnit, SchetUnit,
  SetCaptionsForGroupsUnit, TemraryPaintUnit,
  ShablonOfShetUnit, CalculatorUnit, InfoFormUnit, EntryUnit;

{$R *.dfm}

function TDelphiAndc1.SetOfCoordinatesOfObjects(WidClientPix, HeiClientPix
                                                : integer):byte;
begin
 if not(PaintOptionADOQuery.Active) then
  ShowMessage('Таблица с опциями для рисования объектов не открыта!');
 if PaintOptionADOQuery.RecordCount=0 then
  ShowMessage('Таблица с опциями для рисования не имееет записей!');
 PaintOptionADOQuery.First;
 HorizCoeffPaint:=41;
 if PaintOptionADOQuery.FieldByName('Width').AsFloat<>0 then
  HorizCoeffPaint:=
   WidClientPix/
    PaintOptionADOQuery.FieldByName('Width').AsFloat;
 VertCoeffPaint:=39;
 if PaintOptionADOQuery.FieldByName('Heigth').AsFloat<>0 then
  VertCoeffPaint:=
   HeiClientPix/
    PaintOptionADOQuery.FieldByName('Heigth').AsFloat;

 //заполняем список обхектами которые затем будем все вместе сдвигать
 //величина на которую будем сдвигать объекты
 while (Trim(PaintOptionADOQuery.FieldByName('COMMENTS').AsString)<>
        'Расстояние на которое передвинется, без поддгрупп') and
         not(PaintOptionADOQuery.Eof) and
          (PaintOptionADOQuery.RecNo<>PaintOptionADOQuery.RecordCount)
           do
            PaintOptionADOQuery.Next;
 TopOfMainGrid:=Round(VertCoeffPaint
                        *PaintOptionADOQuery.FieldByName('VALUE').AsFloat);

 General:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'GENERAL');
 PanelOfGroups:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'PanelOfGroups');
 PanelOfGroups:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'PanelOfGroups');
 PanelOfAllOther:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'PanelOfAllOther');
 ArrowLeft:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ArrowLeft');
 ArrowRight:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ArrowRight');
 GroupsImage:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'GroupsImage');
 ArrowLeftSub:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ArrowLeftSub');
 ArrowRightSub:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ArrowRightSub');
 SubGroupsImage:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'SubGroupsImage');
 SubGroupImageAndText:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'SubGroupImageAndText');
 TextSubGroup:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'TextSubGroup');
 PriceTable:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'PriceTable');
 HeadOfPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'HeadOfPrice');
 NameHeadTextPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'NameHeadTextPrice');
 NalEdHeadTextPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'NalEdHeadTextPrice');
 PriceHeadTextPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'PriceHeadTextPrice');
 HistHeadTextPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'HistHeadTextPrice');
 PanelOfSchet:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'PanelOfSchet');
 ZagolScheta:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ZagolScheta');
 SchetTable:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'SchetTable');
 HeadOfSchet:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'HeadOfSchet');
 NameHeadTextSchet:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'NameHeadTextSchet');
 ColHeadTextSchet:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ColHeadTextSchet');
 PriceHeadTextSchet:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'PriceHeadTextSchet');
 SummHeadTextSchet:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'SummHeadTextSchet');
 AllDeleteHeadButton:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'AllDeleteHeadButton');
 BarPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'BarPrice');
 BegunBarPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'BegunBarPrice');
 RowOfPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'RowOfPrice');
 ColNameOfPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ColNameOfPrice');
 NameTextOfPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'NameTextOfPrice');
 ColNalEdOfPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ColNalEdOfPrice');
 NalichTextOfPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'NalichTextOfPrice');
 EdinTextOfPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'EdinTextOfPrice');
 ColPriceOfPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ColPriceOfPrice');
 PriceTextOfPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'PriceTextOfPrice');
 ColHistoryOfPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ColHistoryOfPrice');
 DateOfPokupOfPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'DateOfPokupOfPrice');
 ColichPokupOfPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ColichPokupOfPrice');
 ColButtonsOfPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ColButtonsOfPrice');
 ButtonAdd1OfPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ButtonAdd1OfPrice');
 ButtonAdd5OfPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ButtonAdd5OfPrice');
 ButtonAdd10OfPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ButtonAdd10OfPrice');
 RowOfSchet:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'RowOfSchet');
 ColNameOfSchet:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ColNameOfSchet');
 NameTextOfSchet:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'NameTextOfSchet');
 ColColichOfSchet:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ColColichOfSchet');
 ColichOfSchet:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ColichOfSchet');
 ColPriceOfSchet:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ColPriceOfSchet');
 PriceTextOfSchet:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'PriceTextOfSchet');
 ColSummOfSchet:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ColSummOfSchet');
 SummTextOfSchet:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'SummTextOfSchet');
 ButtonDeleteRow:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ButtonDeleteRow');
 SummTextItog:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'SummTextItog');
 MassaTextItog:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'MassaTextItog');
 ObymTextItog:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ObymTextItog');
 ZnachSummItog:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ZnachSummItog');
 ZnachMassyItog:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ZnachMassyItog');
 ZnachObyemItog:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ZnachObyemItog');
 ButtonCreateSchet:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ButtonCreateSchet');
 GroupsImages:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'GroupsImages');
 SubGroupsImages:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'SubGroupsImages');
 ShetTableFon:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ShetTableFon');
 CreateSchetText:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'CreateSchetText');
 ScrollButtons:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ScrollButtons');
 NandpHideGroups:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'NandpHideGroups');
 UnderSchetRect:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'UnderSchetRect');
 UnderPriceRect:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'UnderPriceRect');
 UpPagePrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'UpPagePrice');
 DownPagePrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'DownPagePrice');
 UpRowPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'UpRowPrice');
 DownRowPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'DownRowPrice');
 UpRowSchet:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'UpRowSchet');
 DownRowSchet:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'DownRowSchet');
 SubGroupPanel:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'SubGroupPanel');
 NadpPageUpDownPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'NadpPageUpDownPrice');
 NadpRowUpDownPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'NadpRowUpDownPrice');
 ButtonAddAllOfPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ButtonAddAllOfPrice');
 ButtonInfoPrice:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ButtonInfoPrice');
 ButtonShowAddButtons:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'ButtonShowAddButtons');
 GroupNameText:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'GroupNameText');
 PoplavokScroll:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'PoplavokScroll');
 BegunPoplavka:=TPaintingObjects.Create(PaintOptionADOQuery,
                      HorizCoeffPaint, VertCoeffPaint,
                      'BegunPoplavka');
                      

 //стрелки групп
 LeftImage.Left:=ArrowLeft.Left;
 LeftImage.Top:=ArrowLeft.Top;
 LeftImage.Width:=ArrowLeft.Width;
 LeftImage.Height:=ArrowLeft.Height;

 RightImage.Left:=ArrowRight.Left;
 RightImage.Top:=ArrowRight.Top;
 RightImage.Width:=ArrowRight.Width;
 RightImage.Height:=ArrowRight.Height;

 //стрелки у подгрупп
 LeftSubImage.Left:=ArrowLeftSub.Left;
 LeftSubImage.Top:=ArrowLeftSub.Top;
 LeftSubImage.Width:=ArrowLeftSub.Width;
 LeftSubImage.Height:=ArrowLeftSub.Height;

 SubRightImage.Left:=ArrowRightSub.Left;
 SubRightImage.Top:=ArrowRightSub.Top;
 SubRightImage.Width:=ArrowRightSub.Width;
 SubRightImage.Height:=ArrowRightSub.Height;

 //надписи скрытых групп
 LeftGroupsLabel.Constraints.MaxWidth:=
  Round((WidClientPix-NandpHideGroups.Left)/2)-40;
 RightGrLabel.Constraints.MaxWidth:=
  Round((WidClientPix-NandpHideGroups.Left)/2)-40;
 LeftGroupsLabel.Font.Name:=NandpHideGroups.FontName;
 RightGrLabel.Font.Name:=NandpHideGroups.FontName;
 LeftGroupsLabel.Font.Size:=NandpHideGroups.FontSize;
 RightGrLabel.Font.Size:=NandpHideGroups.FontSize;
 LeftGroupsLabel.Font.Color:=NandpHideGroups.Color;
 RightGrLabel.Font.Color:=NandpHideGroups.Color;
 LeftGroupsLabel.Color:=NandpHideGroups.ParentObj.Color;
 RightGrLabel.Color:=NandpHideGroups.ParentObj.Color;
 LeftGroupsLabel.Left:=NandpHideGroups.Left;
 RightGrLabel.Left:=NandpHideGroups.Right-RightGrLabel.Width;
 LeftGroupsLabel.Top:=NandpHideGroups.Top;
 RightGrLabel.Top:=NandpHideGroups.Top;

 //группы
 GroupsDBCtrlGrid.Color:=GroupsImages.ParentObj.Color;
 GroupsDBCtrlGrid.SelectedColor:=GroupsImages.ParentObj.Color;
 GroupsDBCtrlGrid.Left:=GroupsImages.Left;
 GroupsDBCtrlGrid.Top:=GroupsImages.Top;
 if GroupsImage.Value+GroupsImages.Value<>0 then
  GroupsDBCtrlGrid.ColCount:=Round(GroupsImages.Width
                                    /(GroupsImage.Value+GroupsImages.Value));
 {if GroupsADOQuery.RecordCount>GroupsDBCtrlGrid.ColCount then
  GroupsDBCtrlGrid.Top:=NandpHideGroups.BottomInParent+10;}
 GroupsDBCtrlGrid.Width:=GroupsImages.Width;//+
 if GroupsDBCtrlGrid.PanelCount<>0 then
  GroupsImage.Value:=Round(GroupsDBCtrlGrid.PanelWidth+
   GetSystemMetrics(SM_CXVSCROLL)/GroupsDBCtrlGrid.PanelCount-
    GroupsImages.Value);
  //GetSystemMetrics(SM_CXVSCROLL);
 GroupsDBCtrlGrid.Height:=GroupsImages.Height;
 //компилируем изображение выделеннной группы
 SetLength(SelectedFigureSide, 18);
 CompileDrawSelected(GroupsDBCtrlGrid.Left,
   GroupsDBCtrlGrid.Left+GroupsImage.Value,
   GroupsImages.Bottom, PanelOfAllOther.Top, SelectedFigureSide);
 //SetLength(SelectedFigureRightSide, 50);
 //CompileDrawSelected(GroupsDBCtrlGrid.Left+GroupsImage.Value+4,
 //  Round(GroupsImages.Bottom+(PanelOfAllOther.Top-GroupsImages.Bottom)/2),
 //  4, 5, SelectedFigureRightSide);
 //картинки
 GroupImage.Left:=GroupsImage.LeftInParent;
 GroupImage.Top:=GroupsImage.TopInParent;
 GroupImage.Width:=GroupsImage.Width;
 //GroupsDBCtrlGrid.PanelWidth;
 GroupImage.Height:=GroupsImage.Height;
 //GroupsDBCtrlGrid.Visible:=false;
 //названия групп
 NameOfGroupImage.Left:=GroupNameText.LeftInParent;
 NameOfGroupImage.Top:=GroupNameText.TopInParent;
 NameOfGroupImage.Width:=GroupNameText.Width;
 NameOfGroupImage.Height:=GroupNameText.Height;
 NameOfGroupImage.Constraints.MinWidth:=GroupNameText.Width;

 //подгруппы
 //панель
 SubGroupsDBCtrlGrid.Color:=SubGroupsImages.ParentObj.Color;
 SubGroupsDBCtrlGrid.SelectedColor:=SubGroupsImages.ParentObj.Color;
 SubGroupsDBCtrlGrid.Left:=SubGroupsImages.Left;
 if SubGroupImageAndText.Width+SubGroupsImages.Value<>0 then
  SubGroupsDBCtrlGrid.ColCount:=Round(SubGroupsImages.Width
                                       /(SubGroupImageAndText.Width+SubGroupsImages.Value));
 SubGroupsDBCtrlGrid.Top:=SubGroupsImages.Top;
 SubGroupsDBCtrlGrid.Width:=SubGroupsImages.Width;//+
 if SubGroupsDBCtrlGrid.PanelCount<>0 then
  SubGroupImageAndText.Width:=Round(SubGroupsDBCtrlGrid.PanelWidth+
   GetSystemMetrics(SM_CXVSCROLL)/SubGroupsDBCtrlGrid.PanelCount);//-
 SubGroupsDBCtrlGrid.Height:=SubGroupsImages.Height;
 //картинки
 SubGroupImage.Left:=SubGroupsImage.LeftInParent;
 SubGroupImage.Top:=SubGroupsImage.TopInParent;
 SubGroupImage.Width:=SubGroupsImage.Width;
 SubGroupImage.Height:=SubGroupsImage.Height;
 //надписи
 TextSubGroup.Width:=SubGroupImageAndText.Width-1-
  TextSubGroup.LeftInParent;
 SubGroupsDBText.Font.Name:=TextSubGroup.FontName;
 SubGroupsDBText.Font.Size:=TextSubGroup.FontSize;
 SubGroupsDBText.Font.Color:=TextSubGroup.Color;
 SubGroupsDBText.Left:=TextSubGroup.LeftInParent;
 SubGroupsDBText.Top:=TextSubGroup.TopInParent;
 SubGroupsDBText.Width:=TextSubGroup.Width;
 SubGroupsDBText.Height:=TextSubGroup.Height;
 //надпись для определения размера названия подгруппы
 DefineWidthSubGroupNameLabel.Font:=SubGroupsDBText.Font;
 DefineWidthSubGroupNameLabel.Left:=TextSubGroup.Left;
 DefineWidthSubGroupNameLabel.Top:=TextSubGroup.Top;
 DefineWidthSubGroupNameLabel.Width:=TextSubGroup.Width;
 DefineWidthSubGroupNameLabel.Height:=TextSubGroup.Height;
 DefineWidthSubGroupNameLabel.Alignment:=SubGroupsDBText.Alignment;
 DefineWidthSubGroupNameLabel.Layout:=SubGroupsDBText.Layout;
 DefineWidthSubGroupNameLabel.Constraints.MinWidth:=
                               TextSubGroup.Width;
 DefineWidthSubGroupNameLabel.WordWrap:=true;
 DefineWidthSubGroupNameLabel.Caption:=SubGroupsDBText.Caption;
 DefineWidthSubGroupNameLabel.AutoSize:=true;


 //таблица прайса
 ItogDBCtrlGrid.Left:=PriceTable.Left;
 ItogDBCtrlGrid.Top:=PriceTable.Top;
 ItogDBCtrlGrid.Width:=PriceTable.Width;//+GetSystemMetrics(SM_CXVSCROLL);
 ItogDBCtrlGrid.RowCount:=Round(PriceTable.Height
                                 /RowOfPrice.Height);
 ItogDBCtrlGrid.Height:=PriceTable.Height;
 ItogDBCtrlGrid.Color:=clWhite;//PriceTable.Color;//clWhite;//PriceTable.Color;
 //скролл бар
 ScrollBarImage.Left:=BarPrice.Left;
 ScrollBarImage.Top:=BarPrice.Top;
 ScrollBarImage.Width:=BarPrice.Width;
 ScrollBarImage.Height:=BarPrice.Height;
 //бегун
 ScrollBegunImage.Left:=BegunBarPrice.Left;
 ScrollBegunImage.Top:=BegunBarPrice.Top+ScrollButtons.Height;
 ScrollBegunImage.Width:=BegunBarPrice.Width;
 ScrollBegunImage.Height:=BegunBarPrice.Height;
 //бегун поплавка
 FRPoplavok.FHeight:=20;
 FRPoplavok.FTop:=BegunPoplavka.TopInParent;
 FRPoplavok.FMaxHeight:=BegunPoplavka.ParentObj.Height;
 FRPoplavok.FMinHeight:=1;
 FRPoplavok.FTopParent:=PoplavokScroll.Top;
 FRPoplavok.FVisivle:=false;
 //копка вверх
 ScrollUpButtonImage.Left:=ScrollButtons.Left;
 ScrollUpButtonImage.Top:=ScrollButtons.Top;
 ScrollUpButtonImage.Width:=ScrollButtons.Width;
 ScrollUpButtonImage.Height:=ScrollButtons.Height;
 //кнопка вниз
 ScrollDownButtonImage.Left:=ScrollButtons.Left;
 ScrollDownButtonImage.Top:=ScrollButtons.ParentObj.Bottom-
  ScrollButtons.Height;
 ScrollDownButtonImage.Width:=ScrollButtons.Width;
 ScrollDownButtonImage.Height:=ScrollButtons.Height;


 //текст в трочках таблицы прайса
 //наименование товара
 DescrItDBText.Font.Color:=NameTextOfPrice.Color;
 DescrItDBText.Font.Size:=NameTextOfPrice.FontSize;
 DescrItDBText.Font.Name:=NameTextOfPrice.FontName;
 DescrItDBText.Color:=NameTextOfPrice.ParentObj.Color;
 DescrItDBText.Left:=NameTextOfPrice.LeftInParent;
 DescrItDBText.Top:=NameTextOfPrice.TopInParent;
 DescrItDBText.Width:=NameTextOfPrice.Width;
 DescrItDBText.Height:=NameTextOfPrice.Height;//+NameTextOfPrice.TopInParent;
 //надпись для определения размера названия товара
 DefineWidthOfNameTovLabel.Font:=DescrItDBText.Font;
 DefineWidthOfNameTovLabel.Left:=DescrItDBText.Left;
 DefineWidthOfNameTovLabel.Top:=DescrItDBText.Top;
 DefineWidthOfNameTovLabel.Width:=DescrItDBText.Width;
 DefineWidthOfNameTovLabel.Height:=DescrItDBText.Height;
 DefineWidthOfNameTovLabel.Constraints.MinWidth:=
                               DescrItDBText.Width;
 DefineWidthOfNameTovLabel.WordWrap:=true;
 DefineWidthOfNameTovLabel.Caption:=DescrItDBText.Caption;
 DefineWidthOfNameTovLabel.AutoSize:=true;
 //колонка кнопок
 ColOfButtonsShape.Left:=ColButtonsOfPrice.LeftInParent+2;
 ColOfButtonsShape.Top:=ColButtonsOfPrice.TopInParent+2;
 ColOfButtonsShape.Width:=ColButtonsOfPrice.Width-3;
 ColOfButtonsShape.Height:=ColButtonsOfPrice.Height-5;
 ColOfButtonsShape.Brush.Color:=ColButtonsOfPrice.Color;

 //наличие
 //NalychStaticText.Name:=NalichTextOfPrice.FontName;
 Canvas.Font.Size:=NalichTextOfPrice.FontSize;
 Canvas.Font.Name:=NalichTextOfPrice.FontName;
 NalychStaticText.Font.Color:=NalichTextOfPrice.Color;
 NalychStaticText.Font.Size:=NalichTextOfPrice.FontSize;
 NalychStaticText.Left:=NalichTextOfPrice.ParentObj.LeftInParent;
 NalychStaticText.Top:=NalichTextOfPrice.TopInParent;
 NalychStaticText.Width:=NalichTextOfPrice.ParentObj.Width;
 NalychStaticText.Height:=Canvas.TextHeight(NalychStaticText.Caption);
 //единица
 //EdItogStaticText.Font.Name:=EdinTextOfPrice.FontName;
 Canvas.Font.Size:=EdinTextOfPrice.FontSize;
 Canvas.Font.Name:=EdinTextOfPrice.FontName;
 EdItogStaticText.Font.Color:=EdinTextOfPrice.Color;
 EdItogStaticText.Font.Size:=EdinTextOfPrice.FontSize;
 EdItogStaticText.Left:=EdinTextOfPrice.ParentObj.LeftInParent;
 EdItogStaticText.Top:=EdinTextOfPrice.TopInParent;
 EdItogStaticText.Width:=EdinTextOfPrice.ParentObj.Width;
 EdItogStaticText.Height:=Canvas.TextHeight(EdItogStaticText.Caption);
 //цена
 //PriceItStaticText.Font.Name:=PriceTextOfPrice.FontName;
 Canvas.Font.Size:=PriceTextOfPrice.FontSize;
 Canvas.Font.Name:=PriceTextOfPrice.FontName;
 PriceItStaticText.Font.Color:=PriceTextOfPrice.Color;
 PriceItStaticText.Font.Size:=PriceTextOfPrice.FontSize;
 PriceItStaticText.Left:=PriceTextOfPrice.ParentObj.LeftInParent;
 PriceItStaticText.Top:=PriceTextOfPrice.TopInParent;
 PriceItStaticText.Width:=PriceTextOfPrice.ParentObj.Width;
 PriceItStaticText.Height:=Canvas.TextHeight(PriceItStaticText.Caption);
 //история
 //дата
 Canvas.Font.Size:=DateOfPokupOfPrice.FontSize;
 Canvas.Font.Name:=DateOfPokupOfPrice.FontName;
 HistDateStaticText.Font.Color:=DateOfPokupOfPrice.Color;
 HistDateStaticText.Font.Size:=DateOfPokupOfPrice.FontSize;
 HistDateStaticText.Left:=DateOfPokupOfPrice.ParentObj.LeftInParent;
 HistDateStaticText.Top:=DateOfPokupOfPrice.TopInParent;
 HistDateStaticText.Width:=DateOfPokupOfPrice.ParentObj.Width;
 HistDateStaticText.Height:=Canvas.TextHeight(HistDateStaticText.Caption);
 //количество
 Canvas.Font.Size:=ColichPokupOfPrice.FontSize;
 Canvas.Font.Name:=ColichPokupOfPrice.FontName;
 ColItStaticText.Font.Color:=ColichPokupOfPrice.Color;
 ColItStaticText.Font.Size:=ColichPokupOfPrice.FontSize;
 ColItStaticText.Left:=ColichPokupOfPrice.ParentObj.LeftInParent;
 ColItStaticText.Top:=ColichPokupOfPrice.TopInParent;
 ColItStaticText.Width:=ColichPokupOfPrice.ParentObj.Width;
 ColItStaticText.Height:=Canvas.TextHeight(ColItStaticText.Caption);
 //кнопки
 //кнопка - показать дилаог добавления товара
 ChooseAmountImage.Left:=
  ButtonAddAllOfPrice.ParentObj.LeftInParent+
   ButtonAddAllOfPrice.LeftInParent;
 ChooseAmountImage.Top:=ButtonAddAllOfPrice.TopInParent;
 ChooseAmountImage.Width:=ButtonAddAllOfPrice.Width;
 ChooseAmountImage.Height:=ButtonAddAllOfPrice.Height;
 //кнопка иноформации о товаре
 InfoPriceImage.Left:=ButtonInfoPrice.ParentObj.LeftInParent+
  ButtonInfoPrice.LeftInParent;
 InfoPriceImage.Top:=ButtonInfoPrice.TopInParent;
 InfoPriceImage.Width:=ButtonInfoPrice.Width;
 InfoPriceImage.Height:=ButtonInfoPrice.Height;
 //кнопка показа кнопок добавления
 ShowAddButImage.Left:=
  ButtonShowAddButtons.ParentObj.LeftInParent+
   ButtonShowAddButtons.LeftInParent;
 ShowAddButImage.Top:=ButtonShowAddButtons.TopInParent;
 ShowAddButImage.Width:=ButtonShowAddButtons.Width;
 ShowAddButImage.Height:=ButtonShowAddButtons.Height;
 //добавить 10 товаров
 Add10Image.Left:=ButtonAdd10OfPrice.ParentObj.LeftInParent+
  ButtonAdd10OfPrice.LeftInParent;
 Add10Image.Top:=ButtonAdd10OfPrice.TopInParent;
 Add10Image.Width:=ButtonAdd10OfPrice.Width;
 Add10Image.Height:=ButtonAdd10OfPrice.Height;
 //добавить 5 товаров
 Add5Image.Left:=ButtonAdd5OfPrice.ParentObj.LeftInParent+
  ButtonAdd5OfPrice.LeftInParent;
 Add5Image.Top:=ButtonAdd5OfPrice.TopInParent;
 Add5Image.Width:=ButtonAdd5OfPrice.Width;
 Add5Image.Height:=ButtonAdd5OfPrice.Height;
 //добавть один товар
 Add1Image.Left:=ButtonAdd1OfPrice.ParentObj.LeftInParent+
  ButtonAdd1OfPrice.LeftInParent;
 Add1Image.Top:=ButtonAdd1OfPrice.TopInParent;
 Add1Image.Width:=ButtonAdd1OfPrice.Width;
 Add1Image.Height:=ButtonAdd1OfPrice.Height;
 {кнопки навигации по прайсу}
 //страница вверх
 PageUpPriceImage.Left:=UpPagePrice.Left;
 PageUpPriceImage.Top:=UpPagePrice.Top;
 PageUpPriceImage.Width:=UpPagePrice.Width;
 PageUpPriceImage.Height:=UpPagePrice.Height;
 //страницу вниз
 PageDownPriceImage.Left:=DownPagePrice.Left;
 PageDownPriceImage.Top:=DownPagePrice.Top;
 PageDownPriceImage.Width:=DownPagePrice.Width;
 PageDownPriceImage.Height:=DownPagePrice.Height;
 //строчка вверх
 RowUpPriceImage.Left:=UpRowPrice.Left;
 RowUpPriceImage.Top:=UpRowPrice.Top;
 RowUpPriceImage.Width:=UpRowPrice.Width;
 RowUpPriceImage.Height:=UpRowPrice.Height;
 //строчка вниз
 RowDownPriceImage.Left:=DownRowPrice.Left;
 RowDownPriceImage.Top:=DownRowPrice.Top;
 RowDownPriceImage.Width:=DownRowPrice.Width;
 RowDownPriceImage.Height:=DownRowPrice.Height;
 //напдписи стрница вверх, вниз
 PageUpDownPriceLabel.Font.Name:=NadpPageUpDownPrice.FontName;
 PageUpDownPriceLabel.Font.Size:=NadpPageUpDownPrice.FontSize;
 PageUpDownPriceLabel.Font.Color:=NadpPageUpDownPrice.Color;
 PageUpDownPriceLabel.Color:=NadpPageUpDownPrice.ParentObj.Color;
 PageUpDownPriceLabel.Left:=NadpPageUpDownPrice.Left;
 PageUpDownPriceLabel.Top:=NadpPageUpDownPrice.Top;
 PageUpDownPriceLabel.Caption:='[стр. вверх / вниз]';
 PageUpDownPriceLabel.AutoSize:=true;
 //надпись строчка вверх вниз
 RowUpDownPriceLabel.Font.Name:=NadpRowUpDownPrice.FontName;
 RowUpDownPriceLabel.Font.Size:=NadpRowUpDownPrice.FontSize;
 RowUpDownPriceLabel.Font.Color:=NadpRowUpDownPrice.Color;
 RowUpDownPriceLabel.Color:=NadpRowUpDownPrice.ParentObj.Color;
 RowUpDownPriceLabel.Left:=NadpRowUpDownPrice.Left;
 RowUpDownPriceLabel.Top:=NadpRowUpDownPrice.Top;
 RowUpDownPriceLabel.Caption:='[вверх / вниз]';
 RowUpDownPriceLabel.AutoSize:=true;



 //таблица счета
 OrderDBCtrlGrid.Left:=SchetTable.Left;
 OrderDBCtrlGrid.Top:=SchetTable.Top;
 OrderDBCtrlGrid.RowCount:=Round(SchetTable.Height
                                 /RowOfSchet.Height);
 OrderDBCtrlGrid.Height:=SchetTable.Height;
 OrderDBCtrlGrid.Width:=SchetTable.Width;//+
  //GetSystemMetrics(SM_CXVSCROLL);
 OrderDBCtrlGrid.Color:=SchetTable.Color;
 OrderDBCtrlGrid.SelectedColor:=SchetTable.Color;

 //кнопка удаления всего товра из счета
 AllDeleteImage.Left:=AllDeleteHeadButton.Left;
 AllDeleteImage.Top:=AllDeleteHeadButton.Top;
 AllDeleteImage.Width:=AllDeleteHeadButton.Width;
 AllDeleteImage.Height:=AllDeleteHeadButton.Height;

 //текст в трочках таблицы счета
 //наименование товара
 NameOfSchetDBText.Font.Color := NameTextOfSchet.Color;
 NameOfSchetDBText.Font.Size  := NameTextOfSchet.FontSize;
 NameOfSchetDBText.Font.Name  := NameTextOfSchet.FontName;
 NameOfSchetDBText.Left       := NameTextOfSchet.LeftInParent;
 NameOfSchetDBText.Top        := NameTextOfSchet.TopInParent;
 NameOfSchetDBText.Width      := NameTextOfSchet.Width;
 NameOfSchetDBText.Height     := NameTextOfSchet.Height;//+NameTextOfPrice.TopInParent;

 //количество и единица
 CountAndEdSchetLabel.Font.Color:=ColichOfSchet.Color;
 CountAndEdSchetLabel.Font.Size:=ColichOfSchet.FontSize;
 CountAndEdSchetLabel.Font.Name:=ColichOfSchet.FontName;
 CountAndEdSchetLabel.Left:=ColichOfSchet.ParentObj.LeftInParent;
 CountAndEdSchetLabel.Top:=ColichOfSchet.TopInParent;
 CountAndEdSchetLabel.Width:=ColichOfSchet.ParentObj.Width;

 //цена
 PriceOfSchetDBText.Font.Color:=PriceTextOfSchet.Color;
 PriceOfSchetDBText.Font.Size:=PriceTextOfSchet.FontSize;
 PriceOfSchetDBText.Font.Name:=PriceTextOfSchet.FontName;
 PriceOfSchetDBText.Left     :=PriceTextOfSchet.ParentObj.LeftInParent;
 PriceOfSchetDBText.Top      :=PriceTextOfSchet.TopInParent;
 PriceOfSchetDBText.Width    :=PriceTextOfSchet.ParentObj.Width;

 //сумма
 SummDBText.Font.Color:=SummTextOfSchet.Color;
 SummDBText.Font.Size:=SummTextOfSchet.FontSize;
 SummDBText.Font.Name:=SummTextOfSchet.FontName;
 SummDBText.Left:=SummTextOfSchet.ParentObj.LeftInParent;
 SummDBText.Top:=SummTextOfSchet.TopInParent;
 SummDBText.Width:=SummTextOfSchet.Width;

 //кнопка удаления
 OneDeleteImage.Left:=ButtonDeleteRow.ParentObj.LeftInParent+
  ButtonDeleteRow.LeftInParent;
 OneDeleteImage.Top:=ButtonDeleteRow.TopInParent;
 OneDeleteImage.Width:=ButtonDeleteRow.Width;
 OneDeleteImage.Height:=ButtonDeleteRow.Height;

 //итоговая сумма счета
 SummItogSchetLabel.Font.Name:=ZnachSummItog.FontName;
 SummItogSchetLabel.Font.Size:=ZnachSummItog.FontSize;
 SummItogSchetLabel.Color:=ZnachSummItog.ParentObj.Color;
 SummItogSchetLabel.Font.Color:=ZnachSummItog.Color;
 SummItogSchetLabel.Top:=ZnachSummItog.Top;
 SummItogSchetLabel.Left:=ZnachSummItog.Left;
 SummItogSchetLabel.Caption:='';

 NadpSummItogSchetLabel.Font.Name:=SummTextItog.FontName;
 NadpSummItogSchetLabel.Font.Size:=SummTextItog.FontSize;
 NadpSummItogSchetLabel.Font.Color:=SummTextItog.Color;
 NadpSummItogSchetLabel.Color:=SummTextItog.ParentObj.Color;
 NadpSummItogSchetLabel.Left:=SummTextItog.Left;
 NadpSummItogSchetLabel.Top:=SummTextItog.Top;
 NadpSummItogSchetLabel.Caption:=SummTextItog.Text;

 //итоговая масса счета
 WeightItogSchetLabel.Font.Name:=ZnachMassyItog.FontName;
 WeightItogSchetLabel.Font.Size:=ZnachMassyItog.FontSize;
 WeightItogSchetLabel.Color:=ZnachMassyItog.ParentObj.Color;
 WeightItogSchetLabel.Font.Color:=ZnachMassyItog.Color;
 WeightItogSchetLabel.Top:=ZnachMassyItog.Top;
 WeightItogSchetLabel.Left:=ZnachMassyItog.Left;
 WeightItogSchetLabel.Caption:='';

 NadpWeigthItogSchetLabel.Font.Name:=MassaTextItog.FontName;
 NadpWeigthItogSchetLabel.Font.Size:=MassaTextItog.FontSize;
 NadpWeigthItogSchetLabel.Font.Color:=MassaTextItog.Color;
 NadpWeigthItogSchetLabel.Color:=MassaTextItog.ParentObj.Color;
 NadpWeigthItogSchetLabel.Left:=MassaTextItog.Left;
 NadpWeigthItogSchetLabel.Top:=MassaTextItog.Top;
 NadpWeigthItogSchetLabel.Caption:=MassaTextItog.Text;

 //итоговый объем счета
 NadpBulkItogSchetLabel.Font.Name:=ObymTextItog.FontName;
 NadpBulkItogSchetLabel.Font.Size:=ObymTextItog.FontSize;
 NadpBulkItogSchetLabel.Font.Color:=ObymTextItog.Color;
 NadpBulkItogSchetLabel.Color:=ObymTextItog.ParentObj.Color;
 NadpBulkItogSchetLabel.Left:=ObymTextItog.Left;
 NadpBulkItogSchetLabel.Top:=ObymTextItog.Top;
 NadpBulkItogSchetLabel.Caption:=ObymTextItog.Text;

 BulkItogSchetLabel.Font.Name:=ZnachObyemItog.FontName;
 BulkItogSchetLabel.Font.Size:=ZnachObyemItog.FontSize;
 BulkItogSchetLabel.Font.Color:=ZnachObyemItog.Color;
 BulkItogSchetLabel.Color:=ZnachObyemItog.ParentObj.Color;
 BulkItogSchetLabel.Left:=ZnachObyemItog.Left;
 BulkItogSchetLabel.Top:=ZnachObyemItog.Top;
 BulkItogSchetLabel.Caption:='';

 //текст на кнопке создания счета
 CreateSchUpLabel.Font.Size:=CreateSchetText.FontSize;
 CreateSchUpLabel.Font.Color:=CreateSchetText.Color;
 CreateSchUpLabel.Font.Name:=CreateSchetText.FontName;
 CreateSchUpLabel.AutoSize:=true;
 CreateSchUpLabel.Caption:='Создать';
 CreateSchUpLabel.AutoSize:=false;
 CreateSchUpLabel.Left:=CreateSchetText.Left;
 CreateSchUpLabel.Top:=CreateSchetText.Top;
 CreateSchUpLabel.Width:=CreateSchetText.Width;
 CreateSchDownLabel.Font.Size:=CreateSchetText.FontSize;
 CreateSchDownLabel.Font.Name:=CreateSchetText.FontName;
 CreateSchDownLabel.Font.Color:=CreateSchetText.Color;
 CreateSchDownLabel.AutoSize:=true;
 CreateSchDownLabel.Caption:='счет';
 CreateSchDownLabel.AutoSize:=false;
 CreateSchDownLabel.Left:=CreateSchetText.Left;
 CreateSchDownLabel.Top:=CreateSchetText.Top+CreateSchetText.FontSize+CreateSchetText.TopInParent;
 CreateSchDownLabel.Width:=CreateSchetText.Width;

 //кнопка создания счета
 CreateSchetImage.Left:=ButtonCreateSchet.Left;
 CreateSchetImage.Top:=ButtonCreateSchet.Top;
 CreateSchetImage.Width:=ButtonCreateSchet.Width;
 CreateSchetImage.Height:=ButtonCreateSchet.Height;

 //кнопка входа
 EntryImage.Left:=CreateSchetImage.Left-EntryImage.Width-10;
 EntryImage.Top:=CreateSchetImage.Top;
 EntryImage.Visible:=false;

 {кнопки навигации по счету}
 //строчка вверх
 RowUpSchetImage.Left:=UpRowSchet.Left;
 RowUpSchetImage.Top:=UpRowSchet.Top;
 RowUpSchetImage.Width:=UpRowSchet.Width;
 RowUpSchetImage.Height:=UpRowSchet.Height;
 //строчка вниз
 RowDownSchetImage.Left:=DownRowSchet.Left;
 RowDownSchetImage.Top:=DownRowSchet.Top;
 RowDownSchetImage.Width:=DownRowSchet.Width;
 RowDownSchetImage.Height:=DownRowSchet.Height;


 AvtorizPanel.Top:=ClientHeight-200;
 AvtorizPanel.Left:=WidClientPix-270;
 AvtorizPanel.Height:=180;
 AvtorizPanel.Width:=250;

 SizeScreenText:=IntToStr(WidClientPix)+'x'+IntToStr(HeiClientPix);
 if SetCaptionsOfGroupsBool then
  SetCaptionsOfGroups(WidClientPix, HeiClientPix);

 Result:=0;
end; //SetOfCoordinatesOfObjects

procedure TDelphiAndc1.FormCreate(Sender: TObject);
var
 HourDec, MinDec, SecDec, MSecDec:Word;
 YearDec, MonthDec, DayDec:Word;
begin
 //инициализируем переменные
 //уcтанавливаем текущую директорию
 GetApplicationPath();
 //
 SummStrItogSchetZnach:='';
 SummItogSchetZnach:=0;
 WeightStrItogSchetZnach:='';
 WeightItogSchetZnach:=0;
 CapacityStrItogSchetZanch:='';
 CapacityItogSchetZanch:=0;
 //переменная для постепенного затемнения картинки
 DarkeningPict:=TIMEOFDARKENINGINSEC;

 //убираем ScrollBar
 PeremOfUnitNoScroll:=TPeremOfUnitNoScroll.Create;
 PeremOfUnitNoScroll.GroupsDBCtrlGrid:=GroupsDBCtrlGrid;
 PeremOfUnitNoScroll.SubGroupsDBCtrlGrid:=SubGroupsDBCtrlGrid;
 PeremOfUnitNoScroll.ItogDBCtrlGrid:=ItogDBCtrlGrid;
 PeremOfUnitNoScroll.OrderDBCtrlGrid:=OrderDBCtrlGrid;

 PeremOfUnitNoScroll.HandelOfGroups:=GroupsDBCtrlGrid.Handle;
 PeremOfUnitNoScroll.OldWindowProcGropus:=Pointer(
           SetWindowLong(PeremOfUnitNoScroll.HandelOfGroups,
                 GWL_WNDPROC, LongInt(@NewWindowProc)));
 PeremOfUnitNoScroll.HandleOfSubGropus:=SubGroupsDBCtrlGrid.Handle;
 PeremOfUnitNoScroll.OldWindowProcSubGropus:=Pointer(
           SetWindowLong(PeremOfUnitNoScroll.HandleOfSubGropus,
                 GWL_WNDPROC, LongInt(@NewWindowProc)));
 PeremOfUnitNoScroll.HandleOfItog:=ItogDBCtrlGrid.Handle;
 PeremOfUnitNoScroll.OldWindowProcItog:=Pointer(
           SetWindowLong(PeremOfUnitNoScroll.HandleOfItog,
                 GWL_WNDPROC, LongInt(@NewWindowProc)));
 PeremOfUnitNoScroll.HandleOfSchet:=OrderDBCtrlGrid.Handle;
 PeremOfUnitNoScroll.OldWindowProcSchet:=Pointer(
           SetWindowLong(PeremOfUnitNoScroll.HandleOfSchet,
                 GWL_WNDPROC, LongInt(@NewWindowProc)));
 //
 DecodeDate(Now, YearDec, MonthDec, DayDec);
 DecodeTime(Now, HourDec, MinDec, SecDec, MSecDec);

 //номер для счета
 NomerOfScheta:=Char((YearDec))+
  IntToStr(MonthDec)+IntToStr(DayDec)+IntToStr(HourDec);

 //получаем путь к базе
 ZagruzkaTovaraIzPrice:=not(ConectWithBase());
 //ZagruzkaTovaraIzPrice:=true;


 LocalADOConnection.ConnectionString:=
  'FILE NAME='+
   GetApplicationPath()+'\'+OPTIONSONCREATEANDRESIZEDIR+'\'+
    LOCALBASECONNECTTEMPTFILE+'.udl';
 LocalADOConnection.DefaultDatabase:=
    GetApplicationPath+'\'+DATABASETEMPDIR;
 if not(ZagruzkaTovaraIzPrice) then begin
  DataBaseADOConnection.Close;
  DataBaseADOConnection.ConnectionString:=
  'FILE NAME='+
   GetApplicationPath()+'\'+OPTIONSONCREATEANDRESIZEDIR+'\'+
    CONNECTWITH1CFILE+'.udl';
  DataBaseADOConnection.DefaultDatabase:=
   BaseObj.PathToBase;
  SearchGroupADOQuery.Connection:=DataBaseADOConnection;
  DataBaseADOConnection.Connected:=true;
 end
 else begin
  GroupsADOQuery.Connection:=LocalADOConnection;
  SubGroupsADOQuery.Connection:=LocalADOConnection;
 end;
 LocalADOConnection.Connected:=true;

 //открываем соединения
 //соединение с таблицами опциями
 OptionsADOConnection.ConnectionString:=
  'FILE NAME='+
   GetApplicationPath()+'\'+OPTIONSONCREATEANDRESIZEDIR+'\'+
    LOCALBASECONNECTTEMPTFILE+'.udl';
 OptionsADOConnection.DefaultDatabase:=
  GetApplicationPath+'\'+OPTIONSONCREATEANDRESIZEDIR;
 OptionsADOConnection.Connected:=true;
 //соединение с таблицами для рисования калькулятора
 InicializationConnectionsCalc(GetApplicationPath(), false);
 //соединение с таблицами данных пользователей
 UserADOConnection.ConnectionString:=
  'FILE NAME='+
   GetApplicationPath()+'\'+OPTIONSONCREATEANDRESIZEDIR+'\'+
    LOCALBASECONNECTTEMPTFILE+'.udl';
 UserADOConnection.DefaultDatabase:=
  GetApplicationPath+'\'+ORDERDIR;
 UserADOConnection.Connected:=true;

 //открываем картинки групп

 //открываем таблицы необходимые для счета и прайса
 if not(ZagruzkaTovaraIzPrice) then begin
  //открываем таблицу с фирмами
  GetMem(OsnovnayFirma,9);

  FirmaADOQuery.Close;
  FirmaADOQuery.SQL.Clear;
  FirmaADOQuery.SQL.LoadFromFile(GetApplicationPath()+'\'+
        QUERYSQLDIR+'\'+GENFIRMSQLQUERY);
  FirmaADOQuery.Open;
  FirmaADOQuery.First;
  if FirmaADOQuery.GetFieldData(1, OsnovnayFirma)=false
  then begin
   ShowMessage('Фирма не определена!?');
  end;

  //определяем тип цен
  GetMem(OpredelTypeOfCen,9);

  TypeOfCenADOQuery.Close;
  TypeOfCenADOQuery.SQL.Clear;
  TypeOfCenADOQuery.SQL.LoadFromFile(GetApplicationPath()+'\'+
        QUERYSQLDIR+'\'+TYPESOFPRICESQLQUERY);
  TypeOfCenADOQuery.Open;
  TypeOfCenADOQuery.First;
  //if TypeOfCenADOQuery.Eof=false then TypeOfCenADOQuery.Next;
  //if TypeOfCenADOQuery.Eof=false then TypeOfCenADOQuery.Next;
  TypeOfCenADOQuery.GetFieldData(1, OpredelTypeOfCen);

  //открываем таблицу с контрагентами
  ContagentADOQuery.Close;
  ContagentADOQuery.SQL.Clear;
  ContagentADOQuery.SQL.LoadFromFile(GetApplicationPath()+'\'+
        QUERYSQLDIR+'\'+CONTRACTORSSQLQUERY);
  ContagentADOQuery.Open;

  {ContagentADOQuery.First;
  ContragComboBox.Items.Add(ContagentADOQuery.FieldValues['DESCR']);
  while not(ContagentADOQuery.Eof) do begin
   ContagentADOQuery.Next;
   ContragComboBox.Items.Add(ContagentADOQuery.FieldValues['DESCR']);
  end;}

 end; //елис загрузка не из прайса

 //открываем таблицу с группами
 SubGroupsADOQuery.Close;
 GroupsADOQuery.Close;
 if not(ZagruzkaTovaraIzPrice) then begin
  GroupsADOQuery.SQL.Clear;
  GroupsADOQuery.SQL.LoadFromFile(GetApplicationPath()+'\'+
        QUERYSQLDIR+'\'+GROUPSSQLQUERY);

  SubGroupsADOQuery.SQL.Clear;
  SubGroupsADOQuery.SQL.LoadFromFile(GetApplicationPath()+'\'+
        QUERYSQLDIR+'\'+SUBGROUPSSQLQUERY);

  SubSubGroupsADOQuery.SQL.Clear;
  SubSubGroupsADOQuery.SQL.LoadFromFile(GetApplicationPath()+'\'+
        QUERYSQLDIR+'\'+SUBSUBGROUPSSQLQUERY);

  RezervADOQuery.SQL.Clear;
  RezervADOQuery.SQL.LoadFromFile(GetApplicationPath()+'\'+
        QUERYSQLDIR+'\'+REZERVSQLQUERY);

  PriceADOQuery.SQL.Clear;
  PriceADOQuery.SQL.LoadFromFile(GetApplicationPath()+'\'+
        QUERYSQLDIR+'\'+PRICESQLQUERY);

  ItogADOQuery.SQL.Clear;
  ItogADOQuery.SQL.LoadFromFile(GetApplicationPath()+'\'+
        QUERYSQLDIR+'\'+ITOGSQLQUERY);

  ItogAddADOCommand.CommandText:=GetLoadFromFileString(GetApplicationPath()+'\'+
        QUERYSQLDIR+'\'+ADDINITOGRECSQLQUERY);
 end; //if not(ZagruzkaTovaraIzPrice)
 GroupsADOQuery.Open;
 //открываем таблицу с подгруппами
 //SubGroupsADOQuery.Close;
 //SubGroupsADOQuery.Open;

 //открываем таблицу с координатами рисованных обектов
 if PaintOptionADOQuery.SQL.Count<2 then
  PaintOptionADOQuery.SQL.Append(PAINTOPTIONSFILE);
 PaintOptionADOQuery.Open;
 {открываем таблицу с координатами рисованных
  объектов калькулятора}
 InicializationConnectionsCalc('', true);
 //открываем таблицы с текущей заявкой покупателя
 OrderADOTable.Open;
 OrderADOTable.First;
 while not(OrderADOTable.Eof) do begin
  OrderADOTable.Delete;
 end;

 //загружем картинки для кнопок интерфейса
 CreateSchetImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+CREATESCHETBUTTONIMAGE+'.bmp');
 LeftImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+ARROWLEFTIMAGEFILE+'.bmp');
 LeftSubImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+ARROWSUBLEFTIMAGEFILE+'.bmp');
 RightImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+ARROWRIGHTIMAGEFILE+'.bmp');
 SubRightImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+ARROWSUBRIGHTIMAGEFILE+'.bmp');
 ScrollUpButtonImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+SCROLLUPBUTTONIMAGEFILE+'.bmp');
 ScrollDownButtonImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+SCROLLDOWNBUTTONIMAGEFILE+'.bmp');
 ScrollBegunImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+SCROLLBEGUNIMAGEFILE+'.bmp');
 AllDeleteImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ALLDELETEBUTTONIMAGEFILE+'.bmp');
 OneDeleteImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+DELETEONEBUTTONIMAGEFILE+'.bmp');
 Add1Image.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ADDBUTTONIMAGEFILE+
    IntToStr(Add1Image.Tag)+'.bmp');
 Add5Image.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ADDBUTTONIMAGEFILE+
    IntToStr(Add5Image.Tag)+'.bmp');
 Add10Image.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ADDBUTTONIMAGEFILE+
    IntToStr(Add10Image.Tag)+'.bmp');
 PageUpPriceImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+PAGEUPPRICEBUTTONIMAGEFILE+'.bmp');
 PageDownPriceImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+PAGEDOWNPRICEBUTTONIMAGEFILE+'.bmp');
 RowUpPriceImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ROWUPPRICEBUTTONIMAGEFILE+'.bmp');
 RowDownPriceImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ROWDOWNPRICEBUTTONIMAGEFILE+'.bmp');
 RowUpSchetImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ROWUPSCHETBUTTONIMAGEFILE+'.bmp');
 RowDownSchetImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ROWDOWNSCHETBUTTONIMAGEFILE+'.bmp');
 ChooseAmountImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+CHOOSEAMOUNTPRICEIMAGEFILE+'.bmp');
 InfoPriceImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+INFOPRICEIMAGEFILE+'.bmp');
 ShowAddButImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+SHOWADDBUTSPRICEIMAGEFILE+'.bmp');
end; //procedure TDelphiAndc1.FormCreate(Sender: TObject);

procedure TDelphiAndc1.SetBaseObj(Value:TBaseObj);
begin
 if Value<>FBaseObj then begin
  if Assigned(FBaseObj) then
   FBaseObj.Destroy;
  FBaseObj:=Value;
 end;
end; //SetBaseObj

function TDelphiAndc1.GetBaseObj:TBaseObj;
begin
 If not(Assigned(FBaseObj)) then begin
  FBaseObj:=TBaseObj.Create;
 end;
 Result:=FBaseObj;
end; //GetBaseObj

procedure TDelphiAndc1.SetCursorVisible(Value:boolean);
procedure SetCursorZnach(Cont:TWinControl; Znach:integer);
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
var
 i:integer;
begin
 //if Value<>FCursorVisible then begin
  FCursorVisible:=Value;
  if FCursorVisible then begin
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
  if not(FCursorVisible) then begin
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
  end; //if FCursorVisible=false
 //end;
end; //SetCursorVisible

procedure TDelphiAndc1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 GroupsADOQuery.Close;
 SubGroupsADOQuery.Close;
 PaintOptionADOQuery.Close;
 DataBaseADOConnection.Connected:=false;
 OptionsADOConnection.Connected:=false;
 LocalADOConnection.Connected:=false;
 UserADOConnection.Connected:=false;

 if SelectedSubGr<>nil then begin
  try
   FreeMem(SelectedSubGr, 9)
  except end; end;
 if SelectedGroup<>nil then begin
  try
   FreeMem(SelectedGroup, 9)
  except end; end;

  //уничтожаем созданные объекты
  General.Destroy;
  PanelOfGroups.Destroy;
  PanelOfAllOther.Destroy;
  ArrowLeft.Destroy;
  ArrowRight.Destroy;
  GroupsImage.Destroy;
  ArrowLeftSub.Destroy;
  ArrowRightSub.Destroy;
  SubGroupsImage.Destroy;
  SubGroupImageAndText.Destroy;
  TextSubGroup.Destroy;
  PriceTable.Destroy;
  HeadOfPrice.Destroy;
  NameHeadTextPrice.Destroy;
  NalEdHeadTextPrice.Destroy;
  PriceHeadTextPrice.Destroy;
  HistHeadTextPrice.Destroy;
  PanelOfSchet.Destroy;
  ZagolScheta.Destroy;
  SchetTable.Destroy;
  HeadOfSchet.Destroy;
  NameHeadTextSchet.Destroy;
  ColHeadTextSchet.Destroy;
  PriceHeadTextSchet.Destroy;
  SummHeadTextSchet.Destroy;
  AllDeleteHeadButton.Destroy;
  BarPrice.Destroy;
  BegunBarPrice.Destroy;
  RowOfPrice.Destroy;
  ColNameOfPrice.Destroy;
  NameTextOfPrice.Destroy;
  ColNalEdOfPrice.Destroy;
  NalichTextOfPrice.Destroy;
  EdinTextOfPrice.Destroy;
  ColPriceOfPrice.Destroy;
  PriceTextOfPrice.Destroy;
  ColHistoryOfPrice.Destroy;
  DateOfPokupOfPrice.Destroy;
  ColichPokupOfPrice.Destroy;
  ColButtonsOfPrice.Destroy;
  ButtonAdd1OfPrice.Destroy;
  ButtonAdd5OfPrice.Destroy;
  ButtonAdd10OfPrice.Destroy;
  RowOfSchet.Destroy;
  ColNameOfSchet.Destroy;
  NameTextOfSchet.Destroy;
  ColColichOfSchet.Destroy;
  ColichOfSchet.Destroy;
  ColPriceOfSchet.Destroy;
  PriceTextOfSchet.Destroy;
  ColSummOfSchet.Destroy;
  SummTextOfSchet.Destroy;
  ButtonDeleteRow.Destroy;
  SummTextItog.Destroy;
  MassaTextItog.Destroy;
  ObymTextItog.Destroy;
  ZnachSummItog.Destroy;
  ZnachMassyItog.Destroy;
  ZnachObyemItog.Destroy;
  ButtonCreateSchet.Destroy;
  GroupsImages.Destroy;
  SubGroupsImages.Destroy;
  ShetTableFon.Destroy;
  CreateSchetText.Destroy;
  ScrollButtons.Destroy;
  NandpHideGroups.Destroy;
  UnderSchetRect.Destroy;
  UnderPriceRect.Destroy;
  UpPagePrice.Destroy;
  DownPagePrice.Destroy;
  UpRowPrice.Destroy;
  DownRowPrice.Destroy;
  UpRowSchet.Destroy;
  DownRowSchet.Destroy;
  SubGroupPanel.Destroy;
  NadpPageUpDownPrice.Destroy;
  NadpRowUpDownPrice.Destroy;
  ButtonAddAllOfPrice.Destroy;
  ButtonInfoPrice.Destroy;
  ButtonShowAddButtons.Destroy;
  GroupNameText.Destroy;
  PoplavokScroll.Destroy;
  BegunPoplavka.Destroy;


 if OpredelTypeOfCen<>nil then begin
  try
   FreeMem(OpredelTypeOfCen,9)
  except end; end;
 if OsnovnayFirma<>nil then begin
  try
   FreeMem(OsnovnayFirma,9)
  except end; end;
end; //procedure FormClose(Sender: TObject;

procedure TDelphiAndc1.FormDestroy(Sender: TObject);
begin
 if Assigned(BaseObj) then
  BaseObj.Destroy;

 SetWindowLong(PeremOfUnitNoScroll.HandelOfGroups,
               GWL_WNDPROC,
                LongInt(PeremOfUnitNoScroll.OldWindowProcGropus));
 SetWindowLong(PeremOfUnitNoScroll.HandleOfSubGropus,
               GWL_WNDPROC,
                LongInt(PeremOfUnitNoScroll.OldWindowProcSubGropus));
 SetWindowLong(PeremOfUnitNoScroll.HandleOfItog,
               GWL_WNDPROC,
                LongInt(PeremOfUnitNoScroll.OldWindowProcItog));
 SetWindowLong(PeremOfUnitNoScroll.HandleOfSchet,
               GWL_WNDPROC,
               LongInt(PeremOfUnitNoScroll.OldWindowProcSchet));
 if PeremOfUnitNoScroll.HandleOfCreatingSchet<>0 then
  SetWindowLong(PeremOfUnitNoScroll.HandleOfCreatingSchet,
                GWL_WNDPROC,
                LongInt(PeremOfUnitNoScroll.OldWindowProcCreatingSchet));
 if Assigned(PeremOfUnitNoScroll) then
  PeremOfUnitNoScroll.Destroy;
end; //destroy Form


function TDelphiAndc1.ReportDoPriceAllTovar():byte;
begin
 PriceADOQuery.Close;
 PriceADOQuery.SQL.Strings[13]:=GetLoadFromFileString(
   GetApplicationPath()+'\'+QUERYSQLDIR+'\'+CONDITIONSQLFILE)+
    ' '+'('+TrimRight(SpisGroupStr)+') and';
 PriceADOQuery.Parameters.Items[0].Value:=TrimRight(OsnovnayFirma);
 PriceADOQuery.Parameters.Items[1].Value:=TrimRight(OpredelTypeOfCen);

 PriceADOQuery.Open;
 Result:=0;
end; //ReportDoPriceAllTovar

function TDelphiAndc1.RezervyReportDo():byte;
begin
 RezervADOQuery.Close;

 //делаем фильтр по товарам орпеделенных групп
 RezervADOQuery.SQL.Strings[13]:=TrimRight(SpisGroupStr);

 //фильтр по фирме
 RezervADOQuery.Prepared:=true;
 RezervADOQuery.Parameters.Items[0].Value:=TrimRight(OsnovnayFirma);
 RezervADOQuery.Parameters.Items[1].Value:=TrimRight(OsnovnayFirma);

 RezervADOQuery.Open;
 Result:=0;
end; //RezervyReportDo


function TDelphiAndc1.HistoryOfOrdersGood():byte;
begin
 Result:=0;
end; //HistoryOfOrdersGood

function TDelphiAndc1.ShowResultsOfQueryes():byte;
var
 RetundValEr, sch:byte;

 DescrRez, GroupRez, DescrPrice, GroupPrice:PChar;
 DescrRezStr, GroupRezStr, DescrPriceStr, GroupPriceStr:String;

 TeckuchPodgruppa:PChar; TeckuchPodgruppaStr:String;
 NewPodgruppa:PChar; TempSubGropu:PChar;
 NewPodgruppaStr:String; TempSubGropuStr:String;

 NalichRemain:Double;

 SizeOfFieldTeck, SizeOfValueTeck:integer;
 NumberOfStolbTeck:integer;

 CurrentGroupTable:TDataSet;
 GroupsNoEqual:boolean;

 i:integer;
begin
 //CopyItogADOQuery.Close;
 ItogADOQuery.Close;

 //значения полей
 TeckuchPodgruppa:=nil;
 GetMem(NewPodgruppa, 9);
 GetMem(TempSubGropu, 9);

 ColOfTov:=0;
 RetundValEr:=0;
 if PriceADOQuery.RecordCount>0 then ColOfTov:=1;
 PriceADOQuery.First;
 while not(PriceADOQuery.Eof) do begin
  //проверяем, не надо ли вставить группу товара
  PriceADOQuery.GetFieldData(2, NewPodgruppa);
  NewPodgruppaStr:=NewPodgruppa;

  CurrentGroupTable:=nil;
  GroupsNoEqual:=false;
  if TeckuchPodgruppa=nil then begin
   GetMem(TeckuchPodgruppa, 9);
   TeckuchPodgruppaStr:='';
   GroupsNoEqual:=true;
  end;
  if not(GroupsNoEqual) then
   if TeckuchPodgruppaStr<>NewPodgruppaStr then
    GroupsNoEqual:=true;

  if GroupsNoEqual then begin
   TempSubGropuStr:='';
   if SubSubGroupsADOQuery.Active=true then begin
     SubSubGroupsADOQuery.First;
     repeat
      SubSubGroupsADOQuery.GetFieldData(1, TempSubGropu);
      TempSubGropuStr:=TempSubGropu;
      if TempSubGropuStr=NewPodgruppaStr then Break;
      SubSubGroupsADOQuery.Next;
     until SubSubGroupsADOQuery.Eof;
   end;
   if TempSubGropuStr=NewPodgruppaStr then
    CurrentGroupTable:=SubSubGroupsADOQuery
   else if SubGroupsADOQuery.RecordCount=1 then
   begin
    //SubGroupsADOQuery.First;
    SubGroupsADOQuery.GetFieldData(1, TempSubGropu);
    TempSubGropuStr:=TempSubGropu;
    if TempSubGropuStr=NewPodgruppaStr then
     CurrentGroupTable:=SubGroupsADOQuery;
   end;
  end; {если у товара есть еще и группа,
        которую нужно всавить в итоговую таблицу}

  if CurrentGroupTable<>nil then Inc(ColOfTov);
  Inc(ColOfTov);
  RetundValEr:=NextRecordGoOf(PriceADOQuery, 4);
 end; //пробегаем по таблице прайса

 if RetundValEr=1 then ColOfTov:=ColOfTov-1;

 if RewriteItogDBF(GetApplicationPath(), ColOfTov)<>0 then begin
  ShowMessage('Не могу создать временные файлы!!');
  exit;
 end;

 //подготоваливаем все таблицы
 PriceADOQuery.First;
 GetMem(DescrPrice,50);
 GetMem(GroupPrice,9);
 //RezervADOQuery.First;
 GetMem(DescrRez,50);
 GetMem(GroupRez,9);

 //перебираем все записи
 if PriceADOQuery.RecordCount>0 then
  repeat
   //очищаем текщую запись, перед ее заполнением
   ClearMassive(nil);

   PriceADOQuery.GetFieldData(2, GroupPrice);
   PriceADOQuery.GetFieldData(4, DescrPrice);
   RezervADOQuery.GetFieldData(2, GroupRez);
   RezervADOQuery.GetFieldData(4, DescrRez);

   GroupPriceStr:=GroupPrice; DescrPriceStr:=DescrPrice;
   GroupRezStr:=GroupRez; DescrRezStr:=DescrRez;
   while not(RezervADOQuery.Eof) and
    (GroupPriceStr>=GroupRezStr) and
      (DescrPriceStr>DescrRezStr)
   do begin
    RezervADOQuery.Next;
    RezervADOQuery.GetFieldData(2, GroupRez);
    RezervADOQuery.GetFieldData(4, DescrRez);
    GroupRezStr:=GroupRez; DescrRezStr:=DescrRez;
   end;

   //чиатем и добавлем в итоговую таблицу
   NalichRemain:=PriceADOQuery.Fields.Fields[7].AsFloat;
   PriceADOQuery.GetFieldData(2, NewPodgruppa);
   NewPodgruppaStr:=NewPodgruppa;

   CurrentGroupTable:=nil;
   GroupsNoEqual:=false;
   if TeckuchPodgruppa=nil then begin
    GetMem(TeckuchPodgruppa, 9);
    TeckuchPodgruppaStr:='';
    GroupsNoEqual:=true;
   end;
   if not(GroupsNoEqual) then
    if TeckuchPodgruppaStr<>NewPodgruppaStr then
     GroupsNoEqual:=true;

   if GroupsNoEqual then begin
    TempSubGropuStr:='';
    if SubSubGroupsADOQuery.Active=true then begin
      SubSubGroupsADOQuery.First;
      repeat
       SubSubGroupsADOQuery.GetFieldData(1, TempSubGropu);
       TempSubGropuStr:=TempSubGropu;
       if TempSubGropuStr=NewPodgruppaStr then Break;
       SubSubGroupsADOQuery.Next;
      until SubSubGroupsADOQuery.Eof;
    end;
    if TempSubGropuStr=NewPodgruppaStr then
     CurrentGroupTable:=SubSubGroupsADOQuery
    else if SubGroupsADOQuery.RecordCount=1 then
    begin
     //SubGroupsADOQuery.First;
     SubGroupsADOQuery.GetFieldData(1, TempSubGropu);
     TempSubGropuStr:=TempSubGropu;
     if TempSubGropuStr=NewPodgruppaStr then
      CurrentGroupTable:=SubGroupsADOQuery;
    end;

    if CurrentGroupTable<>nil then begin
      //ID-товара
      CurrentGroupTable.GetFieldData(1, WriteDBFUnit.MassiveOfFields[0]);
      //Parnet-ID
      CurrentGroupTable.GetFieldData(2, WriteDBFUnit.MassiveOfFields[1]);
      //code
      CurrentGroupTable.GetFieldData(3, MassiveOfFields[2]);
      //descr
      CurrentGroupTable.GetFieldData(4, WriteDBFUnit.MassiveOfFields[3]);
      //ISFOLDER
      WriteDBFUnit.MassiveOfFields[4][0]:=
       PChar(CurrentGroupTable.Fields.Fields[4].AsString)^;
      //VERSTAMP
      CurrentGroupTable.GetFieldData(6, WriteDBFUnit.MassiveOfFields[5]);
      //SP85 - Артикул
      CurrentGroupTable.GetFieldData(7, WriteDBFUnit.MassiveOfFields[6]);

      InsertRecordToItogDBF(nil, true);

    end;
    TeckuchPodgruppaStr:=NewPodgruppa;
    for i:=0 to 9-1 do
     TeckuchPodgruppa[i]:=NewPodgruppa[i];
   end; //если текущая группа и группа текущего товара различны  

   //SetLength(GetChisloArr, 30);

   //ID-товара
   PriceADOQuery.GetFieldData(1, WriteDBFUnit.MassiveOfFields[0]);
   //Parnet-ID
   PriceADOQuery.GetFieldData(2, WriteDBFUnit.MassiveOfFields[1]);
   //code
   PriceADOQuery.GetFieldData(3, MassiveOfFields[2]);
   //descr
   PriceADOQuery.GetFieldData(4, WriteDBFUnit.MassiveOfFields[3]);
   //ISFOLDER
   WriteDBFUnit.MassiveOfFields[4][0]:=
       PChar(PriceADOQuery.Fields.Fields[9].AsString)^;
   //PriceADOQuery.GetFieldData(10, WriteDBFUnit.MassiveOfFields[4]);
   //VERSTAMP
   PriceADOQuery.GetFieldData(11, WriteDBFUnit.MassiveOfFields[5]);
   //SP85 - Артикул
   PriceADOQuery.GetFieldData(12, WriteDBFUnit.MassiveOfFields[6]);
   //IDOKEI - Базовая единица ID
   PriceADOQuery.GetFieldData(13, WriteDBFUnit.MassiveOfFields[7]);
   //IDOKEI - Базовая единица, ОКЕИ ID
   PriceADOQuery.GetFieldData(14, WriteDBFUnit.MassiveOfFields[8]);
   //VES - вес
   NumberOfStolbTeck:=9;
   SizeOfFieldTeck:=WriteDBFUnit.MassiveSizeOfFields[NumberOfStolbTeck];
   FieldValStr:=PriceADOQuery.Fields.Fields[14].AsString;
   SizeOfValueTeck:=length(FieldValStr);
   if SizeOfFieldTeck>SizeOfValueTeck then
    for sch:=0 to (SizeOfFieldTeck-
                    SizeOfValueTeck-1) do
     WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][sch]:=' ';
   for sch:=(SizeOfFieldTeck-
                   SizeOfValueTeck) to
            SizeOfFieldTeck do
   begin
    if copy(FieldValStr,
            sch-(SizeOfFieldTeck-SizeOfValueTeck), 1)=',' then
     WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][sch]:='.'
    else
     WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][sch]:=PChar(copy(FieldValStr,
                   sch-(SizeOfFieldTeck-
                   SizeOfValueTeck), 1))^;
   end; //VES - вес
   //COEFEDIN - коэффициент единицы
   NumberOfStolbTeck:=10;
   SizeOfFieldTeck:=WriteDBFUnit.MassiveSizeOfFields[NumberOfStolbTeck];
   FieldValStr:=PriceADOQuery.Fields.Fields[15].AsString;
   SizeOfValueTeck:=length(FieldValStr);
   if SizeOfFieldTeck>SizeOfValueTeck then
    for sch:=0 to (SizeOfFieldTeck-
                    SizeOfValueTeck-1) do
     WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][sch]:=' ';
   for sch:=(SizeOfFieldTeck-
                   SizeOfValueTeck) to
            SizeOfFieldTeck do
   begin
    if copy(FieldValStr,
            sch-(SizeOfFieldTeck-SizeOfValueTeck), 1)=',' then
     WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][sch]:='.'
    else
     WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][sch]:=PChar(copy(FieldValStr,
                   sch-(SizeOfFieldTeck-
                   SizeOfValueTeck), 1))^;
   end; //COEFEDIN - коэффициент единицы
   //SHTRICHCOD - штрих код
   NumberOfStolbTeck:=11;
   SizeOfFieldTeck:=WriteDBFUnit.MassiveSizeOfFields[NumberOfStolbTeck];
   FieldValStr:=PriceADOQuery.Fields.Fields[16].AsString;
   SizeOfValueTeck:=length(FieldValStr);
   if SizeOfFieldTeck>SizeOfValueTeck then
    for sch:=0 to (SizeOfFieldTeck-
                    SizeOfValueTeck-1) do
     WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][sch]:=' ';
   for sch:=(SizeOfFieldTeck-
                   SizeOfValueTeck) to
            SizeOfFieldTeck do
   begin
    if copy(FieldValStr,
            sch-(SizeOfFieldTeck-SizeOfValueTeck), 1)=',' then
     WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][sch]:='.'
    else
     WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][sch]:=PChar(copy(FieldValStr,
                   sch-(SizeOfFieldTeck-
                   SizeOfValueTeck), 1))^;
   end; //SHTRICHCOD - штрих код
   //DESCROKEI - DESCR of ОКЕИ
   NumberOfStolbTeck:=12;
   SizeOfFieldTeck:=WriteDBFUnit.MassiveSizeOfFields[NumberOfStolbTeck];
   FieldValStr:=PriceADOQuery.Fields.Fields[8].AsString;
   FieldValStr:=Trim(FieldValStr);
   SizeOfValueTeck:=length(FieldValStr);
   if SizeOfFieldTeck>SizeOfValueTeck then
    for sch:=0 to (SizeOfFieldTeck-
                    SizeOfValueTeck-1) do
     WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][sch]:=' ';
   for sch:=(SizeOfFieldTeck-
                   SizeOfValueTeck) to
            SizeOfFieldTeck do
   begin
    //if copy(FieldValStr,
    //        sch-(SizeOfFieldTeck-SizeOfValueTeck), 1)=',' then
    // WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][sch]:='.'
    //else
     WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][sch]:=PChar(
                   copy(FieldValStr,
                   sch-(SizeOfFieldTeck-
                   SizeOfValueTeck-1), 1))^;
   end; //DESCROKEI - DESCR of ОКЕИ
   //SP208 - весовой
   NumberOfStolbTeck:=13;
   PriceADOQuery.GetFieldData(18, WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck]);
   //SP2417 -  ВидНоменклатуры
   NumberOfStolbTeck:=14;
   PriceADOQuery.GetFieldData(19, WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck]);
   //SP5013 - Номер ГТД
   NumberOfStolbTeck:=15;
   PriceADOQuery.GetFieldData(20, WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck]);
   //SP94 - Основная единица
   NumberOfStolbTeck:=16;
   PriceADOQuery.GetFieldData(21, WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck]);
   //SP4427 - основное свойство
   NumberOfStolbTeck:=17;
   PriceADOQuery.GetFieldData(22, WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck]);
   //SP103 - ставка НДС
   NumberOfStolbTeck:=18;
   PriceADOQuery.GetFieldData(23, WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck]);
   //SP104 - СтавкаНП
   NumberOfStolbTeck:=19;
   PriceADOQuery.GetFieldData(24, WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck]);
   //SP5012 - страна происхождения
   NumberOfStolbTeck:=20;
   PriceADOQuery.GetFieldData(25, WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck]);
   //NALYCH - наличие товара в виде звездочек
   NumberOfStolbTeck:=21;
   WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][0]:='*';
   WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][1]:='*';
   WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][2]:='*';
   if NalichRemain<100 then
    WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][2]:=' ';
   if NalichRemain<50 then
    WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][1]:=' ';
   //IDVALUTA - ID валюты
   NumberOfStolbTeck:=22;
   PriceADOQuery.GetFieldData(26, WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck]);
   //VALUTA - валюта DESCR
   NumberOfStolbTeck:=23;
   PriceADOQuery.GetFieldData(27, WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck]);
   //SP25938 - процент у цены
   NumberOfStolbTeck:=24;
   SizeOfFieldTeck:=WriteDBFUnit.MassiveSizeOfFields[NumberOfStolbTeck];
   FieldValStr:=PriceADOQuery.Fields.Fields[27].AsString;
   SizeOfValueTeck:=length(FieldValStr);
   if SizeOfFieldTeck>SizeOfValueTeck then
    for sch:=0 to (SizeOfFieldTeck-
                    SizeOfValueTeck-1) do
     WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][sch]:=' ';
   for sch:=(SizeOfFieldTeck-
                   SizeOfValueTeck) to
            SizeOfFieldTeck do
   begin
    if copy(FieldValStr,
            sch-(SizeOfFieldTeck-SizeOfValueTeck), 1)=',' then
     WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][sch]:='.'
    else
     WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck][sch]:=PChar(copy(FieldValStr,
                   sch-(SizeOfFieldTeck-
                   SizeOfValueTeck), 1))^;
   end; //SP25938 - процент у цены
   //IDTYPEPRIC - ID типа цены
   NumberOfStolbTeck:=25;
   PriceADOQuery.GetFieldData(29, WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck]);
   //IDPRICE - ID цены
   NumberOfStolbTeck:=26;
   PriceADOQuery.GetFieldData(30, WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck]);
   //PRICE - цены
   NumberOfStolbTeck:=27;
   PriceADOQuery.GetFieldData(5, WriteDBFUnit.MassiveOfFields[NumberOfStolbTeck]);
   //DATALASTPO - дата полседней покупки
   //KOLYCHPOK - количесвто купленного

   InsertRecordToItogDBF(nil);

   NextRecordGoOf(PriceADOQuery, 4);
 until PriceADOQuery.Eof;

 FreeMem(DescrPrice,50);
 FreeMem(GroupPrice,9);
 FreeMem(DescrRez,50);
 FreeMem(GroupRez,9);

 if TeckuchPodgruppa<>nil then
  FreeMem(TeckuchPodgruppa, 9);
 FreeMem(NewPodgruppa, 9);
 FreeMem(TempSubGropu, 9);

 closeItogDBF();

 ItogAddADOCommand.Execute;
 ItogDeleteADOCommand.Execute;
 ItogADOQuery.Open;
 //ItogADOQuery.Recordset:=ItogADOCommand.Execute;
 //ItogADOTable.Open;
 //if ItogADOTable.RecordCount>0 then begin
 // try
 //  ItogADOTable.First;
 //  if Trim(ItogADOTable.FieldByName('descr').asString)=
 //      'Idooooooot' then begin
 //   ItogADOTable.Edit;
 //   ItogADOTable.FieldByName('descr').Value:=Trim(CurrFieldName);
 //   ItogADOTable.Post;
 //  end;
 // except
 //  CurrFieldName:=CurrFieldName;
 // end
 //end;
 //ItogADOTable.Edit;
 //ItogADOTable.Edit;
 //ItogADOTable.FieldByName('descr').Value:='idoot';
 //ItogADOTable.Post;
 //CopyItogADOQuery.Open;

end; //ShowResultsOfQueryes

constructor TBaseObj.Create;
begin
 inherited Create;

 FPathToBase:='';
end; //constructor TBaseObj

procedure TBaseObj.SetPathToBase(Value:string);
begin
 if Value<>FPathToBase then
  FPathToBase:=Value;
end; //TBaseObj.SetPathToBase


function TDelphiAndc1.ConectWithBase():boolean;
var
 CountOfInSpisok:integer;
begin
 if not(TryCoonectWithCurrentBase()) then begin
 { CountOfInSpisok:=ReadRegistry();
  SortirovkaSpisokOfRegistry();
  if (CountOfInSpisok>0) then
   if not(ChooseFromRegistry()) then}
    Result:=false
  {else begin
    WriteNewCurrentBase();
   end; //если выбрали другую базу}
  end //если текущей база нет
 else begin
  Result:=true;
  //BaseObj:=TBaseObj.Create;
 end; //елси текущая база есть
end; //ConectWithBase

function TDelphiAndc1.TryCoonectWithCurrentBase():boolean;
var
 SearchRec:TSearchRec;
 f, fConfig:TextFile;
 Symb:Char;
 CommandStr, ValOfPr:String;
 DirOfBase, DirOfBaseWithoutIP, FindingCondition:string;
 AnsStrStr, sl, sr:string;
 AnsiStr1, AnsiStr2:PAnsiChar;
 PosDvoet:integer;
 lpMsgBuf:PAnsiChar;
 FindedFileOfConfig:integer;
begin
 Result:=false;
 AssignFile(f, GetApplicationPath+'\'+OPTIONSONCREATEANDRESIZEDIR+
                '\'+ADMINOPTIONSFILE);
 Reset(f);
 repeat
  repeat
   ReadLn(f);
   Read(f, Symb);
  until (Symb='P');
  Readln(f, CommandStr);
 until (CommandStr='=INTERFACE');

 repeat
  ReadLn(f);
  Read(f, Symb);
  if Symb='P' then begin
   Read(f, Symb);
   Readln(f, CommandStr);
  end;
 until (Trim(CommandStr)='=VISIBLE');

 Readln(f, ValOfPr);
 ValOfPr:=copy(ValOfPr, Length('V=')+1,
              Length(ValOfPr)-Length('V='));
 if ValOfPr='FALSE' then
  CursorVisible:=false else
  CursorVisible:=true;

 //читаем инофрмацию о названии групп есть или нет
 Readln(f, ValOfPr); Readln(f, ValOfPr);
 Readln(f, ValOfPr);
 ValOfPr:=copy(ValOfPr, Length('V=')+1,
              Length(ValOfPr)-Length('V='));
 if ValOfPr='FALSE' then begin
  SetCaptionsOfGroupsBool:=true;
 end;

 repeat
  repeat
   ReadLn(f);
   Read(f, Symb);
  until (Symb='P');
  Readln(f, CommandStr);
 until (CommandStr='=BASE');

 repeat
  ReadLn(f);
  Read(f, Symb);
  if Symb='P' then begin
   Read(f, Symb);
   Readln(f, CommandStr);
  end;
 until (Trim(CommandStr)='=IP_COMP') or
       (Trim(CommandStr)='=DIR');
 Readln(f, ValOfPr);
 ValOfPr:=copy(ValOfPr, Length('V=')+1,
              Length(ValOfPr)-Length('V='));
 if CommandStr='=IP_COMP' then
  DirOfBase:='\\'+ValOfPr+'\'
 else begin
  DirOfBase:=ValOfPr+'\';
  DirOfBaseWithoutIP:=ValOfPr+'\';
 end;

 Read(f, Symb);
 if Symb='P' then begin
  Read(f, Symb);
  Readln(f, CommandStr);
 end;

 if (Trim(CommandStr)<>'=IP_COMP') and
       (Trim(CommandStr)<>'=DIR') then
 repeat
  Readln(f);
  Read(f, Symb);
  if Symb='P' then begin
    Read(f, Symb);
    Readln(f, CommandStr);
  end;
 until (Trim(CommandStr)='=IP_COMP') or
       (Trim(CommandStr)='=DIR');
 Readln(f, ValOfPr);
 ValOfPr:=copy(ValOfPr, Length('V=')+1,
              Length(ValOfPr)-Length('V='));
 if CommandStr='=IP_COMP' then
  DirOfBase:='\\'+ValOfPr+'\'+DirOfBase+'\'
 else begin
  DirOfBase:=DirOfBase+ValOfPr+'\'; //ValOfPr+'\';
  DirOfBaseWithoutIP:=ValOfPr+'\';
 end;

 closeFile(f);
 PosDvoet:=Pos(':', DirOfBase);
 sl:=LeftStr(DirOfBase, PosDvoet-1);
 sr:=RightStr(DirOfBase, Length(DirOfBase)-PosDvoet);
 DirOfBase:=sl+sr;

 //чтение файла с конфигурацией
 FindingCondition:=DirOfBase;
 FindedFileOfConfig:=FindFirst(FindingCondition+'1Cv7.DD', faAnyFile, SearchRec);
 if FindedFileOfConfig<>0 then begin
  FindingCondition:=DirOfBaseWithoutIP;
  FindedFileOfConfig:=FindFirst(FindingCondition+'1Cv7.DD', faAnyFile, SearchRec);
 end;
 if FindedFileOfConfig<>0 then begin

 end; //если не нашли файл с конфигурацией
 if FindedFileOfConfig=0 then begin
  try
   AnsStrStr:=FindingCondition+'1Cv7.DD';
   //AnsStrStr[Length(AnsStrStr)]:=Char(0);
   AnsiStr1:=PAnsiChar(AnsStrStr);
   AnsiStr2:=PAnsiChar(GetApplicationPath+'\'+DATABASETEMPDIR+'\'+CONFIGOFBASEFILE);
   if CopyFile(AnsiStr1, AnsiStr2, false)=false then begin
     FormatMessage(
      FORMAT_MESSAGE_ALLOCATE_BUFFER or FORMAT_MESSAGE_FROM_SYSTEM,
      nil,
      GetLastError(),
      ((Word(SUBLANG_DEFAULT) shr 10) or Word(LANG_NEUTRAL)), // Default language
      PAnsiChar (@lpMsgBuf),
      0,
      nil
    );
    //lpMsgBuf:=Pointer(GetLastError());
    //lpMsgBuf:=PAnsiChar(GetLastError());
    MessageBox(Handle, lpMsgBuf, 'Error', mb_Ok);
   end; //если не получилось скопировать файл
   //чтение конфигурации
   AssignFile(f, GetApplicationPath+'\'+OPTIONSONCREATEANDRESIZEDIR+
                 '\'+ADMINOPTIONSFILE);
   AssignFile(fConfig, GetApplicationPath+'\'+DATABASETEMPDIR+
                       '\'+CONFIGOFBASEFILE);
   Reset(f);
   try
    Reset(fConfig);
    try
    finally
     closeFile(fConfig);
    end; //закрываем открытые файлы
   finally
    closeFile(f);
   end; //закрываем открытые файлы
  finally
   FindClose(SearchRec);
  end; //закрываем ресурс поиска файла
  Result:=true;
  BaseObj.PathToBase:=FindingCondition;
 end; //если нашли файл с конфигурацией
end; //TryCoonectWithCurrentBase

procedure TDelphiAndc1.FormResize(Sender: TObject);
begin
 if BeforeResize then begin
  SetOfCoordinatesOfObjects(ClientWidth, ClientHeight);
  if (ClientWidth=1280) and (ClientHeight=1024) then begin
   RightImage.Stretch:=false;
   RightImage.AutoSize:=true;
   LeftImage.Stretch:=false;
   LeftImage.AutoSize:=true;
   LeftSubImage.Stretch:=false;
   LeftSubImage.AutoSize:=true;
   SubRightImage.Stretch:=false;
   SubRightImage.AutoSize:=true;
   PageUpPriceImage.Stretch:=false;
   PageUpPriceImage.AutoSize:=true;
   PageDownPriceImage.Stretch:=false;
   PageDownPriceImage.AutoSize:=true;
   RowUpPriceImage.Stretch:=false;
   RowUpPriceImage.AutoSize:=true;
   RowDownPriceImage.Stretch:=false;
   RowDownPriceImage.AutoSize:=true;
   RowUpSchetImage.Stretch:=false;
   RowUpSchetImage.AutoSize:=true;
   RowDownSchetImage.Stretch:=false;
   RowDownSchetImage.AutoSize:=true;
   CreateSchetImage.Stretch:=false;
   CreateSchetImage.AutoSize:=true;
   Add1Image.Stretch:=false;
   Add1Image.AutoSize:=true;
   Add5Image.Stretch:=false;
   Add5Image.AutoSize:=true;
   Add10Image.Stretch:=false;
   Add10Image.AutoSize:=true;
   ChooseAmountImage.Stretch:=false;
   ChooseAmountImage.AutoSize:=true;
   InfoPriceImage.Stretch:=false;
   InfoPriceImage.AutoSize:=true;
   ShowAddButImage.Stretch:=false;
   ShowAddButImage.AutoSize:=true;
  end;
 end;

 if (TopOfMainGridBoolChanged) and BeforeResize then begin
  PaintSdvigAllObjects();
  TopOfMainGridBoolChanged:=false;
 end;
 BeforeResize:=false;
 ItogDataSourceDataChange(ItogDataSource, nil);
 GroupsDataSource.OnDataChange(GroupsADOQuery, nil);
end; //procedure TDelphiAndc1.FormResize(Sender: TObject);



procedure TDelphiAndc1.LeftGropuBitBtnClick(Sender: TObject);
begin
 if not(GroupsADOQuery.Bof) then
  GroupsADOQuery.Prior;
 //UpdateNalychiy(GroupsDBCtrlGrid);
end;

procedure TDelphiAndc1.RightGroupBitBtnClick(Sender: TObject);
begin
 if not GroupsADOQuery.Eof then
  GroupsADOQuery.Next;
end;

procedure TDelphiAndc1.SubGroupsDataSourceDataChange(Sender: TObject;
  Field: TField);
var
 s:string;
begin
 if (SubGroupsADOQuery.RecordCount>1) then begin
   //if SelectedSubGr=nil then
   // GetMem(SelectedSubGr, 9);
   //if SubGroupsADOQuery.GetFieldData(1, SelectedSubGr)=false
   //then begin
   // Result:=10;
   // ShowMessage('Выбранной под группы не существует!?');
   // exit;
   //end;
   if not(ZagruzkaTovaraIzPrice) then begin
    SubSubGroupsADOQuery.Parameters.Items[0].Value:=
     SubGroupsADOQuery.FieldValues['ID'];
    SubSubGroupsADOQuery.Close;
    SubSubGroupsADOQuery.Open;
    if SubSubGroupsADOQuery.RecordCount=0 then
     SubSubGroupsADOQuery.Active:=false;
   end;
  end; //else SubGroupsADOQuery.Active:=false;

 //определеям положения рисованных объектов
 //if not SubGroupsADOQuery.Active then begin
 if (SubGroupsADOQuery.RecordCount<=1) then begin
  if not(PredydSdvigExist) then
   TopOfMainGridBoolChanged:=true;
  PredydSdvigExist:=true;
 end else begin
  if PredydSdvigExist then
   TopOfMainGridBoolChanged:=true;
  PredydSdvigExist:=false;
 end;

 //делаем фильтр по товарам орпеделенных групп
 //фильтр по фирме
 //остатки и цена
 //цены, причем вся история
 if ZagruzkaTovaraIzPrice then begin
  if (SubGroupsADOQuery.RecordCount>1) then
   s:=SubGroupsADOQuery.FieldByName('ID').AsString
  else begin
   s:=GroupsADOQuery.FieldByName('CODE').AsString;
  end;
  if PaintOptionADOQuery.Active then
   SendMessage(ItogDBCtrlGrid.Handle, WM_SETREDRAW, 0, 0);
  ItogADOQuery.Close;
  ItogADOQuery.SQL.Strings[8]:=s;
  ItogADOQuery.Open;
  if (PaintOptionADOQuery.Active) and
   not(TopOfMainGridBoolChanged) then begin
    SendMessage(ItogDBCtrlGrid.Handle, WM_SETREDRAW, 1, 0);
    GetUpdateRect(Handle, RePaintRect, false);
    RePaintRect:=LeftGroupsLabel.BoundsRect;
    RePaintRect.Right:=RightGrLabel.Left+RightGrLabel.Width;
    ValidateRect(Handle, @RePaintRect);
    //ItogDBCtrlGrid.Invalidate;
    GetUpdateRect(Handle, RePaintRect, false);
    ItogDBCtrlGrid.Update;
  end;

 end; //если загрузка из прайса

 if not(ZagruzkaTovaraIzPrice) then begin
  //получаем спиок всевозможных выбранных групп
  GetSpisokOfGroup();
  //пытаемся избавиться от глюка с опретивной памятью, кажется получилось
  SizeS:=Length(AllSelectedGroups);

  SpisGroupStr:=TrimRight(AllSelectedGroups);
  SizeS:=Length(AllSelectedGroups);
  if SizeS<>(SizeOfPeremSelecGr*13-2) then begin
   SpisGroupStr:=Copy(AllSelectedGroups,0,SizeOfPeremSelecGr*13-2);
  end;

  //ФОРМИРУЕМ ОТЧЕТЫ
  //прайс с историей цен, но зато по всем в наличии товарам
  ReportDoPriceAllTovar();

  //резервы
  RezervyReportDo();

  //история закупок
  HistoryOfOrdersGood();

  if PaintOptionADOQuery.Active then
   SendMessage(ItogDBCtrlGrid.Handle, WM_SETREDRAW, 0, 0);
  //пробегаем по таблицам таблицам, и формируем таблицу итоговую
  ShowResultsOfQueryes();
  if (PaintOptionADOQuery.Active) and
   not(TopOfMainGridBoolChanged) then begin
   SendMessage(ItogDBCtrlGrid.Handle, WM_SETREDRAW, 1, 0);
   ItogDBCtrlGrid.Repaint;
  end;


 end; //если загружаем информацию не из прайса
 //FormResize(self);
 //PriceDataSource.Enabled:=true;
 //ItogDBCtrlGrid.Repaint;
 //Result:=0;
 //скролл бар делаем видимым или невидимым,
 //в завсимости от количество строк в таблице
 if (PaintOptionADOQuery.Active) and
    Assigned(ScrollButtons) then
 if (ItogADOQuery.RecordCount>ItogDBCtrlGrid.RowCount) then begin
  FRPoplavok.FVisivle:=true;
  //поплавок рисуем
  Canvas.Pen.Color:=PoplavokScroll.ParentObj.Color;
  Canvas.Brush.Color:=PoplavokScroll.Color;
  Canvas.Rectangle(PoplavokScroll.Left, FRPoplavok.FTopParent,
                   PoplavokScroll.Right, PoplavokScroll.Bottom);
  //бегун поплавка
  Canvas.Pen.Color:=BegunPoplavka.ParentObj.Color;
  Canvas.Brush.Color:=BegunPoplavka.Color;
  Canvas.Rectangle(BegunPoplavka.Left, FRPoplavok.FTopParent+FRPoplavok.FTop,
                   BegunPoplavka.Right, FRPoplavok.FTopParent
                                        +FRPoplavok.FTop+FRPoplavok.FHeight);
  {ScrollBarImage.Visible:=true;
  ScrollBegunImage.Visible:=true;
  ScrollUpButtonImage.Visible:=true;
  ScrollDownButtonImage.Visible:=true;
  ScrollDownButtonImage.Update;}
 end
 else begin
  FRPoplavok.FVisivle:=false;
  //поплавок стираем
  {Canvas.Pen.Width:=1;
  Canvas.Pen.Color:=General.Color;
  Canvas.Pen.Color:=General.Color;
  Canvas.Brush.Color:=General.Color;}
  Canvas.Pen.Color:=PoplavokScroll.ParentObj.Color;
  Canvas.Brush.Color:=PoplavokScroll.Color;
  Canvas.Rectangle(PoplavokScroll.Left, FRPoplavok.FTopParent,
                   PoplavokScroll.Right, PoplavokScroll.Bottom);
  {ScrollBarImage.Visible:=false;
  ScrollBegunImage.Visible:=false;
  ScrollUpButtonImage.Visible:=false;
  ScrollDownButtonImage.Visible:=false;
  ScrollDownButtonImage.Update;}
 end;

 if not(UpdateRootGroups) then begin
  ItogDBCtrlGrid.RePaint;
 end;
end; {SubGroupsDataSourceDataChange}

function GetApplicationPath():string;
begin
 if ApplicPath='' then begin
  SProjName:=Application.ExeName;

  while Pos('\', SProjName)>0 do
   SProjName:=copy(SProjName, Pos('\', SProjName)+1,
                    Length(SProjName)-Pos('\', SProjName));
  ApplicPath:=copy(Application.ExeName, 1,
   Length(Application.ExeName)-Length(SProjName)-1);
  ConstUnit.ApplicPath:=ApplicPath;
 end; //если переменная с путем приложения не заполнена
 Result:=ApplicPath;
end; //GetApplicationPath():string;

function TDelphiAndc1.SmodelirovatyClick(DownNacg:boolean; Im:TImage; LeftKn:boolean):byte;
var
 LeftSdv, TopSdv, WidthSug, HeightSug:integer;
begin
 LeftSdv:=3; TopSdv:=1; WidthSug:=-1; HeightSug:=-1;
 if not(DownNacg) then begin
  LeftSdv:=-LeftSdv; TopSdv:=-TopSdv;
  WidthSug:=-WidthSug; HeightSug:=-HeightSug;
 end;
 if not(LeftKn) then LeftSdv:=-LeftSdv;
 Im.Left:=Im.Left+LeftSdv; Im.Top:=Im.Top+TopSdv;
 Result:=0;
end; //SmodelirovatyClick

procedure TDelphiAndc1.GroupsDataSourceDataChange(Sender: TObject;
  Field: TField);
var
 sCapLeft, sCapRigth:string;
 MinAndMaxOfMassive:integer;
begin
 if MoveFromNotTable then Exit;
 if ChangingSystemGr then exit;

 UpdateRootGroups:=true;

 if PaintOptionADOQuery.Active then begin
  //фон экрана рисуем
  Canvas.Pen.Width:=1;
  Canvas.Pen.Color:=General.Color;
  Canvas.Pen.Color:=General.Color;
  Canvas.Brush.Color:=General.Color;
  Canvas.Rectangle(General.Left,
    PanelOfGroups.Bottom-1,
    General.Right,
     PanelOfAllOther.Top);
  //панель групп
  Canvas.Pen.Width:=1;
  Canvas.Pen.Color:=PanelOfGroups.Color;
  Canvas.Brush.Color:=PanelOfGroups.Color;
  Canvas.Rectangle(GroupsDBCtrlGrid.Left-10,
    PanelOfGroups.Top+PanelOfGroups.ThicknessGlare.Top+1,
    GroupsDBCtrlGrid.Left+GroupsDBCtrlGrid.Width+10,
     PanelOfGroups.Bottom-1);
  //рисунок объединеия верхней и нижней панели
  Canvas.Pen.Color:=PanelOfAllOther.Color;
  Canvas.Brush.Color:=PanelOfAllOther.Color;
  SetXCoordOfArrayOfPoint(GroupsDBCtrlGrid.Left+
   (GroupsDBCtrlGrid.PanelIndex)*GroupsDBCtrlGrid.PanelWidth,
   SelectedFigureSide);
  Canvas.Polygon(SelectedFigureSide);
 end;
 //LeftGroupsLabel.Repaint;
 sCapLeft:=LeftGroupsLabel.Caption;
 sCapRigth:=RightGrLabel.Caption;
 PoluchitSpisokGroupAfterClick(self, sCapLeft,
  sCapRigth, LeftGroupsLabel, RightGrLabel,
  GroupsDBCtrlGrid.PanelIndex, GroupsADOQuery,
  GroupsDBCtrlGrid.PanelCount, @ChangingSystemGr);

 //TweakingWidthL:=;
 if PaintOptionADOQuery.Active then begin
  TweakingByWidth(LeftGroupsLabel.Font, sCapLeft,
                  LeftGroupsLabel.Constraints.MaxWidth);

  TweakingByWidth(RightGrLabel.Font, sCapRigth,
                  RightGrLabel.Constraints.MaxWidth, false);
 end;


 LeftGroupsLabel.Caption:=sCapLeft;
 RightGrLabel.Caption:=sCapRigth;

 if PaintOptionADOQuery.Active then
  RightGrLabel.Left:=NandpHideGroups.Right-RightGrLabel.Width;

 //if (RePaintRect.Right-RePaintRect.Left)>
 // LeftGroupsLabel.Width then
 //глюк с рисованием
 //GetUpdateRect(Handle, RePaintRect, false);
 //ValidateRect(Handle, @RePaintRect);
 //GetUpdateRect(Handle, RePaintRect, false);
 //RePaintRect:=LeftGroupsLabel.BoundsRect;
 //RePaintRect.Right:=RePaintRect.Right+300;
 //InvalidateRect(Handle, @RePaintRect, false);
 //Update;
 //закрашиваем прямоугольник с надписями скрытых групп
 if PaintOptionADOQuery.Active then begin
   Canvas.Brush.Color:=PanelOfGroups.Color;
   RePaintRect:=LeftGroupsLabel.BoundsRect;
   RePaintRect.Right:=RePaintRect.Left+100;
   Canvas.FillRect(RePaintRect);
 end;
 LeftGroupsLabel.Repaint;
 RightGrLabel.Repaint;

 //обноваляем подгруппы и прайс
 SubGroupsADOQuery.Parameters.Items[0].Value:=
  GroupsADOQuery.FieldValues['ID'];
 if PaintOptionADOQuery.Active then begin
  SendMessage(ItogDBCtrlGrid.Handle, WM_SETREDRAW, 0, 0);
  //if SubGroupsDBCtrlGrid.Visible then
   SendMessage(SubGroupsDBCtrlGrid.Handle, WM_SETREDRAW, 0, 0);
 end;
 SubGroupsADOQuery.Close;
 SubGroupsADOQuery.Open;
 if PaintOptionADOQuery.Active then begin
  SendMessage(ItogDBCtrlGrid.Handle, WM_SETREDRAW, 1, 0);
  if SubGroupsDBCtrlGrid.Visible then
   SendMessage(SubGroupsDBCtrlGrid.Handle, WM_SETREDRAW, 1, 0)
  else;
   //ValidateRect(SubGroupsDBCtrlGrid.Handle, nil);
   //SubGroupsDBCtrlGrid.validate;
 end;

 //сдвигаем все объекты рисования, если у группы мало подгрупп
 if (TopOfMainGridBoolChanged) and not(BeforeResize) then begin
  GetUpdateRect(Handle, Prov3, false);
  SendMessage(OrderDBCtrlGrid.Handle, WM_SETREDRAW, 0, 0);
  SendMessage(ItogDBCtrlGrid.Handle, WM_SETREDRAW, 0, 0);
  PaintSdvigAllObjects();
  SendMessage(ItogDBCtrlGrid.Handle, WM_SETREDRAW, 1, 0);
  SendMessage(OrderDBCtrlGrid.Handle, WM_SETREDRAW, 1, 0);
  TopOfMainGridBoolChanged:=false;
  if PaintOptionADOQuery.Active then begin
   //InvalidateRect();
   //try
   // ValidateRect(TWinControl(CreateSchetImage).Handle, nil);
   //except
   //end;
   GetUpdateRect(Handle, Prov3, false);
   Prov2:=Prov3;
   Prov2.Left:=0; Prov2.Top:=GroupsDBCtrlGrid.Top+GroupsDBCtrlGrid.Height+5;
   Prov2.Right:=ClientWidth;
   Prov2.Bottom:=CreateSchetImage.Top-10;
   InvalidateRect(Handle, @Prov2, false);

   //ValidateRect(SubGroupsDBCtrlGrid.Handle, nil);
   //Prov2:=SubGroupsDBCtrlGrid.ClientRect;
   //ValidateRect(Handle, @Prov2);
   //ValidateRect(Handle, nil);
   //CreateSchetImage.Invalidate;
   //Refresh;
   Update;
   OrderDBCtrlGrid.Repaint;
   //Repaint;
  end;
 end;

 if PaintOptionADOQuery.Active then begin
  {if ScrollBarImage.Visible then
   ScrollBarImage.Repaint;       }
  if SubGroupsDBCtrlGrid.Visible then
   SubGroupsDBCtrlGrid.Repaint;
  ItogDBCtrlGrid.Repaint;
 end;

 if PaintOptionADOQuery.Active then begin
  if ItogADOQuery.RecordCount<=0 then
     ItogDBCtrlGrid.Refresh;
 end;

 UpdateRootGroups:=false;
 
end; //GroupsDataSourceDataChange

procedure TDelphiAndc1.LeftSubImageClick(Sender: TObject);
begin
end; //LeftSubImageClick

procedure TDelphiAndc1.SubRightImageClick(Sender: TObject);
begin
end; //SubRightImageClick

procedure TDelphiAndc1.GroupsDBCtrlGridPaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
var
 TAnyField:TField;
 FieldVal:String;
begin
 if not(Assigned(GroupsImage)) then Exit;
 if MoveFromNotTable and
  (Index<>DBCtrlGrid.PanelIndex) then Exit;
 FieldVal:=Trim(GroupsADOQuery.FieldByName('DESCR').AsString);
 if FileExists(GetApplicationPath+'\'+IMAGESGROUPSDIR+'\'+
     FieldVal+'.jpg') then begin
   //SubGrImage.Transparent:=false;
   GroupImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
      IMAGESGROUPSDIR+'\'+FieldVal+'.jpg');
  end
       else //begin
   if FileExists(GetApplicationPath+'\'+IMAGESGROUPSDIR+'\'+
     FieldVal+'.bmp') then begin
   //SubGrImage.Transparent:=false;
    GroupImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
       IMAGESGROUPSDIR+'\'+FieldVal+'.bmp');
  end
       else begin

  //SubGrImage.Transparent:=false;
  GroupImage.Picture.LoadFromFile(GetApplicationPath+'\'+IMAGESGROUPSDIR+'\'+
     'NoCart'+'.bmp');
  //GroupImage.Picture:=nil;
 end;
 if FileExists(GetApplicationPath+'\'+IMAGESGROUPSDIR+'\'+
     FieldVal+'_Name_'+SizeScreenText+'.bmp') then begin
  NameOfGroupImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
     IMAGESGROUPSDIR+'\'+FieldVal+'_Name_'+SizeScreenText+'.bmp');
  {NameOfGroupImage.Top:=GroupNameText.BottomInParent-
   NameOfGroupImage.Height;}
  NameOfGroupImage.Top:=GroupNameText.BottomInParent-
   NameOfGroupImage.Height;
 end else begin
  NameOfGroupImage.Picture:=nil;
 end;

 TAnyField:=GroupsADOQuery.FieldByName('DESCR');

 //MoveFromNotTable:=true;
 //GroupsDataSource.OnDataChange(GroupsADOQuery, TAnyField);
 //MoveFromNotTable:=false;

 //рисуем фон кртинок групп
 DBCtrlGrid.Canvas.Brush.Color:=GroupsImage.Color;
 if (Index mod 2) <> 0 then
  DBCtrlGrid.Canvas.Brush.Color:=GroupsImage.ColorChered;
 if Index=DBCtrlGrid.PanelIndex then
  DBCtrlGrid.Canvas.Brush.Color:=GroupsImage.ColorSelected;
 DBCtrlGrid.Canvas.Pen.Color:=DBCtrlGrid.Canvas.Brush.Color;
 DBCtrlGrid.Canvas.RoundRect(0,
  0, GroupsImage.Value,
   DBCtrlGrid.PanelHeight, 5, 5);
 if Index=DBCtrlGrid.PanelIndex then begin
 DBCtrlGrid.Canvas.Rectangle(0,
  DBCtrlGrid.PanelHeight-3, GroupsImage.Value,
   DBCtrlGrid.PanelHeight);
 end;

end; //GroupsDBCtrlGridPaintPanel

procedure TDelphiAndc1.ItogDBCtrlGridPaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
var
 NalychFl, Clich:Double;
 NaimTov, Edin:string;
 HistBraly:Double;
 DobavlGran:integer;
 //замена точки на запятую
 sFull, sLeft, sRight:string; PosPoint:integer;

 IsItGroup:boolean;
 EndI:integer; //переменная для выхода из цикла
 Brush:HBrush; ColBackGroud:TColor; R:TRect;
begin
 if not(Assigned(ColNameOfPrice)) then Exit;
 //TNoScrollPanels(ItogDBCtrlGrid).Panel.Width:=PriceTable.Width;
 if not(ItogADOQuery.Active) then Exit;

 IsItGroup:=false;
 NalychStaticText.Caption:='';
 EdItogStaticText.Caption:='';
 PriceItStaticText.Caption:='';
 HistDateStaticText.Caption:='';
 ColItStaticText.Caption:='';

 if ItogADOQuery.RecordCount=0 then begin
  Add1Image.Visible:=false;
  Add5Image.Visible:=false;
  Add10Image.Visible:=false;
  ChooseAmountImage.Visible:=false;
  InfoPriceImage.Visible:=false;
  ShowAddButImage.Visible:=false;
  ColOfButtonsShape.Visible:=false;
  exit;
 end
 else begin
  ColOfButtonsShape.Visible:=true;
  {if (CurrentPanelInItog=Index) //then begin
  //if (CurrentPanelInItog=ItogADOQuery.RecNo) //then begin
    and (Index=DBCtrlGrid.PanelIndex) then begin
   Add1Image.Visible:=true;
   Add5Image.Visible:=true;
   Add10Image.Visible:=true;
   ChooseAmountImage.Visible:=true;
   InfoPriceImage.Visible:=false;
   ShowAddButImage.Visible:=false;
  end else} begin
   Add1Image.Visible:=false;
   Add5Image.Visible:=false;
   Add10Image.Visible:=false;
   ChooseAmountImage.Visible:=false;
   InfoPriceImage.Visible:=true;
   ShowAddButImage.Visible:=true;
  end;
 end;

 if (not(RepaintTwo)) and (PaintOptionADOQuery.Active) then begin
  RepaintTwo:=true;
  if (Index=DBCtrlGrid.PanelIndex)
   then ColBackGroud := DBCtrlGrid.SelectedColor
    else ColBackGroud := DBCtrlGrid.Color;
    Brush := CreateSolidBrush(ColorToRGB(ColBackGroud));
    R:=TNoScrollPanels(DBCtrlGrid).Panel.ClientRect;
    FillRect(DBCtrlGrid.Canvas.Handle, R, Brush);
    DeleteObject(Brush);
  //TNoScrollPanels(DBCtrlGrid).Panel.Repaint;
    RepaintTwo:=false;
 end;

 if RepaintTwo then Exit;

 {Add1Image.Update;
 Add5Image.Update;
 Add10Image.Update;
 InfoPriceImage.Update;
 ShowAddButImage.Update;}

 //определяем ни ушло ли название товара за пределы рамки
 DescrItDBText.Font.Size:=NameTextOfPrice.FontSize;
 DefineWidthOfNameTovLabel.Font.Size:=NameTextOfPrice.FontSize;
 DefineWidthOfNameTovLabel.Width:=DescrItDBText.Width;
 DefineWidthOfNameTovLabel.Height:=200;
 DefineWidthOfNameTovLabel.Caption:=
  Trim(ItogADOQuery.Fields.Fields[1].AsString);
 DefineWidthOfNameTovLabel.AutoSize:=false;
 DefineWidthOfNameTovLabel.AutoSize:=true;
 //за пределы ширины
 EndI:=0;
 while (DefineWidthOfNameTovLabel.Width>DescrItDBText.Width)
  and (EndI<30) do
 begin
  DefineWidthOfNameTovLabel.Font.Size:=
   Round(9*DefineWidthOfNameTovLabel.Font.Size/10);
  DefineWidthOfNameTovLabel.AutoSize:=true;

  Inc(EndI);
 end; //while
 //за пределы высоты
 EndI:=0;
 while (DefineWidthOfNameTovLabel.Height>NameTextOfPrice.Height)
  and (EndI<30) do
 begin
  DefineWidthOfNameTovLabel.Font.Size:=
   Round(9*DefineWidthOfNameTovLabel.Font.Size/10);
  DefineWidthOfNameTovLabel.AutoSize:=true;
  Inc(EndI);
 end; //while
 //если был изменен размер для рамки
 if DescrItDBText.Font.Size<>
   DefineWidthOfNameTovLabel.Font.Size then begin
  DescrItDBText.Font.Size:=
  DefineWidthOfNameTovLabel.Font.Size;
 end;


 if ZagruzkaTovaraIzPrice then begin
  NalychStaticText.Caption:='***';
  NalychFl:=ItogADOQuery.Fields.Fields[2].AsFloat;
  if NalychFl<100 then NalychStaticText.Caption:='**';
  if NalychFl<50 then NalychStaticText.Caption:='*';
  NaimTov:=Trim(ItogADOQuery.Fields.Fields[1].AsString);
  GetLastNameAndChislo(NaimTov, Edin, Clich);
  EdItogStaticText.Caption:=Edin;//FloatToStr(Clich)+Edin;
  PriceItStaticText.Caption:=Trim(ItogADOQuery.Fields.Fields[3].AsString)+
                                ' руб.';
  HistBraly:=ItogADOQuery.Fields.Fields[5].AsFloat;
  if HistBraly>0 then begin
   ColItStaticText.Caption:=Trim(ItogADOQuery.Fields.Fields[5].AsString)+
       ' '+Edin;
   HistDateStaticText.Caption:=
    Trim(ItogADOQuery.Fields.Fields[4].AsString);
  end;
 end //если информацию берем из прайса
 else begin
  IsItGroup:=false;
  if ItogADOQuery.Fields.Fields[4].AsInteger=1 then
   IsItGroup:=true;
  //если не группа
  if not(IsItGroup) then begin
   NalychStaticText.Caption:=ItogADOQuery.Fields.Fields[21].AsString;
   EdItogStaticText.Caption:=Trim(ItogADOQuery.Fields.Fields[12].AsString);
   sFull:=Trim(ItogADOQuery.Fields.Fields[27].AsString);
   PosPoint:=Pos('.', sFull);
   sLeft:=LeftStr(sFull, PosPoint-1);
   sRight:=RightStr(sFull, Length(sFull)-PosPoint);
   PriceItStaticText.Caption:=sLeft+','+sRight;

   if ItogADOQuery.FieldValues['DATALASTPO']<>0 then
    HistDateStaticText.Caption:=Trim(ItogADOQuery.Fields.Fields[28].AsString);
   if ItogADOQuery.FieldValues['KOLYCHPOK']>0 then
    ColItStaticText.Caption:=Trim(ItogADOQuery.Fields.Fields[29].AsString);
  end; //если не группа
 end; //есил загрузка идет из прайса и в противном случае

 //если группу
 if IsItGroup then begin
  Add1Image.Visible:=false;
  Add5Image.Visible:=false;
  Add10Image.Visible:=false;
  ChooseAmountImage.Visible:=false;
  InfoPriceImage.Visible:=false;
  ShowAddButImage.Visible:=false;

  DBCtrlGrid.Canvas.Brush.Color:=clWhite;//цвет группы;
  DBCtrlGrid.Canvas.Pen.Width:=1;
  //цвет границы ячеек в таблице
  DBCtrlGrid.Canvas.Pen.Color:=RGB(186, 201, 211);
  if Index=DBCtrlGrid.PanelIndex then begin
   DobavlGran:=-1;
   //DBCtrlGrid.Canvas.Pen.Color:=clGray;
  end;
  //if Index=DBCtrlGrid.PanelIndex-1 then
  // DobavlGran:=-1;
  DBCtrlGrid.Canvas.Rectangle(0, 0,
   ColButtonsOfPrice.RightInParent,
   DBCtrlGrid.PanelHeight);
 end; //если группа

 DobavlGran:=0;
 //DobavlGran:=-1;
 //колонка наименования товара
 DBCtrlGrid.Canvas.Brush.Color:=ColNameOfPrice.Color;
 if (Index mod 2) <> 0 then begin
  DBCtrlGrid.Canvas.Brush.Color:=ColNameOfPrice.ColorChered;
 end;
 DBCtrlGrid.Canvas.Pen.Width:=1;
 //цвет границы ячеек в таблице
 DBCtrlGrid.Canvas.Pen.Color:=RGB(186, 201, 211);
 if Index=DBCtrlGrid.PanelIndex then begin
  DobavlGran:=-1;
  //DBCtrlGrid.Canvas.Pen.Color:=clGray;
 end;
 //if Index=DBCtrlGrid.PanelIndex-1 then
 // DobavlGran:=-1;
 DBCtrlGrid.Canvas.Rectangle(0, -1,
  ColNameOfPrice.RightInParent,
  DBCtrlGrid.PanelHeight);

 //колонка наличия и единицы
 //DBCtrlGrid.Canvas.Pen.Color:=RGB(186, 0, 0);
 DBCtrlGrid.Canvas.Brush.Color:=ColNalEdOfPrice.Color;
 if (Index mod 2) <> 0 then begin
  DBCtrlGrid.Canvas.Brush.Color:=ColNalEdOfPrice.ColorChered;
 end;
 DBCtrlGrid.Canvas.Rectangle(ColNalEdOfPrice.LeftInParent-1,
  ColNalEdOfPrice.TopInParent-1,
  ColNalEdOfPrice.RightInParent,
  DBCtrlGrid.PanelHeight
  //ColNalEdOfPrice.BottomInParent
  );

 //коллонка цены
 DBCtrlGrid.Canvas.Brush.Color:=ColPriceOfPrice.Color;
 if (Index mod 2) <> 0 then
  DBCtrlGrid.Canvas.Brush.Color:=ColPriceOfPrice.ColorChered;
 DBCtrlGrid.Canvas.Rectangle(ColPriceOfPrice.LeftInParent-1,
  ColPriceOfPrice.TopInParent-1, ColPriceOfPrice.RightInParent,
  DBCtrlGrid.PanelHeight);

 //колонка истории
 DBCtrlGrid.Canvas.Brush.Color:=ColHistoryOfPrice.Color;
 if (Index mod 2) <> 0 then
  DBCtrlGrid.Canvas.Brush.Color:=ColHistoryOfPrice.ColorChered;
 DBCtrlGrid.Canvas.Rectangle(ColHistoryOfPrice.LeftInParent-1,
  ColHistoryOfPrice.TopInParent-1, ColHistoryOfPrice.RightInParent,
  DBCtrlGrid.PanelHeight);

 //колонка кнопок
 ColOfButtonsShape.Brush.Color:=ColButtonsOfPrice.Color;
 DBCtrlGrid.Canvas.Brush.Color:=ColButtonsOfPrice.Color;
 if (Index mod 2) <> 0 then begin
  DBCtrlGrid.Canvas.Brush.Color:=ColButtonsOfPrice.ColorChered;
  ColOfButtonsShape.Brush.Color:=ColButtonsOfPrice.ColorChered;
 end;
 DBCtrlGrid.Canvas.Rectangle(ColButtonsOfPrice.LeftInParent-1,
  ColButtonsOfPrice.TopInParent-1, ColButtonsOfPrice.RightInParent,
  DBCtrlGrid.PanelHeight);

end; //ItogDBCtrlGridPaintPanel

function TDelphiAndc1.PaintSdvigAllObjects():byte;
begin
 Prov3:=ScrollBarImage.BoundsRect;
 if PredydSdvigExist then begin
  Prov3.Top:=Prov3.Top+TopOfMainGrid;
  //Prov3.Bottom:=Prov3.Bottom-TopOfMainGrid;
  ValidateRect(Handle, @Prov3);
  ScrollBarImage.BoundsRect:=Prov3;
  ValidateRect(Handle, @Prov3);
  FRPoplavok.FTopParent:=FRPoplavok.FTopParent+TopOfMainGrid;
  FRPoplavok.FMaxHeight:=FRPoplavok.FMaxHeight-TopOfMainGrid;
  //ScrollBarImage.Top:=ScrollBarImage.Top+TopOfMainGrid;
  //ValidateRect(Handle, @Prov3);
  //ScrollBarImage.Height:=ScrollBarImage.Height-TopOfMainGrid;
  //ValidateRect(Handle, @Prov3);
  ScrollUpButtonImage.Top:=ScrollUpButtonImage.Top+TopOfMainGrid;
  //ValidateRect(Handle, @Prov3);
  ScrollBegunImage.Top:=ScrollBarImage.Top+ScrollUpButtonImage.Height;
  //ValidateRect(Handle, @Prov3);
  {SetWindowPos(ItogDBCtrlGrid.Handle, SWP_NOZORDER,
   ItogDBCtrlGrid.Left, ItogDBCtrlGrid.Top+TopOfMainGrid,
   ItogDBCtrlGrid.Width, ItogDBCtrlGrid.Height-TopOfMainGrid,
   SWP_NOZORDER	or SWP_NOREDRAW);}
  ItogDBCtrlGrid.Top:=ItogDBCtrlGrid.Top+TopOfMainGrid;
  ItogDBCtrlGrid.Height:=ItogDBCtrlGrid.Height-TopOfMainGrid;
  OrderDBCtrlGrid.Top:=OrderDBCtrlGrid.Top+TopOfMainGrid;
  OrderDBCtrlGrid.Height:=OrderDBCtrlGrid.Height-TopOfMainGrid;
  AllDeleteImage.Top:=AllDeleteImage.Top+TopOfMainGrid;
  SubGroupsDBCtrlGrid.Visible:=false;
  LeftSubImage.Visible:=false;
  SubRightImage.Visible:=false;
 end
 else begin
  Prov3.Top:=ScrollBarImage.Top-TopOfMainGrid;
  //Prov3.Right:=Prov3.Left+ScrollBarImage.Height+TopOfMainGrid;
  ValidateRect(Handle, @Prov3);
  ScrollBarImage.BoundsRect:=Prov3;
  ValidateRect(Handle, @Prov3);
  FRPoplavok.FTopParent:=FRPoplavok.FTopParent-TopOfMainGrid;
  FRPoplavok.FMaxHeight:=FRPoplavok.FMaxHeight+TopOfMainGrid;
  //ScrollBarImage.Height:=ScrollBarImage.Height+TopOfMainGrid;
  //ValidateRect(Handle, @Prov3);
  //ScrollBarImage.Top:=ScrollBarImage.Top-TopOfMainGrid;
  //ValidateRect(Handle, @Prov3);
  ScrollUpButtonImage.Top:=ScrollUpButtonImage.Top-TopOfMainGrid;
  //ValidateRect(Handle, @Prov3);
  ScrollBegunImage.Top:=ScrollBarImage.Top+ScrollUpButtonImage.Height;
  //ValidateRect(Handle, @Prov3);
  {SetWindowPos(ItogDBCtrlGrid.Handle, SWP_NOZORDER,
   ItogDBCtrlGrid.Left, ItogDBCtrlGrid.Top-TopOfMainGrid,
   ItogDBCtrlGrid.Width, ItogDBCtrlGrid.Height+TopOfMainGrid,
   SWP_NOZORDER or SWP_NOREDRAW);}
  ItogDBCtrlGrid.Height:=ItogDBCtrlGrid.Height+TopOfMainGrid;
  ItogDBCtrlGrid.Top:=ItogDBCtrlGrid.Top-TopOfMainGrid;
  OrderDBCtrlGrid.Height:=OrderDBCtrlGrid.Height+TopOfMainGrid;
  OrderDBCtrlGrid.Top:=OrderDBCtrlGrid.Top-TopOfMainGrid;
  AllDeleteImage.Top:=AllDeleteImage.Top-TopOfMainGrid;
  SubGroupsDBCtrlGrid.Visible:=true;
  LeftSubImage.Visible:=true;
  SubRightImage.Visible:=true;
 end;
 ValidateRect(Handle, @Prov3);
 Result:=0;
end; //PaintSdvigAllObjects

function FadeInText(Target: TCanvas; X, Y: integer; FText: string):
  TRect;
var
  Pic: TBitmap;
  W, H: integer;
  PicRect, TarRect: TRect;
begin
  Pic := TBitmap.Create;
  Pic.Canvas.Font := Target.Font;
  W := Pic.Canvas.TextWidth(FText);
  H := Pic.Canvas.TextHeight(FText);
  Pic.Width := W;
  Pic.Height := H;
  PicRect := Rect(0, 0, W, H);
  TarRect := Rect(X, Y, X + W, Y + H);
  Pic.Canvas.CopyRect(PicRect, Target, TarRect);
  SetBkMode(Pic.Canvas.Handle, Transparent);
  Pic.Canvas.TextOut(0, 0, FText);
  //FadeInto(Target, X, Y, Pic);
  Pic.Free;
  FadeInText := TarRect;
end;

procedure TDelphiAndc1.FormPaint(Sender: TObject);
var
 Peredvig:integer;
 OldBkMode: integer;

begin
 //TNoScrollPanels(ItogDBCtrlGrid).Panel.Width:=PriceTable.Width;


 if not(Assigned(PanelOfGroups)) then FormResize(self);
 //фон экрана рисуем
 Canvas.Pen.Color:=clWhite;
 Canvas.Pen.Color:=General.Color;
 Canvas.Brush.Color:=General.Color;
 Canvas.RoundRect(General.Left,
   General.Top,
   General.Right,
    General.Bottom,
     0, 0);


 //панель групп
 Canvas.Pen.Color:=PanelOfGroups.ParentObj.Color;
 Canvas.Brush.Color:=PanelOfGroups.Color;
 Canvas.RoundRect(PanelOfGroups.Left,
   PanelOfGroups.Top,
   PanelOfGroups.Right,
    PanelOfGroups.Bottom,
     PanelOfGroups.AngleRadius, PanelOfGroups.AngleRadius);
 //блик на панели для групп
  //полоска
  Canvas.Pen.Width:=1;
  Canvas.Pen.Color:=clWhite;
  Canvas.Brush.Color:=clWhite;
  Canvas.Rectangle(PanelOfGroups.Left+
                   Round(PanelOfGroups.AngleRadius/2),
     PanelOfGroups.Top+PanelOfGroups.ThicknessGlare.Top,
      PanelOfGroups.Right-Round(PanelOfGroups.AngleRadius/2),
       PanelOfGroups.Top+PanelOfGroups.ThicknessGlare.Top+1);
  Canvas.Pen.Width:=1;
  {//закругление слева
  Canvas.Arc(PanelOfGroups.Left+PanelOfGroups.ThicknessGlare.Top,
     PanelOfGroups.Top+PanelOfGroups.ThicknessGlare.Top,
     PanelOfGroups.Left+PanelOfGroups.AngleRadius
               +PanelOfGroups.ThicknessGlare.Top,
     PanelOfGroups.Top+PanelOfGroups.AngleRadius
               +PanelOfGroups.ThicknessGlare.Top,
      PanelOfGroups.Left+Round(PanelOfGroups.AngleRadius/2)
                        +PanelOfGroups.ThicknessGlare.Top,
      PanelOfGroups.Top+PanelOfGroups.ThicknessGlare.Top,
      PanelOfGroups.Left+PanelOfGroups.ThicknessGlare.Top,
      PanelOfGroups.Top+Round(PanelOfGroups.AngleRadius/2)
                       +PanelOfGroups.ThicknessGlare.Top);
  //закругление справа
  Canvas.Arc(PanelOfGroups.Right-PanelOfGroups.AngleRadius
                         -PanelOfGroups.ThicknessGlare.Top,
     PanelOfGroups.Top+PanelOfGroups.ThicknessGlare.Top,
     PanelOfGroups.Right-PanelOfGroups.ThicknessGlare.Top,
     PanelOfGroups.Top+PanelOfGroups.AngleRadius
               +PanelOfGroups.ThicknessGlare.Top,
      PanelOfGroups.Right-PanelOfGroups.ThicknessGlare.Top,
      PanelOfGroups.Top+Round(PanelOfGroups.AngleRadius/2)
                       +PanelOfGroups.ThicknessGlare.Top,
      PanelOfGroups.Right-Round(PanelOfGroups.AngleRadius/2)
                         -PanelOfGroups.ThicknessGlare.Top,
      PanelOfGroups.Top+PanelOfGroups.ThicknessGlare.Top);}

  //закругление слева
  Canvas.Arc(PanelOfGroups.Left+PanelOfGroups.ThicknessGlare.Top,
     PanelOfGroups.Top+PanelOfGroups.ThicknessGlare.Top,
     PanelOfGroups.Left+PanelOfGroups.AngleRadius,
     PanelOfGroups.Top+PanelOfGroups.AngleRadius,
      PanelOfGroups.Left+Round(PanelOfGroups.AngleRadius/2),
      PanelOfGroups.Top+PanelOfGroups.ThicknessGlare.Top,
      PanelOfGroups.Left+PanelOfGroups.ThicknessGlare.Top,
      PanelOfGroups.Top+Round(PanelOfGroups.AngleRadius/2));
  //закругление справа
  Canvas.Arc(PanelOfGroups.Right-PanelOfGroups.AngleRadius,
     PanelOfGroups.Top+PanelOfGroups.ThicknessGlare.Top,
     PanelOfGroups.Right-PanelOfGroups.ThicknessGlare.Top,
     PanelOfGroups.Top+PanelOfGroups.AngleRadius,
      PanelOfGroups.Right-PanelOfGroups.ThicknessGlare.Top,
      PanelOfGroups.Top+Round(PanelOfGroups.AngleRadius/2),
      PanelOfGroups.Right-Round(PanelOfGroups.AngleRadius/2),
      PanelOfGroups.Top+PanelOfGroups.ThicknessGlare.Top);

 //соедиение панели групп и остального
 //GroupsDBCtrlGrid.PanelIndex;
 //Canvas.Arc(GroupsDBCtrlGrid.Left+
 // GroupsDBCtrlGrid.PanelIndex*GroupsDBCtrlGrid.PanelWidth+
 //  GroupImage.Left, GroupsDBCtrlGrid.Top+GroupsDBCtrlGrid.Height,
 //   );
 //рисунок объединеия верхней и нижней панели
 Canvas.Pen.Color:=PanelOfAllOther.Color;
 Canvas.Brush.Color:=PanelOfAllOther.Color;
 SetXCoordOfArrayOfPoint(GroupsDBCtrlGrid.Left+
  (GroupsDBCtrlGrid.PanelIndex)*GroupsDBCtrlGrid.PanelWidth,
  SelectedFigureSide);
 Canvas.Polygon(SelectedFigureSide);
 //панель для остального
 Canvas.Brush.Color:=PanelOfAllOther.Color;
 Canvas.RoundRect(PanelOfAllOther.Left, PanelOfAllOther.Top,
  PanelOfAllOther.Right,
   PanelOfAllOther.Bottom,
    PanelOfAllOther.AngleRadius, PanelOfAllOther.AngleRadius);

 //панель для подгрупп
 if not(PredydSdvigExist) then begin
  Canvas.Pen.Color:=SubGroupPanel.ParentObj.Color;
  Canvas.Brush.Color:=SubGroupPanel.Color;
  Canvas.RoundRect(SubGroupPanel.Left, SubGroupPanel.Top,
   SubGroupPanel.Right,
    SubGroupPanel.Bottom,
     SubGroupPanel.AngleRadius, SubGroupPanel.AngleRadius);
  //рисуем блик
  Canvas.Pen.Width:=1;
  Canvas.Pen.Color:=clWhite;
  Canvas.Brush.Color:=clWhite;
  Canvas.Rectangle(SubGroupPanel.Left+
                   Round(SubGroupPanel.AngleRadius/2),
   SubGroupPanel.Top+SubGroupPanel.ThicknessGlare.Top,
    SubGroupPanel.Right-Round(SubGroupPanel.AngleRadius/2),
     SubGroupPanel.Top+SubGroupPanel.ThicknessGlare.Top+1);
 end; //if not(PredydSdvigExist)

 Peredvig:=0;
 if PredydSdvigExist then
  Peredvig:=TopOfMainGrid;
 //шапка таблицы прайса
 Canvas.Pen.Color:=HeadOfPrice.ParentObj.Color;
 Canvas.Brush.Color:=HeadOfPrice.Color;
 Canvas.RoundRect(HeadOfPrice.Left,
                  HeadOfPrice.Top+Peredvig,
                  HeadOfPrice.Right,
                  HeadOfPrice.Bottom,
                  1,1);
 //текст шапки
 //наименование
 Canvas.Font.Name :=NameHeadTextPrice.FontName;
 Canvas.Font.Color:=NameHeadTextPrice.Color;
 Canvas.Font.Size :=NameHeadTextPrice.FontSize;

 //Canvas.Font.Height:=NameHeadTextPrice.FontSize;
 OldBkMode := SetBkMode(Canvas.Handle, TRANSPARENT);
 Canvas.TextOut(NameHeadTextPrice.Left,
                NameHeadTextPrice.Top+Peredvig, //+2+Peredvig,
                NameHeadTextPrice.Text);
 //SetBkMode(Handle, OldBkMode);
 //наличие едница измерения
 Canvas.Font.Size:=NalEdHeadTextPrice.FontSize;
 Canvas.TextOut(NalEdHeadTextPrice.Left+
                Trunc((NalEdHeadTextPrice.Width-Canvas.TextWidth('Наличие'))/2),
                NalEdHeadTextPrice.Top+Peredvig,
                'Наличие');
 Canvas.TextOut(NalEdHeadTextPrice.Left+
                Trunc((NalEdHeadTextPrice.Width-Canvas.TextWidth('ед. изм'))/2),
                NalEdHeadTextPrice.Top+2+
                NalEdHeadTextPrice.FontSize+Peredvig,
                'ед. изм');
                //NalEdHeadTextPrice.ObjDescr);
 //цена
 Canvas.Font.Size:=PriceHeadTextPrice.FontSize;
 Canvas.TextOut(PriceHeadTextPrice.Left+
                Trunc((PriceHeadTextPrice.Width-Canvas.TextWidth('Цена'))/2),
                PriceHeadTextPrice.Top+Peredvig,
                'Цена');
 Canvas.TextOut(PriceHeadTextPrice.Left+
                Trunc((PriceHeadTextPrice.Width-Canvas.TextWidth('(руб)'))/2),
                PriceHeadTextPrice.Top+2+
                PriceHeadTextPrice.FontSize+Peredvig,
                '(руб)');
 //история покупок
 Canvas.Font.Size:=HistHeadTextPrice.FontSize;
 Canvas.TextOut(HistHeadTextPrice.Left+
                Trunc((HistHeadTextPrice.Width-Canvas.TextWidth('История'))/2),
                HistHeadTextPrice.Top+Peredvig,
                'История');
 Canvas.TextOut(HistHeadTextPrice.Left+
                Trunc((HistHeadTextPrice.Width-Canvas.TextWidth('покупок'))/2),
                HistHeadTextPrice.Top+2+
                HistHeadTextPrice.FontSize+Peredvig,
                'покупок');

 //поплавок для прайса
  Canvas.Pen.Color:=PoplavokScroll.ParentObj.Color;
  Canvas.Brush.Color:=PoplavokScroll.Color;
  Canvas.Rectangle(PoplavokScroll.Left, FRPoplavok.FTopParent,
                   PoplavokScroll.Right, PoplavokScroll.Bottom);
 if FRPoplavok.FVisivle then begin
  //бегун поплавка
  Canvas.Pen.Color:=BegunPoplavka.ParentObj.Color;
  Canvas.Brush.Color:=BegunPoplavka.Color;
  Canvas.Rectangle(BegunPoplavka.Left, FRPoplavok.FTopParent+FRPoplavok.FTop,
                   BegunPoplavka.Right, FRPoplavok.FTopParent
                                        +FRPoplavok.FTop+FRPoplavok.FHeight);
 end; //FRPoplavok.FVisivle

 //паенль навигации под прайсом
 Canvas.Pen.Color:=UnderPriceRect.ParentObj.Color;
 Canvas.Brush.Color:=UnderPriceRect.Color;
 Canvas.RoundRect(UnderPriceRect.Left, UnderPriceRect.Top,
                  UnderPriceRect.Right, UnderPriceRect.Bottom,
                  UnderPriceRect.AngleRadius, UnderPriceRect.AngleRadius);

 //счет
 //панель
 Canvas.Pen.Color:=PanelOfSchet.ParentObj.Color;
 Canvas.Brush.Color:=PanelOfSchet.Color;
 Canvas.RoundRect(PanelOfSchet.Left, PanelOfSchet.Top+Peredvig,
                  PanelOfSchet.Right, PanelOfSchet.Bottom,
                  PanelOfSchet.AngleRadius, PanelOfSchet.AngleRadius);
 //заголовок счета
 Canvas.Brush.Color:=ZagolScheta.ParentObj.Color;
 Canvas.Font.Color:=ZagolScheta.Color;
 Canvas.Font.Name:=ZagolScheta.FontName;
 Canvas.Font.Size:=ZagolScheta.FontSize;
 Canvas.Font.Style:=[fsBold];
 Canvas.TextOut(ZagolScheta.Left,
                ZagolScheta.Top+Peredvig,
                'Счет № '+NomerOfScheta);
  Canvas.Font.Style:=[];
 //сумма надпись
 if SummStrItogSchetZnach<>'' then begin
 Canvas.Brush.Color:=SummTextItog.ParentObj.Color;
 Canvas.Font.Color:=SummTextItog.Color;
 Canvas.Font.Name:=SummTextItog.FontName;
 Canvas.Font.Size:=SummTextItog.FontSize;
 Canvas.TextOut(SummTextItog.Left,
                SummTextItog.Top,
                SummTextItog.Text);
 Canvas.Brush.Color:=ZnachSummItog.ParentObj.Color;
 Canvas.Font.Color:=ZnachSummItog.Color;
 Canvas.Font.Name:=ZnachSummItog.FontName;
 Canvas.Font.Size:=ZnachSummItog.FontSize;
 Canvas.TextOut(ZnachSummItog.Left,
                ZnachSummItog.Top,
                SummStrItogSchetZnach);
 end; //если сумма не равна нулю
 //вес надпись
 if WeightStrItogSchetZnach<>'' then begin
 Canvas.Brush.Color:=MassaTextItog.ParentObj.Color;
 Canvas.Font.Color:=MassaTextItog.Color;
 Canvas.Font.Name:=MassaTextItog.FontName;
 Canvas.Font.Size:=MassaTextItog.FontSize;
 Canvas.TextOut(MassaTextItog.Left,
                MassaTextItog.Top,
                MassaTextItog.Text);
 Canvas.Brush.Color:=ZnachMassyItog.ParentObj.Color;
 Canvas.Font.Color:=ZnachMassyItog.Color;
 Canvas.Font.Name:=ZnachMassyItog.FontName;
 Canvas.Font.Size:=ZnachMassyItog.FontSize;
 Canvas.TextOut(ZnachMassyItog.Left,
                ZnachMassyItog.Top,
                WeightStrItogSchetZnach);
 end; //если ве с не равен нулю
 //объем надпись
 if CapacityStrItogSchetZanch<>'' then begin
 Canvas.Brush.Color:=ObymTextItog.ParentObj.Color;
 Canvas.Font.Color:=ObymTextItog.Color;
 Canvas.Font.Name:=ObymTextItog.FontName;
 Canvas.Font.Size:=ObymTextItog.FontSize;
 Canvas.TextOut(ObymTextItog.Left,
                ObymTextItog.Top,
                ObymTextItog.Text);
 Canvas.Brush.Color:=ZnachObyemItog.ParentObj.Color;
 Canvas.Font.Color:=ZnachObyemItog.Color;
 Canvas.Font.Name:=ZnachObyemItog.FontName;
 Canvas.Font.Size:=ZnachObyemItog.FontSize;
 Canvas.TextOut(ZnachObyemItog.Left,
                ZnachObyemItog.Top,
                CapacityStrItogSchetZanch);
 end; //если объем не равен нулю
 //фон для счета
 Canvas.Pen.Color:=ShetTableFon.ParentObj.Color;
 Canvas.Brush.Color:=ShetTableFon.Color;
 Canvas.RoundRect(ShetTableFon.Left,
                  ShetTableFon.Top+Peredvig,
                  ShetTableFon.Right,
                  ShetTableFon.Bottom,
                  ShetTableFon.AngleRadius, ShetTableFon.AngleRadius);
 //паенель навигации под счетом
 Canvas.Pen.Color:=UnderSchetRect.ParentObj.Color;
 Canvas.Brush.Color:=UnderSchetRect.Color;
 Canvas.RoundRect(UnderSchetRect.Left, UnderSchetRect.Top,
                  UnderSchetRect.Right, UnderSchetRect.Bottom,
                  UnderSchetRect.AngleRadius, UnderSchetRect.AngleRadius);
 //шапка счета
 Canvas.Pen.Color:=HeadOfSchet.ParentObj.Color;
 Canvas.Brush.Color:=HeadOfSchet.Color;
 Canvas.RoundRect(HeadOfSchet.Left,
                  HeadOfSchet.Top+Peredvig,
                  HeadOfSchet.Right,
                  HeadOfSchet.Bottom+Peredvig,
                  HeadOfSchet.AngleRadius,HeadOfSchet.AngleRadius);
 //текст шапки
 //наименование
 Canvas.Font.Name :=NameHeadTextSchet.FontName;
 Canvas.Font.Color:=NameHeadTextSchet.Color;
 Canvas.Font.Size :=NameHeadTextSchet.FontSize;
 Canvas.TextOut(NameHeadTextSchet.Left,
                NameHeadTextSchet.Top+Peredvig, //+2+Peredvig,
                NameHeadTextSchet.Text);

 //количество
 Canvas.Font.Name :=ColHeadTextSchet.FontName;
 Canvas.Font.Color:=ColHeadTextSchet.Color;
 Canvas.Font.Size :=ColHeadTextSchet.FontSize;
 Canvas.TextOut(ColHeadTextSchet.Left+
                Trunc((ColHeadTextSchet.Width-Canvas.TextWidth(ColHeadTextSchet.Text))/2),
                ColHeadTextSchet.Top+Peredvig, //+2+Peredvig,
                ColHeadTextSchet.Text);
 //цена
 Canvas.Font.Name :=PriceHeadTextSchet.FontName;
 Canvas.Font.Color:=PriceHeadTextSchet.Color;
 Canvas.Font.Size :=PriceHeadTextSchet.FontSize;
 Canvas.TextOut(PriceHeadTextSchet.Left+
                Trunc((PriceHeadTextSchet.Width-Canvas.TextWidth(PriceHeadTextSchet.Text))/2),
                PriceHeadTextSchet.Top+Peredvig, //+2+Peredvig,
                PriceHeadTextSchet.Text);
 //стоимость
 Canvas.Font.Name :=SummHeadTextSchet.FontName;
 Canvas.Font.Color:=SummHeadTextSchet.Color;
 Canvas.Font.Size :=SummHeadTextSchet.FontSize;
 Canvas.TextOut(SummHeadTextSchet.Left+
                Trunc((SummHeadTextSchet.Width-Canvas.TextWidth(SummHeadTextSchet.Text))/2),
                SummHeadTextSchet.Top+Peredvig, //+2+Peredvig,
                SummHeadTextSchet.Text);
 //SetScrollRange(ItogDBCtrlGrid.Handle, 1, 0, 0, true);
 //SetScrollRange(GroupsDBCtrlGrid.Handle, 1, 0, 0, true);
 //SetScrollRange(SubGroupsDBCtrlGrid.Handle, 1, 0, 0, true);
end; //FormPaint

procedure TDelphiAndc1.LeftImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if InfoForm.Visible then begin
  FormMouseDown(self, Button, Shift, X, Y);
  exit;
 end;

 LeftChopkaIzm:=true;


 LeftImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+ARROWLEFTIMAGEFILE+'_Down.bmp');
 LeftImage.Update;
 //LeftImage.Repaint;
 //LeftImage.Refresh;

 //SendMessage(Handle, WM_SETREDRAW, 0, 0);

 if not(GroupsADOQuery.Bof) and (GroupsADOQuery.RecNo>1) then
  GroupsADOQuery.Prior;

 if (GroupsADOQuery.Bof) or (GroupsADOQuery.RecNo=1) then begin
  //SendMessage(Handle, WM_SETREDRAW, 1, 0);
  //RedrawWindow(Handle, nil, 0, RDW_FRAME + RDW_INVALIDATE +
  //RDW_ALLCHILDREN + RDW_NOINTERNALPAINT);
 end;
 //if (erase) then
 //Windows.InvalidateRect(Handle, nil, True);

 //SmodelirovatyClick(true, (Sender as TImage), true);
end;

procedure TDelphiAndc1.LeftImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 LeftImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+ARROWLEFTIMAGEFILE+'.bmp');
 //SmodelirovatyClick(false, (Sender as TImage), true);
end;

procedure TDelphiAndc1.RightImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if InfoForm.Visible then begin
  FormMouseDown(self, Button, Shift, X, Y);
  exit;
 end;

 LeftChopkaIzm:=false;

 RightImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+ARROWRIGHTIMAGEFILE+'_Down.bmp');
 RightImage.Update;

 //SendMessage(Handle, WM_SETREDRAW, 0, 0);

 if (GroupsADOQuery.RecNo<GroupsADOQuery.RecordCount) and
         not(GroupsADOQuery.Eof) then
  GroupsADOQuery.Next;

 if (GroupsADOQuery.RecNo=GroupsADOQuery.RecordCount) or
        (GroupsADOQuery.Eof) then begin
  //SendMessage(Handle, WM_SETREDRAW, 1, 0);
  //RedrawWindow(Handle, nil, 0, RDW_FRAME + RDW_INVALIDATE +
  // RDW_ALLCHILDREN + RDW_NOINTERNALPAINT);
 end;
 //if (erase) then
 //Windows.InvalidateRect(Handle, nil, True);

 //SmodelirovatyClick(true, (Sender as TImage), false);
end; //RightImageMouseDown

procedure TDelphiAndc1.RightImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 RightImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+ARROWRIGHTIMAGEFILE+'.bmp');
 //SmodelirovatyClick(false, (Sender as TImage), false);
end; //RightImageMouseUp

procedure TDelphiAndc1.LeftSubImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if InfoForm.Visible then begin
  FormMouseDown(self, Button, Shift, X, Y);
  exit;
 end;

 LeftChopkaIzm:=true;

 LeftSubImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+ARROWSUBLEFTIMAGEFILE+'_Down.bmp');
 LeftSubImage.Update; 

 if not(SubGroupsADOQuery.Bof) and
     not(SubGroupsADOQuery.RecNo=1) then
  SubGroupsADOQuery.Prior;
end;

procedure TDelphiAndc1.LeftSubImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 LeftSubImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+ARROWSUBLEFTIMAGEFILE+'.bmp');
end;

procedure TDelphiAndc1.SubRightImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if InfoForm.Visible then begin
  FormMouseDown(self, Button, Shift, X, Y);
  exit;
 end;

 LeftChopkaIzm:=false;

 SubRightImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+ARROWSUBRIGHTIMAGEFILE+'_Down.bmp');
 SubRightImage.Update; 
 
 if not(SubGroupsADOQuery.Eof) and
     (SubGroupsADOQuery.RecNo<>SubGroupsADOQuery.RecordCount) then
  SubGroupsADOQuery.Next;

end;

procedure TDelphiAndc1.SubRightImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 SubRightImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+ARROWSUBRIGHTIMAGEFILE+'.bmp');
end;

procedure TDelphiAndc1.Add1ImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 pGroup, pDescr, pEdinica, pValuta:string;
 CodeGroupForPrice:Integer;
 pPriceDoub:double;
 pPrice, pSumma:string;
 pCount:Double;
 pSummaDoub:double;
 codeEr:integer;
begin
 if (Sender is TImage) then
  (Sender as TImage).Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ADDBUTTONIMAGEFILE+
    IntToStr((Sender as TImage).Tag)+'_Down.bmp');

 pGroup:=''; CodeGroupForPrice:=0;
 if ZagruzkaTovaraIzPrice then begin
  if (SubGroupsADOQuery.Active) and (SubGroupsADOQuery.RecordCount>0) then
  begin
   CodeGroupForPrice:=SubGroupsADOQuery.FieldValues['ID'];
   pGroup:=Trim(SubGroupsADOQuery.FieldValues['DESCR'])
  end
  else begin
   CodeGroupForPrice:=GroupsADOQuery.FieldValues['CODE'];
   pGroup:=Trim(GroupsADOQuery.FieldValues['DESCR']);
  end;
 end; //если товар берем из прайса
 pDescr:=Trim(ItogADOQuery.FieldValues['DESCR']);

 //OrderADOTable.First;
 if (Trim(OrderADOTable.FieldByName('DESCR').AsString)<>pDescr) then
  OrderADOTable.Locate('DESCR', pDescr, [loCaseInsensitive]);
 // while not(OrderADOTable.Eof) and
 //   (Trim(OrderADOTable.FieldByName('DESCR').AsString)<>pDescr)
 // do
 //  OrderADOTable.Next;

 pCount:=(Sender as TComponent).Tag;
 pEdinica:=EdItogStaticText.Caption;
 pPrice:=Copy(PriceItStaticText.Caption, 1,
         Length(PriceItStaticText.Caption)-5);
 pPriceDoub:=0;
 if ZagruzkaTovaraIzPrice then
  pPriceDoub:=StrToFloat(pPrice);
 if not(ZagruzkaTovaraIzPrice) then begin
  pPrice:=Trim(ItogADOQuery.FieldValues['PRICE']);
  Val(pPrice, pPriceDoub, codeEr);
  //pPriceDoub:=ItogADOQuery.FieldValues['PRICE'];
 end;

 pValuta:='руб';
 if not(ZagruzkaTovaraIzPrice) then
  pValuta:=ItogADOQuery.FieldValues['VALUTA'];
 pSummaDoub:=pPriceDoub*pCount;
 if (Trim(OrderADOTable.FieldByName('DESCR').AsString)<>pDescr) then begin
   OrderADOTable.Edit;
   OrderADOTable.Append;
   OrderADOTable.FieldByName('ID').Value:='';
   OrderADOTable.FieldByName('PARENTID').Value:='';
   if not(ZagruzkaTovaraIzPrice) then begin
    OrderADOTable.FieldByName('ID').Value:=ItogADOQuery.FieldValues['ID'];
    OrderADOTable.FieldByName('PARENTID').Value:=ItogADOQuery.FieldValues['PARENTID'];
   end;
   OrderADOTable.FieldByName('PARENTID_E').Value:=CodeGroupForPrice;
   OrderADOTable.FieldByName('PARENT_EDS').Value:=pGroup;
   OrderADOTable.FieldByName('CODE').Value:=ItogADOQuery.FieldValues['CODE'];
   OrderADOTable.FieldByName('DESCR').Value:=pDescr;
   OrderADOTable.FieldByName('COUNT').Value:=pCount;
   OrderADOTable.FieldByName('EDINICAID').Value:='';
   if not(ZagruzkaTovaraIzPrice) then
    OrderADOTable.FieldByName('EDINICAID').Value:=ItogADOQuery.FieldValues['sp86'];
   OrderADOTable.FieldByName('EDINICADES').Value:=pEdinica;
   OrderADOTable.FieldByName('PRICE').Value:=pPriceDoub;
   OrderADOTable.FieldByName('VALUTAID').Value:='';
   if not(ZagruzkaTovaraIzPrice) then
    OrderADOTable.FieldByName('VALUTAID').Value:=ItogADOQuery.FieldValues['IDVALUTA'];
   OrderADOTable.FieldByName('VALUTADESC').Value:=pValuta;
   OrderADOTable.FieldByName('SUMMA').Value:=pSummaDoub;
   OrderADOTable.Post;
  end
 else begin
  //OrderADOTable.First;
  //while not(OrderADOTable.Eof) and
  //  (Trim(OrderADOTable.FieldByName('DESCR').AsString)<>pDescr)
  //do
  // OrderADOTable.Next;
  OrderADOTable.Edit;
  OrderADOTable.FieldByName('COUNT').Value:=
  OrderADOTable.FieldByName('COUNT').Value+pCount;
  OrderADOTable.FieldByName('SUMMA').Value:=
  OrderADOTable.FieldByName('SUMMA').Value+pSummaDoub;
  OrderADOTable.Post;
 end;

 SummItogSchetZnach:=Round((SummItogSchetZnach+pSummaDoub)*100)/100;
 //RecountSchetItog(SummItogSchetZnach,
 //   WeightItogSchetZnach, CapacityItogSchetZanch);


 SummStrItogSchetZnach:='';
 if SummItogSchetZnach<>0 then
  SummStrItogSchetZnach:=FloatToStr(SummItogSchetZnach);
 WeightStrItogSchetZnach:='';
 if WeightItogSchetZnach<>0 then
  WeightStrItogSchetZnach:=FloatToStr(WeightItogSchetZnach);
 CapacityStrItogSchetZanch:='';
 if CapacityItogSchetZanch<>0 then
  CapacityStrItogSchetZanch:=FloatToStr(CapacityItogSchetZanch);

 //InvalidateRect(Handle, , false);
 //ReDrawWindow(
 SummItogSchetLabel.Caption:=SummStrItogSchetZnach+' '+pValuta;
 SummItogSchetLabel.Repaint;
 //SummItogSchetLabel.Invalidate;
 //SummItogSchetLabel.Update;
 //RedrawWindow(LeftGroupsLabel.Handle, nil, 0, RDW_FRAME + RDW_INVALIDATE +
 // RDW_ALLCHILDREN + RDW_NOINTERNALPAINT);
end;

procedure TDelphiAndc1.OrderDBCtrlGridPaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
 if Not(Assigned(ColNameOfSchet)) then Exit;
 CountAndEdSchetLabel.Caption:=OrderADOTable.FieldByName('COUNT').AsString+' '+
  Trim(OrderADOTable.FieldByName('EDINICADES').AsString);

 //колонка наименования товара
 DBCtrlGrid.Canvas.Brush.Color:=ColNameOfSchet.Color;
 if (Index mod 2) <> 0 then begin
  DBCtrlGrid.Canvas.Brush.Color:=ColNameOfSchet.ColorChered;
 end;
 DBCtrlGrid.Canvas.Pen.Width:=1;
 DBCtrlGrid.Canvas.Pen.Color:=RGB(186, 201, 211);
 DBCtrlGrid.Canvas.Rectangle(0, 0,
  ColNameOfSchet.RightInParent+1,
  DBCtrlGrid.PanelHeight+1);

 //колонка закзанного количества и единицы
 //DBCtrlGrid.Canvas.Pen.Color:=RGB(186, 0, 0);
 DBCtrlGrid.Canvas.Brush.Color:=ColColichOfSchet.Color;
 if (Index mod 2) <> 0 then begin
  DBCtrlGrid.Canvas.Brush.Color:=ColColichOfSchet.ColorChered;
 end;
 DBCtrlGrid.Canvas.Rectangle(ColColichOfSchet.LeftInParent,
  ColColichOfSchet.TopInParent,
  ColColichOfSchet.RightInParent+1,
  DBCtrlGrid.PanelHeight+1
  //ColNalEdOfPrice.BottomInParent
  );

 //коллонка цены
 DBCtrlGrid.Canvas.Brush.Color:=ColPriceOfSchet.Color;
 if (Index mod 2) <> 0 then
  DBCtrlGrid.Canvas.Brush.Color:=ColPriceOfSchet.ColorChered;
 DBCtrlGrid.Canvas.Rectangle(ColPriceOfSchet.LeftInParent,
  ColPriceOfSchet.TopInParent, ColPriceOfSchet.RightInParent+1,
  DBCtrlGrid.PanelHeight+1);

 //колонка суммы
 DBCtrlGrid.Canvas.Brush.Color:=ColSummOfSchet.Color;
 if (Index mod 2) <> 0 then
  DBCtrlGrid.Canvas.Brush.Color:=ColSummOfSchet.ColorChered;
 DBCtrlGrid.Canvas.Rectangle(ColSummOfSchet.LeftInParent,
  ColSummOfSchet.TopInParent, ColSummOfSchet.RightInParent+1,
  DBCtrlGrid.PanelHeight+1);

end;

procedure TDelphiAndc1.AllDeleteImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 AllDeleteImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ALLDELETEBUTTONIMAGEFILE+'.bmp');
 AllDeleteImage.Update;  

 if OrderADOTable.Active then begin
  OrderADOTable.First;
  while not(OrderADOTable.Eof) do begin
   OrderADOTable.Delete;
  end;
 end; //если открыта таблица со счетом

 SummStrItogSchetZnach:='';
 SummItogSchetZnach:=0;
 WeightStrItogSchetZnach:='';
 WeightItogSchetZnach:=0;
 CapacityStrItogSchetZanch:='';
 CapacityItogSchetZanch:=0;

 SummItogSchetLabel.Caption:='';
 SummItogSchetLabel.Invalidate;
end; // AllDeleteImageMouseUp

procedure TDelphiAndc1.OneDeleteImageClick(Sender: TObject);
var
 pValuta:string;
 pPriceDoub:double;
 pPrice, pSumma:string;
 pCount:Double;
 pSummaDoub:double;
 codeEr:integer;
begin
 if (OrderADOTable.RecNo<=OrderADOTable.RecordCount) and
      (OrderADOTable.RecordCount>0) then begin

  pCount:=OrderADOTable.FieldValues['COUNT'];
  pPriceDoub:=OrderADOTable.FieldValues['PRICE'];

  pValuta:=OrderADOTable.FieldValues['VALUTADESC'];
  pSummaDoub:=pPriceDoub*pCount;

  SummItogSchetZnach:=Round((SummItogSchetZnach-pSummaDoub)*100)/100;

  SummStrItogSchetZnach:='';
  if SummItogSchetZnach<>0 then
   SummStrItogSchetZnach:=FloatToStr(SummItogSchetZnach);
  WeightStrItogSchetZnach:='';
  if WeightItogSchetZnach<>0 then
   WeightStrItogSchetZnach:=FloatToStr(WeightItogSchetZnach);
  CapacityStrItogSchetZanch:='';
  if CapacityItogSchetZanch<>0 then
   CapacityStrItogSchetZanch:=FloatToStr(CapacityItogSchetZanch);

  OneDeleteImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+DELETEONEBUTTONIMAGEFILE+'.bmp');
  OneDeleteImage.Update;

  OrderADOTable.Delete;
  SummItogSchetLabel.Caption:=SummStrItogSchetZnach+' '+pValuta;
  SummItogSchetLabel.Invalidate;

 end; //если выбрана строчка в счете
 //RecountSchetItog();
end;

procedure TDelphiAndc1.SubGroupsDBCtrlGridPaintPanel(
  DBCtrlGrid: TDBCtrlGrid; Index: Integer);
var
 EndI:integer; //переменная для выхода из цикла
 FieldVal:string;
begin
 if Not(Assigned(SubGroupsImages)) then Exit;

 //загружаем картинку для подгруппы
 FieldVal:=Trim(SubGroupsADOQuery.FieldByName('DESCR').AsString);
 if FileExists(GetApplicationPath+'\'+IMAGESSUBGROUPSDIR+'\'+
     FieldVal+'.jpg') then begin
   //SubGrImage.Transparent:=false;
   SubGroupImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
      IMAGESSUBGROUPSDIR+'\'+FieldVal+'.jpg');
  end
       else //begin
   if FileExists(GetApplicationPath+'\'+IMAGESSUBGROUPSDIR+'\'+
     FieldVal+'.bmp') then begin
   //SubGrImage.Transparent:=false;
    SubGroupImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
       IMAGESSUBGROUPSDIR+'\'+FieldVal+'.bmp');
  end
       else begin

  //SubGrImage.Transparent:=false;
   SubGroupImage.Picture.LoadFromFile(GetApplicationPath+'\'+IMAGESGROUPSDIR+'\'+
     'NoCart'+'.bmp');
  //GroupImage.Picture:=nil;
 end;

 //определяем ни ушло ли название товара за пределы рамки
 SubGroupsDBText.Font.Size:=TextSubGroup.FontSize;
 DefineWidthSubGroupNameLabel.Font.Size:=TextSubGroup.FontSize;
 DefineWidthSubGroupNameLabel.Width:=SubGroupsDBText.Width;
 DefineWidthSubGroupNameLabel.Height:=200;
 DefineWidthSubGroupNameLabel.Caption:=
  Trim(SubGroupsADOQuery.FieldByName('DESCR').AsString);
 DefineWidthSubGroupNameLabel.AutoSize:=false;
 DefineWidthSubGroupNameLabel.AutoSize:=true;
 //за пределы ширины
 EndI:=0;
 while (DefineWidthSubGroupNameLabel.Width>SubGroupsDBText.Width)
  and (EndI<10) do
 begin
  DefineWidthSubGroupNameLabel.Font.Size:=
   Round(9*DefineWidthSubGroupNameLabel.Font.Size/10);
  DefineWidthSubGroupNameLabel.AutoSize:=true;

  Inc(EndI);
 end; //while
 //за пределы высоты
 EndI:=0;
 while (DefineWidthSubGroupNameLabel.Height>TextSubGroup.Height)
  and (EndI<10) do
 begin
  DefineWidthSubGroupNameLabel.Font.Size:=
   Round(9*DefineWidthSubGroupNameLabel.Font.Size/10);
  DefineWidthSubGroupNameLabel.AutoSize:=true;
  Inc(EndI);
 end; //while
 //если был изменен размер для рамки
 if SubGroupsDBText.Font.Size<>
   DefineWidthSubGroupNameLabel.Font.Size then begin
  SubGroupsDBText.Font.Size:=
  DefineWidthSubGroupNameLabel.Font.Size;
 end;

 //рисуем панель для картинки
 DBCtrlGrid.Canvas.Pen.Color:=SubGroupsImages.ParentObj.Color;
 if Index=DBCtrlGrid.PanelIndex then
  DBCtrlGrid.Canvas.Brush.Color:=SubGroupImageAndText.ColorSelected
 else
  DBCtrlGrid.Canvas.Brush.Color:=SubGroupImageAndText.Color;

 DBCtrlGrid.Canvas.RoundRect(0, 0, SubGroupImageAndText.Width,
  SubGroupImageAndText.Height, SubGroupImageAndText.AngleRadius,
   SubGroupImageAndText.AngleRadius);
 DBCtrlGrid.Canvas.Brush.Color:=clRed;
 DBCtrlGrid.Canvas.RoundRect(SubGroupImageAndText.Width, 0,
  SubGroupsDBCtrlGrid.PanelWidth,
  SubGroupImageAndText.Height, SubGroupImageAndText.AngleRadius,
   SubGroupImageAndText.AngleRadius);


 //if Index<>DBCtrlGrid.PanelIndex then begin
 //рисуем фонт для картинок, если фон у них прозрачный
 SubGroupsImage.PaintGradient(DBCtrlGrid.Canvas, 0,
  Round(SubGroupsImage.RightInParent-SubGroupsImage.Width/2));
 SubGroupsImage.PaintGradient(DBCtrlGrid.Canvas,
  Round(SubGroupsImage.RightInParent-SubGroupsImage.Width/2),
   0, SubGroupsImage.ColorChered, SubGroupsImage.Color);
 //end; {if не текущий индекс}

 SubGroupsDBText.Caption:=
  Trim(SubGroupsADOQuery.FieldByName('DESCR').AsString);
 SubGroupsDBText.AutoSize:=true;
 SubGroupsDBText.Top:=Round(TextSubGroup.TopInParent+
  TextSubGroup.Height/2-1.5*SubGroupsDBText.Height/2);
 SubGroupsDBText.AutoSize:=false;
 SubGroupsDBText.Width:=TextSubGroup.Width;
end; //SubGroupsDBCtrlGridPaintPanel

procedure TDelphiAndc1.ItogDataSourceDataChange(Sender: TObject;
  Field: TField);
var
 PixelsInRec:Double;
 RecordMove:Double;
begin
 if (PaintOptionADOQuery.Active) and
    Assigned(ScrollButtons) then begin
  PixelsInRec:=0;
  CurrentPanelInItog:=-10;
  if ItogADOQuery.RecordCount>ItogDBCtrlGrid.RowCount then begin
   {ScrollBegunImage.Height:=Round((ScrollBarImage.Height-2*ScrollButtons.Height)/
    (ItogADOQuery.RecordCount+1-ItogDBCtrlGrid.RowCount));}
   FRPoplavok.FHeight:=Round(FRPoplavok.FMaxHeight/
    (ItogADOQuery.RecordCount+1-ItogDBCtrlGrid.RowCount));
   if ItogADOQuery.RecordCount>1 then begin
    {{PixelsInRec:=(ScrollBarImage.Height-2*ScrollButtons.Height-BegunBarPrice.Height)
                   /(ItogADOQuery.RecordCount-1);}
    {PixelsInRec:=(ScrollBarImage.Height-2*ScrollButtons.Height-ScrollBegunImage.Height)
                   /(ItogADOQuery.RecordCount-ItogDBCtrlGrid.RowCount);}
    PixelsInRec:=(FRPoplavok.FMaxHeight-FRPoplavok.FHeight)
                   /(ItogADOQuery.RecordCount-ItogDBCtrlGrid.RowCount);
   end;
   {//if ItogADOQuery.RecNo-1-ItogDBCtrlGrid.RowCount
   //RecordMove:=;
   {{ScrollBegunImage.Top:=Round(ScrollBarImage.Top+ScrollButtons.Height+
     (ItogADOQuery.RecNo-1)*PixelsInRec);}
   {ScrollBegunImage.Top:=Round(ScrollBarImage.Top+ScrollButtons.Height+
     (ItogADOQuery.RecNo-(ItogDBCtrlGrid.PanelIndex+1))*PixelsInRec);}
   FRPoplavok.FTop:=Round((ItogADOQuery.RecNo-(ItogDBCtrlGrid.PanelIndex+1))*PixelsInRec);

   //поплавок рисуем
   Canvas.Pen.Color:=PoplavokScroll.ParentObj.Color;
   Canvas.Brush.Color:=PoplavokScroll.Color;
   Canvas.Rectangle(PoplavokScroll.Left, FRPoplavok.FTopParent,
                    PoplavokScroll.Right, PoplavokScroll.Bottom);
   //бегун поплавка
   Canvas.Pen.Color:=BegunPoplavka.ParentObj.Color;
   Canvas.Brush.Color:=BegunPoplavka.Color;
   Canvas.Rectangle(BegunPoplavka.Left, FRPoplavok.FTopParent+FRPoplavok.FTop,
                    BegunPoplavka.Right, FRPoplavok.FTopParent
                                         +FRPoplavok.FTop+FRPoplavok.FHeight);
  end; {if}
 end; {Если открыта таблица с рисованными объектами}
end; //ItogDataSourceDataChange

procedure TDelphiAndc1.ScrollBegunImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 ScrollBegunImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+SCROLLBEGUNIMAGEFILE+'_Down.bmp');

 ScrollingPriceTable:=true;
 LastCoordinatesOfMouseX:=X;
 LastCoordinatesOfMouseY:=Y-ScrollBegunImage.Top;
 ScrollBegunImage.BeginDrag(false);
 //ScrollBegunImage.EndDrag(false);
end; //ScrollBegunImageMouseDown

procedure TDelphiAndc1.ScrollBegunImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 ScrollBegunImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+SCROLLBEGUNIMAGEFILE+'.bmp');

 ScrollingPriceTable:=false;
end; //ScrollBegunImageMouseUp

procedure TDelphiAndc1.ScrollBegunImageMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
 RecInPixels:Double;
 RecordMove:integer;
begin
 if ScrollingPriceTable then begin
  RecInPixels:=0;
  //ScrollBegunImage.Top:=Y;//-LastCoordinatesOfMouseY;
  //if (BarPrice.Height-2*ScrollButtons.Height-BegunBarPrice.Height)<>0 then
  // RecInPixels:=(ItogADOQuery.RecordCount-1)
  //     /(BarPrice.Height-2*ScrollButtons.Height-BegunBarPrice.Height);
  //RecordMove:=Round((LastCoordinatesOfMouseY-Y)*RecInPixels);
  //if RecordMove<>0 then begin
  // ItogADOQuery.MoveBy(RecordMove);
  // LastCoordinatesOfMouseX:=X;
  // LastCoordinatesOfMouseY:=Y;
  //end; //если передвигаем набор данных в прайсе
  //LastCoordinatesOfMouseY:=Y;
 end; //
end; //ScrollBegunImageMouseMove

procedure TDelphiAndc1.ScrollUpButtonImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 KeyD:Word;
begin
 //KeyD:=VK_PRIOR;
 //ItogDBCtrlGrid.KeyDown(KeyD, Shift);
 //CurrentPanelInItog:=-10;
 ScrollUpButtonImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+SCROLLUPBUTTONIMAGEFILE+'_Down.bmp');

 ItogDBCtrlGrid.PanelIndex:=0;

 ItogADOQuery.Prior;
end; //ScrollUpButtonImageMouseDowns

procedure TDelphiAndc1.ScrollDownButtonImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 KeyD:Word;
begin
 ScrollDownButtonImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+SCROLLDOWNBUTTONIMAGEFILE+'_Down.bmp');
 //CurrentPanelInItog:=-10;
 //KeyD:=VK_NEXT;
 //ItogDBCtrlGrid.KeyDown(KeyD, Shift);

 ItogDBCtrlGrid.PanelIndex:=ItogDBCtrlGrid.PanelCount-1;

 ItogADOQuery.Next;
end; //ScrollDownButtonImageMouseDown

function TDelphiAndc1.GetSpisokOfGroup():byte;
var
 TempFieldVal:PChar; i:word; CurrRec:integer;
 j:integer;
 sizPer:Integer;
begin
 if AllSelectedGroups<>nil then
  try
   FreeMem(AllSelectedGroups, SizeOfPeremSelecGr*13-2);
   AllSelectedGroups:=nil
  except
   try
    sizPer:=SizeOf(AllSelectedGroups);
    FreeMem(AllSelectedGroups, sizPer)
   except end;
  end;

 SizeOfPeremSelecGr:=0;
 if GroupsADOQuery.Active then begin
  SizeOfPeremSelecGr:=1;
 end;
 if SubGroupsADOQuery.RecordCount>0 then
  SizeOfPeremSelecGr:=SizeOfPeremSelecGr+1;
 if SubSubGroupsADOQuery.Active then
  SizeOfPeremSelecGr:=SizeOfPeremSelecGr+SubSubGroupsADOQuery.RecordCount;

 j:=0;
 GetMem(AllSelectedGroups, SizeOfPeremSelecGr*13-2);
 GetMem(TempFieldVal, 9);
 if GroupsADOQuery.GetFieldData(1, TempFieldVal) then begin
  AllSelectedGroups[0]:='''';
  for i:=0 to 8 do
   AllSelectedGroups[i+1]:=TempFieldVal[i];
  AllSelectedGroups[10]:='''';
  if j<SizeOfPeremSelecGr then begin
  end;
  j:=1;
 end;

 if SubGroupsADOQuery.Active then begin
  if SubGroupsADOQuery.RecordCount>0 then begin
   //CurrRec:=SubGroupsADOQuery.RecNo;
   //SubGroupsDataSource.Enabled:=false;

   //SubGroupsADOQuery.First;
   //repeat
    if SubGroupsADOQuery.GetFieldData(1, TempFieldVal) then begin
     AllSelectedGroups[j*13-2]:=',';
     AllSelectedGroups[j*13-1]:=' ';
     AllSelectedGroups[j*13]:='''';
     for i:=0 to 8 do
      AllSelectedGroups[j*13+1+i]:=TempFieldVal[i];
     AllSelectedGroups[j*13+10]:='''';
     Inc(j);
    end; //for i:=0 to 8
    //SubGroupsADOQuery.Next;
   //until SubGroupsADOQuery.Eof;

   //SubGroupsADOQuery.First;
   //i:=SubGroupsADOQuery.RecNo;
   //while i<>CurrRec do begin
   // SubGroupsADOQuery.Next;
   // Inc(i);
   //end;
   SubGroupsDataSource.Enabled:=true;
  end; //if SubGroupsADOQuery.RecordCount>0 then begin
 end; //if SubGroupsADOQuery.Active then begin

 //sub sub groups
 if SubSubGroupsADOQuery.Active then begin
  if SubSubGroupsADOQuery.RecordCount>0 then begin
   CurrRec:=SubSubGroupsADOQuery.RecNo;
   SubSubGroupsDataSource.Enabled:=false;

   SubSubGroupsADOQuery.First;
   repeat
    if SubSubGroupsADOQuery.GetFieldData(1, TempFieldVal) then begin
     AllSelectedGroups[j*13-2]:=',';
     AllSelectedGroups[j*13-1]:=' ';
     AllSelectedGroups[j*13]:='''';
     for i:=0 to 8 do
      AllSelectedGroups[j*13+1+i]:=TempFieldVal[i];
     AllSelectedGroups[j*13+10]:='''';
     Inc(j);
    end; //for i:=0 to 8
    SubSubGroupsADOQuery.Next;
   until SubSubGroupsADOQuery.Eof;

   SubSubGroupsADOQuery.First;
   i:=SubSubGroupsADOQuery.RecNo;
   while i<>CurrRec do begin
    SubSubGroupsADOQuery.Next;
    Inc(i);
   end;
   SubSubGroupsDataSource.Enabled:=true;
  end; //if SubSubGroupsADOQuery.RecordCount>0 then begin
 end; //if SubSubGroupsADOQuery.Active then begin

 FreeMem(TempFieldVal, 9);
 Result:=0;
end; //function TDelphiAndc1.GetSpisokOfGroup():byte;

function TDelphiAndc1.NextRecordGoOf(q:TADOQuery; const FieldNum:Integer):byte;
var
 DescrTemp1, DescrTemp2:PChar;
 NextRecTemp:boolean;
begin
 GetMem(DescrTemp1, 50);
 GetMem(DescrTemp2, 50);
 q.GetFieldData(FieldNum, DescrTemp1);
 NextRecTemp:=false;
 while (not(q.Eof)) and not(NextRecTemp) do begin
  q.Next;
  q.GetFieldData(FieldNum, DescrTemp2);
  if DescrTemp1^<>DescrTemp2^ then NextRecTemp:=true;
  DescrTemp1^:=DescrTemp2^;
 end;

 Result:=0;
 if (q.Eof) and (DescrTemp1^=DescrTemp2^) then Result:=1;

 FreeMem(DescrTemp1, 50);
 FreeMem(DescrTemp2, 50);
end; //function TDelphiAndc1.NextRecordGoOf(q:TADOQuery; const FieldName:String):byte;

//показ предупредительных сообщений
function TDelphiAndc1.ShowMyMessage(Mes:string):byte;
begin
 Result:=0;
end; //показ предупредительных сообщений //ShowMyMessage

//запись в лог-файл полседней ошибки
function TDelphiAndc1.WriteInLogLastError():byte;
begin
 FormatMessage(
      FORMAT_MESSAGE_ALLOCATE_BUFFER or FORMAT_MESSAGE_FROM_SYSTEM,
      nil,
      GetLastError(),
      ((Word(SUBLANG_DEFAULT) shr 10) or Word(LANG_NEUTRAL)), // Default language
      PAnsiChar (@ErrorLastMes),
      0,
      nil
 );
 MessageBox(Handle, ErrorLastMes, 'Error', mb_Ok);
 //запись в файл
 Result:=0;
end; //запись в лог-файл полседней ошибки

//пересчет полностью по всей талице суммыб веса и объема
function TDelphiAndc1.RecountSchetItog(var
          Summ, Weight, Capacity:Double):Byte;
begin
 Summ:=0;
 Weight:=0;
 Capacity:=0;
 OrderADOTable.First;
 while Not(OrderADOTable.Eof) and (OrderADOTable.RecNo<=OrderADOTable.RecordCount)
 do begin
  Summ:=Summ+
   OrderADOTable.FieldValues['SUMMA'];
  //WeightItogSchetZnach:=WeightItogSchetZnach+
  // OrderADOTable.FieldValues['WEIGHT'];
  //CapacityItogSchetZanch:=CapacityItogSchetZanch+
  // OrderADOTable.FieldValues['CAPASITY'];
  OrderADOTable.Next;
 end; //пока не достигли конца таблицы
 Result:=0;
 if Summ<>0 then Result:=1;
 if Weight<>0 then Result:=Result+1;
 if Capacity<>0 then Result:=Result+1;
end; //RecountSchetItog

procedure TDelphiAndc1.ScrollBegunImageDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
 RecInPixels:Double;
 RecordMove:integer;
 MovingRecord:integer;
begin
 MovingRecord:=0;
 if Source is TControl then begin
  if (State=dsDragEnter) and (Source=Sender) then begin
   OnEntX:=X; OnEntY:=Y;
   //TopPrior:=ScrollBegunImage.Top;
   //LeftGroupsLabel.Caption:='OnEntY='+IntToStr(OnEntY);
   //LeftGroupsLabel.Repaint;
  end;
  if Source<>Sender then
   if (Source is TControl) and (Sender is TControl) then begin
    Y:=Y-((Source as TControl).Top-(Sender as TControl).Top);
   end;
  //RightGrLabel.Caption:='Y='+IntToStr(Y)+'; Y-OnEntY='+IntToStr(Y-OnEntY);
  //RightGrLabel.Repaint;
  if State=dsDragMove then begin
   if (PaintOptionADOQuery.Active) and Assigned(ScrollButtons)  and
      (ItogADOQuery.Active) then begin
    RecInPixels:=0;
    if ItogADOQuery.RecordCount>ItogDBCtrlGrid.RowCount then begin
     if (ScrollBarImage.Height-2*ScrollButtons.Height-ScrollBegunImage.Height)<>0 then
      RecInPixels:=(ItogADOQuery.RecordCount-ItogDBCtrlGrid.RowCount)
                   /(ScrollBarImage.Height-2*ScrollButtons.Height-ScrollBegunImage.Height);
     //LeftGroupsLabel.Caption:='OnEntY='+IntToStr(OnEntY)+'; RecInPixels='+FloatToStr(RecInPixels)+
     //                          '; TopPrior='+IntToStr(TopPrior);
     //if (Y-OnEntY)>0 then ItogDBCtrlGrid.PanelIndex:=ItogDBCtrlGrid.PanelCount-1;
     //if (Y-OnEntY)<0 then ItogDBCtrlGrid.PanelIndex:=0;  dfdf
     MovingRecord:=Round((Y-OnEntY)*RecInPixels);
     {if ScrollBegunImage.Top+(Y-OnEntY)+ScrollBegunImage.Height>
         ScrollDownButtonImage.Top then
          ScrollBegunImage.Top:=ScrollDownButtonImage.Top-ScrollBegunImage.Height
     else
      ScrollBegunImage.Top:=ScrollBegunImage.Top+(Y-OnEntY);
     if ScrollBegunImage.Top+(Y-OnEntY)<
         ScrollUpButtonImage.Top+ScrollUpButtonImage.Height then
          ScrollBegunImage.Top:=ScrollUpButtonImage.Top+ScrollUpButtonImage.Height
     else
      ScrollBegunImage.Top:=ScrollBegunImage.Top+(Y-OnEntY);}
     ScrollBarImage.Update;
     //MovingRecord:=Trunc((ScrollBegunImage.Top-TopPrior)*RecInPixels);
     if MovingRecord>0 then ItogDBCtrlGrid.PanelIndex:=ItogDBCtrlGrid.PanelCount-1;
     if MovingRecord<0 then ItogDBCtrlGrid.PanelIndex:=0;
     if MovingRecord<>0 then
      ItogADOQuery.MoveBy(MovingRecord);
     //if MovingRecord<>0 then TopPrior:=ScrollBegunImage.Top;
     //ItogADOQuery.MoveBy(Trunc((Y-OnEntY)*RecInPixels));
    end;
   end;
   {if (Y-OnEntY)<0 then
    if ((Source as TControl).Top+(Y-OnEntY))>=(ScrollUpButtonImage.Top+
     ScrollUpButtonImage.Height) then
     (Source as TControl).Top:=(Source as TControl).Top+
      Y-OnEntY;
   if (Y-OnEntY)>0 then
    if ((Source as TControl).Top+(Source as TControl).Height+
        Y-OnEntY)<=(ScrollDownButtonImage.Top) then
     (Source as TControl).Top:=(Source as TControl).Top+
      Y-OnEntY;}
  end;
 end;
end;

procedure TDelphiAndc1.ScrollBarImageDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
 if (Source is TControl) then
  if (Source as TControl).Name='ScrollBegunImage' then begin
   ScrollBegunImageDragOver(Sender, Source, X, Y, State, Accept);
 end;
end;

procedure TDelphiAndc1.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
 if (Source is TControl) then
  if (Source as TControl).Name='ScrollBegunImage' then begin
   ScrollBegunImageDragOver(Sender, Source, X, Y, State, Accept);
 end;
end;

procedure TDelphiAndc1.ItogDBCtrlGridDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
 if (Source is TControl) then
  if (Source as TControl).Name='ScrollBegunImage' then begin
   ScrollBegunImageDragOver(Sender, Source, X, Y, State, Accept);
 end;
end;

procedure TDelphiAndc1.OrderDBCtrlGridDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
 if (Source is TControl) then
  if (Source as TControl).Name='ScrollBegunImage' then begin
   ScrollBegunImageDragOver(Sender, Source, X, Y, State, Accept);
 end;
end;

procedure TDelphiAndc1.ScrollBarImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 RecInPixels:Double;
 RecordMove:integer;
 KeyD:Word;
begin
 if (PaintOptionADOQuery.Active) and Assigned(ScrollButtons)  and
      (ItogADOQuery.Active) and (Sender is TControl) then
  if (Y+(Sender as TControl).Top)>ScrollBegunImage.Top+ScrollBegunImage.Height then
   begin
    KeyD:=VK_NEXT;
    ItogDBCtrlGrid.KeyDown(KeyD, Shift);
   end
  else begin
   KeyD:=VK_PRIOR;
   ItogDBCtrlGrid.KeyDown(KeyD, Shift);
  end;
end;

procedure TDelphiAndc1.Add1ImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if (Sender is TImage) then
  (Sender as TImage).Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ADDBUTTONIMAGEFILE+
    IntToStr((Sender as TImage).Tag)+'.bmp');
end;

procedure TDelphiAndc1.ScrollUpButtonImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 ScrollUpButtonImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+SCROLLUPBUTTONIMAGEFILE+'.bmp');
end;

procedure TDelphiAndc1.ScrollDownButtonImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 ScrollDownButtonImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+SCROLLDOWNBUTTONIMAGEFILE+'.bmp');
end;

procedure TDelphiAndc1.AllDeleteImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 AllDeleteImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ALLDELETEBUTTONIMAGEFILE+'_Down.bmp');
end;

procedure TDelphiAndc1.OneDeleteImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 OneDeleteImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+DELETEONEBUTTONIMAGEFILE+'_Down.bmp');
 NoClickInOrder:=true;  
end;

procedure TDelphiAndc1.OneDeleteImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 OneDeleteImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+DELETEONEBUTTONIMAGEFILE+'.bmp');
 NoClickInOrder:=true;
end;

procedure TDelphiAndc1.CreateSchetImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 CloneOfOrder:TCustomADODataSet;
 lpSoursFile, lpDestFile:PAnsiChar;
begin
 if InfoForm.Visible then begin
  FormMouseDown(self, Button, Shift, X, Y);
  exit;
 end;

 CreateSchetImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+CREATESCHETBUTTONIMAGE+'_Down.bmp');
 CreateSchetImage.Update;

 //создаем счет
 if OrderADOTable.RecordCount=0 then begin
  ShowMyMessage('Счет пустой.');
 end;

 CloneOfOrder:=TCustomADODataSet.Create(nil);
 try
  CloneOfOrder.Clone(OrderADOTable);
  lpSoursFile:=PAnsiChar(GetApplicationPath()+'\'+
   ORDERDIR+'\'+CURRENTOREDERFILE+'.dbf');
  lpDestFile:=PAnsiChar(GetApplicationPath()+'\'+
   ORDERDIR+'\'+CREATETOREDERFILE+'.dbf');
  if AuthoRizationDid then
   lpDestFile:=PAnsiChar(GetApplicationPath()+'\'+
    ORDERDIR+'\'+
     Trim(ContagentADOQuery.FieldByName('CODE').AsString)
      +'.dbf');
  CopyFile(lpSoursFile,
   lpDestFile, false);

  ShablonOfShetaForm.SchetADOQuery.Close;
  ShablonOfShetaForm.SchetsADOConnection.Close;
  ShablonOfShetaForm.SchetsADOConnection.ConnectionString:=
   'FILE NAME='+
    GetApplicationPath()+'\'+OPTIONSONCREATEANDRESIZEDIR+'\'+
     LOCALBASECONNECTTEMPTFILE+'.udl';
  ShablonOfShetaForm.SchetsADOConnection.DefaultDatabase:=
   GetApplicationPath+'\'+ORDERDIR;
  ShablonOfShetaForm.SchetsADOConnection.Connected:=true;
  ShablonOfShetaForm.SchetADOQuery.SQL.Clear;
  ShablonOfShetaForm.SchetADOQuery.SQL.LoadFromFile(
        GetApplicationPath()+'\'+QUERYSQLDIR+
         '\'+SCHETCREATEDSQLFILE);

  ShablonOfShetaForm.SchetAddFixADOCommand.CommandText:=
     GetLoadFromFileString(GetApplicationPath()+'\'+
        QUERYSQLDIR+'\'+ADDINSCHETRECSQLQUERY);

  //открываем таблицу со счетом
  ShablonOfShetaForm.SchetAddFixADOCommand.Execute;
  ShablonOfShetaForm.SchetDeleteFixADOCommand.Execute;
  ShablonOfShetaForm.SchetADOQuery.Open;

  //SchetPechForm.SchetHeadLabel.Caption:='Счет № '+NomerOfScheta;
  SchetPechForm.Caption:='Печатная форма счета';
  if PeremOfUnitNoScroll.HandleOfCreatingSchet=0 then begin
   SchetPechForm.ColNameOfSchet:=ColNameOfSchet;
   SchetPechForm.ColColichOfSchet:=ColColichOfSchet;
   SchetPechForm.ColPriceOfSchet:=ColPriceOfSchet;
   SchetPechForm.ColSummOfSchet:=ColSummOfSchet;
   {PeremOfUnitNoScroll.CreatingSchDBCtrlGrid:=
    SchetPechForm.OrderDBCtrlGrid;
   PeremOfUnitNoScroll.HandleOfCreatingSchet:=
    SchetPechForm.OrderDBCtrlGrid.Handle;
   PeremOfUnitNoScroll.OldWindowProcCreatingSchet:=
    Pointer(SetWindowLong
         (PeremOfUnitNoScroll.HandleOfCreatingSchet,
                 GWL_WNDPROC, LongInt(@NewWindowProc)));}
  end; //if
  ShablonOfShetaForm.SupplierQRLabel.Caption:='ИНН 43434343434343 КПП 554454545454'+
  'ООО "Продовольствия" 4334343, Россия, Екатеринбург, Ливтвинская, д. 4';
  ShablonOfShetaForm.FirmaQRLabel.Caption:='ООО "УралКлиент"';
  if EntryForm.FirmNameEdit.Text<>EntryForm.FirmNameEdit.Name then
   ShablonOfShetaForm.FirmaQRLabel.Caption:=EntryForm.FirmNameEdit.Text;
  ShablonOfShetaForm.BankQRLabel.Caption:='ОАО "ГРАДБАНК" Екатеринбург';
  ShablonOfShetaForm.BIKQRLabel.Caption:='3344043343';
  ShablonOfShetaForm.SchBankQRLabel.Caption:='230923090488934';
  ShablonOfShetaForm.NomSchetaQRLabel.Caption:='34439009887585';
  ShablonOfShetaForm.SchetQuickRep.PrintIfEmpty:=true;

  SchetPechForm.Show(FCursorVisible);
  SchetPechForm.BoundsRect:=BoundsRect;
  SchetPechForm.SchetQRPreview.Height:=SchetPechForm.ClientHeight-
                        SchetPechForm.SchetQRPreview.Top;
  
  ShablonOfShetaForm.SchetQuickRep.Preview;
  ////SchetForm.Height:=ClientHeight;
  //SchetPechForm.OrderDBCtrlGrid.Top:=200;
 finally
  CloneOfOrder.Destroy;
  ////WriteInLogLastError();
 end;
end; //CreateSchetImageMouseDown

procedure TDelphiAndc1.CreateSchetImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 CreateSchetImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+CREATESCHETBUTTONIMAGE+'.bmp');
end;

procedure TDelphiAndc1.GroupsDBCtrlGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 //RePaintRect.Bottom:=200;
 //SendMessage(handle, WM_PAINT, 0, 0);
 //RedrawWindow(Handle, nil, 0, RDW_NOERASE + RDW_INVALIDATE +
 // RDW_NOINTERNALPAINT);
 //Windows.InvalidateRect(Handle, nil, true);
 
 if InfoForm.Visible then begin
  FormMouseDown(self, Button, Shift, X, Y);
  exit;
 end;
end;

procedure TDelphiAndc1.OrderDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
 Prov3.Left:=0;
end;

procedure TDelphiAndc1.PageUpPriceImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 KeyD:Word;
begin
 PageUpPriceImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+PAGEUPPRICEBUTTONIMAGEFILE+'_Down.bmp');
 PageUpPriceImage.Update;
 //CurrentPanelInItog:=-10;
 KeyD:=VK_PRIOR;
 ItogDBCtrlGrid.KeyDown(KeyD, Shift);
end;

procedure TDelphiAndc1.PageUpPriceImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 PageUpPriceImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+PAGEUPPRICEBUTTONIMAGEFILE+'.bmp');
end;

procedure TDelphiAndc1.PageDownPriceImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 KeyD:Word;
begin
 PageDownPriceImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+PAGEDOWNPRICEBUTTONIMAGEFILE+'_Down.bmp');
 PageDownPriceImage.Update;
 //CurrentPanelInItog:=-10;
 KeyD:=VK_NEXT;
 ItogDBCtrlGrid.KeyDown(KeyD, Shift);
end;

procedure TDelphiAndc1.PageDownPriceImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 PageDownPriceImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+PAGEDOWNPRICEBUTTONIMAGEFILE+'.bmp');
end;

procedure TDelphiAndc1.RowUpPriceImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 RowUpPriceImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ROWUPPRICEBUTTONIMAGEFILE+'_Down.bmp');
 RowUpPriceImage.Update;
 //CurrentPanelInItog:=-10;

 ItogDBCtrlGrid.PanelIndex:=0;
 ItogADOQuery.Prior;

end;

procedure TDelphiAndc1.RowUpPriceImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 RowUpPriceImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ROWUPPRICEBUTTONIMAGEFILE+'.bmp');
end;

procedure TDelphiAndc1.RowDownPriceImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 RowDownPriceImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ROWDOWNPRICEBUTTONIMAGEFILE+'_Down.bmp');
 RowDownPriceImage.Update;
 //CurrentPanelInItog:=-10;
 
 ItogDBCtrlGrid.PanelIndex:=ItogDBCtrlGrid.PanelCount-1;
 ItogADOQuery.Next;
end;

procedure TDelphiAndc1.RowDownPriceImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 RowDownPriceImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ROWDOWNPRICEBUTTONIMAGEFILE+'.bmp');
end;

procedure TDelphiAndc1.RowUpSchetImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 RowUpSchetImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ROWUPSCHETBUTTONIMAGEFILE+'_Down.bmp');
 RowUpSchetImage.Update;

 OrderDBCtrlGrid.PanelIndex:=0;
 OrderADOTable.Prior;
end;

procedure TDelphiAndc1.RowUpSchetImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 RowUpSchetImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ROWUPSCHETBUTTONIMAGEFILE+'.bmp');
end;

procedure TDelphiAndc1.RowDownSchetImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 RowDownSchetImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ROWDOWNSCHETBUTTONIMAGEFILE+'_Down.bmp');
 RowDownSchetImage.Update;

 OrderDBCtrlGrid.PanelIndex:=OrderDBCtrlGrid.PanelCount-1;
 OrderADOTable.Next;
end;

procedure TDelphiAndc1.RowDownSchetImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 RowDownSchetImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+ROWDOWNSCHETBUTTONIMAGEFILE+'.bmp');
end;

procedure TDelphiAndc1.ChooseAmountImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 CountInOrderLoc:Double;
 CaptTablo:String;
 NumberAdding:Double; Code:integer;
begin
 //if Shift<>[ssDouble] then begin
  ChooseAmountImage.Picture.LoadFromFile(GetApplicationPath+'\'+
    INTERFACEIMAGEDIR+'\'+CHOOSEAMOUNTPRICEIMAGEFILE+'_Down.bmp');
  ChooseAmountImage.Update;
 //end;
 {показ диалога выбора количества}
 if not(InitConnectBoolCalc) then
  InicializationConnectionsCalc(GetApplicationPath());
 CountInOrderLoc:=GetCountGoodInOrder(true);
 CaptTablo:='';
 if CountInOrderLoc=0 then CaptTablo:='';
 if CountInOrderLoc>0 then
  CaptTablo:=MyFormatOfNumber(CountInOrderLoc);

 CalculatorForm.NumberLabel.Caption:=CaptTablo;
 CalculatorForm.ShowModal;
 Val(CalculatorForm.NumberLabel.Caption, NumberAdding, code);
 if NumberAdding<>0 then
  AddInOrderTovar(NumberAdding, false);
 try
  //нарисовать или показать калькулятор
 finally
 end;
end;

procedure TDelphiAndc1.ChooseAmountImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 ChooseAmountImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+CHOOSEAMOUNTPRICEIMAGEFILE+'.bmp');
end;

procedure TDelphiAndc1.InfoPriceImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 Peredvig:integer;
begin
 InfoPriceImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+INFOPRICEIMAGEFILE+'_Down.bmp');
 InfoPriceImage.Update;

 //затеменяем фон формы
 DarkeningPict:=TIMEOFDARKENINGINSEC;
 DarkeningTimer.OnTimer(self);
 DarkeningTimer.Enabled:=true;
 //показвываем информационнное окно
 Peredvig:=0;
 if PredydSdvigExist then
  Peredvig:=TopOfMainGrid;
 InfoForm.Top:=HeadOfPrice.Top+Peredvig-5;
 InfoForm.Height:=UnderPriceRect.Bottom-InfoForm.Top;//UpPagePrice.Bottom-InfoForm.Top;//UpPagePrice.Top-InfoForm.Top;

 if FileExists(GetApplicationPath+'\'+
    IMAGESGOODS+'\'+IntToStr(ItogADOQuery.FieldByName('code').AsInteger)+'.bmp') then begin
  InfoForm.GoodsImage.Picture.LoadFromFile(GetApplicationPath+'\'+
    IMAGESGOODS+'\'+IntToStr(ItogADOQuery.FieldByName('code').AsInteger)+'.bmp');
 end
 else begin
  InfoForm.GoodsImage.Picture:=nil;
 end;

 InfoForm.DescriptionADOQuery.Connection:=LocalADOConnection;
 InfoForm.DescriptionADOQuery.Close;
 //InfoForm.DescriptionADOQuery.SQL.Clear;
 InfoForm.DescriptionADOQuery.SQL[8]:=IntToStr(ItogADOQuery.FieldByName('code').AsInteger);
 InfoForm.DescriptionADOQuery.Open;
 InfoForm.DescriptionADOQuery.RecordCount;
 InfoForm.Show(FCursorVisible);
 //CurrentPanelInItog:=-10;
end;

procedure TDelphiAndc1.InfoPriceImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 InfoPriceImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+INFOPRICEIMAGEFILE+'.bmp');
end;

procedure TDelphiAndc1.ShowAddButImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 CountInOrderLoc, NumberAdding:Double;
 CaptTablo:String; code:integer;
begin
 if Shift<>[ssAlt] then begin
  ShowAddButImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+SHOWADDBUTSPRICEIMAGEFILE+'_Down.bmp');
  ShowAddButImage.Update;
 end; //

 {Add1Image.Visible:=true;
 Add5Image.Visible:=true;
 Add10Image.Visible:=true;
 ChooseAmountImage.Visible:=true;
 InfoPriceImage.Visible:=false;
 ShowAddButImage.Visible:=false;}

 CurrentPanelInItog:=ItogDBCtrlGrid.PanelIndex;
 //CurrentPanelInItog:=ItogADOQuery.RecNo;
 {показ диалога выбора количества}
 if not(InitConnectBoolCalc) then
  InicializationConnectionsCalc(GetApplicationPath());
 if Shift=[ssAlt] then
  CountInOrderLoc:=GetCountGoodInOrder(false);
 if Shift<>[ssAlt] then
  CountInOrderLoc:=GetCountGoodInOrder(true);
 CaptTablo:='';
 if CountInOrderLoc=0 then CaptTablo:='';
 if CountInOrderLoc>0 then
  CaptTablo:=MyFormatOfNumber(CountInOrderLoc);

 CalculatorForm.NumberLabel.Caption:=CaptTablo;
 CalculatorForm.SetCurrentCursor(FCursorVisible);
 CalculatorForm.ShowModal;
 Val(CalculatorForm.NumberLabel.Caption, NumberAdding, code);
 if NumberAdding<>0 then
  if Shift=[ssAlt] then
   AddInOrderTovar(NumberAdding, false, true);
  if Shift<>[ssAlt] then
   AddInOrderTovar(NumberAdding, false);
 try
  //нарисовать или показать калькулятор
 finally
 end;
end; //ShowAddButImageMouseDown

procedure TDelphiAndc1.ShowAddButImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 ShowAddButImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+SHOWADDBUTSPRICEIMAGEFILE+'.bmp');
end;

procedure TDelphiAndc1.ItogDBCtrlGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 CoordYInPanel:integer;
begin
 CoordYInPanel:=Y-ItogDBCtrlGrid.PanelHeight*
  ItogDBCtrlGrid.PanelIndex;
 SendMessage(TNoScrollPanels(ItogDBCtrlGrid).Panel.Handle,
             WM_LBUTTONDOWN,
              MK_LBUTTON	, X
                or (CoordYInPanel shl 16));
end;

procedure TDelphiAndc1.OrderDBCtrlGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 CoordYInPanel:integer;
begin
 CoordYInPanel:=Y-OrderDBCtrlGrid.PanelHeight*
  OrderDBCtrlGrid.PanelIndex;
  SendMessage(TNoScrollPanels(OrderDBCtrlGrid).Panel.Handle,
             WM_LBUTTONDOWN,
              0, X
                or (CoordYInPanel shl 16));
end;

procedure TDelphiAndc1.OrderDBCtrlGridMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 CoordYInPanel:integer;
begin
 CoordYInPanel:=Y-OrderDBCtrlGrid.PanelHeight*
  OrderDBCtrlGrid.PanelIndex;
  SendMessage(TNoScrollPanels(OrderDBCtrlGrid).Panel.Handle,
             WM_LBUTTONUP,
              0, X
                or (CoordYInPanel shl 16));
end;

function TDelphiAndc1.SetCaptionsOfGroups(WidClientPix, HeiClientPix
                                                : integer):byte;
var
 FieldVal:string;
begin
 //TempraryImage.Width:=GroupNameText.Width;
 //TempraryImage.Height:=GroupNameText.Height;
 //TemrNewImage.BoundsRect:=TempraryImage.BoundsRect;
 //TemrNewImage.Left:=TempraryImage.Left+TempraryImage.Width;
 GroupsDataSource.Enabled:=false;

 GroupsADOQuery.First;
 TemraryPaintForm.RecordsProgressBar.Min:=1;
 TemraryPaintForm.RecordsProgressBar.Max:=GroupsADOQuery.RecordCount;
 TemraryPaintForm.RecordsProgressBar.Position:=1;
 while not(GroupsADOQuery.Eof) and
  (GroupsADOQuery.RecNo<=GroupsADOQuery.RecordCount) do
 begin
  FieldVal:=Trim(GroupsADOQuery.FieldByName('DESCR').AsString);
  //TempraryImage.Picture:=nil;
  if not(FileExists(GetApplicationPath+'\'+IMAGESGROUPSDIR+'\'+
      FieldVal+'_Name_'+SizeScreenText+'.bmp')) then begin
    TemraryPaintForm.Show(FCursorVisible);
    TemraryPaintForm.RecordsProgressBar.Position:=GroupsADOQuery.RecNo;
    TemraryPaintForm.RecordsProgressBar.Update;
    TemraryPaintForm.NadpLabel.Update;
    DrawTextWithStroke(0, nil, FieldVal,
     GroupNameText.LeftInParent, GroupNameText.BottomInParent,
     GroupNameText.Width, GroupNameText.FontName,
     GroupNameText.FontSize, GroupNameText.Color,
     GroupNameText.ColorSelected, GroupNameText.ParentObj.Color, 3,
     self, GroupsImage.Height,
     GetApplicationPath+'\'+IMAGESGROUPSDIR+'\'+
       FieldVal+'_Name_'+SizeScreenText+'.bmp');
  end;
  if not(FileExists(GetApplicationPath+'\'+IMAGESGROUPSDIR+'\'+
      FieldVal+'_Name_'+SizeScreenText+'.bmp')) then begin
  end; //while пробегаем по таблице с группами

  GroupsADOQuery.Next;
 end; //while пробегаем по записям таблицы групп

 TemraryPaintForm.Close;
 GroupsADOQuery.First;
 GroupsDataSource.Enabled:=true;

 Result:=0;
end; //SetCaptionsOfGroups

procedure TDelphiAndc1.NameOfSchetDBTextClick(Sender: TObject);
var
 Res:integer;
begin
 Res:=0;
 if (Sender is TComponent) then
  if (Sender as TComponent).Name<>'CountAndEdSchetLabel' then
 {обратная навигация из счета в парйс}
 if OrderADOTable.Active then
  if OrderADOTable.RecordCount>0 then begin
   if ZagruzkaTovaraIzPrice then
    Res:=FindeAndSetTovar(
     Trim(OrderADOTable.FieldByName('DESCR').AsString),
     Trim(OrderADOTable.FieldByName('PARENT_EDS').AsString),
     Trim(OrderADOTable.FieldByName('CODE').AsString),
     OrderADOTable.FieldByName('PARENTID_E').AsInteger)
    else
    Res:=FindeAndSetTovarDBF(
     OrderADOTable.FieldByName('ID').AsString,
     OrderADOTable.FieldByName('ParentID').AsString);
 end; //
 if (Sender is TComponent) then
  if (Sender as TComponent).Name='CountAndEdSchetLabel' then
 //if (Res<>0) then begin
  ShowAddButImageMouseDown(ShowAddButImage, mbLeft, [ssAlt], 1, 1);
  ShowAddButImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+SHOWADDBUTSPRICEIMAGEFILE+'.bmp');
  ItogDBCtrlGrid.Refresh;
 //end; //
end; //NameOfSchetDBTextClick

function TDelphiAndc1.FindeAndSetTovar(Descr, code, Group_DescrE:string;
                                       Group_IDe:integer):Integer;
var
 GroupID:integer; GroupIDStr:String;
 NotCurrentGroup, NotCurrentSubGroup,
  NotCurrentTovar:boolean;
 PoiskInFieldName:string;
begin
 Result:=0;
 NotCurrentGroup:=true;
 NotCurrentSubGroup:=true;
 NotCurrentTovar:=true;
 GroupID:=Group_IDe;
 if SubGroupsADOQuery.Active then
  if SubGroupsADOQuery.RecordCount>0 then
   if SubGroupsADOQuery.FieldByName('ID').AsInteger=GroupID then
    NotCurrentSubGroup:=false;

 if ItogADOQuery.Active then
  if ItogADOQuery.RecordCount>0 then
   if Trim(ItogADOQuery.FieldByName('DESCR').AsString)=Descr then
    NotCurrentTovar:=false;

 if NotCurrentTovar then
  if ItogADOQuery.Locate('DESCR', Descr, [loCaseInsensitive]) then
   NotCurrentTovar:=false;

 if (NotCurrentSubGroup) and (NotCurrentTovar) then
  if SubGroupsADOQuery.Locate('ID', GroupID, [loCaseInsensitive]) then
  begin
   NotCurrentSubGroup:=false;
   if ItogADOQuery.Locate('DESCR', Descr, [loCaseInsensitive]) then
    NotCurrentTovar:=false;
  end;

 if not(NotCurrentTovar) then begin
  Result:=ItogADOQuery.RecNo;
  Exit;
 end;

 SearchTovADOQuery.Parameters.Items[0].Value:=Descr;
 SearchTovADOQuery.Close;
 SearchTovADOQuery.Open;
 if SearchTovADOQuery.RecordCount<=0 then begin
  ShowMessage('Товара c названием '+Descr+' не смог быть найден!?');
  Exit;
 end; //

 SearchSubGrADOQuery.Parameters.Items[0].Value:=Group_IDe;
 SearchSubGrADOQuery.Close;
 //SearchSubGrADOQuery.SQL.Strings[3]:=IntToStr(Group_IDe);
 SearchSubGrADOQuery.Open;

 PoiskInFieldName:='CODE';
 if SearchSubGrADOQuery.RecordCount>0 then begin
  SearchSubGrADOQuery.First;
  GroupID:=SearchSubGrADOQuery.FieldValues['PARENT'];
  PoiskInFieldName:='ID';
 end; //

 SearchGroupADOQuery.Parameters.Items[0].Value:=GroupID;
 SearchGroupADOQuery.Close;
 SearchGroupADOQuery.SQL.Strings[6]:=PoiskInFieldName;
 SearchGroupADOQuery.Open;
 if SearchGroupADOQuery.RecordCount<=0 then begin
  ShowMessage('Группа c '+PoiskInFieldName+' равным '+IntToStr(GroupID)+' не смогла быть найдена!?');
  Exit;
 end;

 if GroupsADOQuery.FieldByName(PoiskInFieldName).AsInteger=GroupID then
  NotCurrentGroup:=false;

 if NotCurrentGroup then
  if GroupsADOQuery.Locate(PoiskInFieldName, GroupID, [loCaseInsensitive]) then
   NotCurrentGroup:=false;

 if NotCurrentGroup then begin
  ShowMessage('Группа c '+PoiskInFieldName+' равным '+IntToStr(GroupID)+' не смогла быть сделана текущей!?');
  Exit;
 end; //

 if (SubGroupsADOQuery.Active) then
  if SubGroupsADOQuery.RecordCount>1 then
   if SubGroupsADOQuery.Locate('ID', Group_IDe, [loCaseInsensitive]) then
    NotCurrentSubGroup:=false;

 if (ItogADOQuery.Active) then
  if ItogADOQuery.RecordCount>1 then
   if ItogADOQuery.Locate('DESCR', Descr, [loCaseInsensitive]) then
    NotCurrentTovar:=false;

 if ItogADOQuery.Active then
  if ItogADOQuery.RecordCount>0 then
   Result:=ItogADOQuery.RecNo;
end; //FindeAndSetTovar

function TDelphiAndc1.FindeAndSetTovarDBF(IdTov, IdGropy:string):Integer;
var
 ParentIDTemprary:String; GroupID:String; SubGruopId, PushGroupID:String; GroupIDStr:String;
 NotCurrentGroup, NotCurrentSubGroup,
  NotCurrentTovar:boolean;
 PoiskInFieldName:string;
begin
 Result:=0;
 NotCurrentGroup:=true;
 NotCurrentSubGroup:=true;
 NotCurrentTovar:=true;
 PushGroupID:=IdGropy;
 if SubGroupsADOQuery.Active then
  if SubGroupsADOQuery.RecordCount>0 then
   if SubGroupsADOQuery.FieldByName('ID').AsString=PushGroupID then
    NotCurrentSubGroup:=false;

 if ItogADOQuery.Active then
  if ItogADOQuery.RecordCount>0 then
   if Trim(ItogADOQuery.FieldByName('ID').AsString)=IdTov then
    NotCurrentTovar:=false;

 if NotCurrentTovar then
  if ItogADOQuery.Locate('ID', IdTov, [loCaseInsensitive]) then
   NotCurrentTovar:=false;

 if (NotCurrentSubGroup) and (NotCurrentTovar) then
  if SubGroupsADOQuery.Locate('ID', PushGroupID, [loCaseInsensitive]) then
  begin
   NotCurrentSubGroup:=false;
   if ItogADOQuery.Locate('ID', IdTov, [loCaseInsensitive]) then
    NotCurrentTovar:=false;
  end;

 if not(NotCurrentTovar) then begin
  Result:=ItogADOQuery.RecNo;
  Exit;
 end;

 SearchGroupADOQuery.Close;
 SearchGroupADOQuery.SQL.Clear;
 SearchGroupADOQuery.SQL.LoadFromFile(GetApplicationPath()+'\'+
        QUERYSQLDIR+'\'+SEARCHGROUPSQLFILE);

 //перебираем грауппы товара добираясь до корневой
 GroupID:=IdGropy;
 SubGruopId:='';
 ParentIDTemprary:=Trim(IdGropy);
 while (ParentIDTemprary<>'') do begin
  SearchGroupADOQuery.Close;
  SearchGroupADOQuery.Parameters.Items[0].Value:=GroupID;
  SearchGroupADOQuery.Open;
  Prov5:=SearchGroupADOQuery.RecordCount;
  Prov5:=SearchGroupADOQuery.Parameters.Count;
  //запоинаем новую строку поиска
  GroupID:=SearchGroupADOQuery.FieldByName('ID').AsString;
  if SearchGroupADOQuery.FieldByName('ParentID').IsNull then
   ParentIDTemprary:='' else
   ParentIDTemprary:=Trim(SearchGroupADOQuery.FieldByName('ParentID').AsString);
   if ParentIDTemprary='0' then ParentIDTemprary:='';
  //зпоминаем полседние две корневые грыппы
  if ParentIDTemprary<>'' then begin
   SubGruopId:=GroupID;
   GroupID:=SearchGroupADOQuery.FieldByName('ParentID').AsString;
  end; //
 end; //{while} пока не добрались до корневой группы

 if GroupsADOQuery.FieldByName('ID').AsString=GroupID then
  NotCurrentGroup:=false;

 if NotCurrentGroup then
  if GroupsADOQuery.Locate('ID', GroupID, [loCaseInsensitive]) then
   NotCurrentGroup:=false;

 if NotCurrentGroup then begin
  ShowMessage('Группа c '+'id'+' равным '+GroupID+' не смогла быть сделана текущей!?');
  Exit;
 end; //

 if (SubGroupsADOQuery.Active) then
  if SubGroupsADOQuery.RecordCount>1 then
   if SubGroupsADOQuery.Locate('ID', SubGruopId, [loCaseInsensitive]) then
    NotCurrentSubGroup:=false;

 if (ItogADOQuery.Active) then
  if ItogADOQuery.RecordCount>1 then
   if ItogADOQuery.Locate('ID', IdTov, [loCaseInsensitive]) then
    NotCurrentTovar:=false;

 if ItogADOQuery.Active then
  if ItogADOQuery.RecordCount>0 then
   Result:=ItogADOQuery.RecNo;
end; //FindeAndSetTovarDBF

//получить количество товара в заявке
function TDelphiAndc1.GetCountGoodInOrder(RelativelyItoTable:boolean):Double;
var
 pDescr:string;
 GoodFinded:boolean;
begin
 Result:=0;
 if RelativelyItoTable then begin
  if not(ItogADOQuery.Active) then Exit;
  if ItogADOQuery.RecordCount<=0 then Exit;
  if not(OrderADOTable.Active) then Exit;
  if OrderADOTable.RecordCount<=0 then Exit;
  pDescr:=Trim(ItogADOQuery.FieldValues['DESCR']);
 end; //

 GoodFinded:=true;

 if RelativelyItoTable then begin
  if (Trim(OrderADOTable.FieldByName('DESCR').AsString)<>pDescr) then
   if not(OrderADOTable.Locate('DESCR', pDescr, [loCaseInsensitive])) then
    GoodFinded:=false;
 end;

 if not(GoodFinded) then Exit;

 if OrderADOTable.FieldByName('COUNT').IsNull then Exit;

 Result:=OrderADOTable.FieldByName('COUNT').Value;
end; //GetCountGoodInOrder

//добавить товар в заявку
function TDelphiAndc1.AddInOrderTovar(CountGood:Double; AddCountBool:boolean;
                                      const CurrentOrder:boolean=false):Double;
var
 pGroup, pDescr, pEdinica, pValuta:string;
 CodeGroupForPrice:Integer;
 pPriceDoub:double;
 pPrice, pSumma:string;
 pCount:Double;
 pSummaDoub:double;
 codeEr:integer;
 OldPCount, OldpSummaDoub:double;
begin
 pGroup:=''; CodeGroupForPrice:=0; OldpSummaDoub:=0; OldPCount:=0;
 if ZagruzkaTovaraIzPrice then begin
  if (SubGroupsADOQuery.Active) and (SubGroupsADOQuery.RecordCount>0) then
  begin
   CodeGroupForPrice:=SubGroupsADOQuery.FieldValues['ID'];
   pGroup:=Trim(SubGroupsADOQuery.FieldValues['DESCR'])
  end
  else begin
   CodeGroupForPrice:=GroupsADOQuery.FieldValues['CODE'];
   pGroup:=Trim(GroupsADOQuery.FieldValues['DESCR']);
  end;
 end; //если товар берем из прайса
 if not(CurrentOrder) then
  pDescr:=Trim(ItogADOQuery.FieldValues['DESCR']);
 if CurrentOrder then
  pDescr:=Trim(OrderADOTable.FieldValues['DESCR']);

 if not(CurrentOrder) then
  if (Trim(OrderADOTable.FieldByName('DESCR').AsString)<>pDescr) then
   OrderADOTable.Locate('DESCR', pDescr, [loCaseInsensitive]);
 pCount:=CountGood;
 if not(CurrentOrder) then begin
  pEdinica:=EdItogStaticText.Caption;
  pPrice:=Copy(PriceItStaticText.Caption, 1,
          Length(PriceItStaticText.Caption)-5);
 end;
 if CurrentOrder then begin
  pEdinica:=OrderADOTable.FieldByName('EDINICADES').AsString;
  pPrice:=FloatToStr(OrderADOTable.FieldByName('PRICE').AsFloat);
 end;

 pPriceDoub:=0;
 if ZagruzkaTovaraIzPrice then
  pPriceDoub:=StrToFloat(pPrice);
 if not(ZagruzkaTovaraIzPrice) then begin
  if not(CurrentOrder) then
   pPrice:=Trim(ItogADOQuery.FieldValues['PRICE']);
  if CurrentOrder then
   pPrice:=Trim(OrderADOTable.FieldValues['PRICE']);
  Val(pPrice, pPriceDoub, codeEr);
 end;

 pValuta:='руб';
 if not(ZagruzkaTovaraIzPrice) then begin
  if not(CurrentOrder) then
   pValuta:=ItogADOQuery.FieldValues['VALUTA'];
  if CurrentOrder then
   pValuta:=OrderADOTable.FieldValues['VALUTA'];
 end;
 pSummaDoub:=pPriceDoub*pCount;
 if (Trim(OrderADOTable.FieldByName('DESCR').AsString)<>pDescr) then begin
   OrderADOTable.Edit;
   OrderADOTable.Append;
   OrderADOTable.FieldByName('ID').Value:='';
   OrderADOTable.FieldByName('PARENTID').Value:='';
   if not(ZagruzkaTovaraIzPrice) then begin
    OrderADOTable.FieldByName('ID').Value:=ItogADOQuery.FieldValues['ID'];
    OrderADOTable.FieldByName('PARENTID').Value:=ItogADOQuery.FieldValues['PARENTID'];
   end;
   OrderADOTable.FieldByName('PARENTID_E').Value:=CodeGroupForPrice;
   OrderADOTable.FieldByName('PARENT_EDS').Value:=pGroup;
   OrderADOTable.FieldByName('CODE').Value:=ItogADOQuery.FieldValues['CODE'];
   OrderADOTable.FieldByName('DESCR').Value:=pDescr;
   OrderADOTable.FieldByName('COUNT').Value:=pCount;
   OrderADOTable.FieldByName('EDINICAID').Value:='';
   if not(ZagruzkaTovaraIzPrice) then
    OrderADOTable.FieldByName('EDINICAID').Value:=ItogADOQuery.FieldValues['sp86'];
   OrderADOTable.FieldByName('EDINICADES').Value:=pEdinica;
   OrderADOTable.FieldByName('PRICE').Value:=pPriceDoub;
   OrderADOTable.FieldByName('VALUTAID').Value:='';
   if not(ZagruzkaTovaraIzPrice) then
    OrderADOTable.FieldByName('VALUTAID').Value:=ItogADOQuery.FieldValues['IDVALUTA'];
   OrderADOTable.FieldByName('VALUTADESC').Value:=pValuta;
   OrderADOTable.FieldByName('SUMMA').Value:=pSummaDoub;
   OrderADOTable.Post;
  end
 else begin
  OrderADOTable.Edit;
  if AddCountBool then begin
   OrderADOTable.FieldByName('COUNT').Value:=
   OrderADOTable.FieldByName('COUNT').Value+pCount;
   OrderADOTable.FieldByName('SUMMA').Value:=
   OrderADOTable.FieldByName('SUMMA').Value+pSummaDoub;
  end
  else begin
   OldPCount:=OrderADOTable.FieldByName('COUNT').Value;
   OldpSummaDoub:=OrderADOTable.FieldByName('SUMMA').Value;
   OrderADOTable.FieldByName('COUNT').Value:=pCount;
   OrderADOTable.FieldByName('SUMMA').Value:=pSummaDoub;
  end;
  OrderADOTable.Post;
 end;

 if AddCountBool then
  SummItogSchetZnach:=Round((SummItogSchetZnach+pSummaDoub)*100)/100
 else
  SummItogSchetZnach:=Round((SummItogSchetZnach-OldpSummaDoub+
                            pSummaDoub)*100)/100;

 SummStrItogSchetZnach:='';
 if SummItogSchetZnach<>0 then
  SummStrItogSchetZnach:=FloatToStr(SummItogSchetZnach);
 WeightStrItogSchetZnach:='';
 if WeightItogSchetZnach<>0 then
  WeightStrItogSchetZnach:=FloatToStr(WeightItogSchetZnach);
 CapacityStrItogSchetZanch:='';
 if CapacityItogSchetZanch<>0 then
  CapacityStrItogSchetZanch:=FloatToStr(CapacityItogSchetZanch);

 SummItogSchetLabel.Caption:=SummStrItogSchetZnach+' '+pValuta;
 SummItogSchetLabel.Repaint;
end; //AddInOrderTovar

procedure TDelphiAndc1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if InfoForm.Visible then begin
  SendMessage(GroupsDBCtrlGrid.Handle, WM_SETREDRAW, 1, 0);
  SendMessage(SubGroupsDBCtrlGrid.Handle, WM_SETREDRAW, 1, 0);
  DarkeningTimer.Enabled:=false;
  if not(SubGroupsDBCtrlGrid.Visible) then begin
   SubGroupsDBCtrlGrid.Visible:=true;
   SubGroupsDBCtrlGrid.Visible:=false;
  end;
  InvalidateRect(Handle, nil, false);
  if GroupsDBCtrlGrid.Visible then begin
   GroupsDBCtrlGrid.Invalidate;
   GroupsDBCtrlGrid.Update;
  end;
  //SubGroupsDBCtrlGrid.Refresh;
  if SubGroupsDBCtrlGrid.Visible then begin
   SubGroupsDBCtrlGrid.Invalidate;
   SubGroupsDBCtrlGrid.Update;
  end;
  Update;
  InfoForm.Close;
  //Refresh;
 end;
end;

procedure TDelphiAndc1.GroupImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if InfoForm.Visible then begin
  FormMouseDown(self, Button, Shift, X, Y);
  exit;
 end;
end;

procedure TDelphiAndc1.NameOfGroupImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if InfoForm.Visible then begin
  FormMouseDown(self, Button, Shift, X, Y);
  exit;
 end;
end;

procedure TDelphiAndc1.RightGrLabelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if InfoForm.Visible then begin
  FormMouseDown(self, Button, Shift, X, Y);
  exit;
 end;
end;

procedure TDelphiAndc1.SubGroupImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if InfoForm.Visible then begin
  FormMouseDown(self, Button, Shift, X, Y);
  exit;
 end;
end;

procedure TDelphiAndc1.SubGroupsDBTextMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if InfoForm.Visible then begin
  FormMouseDown(self, Button, Shift, X, Y);
  exit;
 end;
end;

procedure TDelphiAndc1.DefineWidthSubGroupNameLabelMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
 if InfoForm.Visible then begin
  FormMouseDown(self, Button, Shift, X, Y);
  exit;
 end;
end;

procedure TDelphiAndc1.SummItogSchetLabelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if InfoForm.Visible then begin
  FormMouseDown(self, Button, Shift, X, Y);
  exit;
 end;
end;

procedure TDelphiAndc1.NadpSummItogSchetLabelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if InfoForm.Visible then begin
  FormMouseDown(self, Button, Shift, X, Y);
  exit;
 end;
end;

procedure TDelphiAndc1.BulkItogSchetLabelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if InfoForm.Visible then begin
  FormMouseDown(self, Button, Shift, X, Y);
  exit;
 end;
end;

procedure TDelphiAndc1.NadpWeigthItogSchetLabelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if InfoForm.Visible then begin
  FormMouseDown(self, Button, Shift, X, Y);
  exit;
 end;
end;

procedure TDelphiAndc1.NadpBulkItogSchetLabelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if InfoForm.Visible then begin
  FormMouseDown(self, Button, Shift, X, Y);
  exit;
 end;
end;

procedure TDelphiAndc1.SubGroupsDBCtrlGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if InfoForm.Visible then begin
  FormMouseDown(self, Button, Shift, X, Y);
  exit;
 end;
end;

procedure TDelphiAndc1.DarkeningTimerTimer(Sender: TObject);
var
 BitMapTemr:TBitmap;
 RowBitMap:pByteArray;
 RGBTR:TRGBArray;
 i, j, k, BitsPerPixel:integer;
 MinCvet, AverCvet:byte;
begin
 //чтобы не проиходило деление на ноль
 if DarkeningPict<=0 then begin
  DarkeningTimer.Enabled:=false;
  SendMessage(GroupsDBCtrlGrid.Handle, WM_SETREDRAW, 1, 0);
  SendMessage(SubGroupsDBCtrlGrid.Handle, WM_SETREDRAW, 1, 0);
  Exit;
 end;

 if GroupsDBCtrlGrid.Visible then
  SendMessage(GroupsDBCtrlGrid.Handle, WM_SETREDRAW, 0, 0);
 if SubGroupsDBCtrlGrid.Visible then
  SendMessage(SubGroupsDBCtrlGrid.Handle, WM_SETREDRAW, 0, 0);

 //создаем рабочее пространство рисования
 BitMapTemr:=TBitmap.Create;
 try
  BitMapTemr.Width:=ClientWidth;
  BitMapTemr.Height:=ClientHeight;
  BitMapTemr.Canvas.Brush.Color:=clGray;
  BitsPerPixel:=24;
  BitMapTemr.PixelFormat:=pf24bit;
  BitBlt(BitMapTemr.Canvas.Handle, 0, 0, ClientWidth, ClientHeight,
         Canvas.Handle, 0, 0, SRCCOPY);
  for i:=0 to BitMapTemr.Height-1 do
  begin
   RowBitMap:=BitMapTemr.ScanLine[i];
   for j:=0 to BitMapTemr.Width-1 do begin//GroupsDBCtrlGrid.Width+GroupsDBCtrlGrid.Left do begin
    MinCvet:=RowBitMap[j];
    AverCvet:=Byte(Round((RowBitMap[j*3]+RowBitMap[j*3+1]+RowBitMap[j*3+2])/3));
    for k:=0 to 2 do begin
     RowBitMap[j*3+k]:=RowBitMap[j*3+k]-Round(((RowBitMap[j*3+k]-AverCvet)/TIMEOFDARKENINGINSEC)*
                                              (TIMEOFDARKENINGINSEC-DarkeningPict+1));
    end;
   end;
  end; //for i:=0 to BitMapTemr.Height-1
  BitBlt(Canvas.Handle, 0, 0, ClientWidth, ClientHeight,
         BitMapTemr.Canvas.Handle, 0, 0, SRCCOPY);
  //затемняем группы
  (*BitMapTemr.Width:=GroupsDBCtrlGrid.Width-1;
  BitMapTemr.Height:=GroupsDBCtrlGrid.Height-1;
  {BitBlt(BitMapTemr.Canvas.Handle, 0, 0, GroupsDBCtrlGrid.Width-1,
         GroupsDBCtrlGrid.Height-1,
         GroupsDBCtrlGrid.Canvas.Handle, 0, 0, SRCCOPY);}
  BitBlt(BitMapTemr.Canvas.Handle, 0, 0, GroupsDBCtrlGrid.Width-1,
         GroupsDBCtrlGrid.Height-1,
         GetDC(0), 0, 0, SRCCOPY);
  for i:=0 to BitMapTemr.Height-1 do
  begin
   RowBitMap:=BitMapTemr.ScanLine[i];
   for j:=0 to (BitMapTemr.Width-1) do begin
    MinCvet:=RowBitMap[j];
    AverCvet:=Byte(Round((RowBitMap[j*3]+RowBitMap[j*3+1]+RowBitMap[j*3+2])/3));
    for k:=0 to 2 do begin
     RowBitMap[j*3+k]:=RowBitMap[j*3+k]-Round(((RowBitMap[j*3+k]-AverCvet)/
                                               TIMEOFDARKENINGINSEC)*
                                              (TIMEOFDARKENINGINSEC-
                                               DarkeningPict+1));
    end;
   end;
  end; //for i:=0 to BitMapTemr.Height-1
  BitBlt(GroupsDBCtrlGrid.Canvas.Handle, 0, 0, GroupsDBCtrlGrid.Width,
         GroupsDBCtrlGrid.Height,
         BitMapTemr.Canvas.Handle, 0, 0, SRCCOPY);*)
 finally
  BitMapTemr.Destroy;
 end;
 if DarkeningPict<=1 then begin
  SendMessage(GroupsDBCtrlGrid.Handle, WM_SETREDRAW, 1, 0);
  SendMessage(SubGroupsDBCtrlGrid.Handle, WM_SETREDRAW, 1, 0);
  DarkeningTimer.Enabled:=false;
 end;
 Dec(DarkeningPict);
end;

procedure TDelphiAndc1.EntryImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 EntryForm.Left:=0;
 EntryForm.Top:=0;
 EntryForm.Width:=ClientWidth;
 EntryForm.Height:=ClientHeight;
 EntryForm.Show(FCursorVisible);
end; //EntryImageMouseDown

end.
