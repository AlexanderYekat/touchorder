unit SchetUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, XPMan, Grids, DBGrids, StdCtrls, DBCtrls, dbcgrids,
  ExtCtrls, PaintObjectsUnit, ComCtrls, QuickRpt, QRCtrls, QRPrntr, ToolWin,
  Buttons, ImgList, FormsClassCurs;

type
  TSchetPechForm = class(TMyCursorForms)
    XPManifest: TXPManifest;
    SchetQRPreview: TQRPreview;
    OptionsToolBar: TToolBar;
    ForToolBarImageList: TImageList;
    procedure PrintBitBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OptionsToolBarCustomDraw(Sender: TToolBar;
      const ARect: TRect; var DefaultDraw: Boolean);
    procedure OptionsToolBarMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OptionsToolBarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    ColNameOfSchet,
    ColColichOfSchet, ColPriceOfSchet,
    ColSummOfSchet:TPaintingObjects;
  end;

var
  SchetPechForm: TSchetPechForm;
  NumBMP:integer=0;
  NumBMPClose:integer=2;


implementation uses ConstUnit, NoScrollUnit;

{$R *.dfm}

procedure TSchetPechForm.PrintBitBtnClick(Sender: TObject);
begin
 SchetQRPreview.QRPrinter.Print;
end;

procedure TSchetPechForm.CloseBitBtnClick(Sender: TObject);
begin
 close;
end;

procedure TSchetPechForm.FormCreate(Sender: TObject);
begin
 ForToolBarImageList.Draw(OptionsToolBar.Canvas,
                          0, 0, NumBMP);
end;

procedure TSchetPechForm.OptionsToolBarCustomDraw(Sender: TToolBar;
  const ARect: TRect; var DefaultDraw: Boolean);
begin
 ForToolBarImageList.Draw(OptionsToolBar.Canvas,
                          0, 0, NumBMP);
 ForToolBarImageList.Draw(OptionsToolBar.Canvas,
                           ForToolBarImageList.Width,
                           0, NumBMPClose);
end;

procedure TSchetPechForm.OptionsToolBarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if (X>=0) and (X<=ForToolBarImageList.Width) then begin
  if NumBMP>1 then Exit;
  NumBMP:=1;
  ForToolBarImageList.Draw(OptionsToolBar.Canvas,
                          0, 0, NumBMP);
  //SchetQRPreview.QRPrinter.Print;
 end;
 if (X>ForToolBarImageList.Width) and (X<=2*ForToolBarImageList.Width) then begin
  if NumBMPClose>3 then Exit;
  NumBMPClose:=3;
  ForToolBarImageList.Draw(OptionsToolBar.Canvas,
                           ForToolBarImageList.Width,
                           0, NumBMPClose);
  Close;
 end;
end;

procedure TSchetPechForm.OptionsToolBarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if NumBMP=1 then begin
  NumBMP:=0;
  ForToolBarImageList.Draw(OptionsToolBar.Canvas,
                          0, 0, NumBMP);
 end;
 if NumBMPClose=3 then begin
  NumBMPClose:=2;
  ForToolBarImageList.Draw(OptionsToolBar.Canvas,
                           ForToolBarImageList.Width,
                           0, NumBMPClose);
 end;
end;

procedure TSchetPechForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 NumBMPClose:=2;
 NumBMP:=0;
end;

end.
