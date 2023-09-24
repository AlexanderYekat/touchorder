unit ShablonOfShetUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, QRPrntr, DB, ADODB, FormsClassCurs;

type
  TShablonOfShetaForm = class(TMyCursorForms)
    SchetQuickRep: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    SummaQRDBText: TQRDBText;
    RowNumQRSysData: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    TitleBand1: TQRBand;
    QRLabel6: TQRLabel;
    AttantionQRLabel: TQRLabel;
    SummaryQRBand: TQRBand;
    SummQRExpr: TQRExpr;
    NadpSumQRLabel: TQRLabel;
    QRChildBand1: TQRChildBand;
    ChiefQRLabel: TQRLabel;
    NadpChiefQRLabel: TQRLabel;
    NadpAccountantQRLabel: TQRLabel;
    QRLabel9: TQRLabel;
    BankiQRChildBand: TQRChildBand;
    NadpBankPolQRLabel: TQRLabel;
    BankQRLabel: TQRLabel;
    NadpBIKQRLabel: TQRLabel;
    NadpSchNQRLabel: TQRLabel;
    SchBankQRLabel: TQRLabel;
    BIKQRLabel: TQRLabel;
    INNBankQRLabel: TQRLabel;
    KPPQRLabel: TQRLabel;
    FirmaQRLabel: TQRLabel;
    QRLabel12: TQRLabel;
    NadpBankSchNQRLabel: TQRLabel;
    NomSchetaQRLabel: TQRLabel;
    SchetQRChildBand: TQRChildBand;
    NadpSchetQRLabel: TQRLabel;
    QRLabel11: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel10: TQRLabel;
    PostPokupQRChildBand: TQRChildBand;
    NadpSupplierQRLabel: TQRLabel;
    SupplierQRLabel: TQRLabel;
    NadpClientQRLabel: TQRLabel;
    ClientQRLabel: TQRLabel;
    SchetADOQuery: TADOQuery;
    SchetsADOConnection: TADOConnection;
    SchetDataSource: TDataSource;
    SchetAddFixADOCommand: TADOCommand;
    SchetDeleteFixADOCommand: TADOCommand;
    procedure SchetQuickRepPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ShablonOfShetaForm: TShablonOfShetaForm;

implementation uses SchetUnit;

{$R *.dfm}

procedure TShablonOfShetaForm.SchetQuickRepPreview(Sender: TObject);
begin
 SchetPechForm.SchetQRPreview.QRPrinter:=TQRPrinter(Sender);
end;

end.
