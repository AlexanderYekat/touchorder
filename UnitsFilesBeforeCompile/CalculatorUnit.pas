unit CalculatorUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, PaintObjectsUnit, DB, ADODB, FormsClassCurs;

type
  TCalculatorForm = class(TMyCursorForms)
    CalculatorImage: TImage;
    TabloImage: TImage;
    ClearImage: TImage;
    NumberLabel: TLabel;
    PaintCalculADOConnection: TADOConnection;
    PaintCalculatorADOQuery: TADOQuery;
    OkImage: TImage;
    ZeroImage: TImage;
    ThreeImage: TImage;
    TwoImage: TImage;
    OneImage: TImage;
    SixImage: TImage;
    FiveImage: TImage;
    FourImage: TImage;
    NineImage: TImage;
    EightImage: TImage;
    SevenImage: TImage;
    procedure ClearImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ClearImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OkImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure OkImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SevenImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SevenImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EightImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EightImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure NineImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure NineImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FourImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FourImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FiveImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FiveImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SixImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SixImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure OneImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure OneImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TwoImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TwoImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ThreeImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ThreeImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ZeroImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ZeroImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    CalculatorPanel, Tablo, Number, ClearButton,
    OkButton, ZeroButton, ThreeButton, TwoButton,
    OneButton, SixButton, FiveButton, FourButton,
    NineButton, EightButton, SevenButton

    :TPaintingObjects;

    KoefOfCalckHoriz, CoefOfCalcVert:Double;

    OkButtonDownedBool:boolean; //если кнопка Ok нажата

    function  SetCoordinatesOfObjects(WidClientPix, HeiClientPix
                         : integer):byte;
  end;

function InicializationConnectionsCalc(ApplicPath:string;
                    OpenTables:boolean = true):byte;

var
  CalculatorForm: TCalculatorForm;
  InitConnectBoolCalc:boolean = false;

implementation uses ConstUnit;

{$R *.dfm}

function InicializationConnectionsCalc(ApplicPath:string;
                    OpenTables:boolean = true):byte;
begin
 Result:=0;
 if Assigned(CalculatorForm) then begin
  if ApplicPath<>'' then begin
   //соединение с таблицами для рисования калькулятора
   CalculatorForm.PaintCalculADOConnection.Connected:=false;
   CalculatorForm.PaintCalculADOConnection.ConnectionString:=
    'FILE NAME='+
     ApplicPath+'\'+OPTIONSONCREATEANDRESIZEDIR+'\'+
      LOCALBASECONNECTTEMPTFILE+'.udl';
   CalculatorForm.PaintCalculADOConnection.DefaultDatabase:=
    ApplicPath+'\'+OPTIONSONCREATEANDRESIZEDIR;
   CalculatorForm.PaintCalculADOConnection.Connected:=true;
   Result:=1;
  end; //if ApplicPath<>''
  {открываем таблицу с координатами рисованных
   объектов калькулятора}
  if OpenTables then begin
   CalculatorForm.PaintCalculatorADOQuery.Close;
   if CalculatorForm.PaintCalculatorADOQuery.SQL.Count<2 then
    CalculatorForm.PaintCalculatorADOQuery.SQL.Append(
                                 PAINTCALCULATOROPTIONSFILE);
   CalculatorForm.PaintCalculatorADOQuery.Open;
   Result:=2;
   InitConnectBoolCalc:=true;
  end; //if OpenTables
 end; //if Assigned(CalculatorForm)
end; //InicializationConnectionsCalc

