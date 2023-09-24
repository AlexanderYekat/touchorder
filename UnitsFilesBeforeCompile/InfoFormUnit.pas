unit InfoFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, FormsClassCurs, StdCtrls, DB, ADODB, DBCtrls;

type
  TInfoForm = class(TMyCursorForms)
    GoodsImage: TImage;
    CodeLabel: TLabel;
    TradeMarkLabel: TLabel;
    ProducerLabel: TLabel;
    CountryLabel: TLabel;
    SeparatingPanel: TPanel;
    WeightBulkLabel: TLabel;
    FlavouringStuffLabel: TLabel;
    AmountPackingLabel: TLabel;
    SubstanceOfGasLabel: TLabel;
    TradeMarkUnderLabel: TLabel;
    PackingLabel: TLabel;
    NonalcoholicDrinkLabel: TLabel;
    BulkLitreLabel: TLabel;
    PackageLabel: TLabel;
    SmallWholesaleCostLabel: TLabel;
    DescriptionADOQuery: TADOQuery;
    CodeDBText: TDBText;
    DescriptionDataSource: TDataSource;
    TradeMarkDBText: TDBText;
    ProducerDBText: TDBText;
    CountryDBText: TDBText;
    WeightBulkDBText: TDBText;
    FlavouringStuffDBText: TDBText;
    AmountPackingDBText: TDBText;
    SubstanceOfGasDBText: TDBText;
    TradeMarkUnderDBText: TDBText;
    PackingDBText: TDBText;
    NonalcoholicDrinkDBText: TDBText;
    BulkLitreDBText: TDBText;
    PackageDBText: TDBText;
    SmallWholesaleCostDBText: TDBText;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  protected
  public
    { Public declarations }
  end;

var
  InfoForm: TInfoForm;

implementation uses DelphiEx_v52_06;

{$R *.dfm}

procedure TInfoForm.FormResize(Sender: TObject);
begin
 Left:=10;
 //Top:=40;
 Width:=Screen.Width-2*Left;
 //Height:=Screen.Height-2*Top;
end;

end.
