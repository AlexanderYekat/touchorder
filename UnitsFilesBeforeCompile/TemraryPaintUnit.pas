unit TemraryPaintUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, FormsClassCurs;

type
  TTemraryPaintForm = class(TMyCursorForms)
    TemraryImage: TImage;
    RecordsProgressBar: TProgressBar;
    NadpLabel: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TemraryPaintForm: TTemraryPaintForm;

implementation

{$R *.dfm}

end.