procedure TCalculatorForm.ClearImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 ClearImage.Picture.LoadFromFile(GetApplicationPath+'\'+
   INTERFACEIMAGEDIR+'\'+CLEARBUTCALCULIMAGEFILE+'_Down.bmp');
 ClearImage.Update;

 if Length(NumberLabel.Caption)>0 then
  NumberLabel.Caption:=Copy(NumberLabel.Caption,
   0, Length(NumberLabel.Caption)-1);
end;

procedure TCalculatorForm.ClearImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 ClearImage.Picture.LoadFromFile(GetApplicationPath+'\'+
  INTERFACEIMAGEDIR+'\'+CLEARBUTCALCULIMAGEFILE+'.bmp');
 ClearImage.Update;
end;

procedure TCalculatorForm.FormCreate(Sender: TObject);
begin
 KoefOfCalckHoriz:=28;
 CoefOfCalcVert:=28;
 if not(InitConnectBoolCalc) then
  InicializationConnectionsCalc(GetApplicationPath());
 if not(InitConnectBoolCalc) then Exit;
 
 PaintCalculatorADOQuery.First;
 if PaintCalculatorADOQuery.FieldByName('Width').AsFloat<>0 then
  KoefOfCalckHoriz:=Width/
   PaintCalculatorADOQuery.FieldByName('Width').AsFloat;
 if PaintCalculatorADOQuery.FieldByName('Heigth').AsFloat<>0 then
  CoefOfCalcVert:=Height/
   PaintCalculatorADOQuery.FieldByName('Heigth').AsFloat;
   
 CalculatorPanel:=TPaintingObjects.Create(
   PaintCalculatorADOQuery,  KoefOfCalckHoriz,
   CoefOfCalcVert, 'CalculatorPanel');
 Tablo:=TPaintingObjects.Create(
   PaintCalculatorADOQuery, KoefOfCalckHoriz,
   CoefOfCalcVert, 'Tablo');
 Number:=TPaintingObjects.Create(
   PaintCalculatorADOQuery, KoefOfCalckHoriz,
   CoefOfCalcVert, 'Number');
 ClearButton:=TPaintingObjects.Create(
   PaintCalculatorADOQuery, KoefOfCalckHoriz,
   CoefOfCalcVert, 'ClearButton');
 OkButton:=TPaintingObjects.Create(
   PaintCalculatorADOQuery, KoefOfCalckHoriz,
   CoefOfCalcVert, 'OkButton');
 ZeroButton:=TPaintingObjects.Create(
   PaintCalculatorADOQuery, KoefOfCalckHoriz,
   CoefOfCalcVert, 'ZeroButton');
 ThreeButton:=TPaintingObjects.Create(
   PaintCalculatorADOQuery, KoefOfCalckHoriz,
   CoefOfCalcVert, 'ThreeButton');
 TwoButton:=TPaintingObjects.Create(
   PaintCalculatorADOQuery, KoefOfCalckHoriz,
   CoefOfCalcVert, 'TwoButton');
 OneButton:=TPaintingObjects.Create(
   PaintCalculatorADOQuery, KoefOfCalckHoriz,
   CoefOfCalcVert, 'OneButton');
 SixButton:=TPaintingObjects.Create(
   PaintCalculatorADOQuery, KoefOfCalckHoriz,
   CoefOfCalcVert, 'SixButton');
 FiveButton:=TPaintingObjects.Create(
   PaintCalculatorADOQuery, KoefOfCalckHoriz,
   CoefOfCalcVert, 'FiveButton');
 FourButton:=TPaintingObjects.Create(
   PaintCalculatorADOQuery, KoefOfCalckHoriz,
   CoefOfCalcVert, 'FourButton');
 NineButton:=TPaintingObjects.Create(
   PaintCalculatorADOQuery, KoefOfCalckHoriz,
   CoefOfCalcVert, 'NineButton');
 EightButton:=TPaintingObjects.Create(
   PaintCalculatorADOQuery, KoefOfCalckHoriz,
   CoefOfCalcVert, 'EightButton');
 SevenButton:=TPaintingObjects.Create(
   PaintCalculatorADOQuery, KoefOfCalckHoriz,
   CoefOfCalcVert, 'SevenButton');

 //переопределение размеров
 SetCoordinatesOfObjects(Width, Height);

 //кнопка закратия окна
 OkButtonDownedBool:=false;
end; //FormCreate

function  TCalculatorForm.SetCoordinatesOfObjects(WidClientPix, HeiClientPix
                         : integer):byte;
begin
 Result:=0;
 //картинка табло
 TabloImage.Left:=Tablo.Left;
 TabloImage.Top:=Tablo.Top;
 TabloImage.Width:=Tablo.Width;
 TabloImage.Height:=Tablo.Height;

 //цифры в табло
 NumberLabel.Left:=Number.Left;
 NumberLabel.Top:=Number.Top;
 NumberLabel.Width:=Number.Width;
 NumberLabel.Height:=NumberLabel.Height;
 NumberLabel.Caption:='';

 //явная установка координат
 //для кнопки очистки табло
 ClearImage.Left:=ClearButton.Left;
 ClearImage.Top:=ClearButton.Top;
 ClearImage.Width:=ClearButton.Width;
 ClearImage.Height:=ClearButton.Height;
 //для кнопки очистки табло Ok
 OkImage.Left:=OkButton.Left;
 OkImage.Top:=OkButton.Top;
 OkImage.Width:=OkButton.Width;
 OkImage.Height:=OkButton.Height;
 //для кнопки Zero
 ZeroImage.Left:=ZeroButton.Left;
 ZeroImage.Top:=ZeroButton.Top;
 ZeroImage.Width:=ZeroButton.Width;
 ZeroImage.Height:=ZeroButton.Height;
 //для кнопки One
 OneImage.Left:=OneButton.Left;
 OneImage.Top:=OneButton.Top;
 OneImage.Width:=OneButton.Width;
 OneImage.Height:=OneButton.Height;
 //для кнопки Two
 TwoImage.Left:=TwoButton.Left;
 TwoImage.Top:=TwoButton.Top;
 TwoImage.Width:=TwoButton.Width;
 TwoImage.Height:=TwoButton.Height;
 //для кнопки Three
 ThreeImage.Left:=ThreeButton.Left;
 ThreeImage.Top:=ThreeButton.Top;
 ThreeImage.Width:=ThreeButton.Width;
 ThreeImage.Height:=ThreeButton.Height;
 //для кнопки  Four
 FourImage.Left:=FourButton.Left;
 FourImage.Top:=FourButton.Top;
 FourImage.Width:=FourButton.Width;
 FourImage.Height:=FourButton.Height;
 //для кнопки Five
 FiveImage.Left:=FiveButton.Left;
 FiveImage.Top:=FiveButton.Top;
 FiveImage.Width:=FiveButton.Width;
 FiveImage.Height:=FiveButton.Height;
 //для кнопки Six
 SixImage.Left:=SixButton.Left;
 SixImage.Top:=SixButton.Top;
 SixImage.Width:=SixButton.Width;
 SixImage.Height:=SixButton.Height;
 //для кнопки Seven
 SevenImage.Left:=SevenButton.Left;
 SevenImage.Top:=SevenButton.Top;
 SevenImage.Width:=SevenButton.Width;
 SevenImage.Height:=SevenButton.Height;
 //для кнопки Eight
 EightImage.Left:=EightButton.Left;
 EightImage.Top:=EightButton.Top;
 EightImage.Width:=EightButton.Width;
 EightImage.Height:=EightButton.Height;
 //для кнопки Nine
 NineImage.Left:=NineButton.Left;
 NineImage.Top:=NineButton.Top;
 NineImage.Width:=NineButton.Width;
 NineImage.Height:=NineButton.Height;

 //загрузка картинок
 CalculatorImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+CALCFONBUTTONIMAGEFILE+'.bmp');
 TabloImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+TABLOCALCIMAGEFILE+'.bmp');
 ClearImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+CLEARBUTCALCULIMAGEFILE+'.bmp');
 ZeroImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+ZEROCALCBUTTONIMAGEFILE+'.bmp');
 OneImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+ONECALCBUTTONIMAGEFILE+'.bmp');
 TwoImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+TWOCALCBUTTONIMAGEFILE+'.bmp');
 ThreeImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+THREECALCBUTTONIMAGEFILE+'.bmp');
 FourImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+FOURCALCBUTTONIMAGEFILE+'.bmp');
 FiveImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+FIVECALCBUTTONIMAGEFILE+'.bmp');
 SixImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+SIXCALCBUTTONIMAGEFILE+'.bmp');
 SevenImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+SEVENCALCBUTTONIMAGEFILE+'.bmp');
 EightImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+EIGHTCALCBUTTONIMAGEFILE+'.bmp');
 NineImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+NINECALCBUTTONIMAGEFILE+'.bmp');
 OkImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+OKCALCBUTTONIMAGEFILE+'.bmp');
end; //SetCoordinatesOfObjects


procedure TCalculatorForm.FormDestroy(Sender: TObject);
begin
 CalculatorPanel.Destroy;
 Tablo.Destroy;
 Number.Destroy;
 ClearButton.Destroy;
 OkButton.Destroy;
 ZeroButton.Destroy;
 ThreeButton.Destroy;
 TwoButton.Destroy;
 OneButton.Destroy;
 SixButton.Destroy;
 FiveButton.Destroy;
 FourButton.Destroy;
 NineButton.Destroy;
 EightButton.Destroy;
 SevenButton.Destroy;
end;

procedure TCalculatorForm.OkImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 OkImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+OKCALCBUTTONIMAGEFILE+'_Down.bmp');
 OkImage.Update;

 OkButtonDownedBool:=true;
end;

procedure TCalculatorForm.OkImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 OkImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+OKCALCBUTTONIMAGEFILE+'.bmp');
 OkImage.Update;

 if OkButtonDownedBool then
 begin
  OkButtonDownedBool:=false;
  close;
 end;
end;

procedure TCalculatorForm.SevenImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 SevenImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+SEVENCALCBUTTONIMAGEFILE+'_Down.bmp');
 SevenImage.Update;

 if Length(NumberLabel.Caption)<MAXCOUNTINNUMBER then
  NumberLabel.Caption:=NumberLabel.Caption+'7';
end;

procedure TCalculatorForm.SevenImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 SevenImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+SEVENCALCBUTTONIMAGEFILE+'.bmp');
 SevenImage.Update;
end;

procedure TCalculatorForm.EightImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 EightImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+EIGHTCALCBUTTONIMAGEFILE+'.bmp');
 EightImage.Update;
end;

procedure TCalculatorForm.EightImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 EightImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+EIGHTCALCBUTTONIMAGEFILE+'_Down.bmp');
 EightImage.Update;

 if Length(NumberLabel.Caption)<MAXCOUNTINNUMBER then
  NumberLabel.Caption:=NumberLabel.Caption+'8';
end;

procedure TCalculatorForm.NineImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 NineImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+NINECALCBUTTONIMAGEFILE+'.bmp');
 NineImage.Update;
end;

procedure TCalculatorForm.NineImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 NineImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+NINECALCBUTTONIMAGEFILE+'_Down.bmp');
 NineImage.Update;

 if Length(NumberLabel.Caption)<MAXCOUNTINNUMBER then
  NumberLabel.Caption:=NumberLabel.Caption+'9';
end;

procedure TCalculatorForm.FourImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 FourImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+FOURCALCBUTTONIMAGEFILE+'.bmp');
 FourImage.Update;
end;

procedure TCalculatorForm.FourImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 FourImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+FOURCALCBUTTONIMAGEFILE+'_Down.bmp');
 FourImage.Update;

 if Length(NumberLabel.Caption)<MAXCOUNTINNUMBER then
  NumberLabel.Caption:=NumberLabel.Caption+'4';
end;

procedure TCalculatorForm.FiveImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 FiveImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+FIVECALCBUTTONIMAGEFILE+'.bmp');
 FiveImage.Update;
end;

procedure TCalculatorForm.FiveImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 FiveImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+FIVECALCBUTTONIMAGEFILE+'_Down.bmp');
 FiveImage.Update;

 if Length(NumberLabel.Caption)<MAXCOUNTINNUMBER then
  NumberLabel.Caption:=NumberLabel.Caption+'5';
end;

procedure TCalculatorForm.SixImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 SixImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+SIXCALCBUTTONIMAGEFILE+'.bmp');
 SixImage.Update;
end;

procedure TCalculatorForm.SixImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 SixImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+SIXCALCBUTTONIMAGEFILE+'_Down.bmp');
 SixImage.Update;

 if Length(NumberLabel.Caption)<MAXCOUNTINNUMBER then
  NumberLabel.Caption:=NumberLabel.Caption+'6';
end;

procedure TCalculatorForm.OneImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 OneImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+ONECALCBUTTONIMAGEFILE+'.bmp');
 OneImage.Update;
end;

procedure TCalculatorForm.OneImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 OneImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+ONECALCBUTTONIMAGEFILE+'_Down.bmp');
 OneImage.Update;

 if Length(NumberLabel.Caption)<MAXCOUNTINNUMBER then
  NumberLabel.Caption:=NumberLabel.Caption+'1';
end;

procedure TCalculatorForm.TwoImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 TwoImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+TWOCALCBUTTONIMAGEFILE+'.bmp');
 TwoImage.Update;
end;

procedure TCalculatorForm.TwoImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 TwoImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+TWOCALCBUTTONIMAGEFILE+'_Down.bmp');
 TwoImage.Update;

 if Length(NumberLabel.Caption)<MAXCOUNTINNUMBER then
  NumberLabel.Caption:=NumberLabel.Caption+'2';
end;

procedure TCalculatorForm.ThreeImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 ThreeImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+THREECALCBUTTONIMAGEFILE+'.bmp');
 ThreeImage.Update;
end;

procedure TCalculatorForm.ThreeImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 ThreeImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+THREECALCBUTTONIMAGEFILE+'_Down.bmp');
 ThreeImage.Update;

 if Length(NumberLabel.Caption)<MAXCOUNTINNUMBER then
  NumberLabel.Caption:=NumberLabel.Caption+'3';
end;

procedure TCalculatorForm.ZeroImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 ZeroImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+ZEROCALCBUTTONIMAGEFILE+'.bmp');
 ZeroImage.Update;
end;

procedure TCalculatorForm.ZeroImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 ZeroImage.Picture.LoadFromFile(GetApplicationPath()+'\'+
  INTERFACEIMAGEDIR+'\'+ZEROCALCBUTTONIMAGEFILE+'_Down.bmp');
 ZeroImage.Update;

 if Length(NumberLabel.Caption)<MAXCOUNTINNUMBER then
  NumberLabel.Caption:=NumberLabel.Caption+'0';
end;

end.
