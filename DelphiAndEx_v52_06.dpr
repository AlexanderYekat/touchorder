program DelphiAndEx_v52_06;

uses
  Forms,
  DelphiEx_v52_06 in 'DelphiEx_v52_06.pas' {DelphiAndc1},
  ConstUnit in 'UnitsFilesBeforeCompile\ConstUnit.pas',
  StringsUnit in 'UnitsFilesBeforeCompile\StringsUnit.pas',
  WithBaseWorkAnyProcUnit in 'UnitsFilesBeforeCompile\WithBaseWorkAnyProcUnit.pas',
  PaintUnit in 'UnitsFilesBeforeCompile\PaintUnit.pas',
  PaintObjectsUnit in 'UnitsFilesBeforeCompile\PaintObjectsUnit.pas',
  ObjectsUnit in 'UnitsFilesBeforeCompile\ObjectsUnit.pas',
  NoScrollUnit in 'UnitsFilesBeforeCompile\NoScrollUnit.pas',
  WriteDBFUnit in 'UnitsFilesBeforeCompile\WriteDBFUnit.pas',
  SchetUnit in 'UnitsFilesBeforeCompile\SchetUnit.pas' {SchetPechForm},
  SetCaptionsForGroupsUnit in 'UnitsFilesBeforeCompile\SetCaptionsForGroupsUnit.pas',
  TemraryPaintUnit in 'UnitsFilesBeforeCompile\TemraryPaintUnit.pas' {TemraryPaintForm},
  ShablonOfShetUnit in 'UnitsFilesBeforeCompile\ShablonOfShetUnit.pas' {ShablonOfShetaForm},
  CalculatorUnit in 'UnitsFilesBeforeCompile\CalculatorUnit.pas' {CalculatorForm},
  InfoFormUnit in 'UnitsFilesBeforeCompile\InfoFormUnit.pas' {InfoForm},
  EntryUnit in 'UnitsFilesBeforeCompile\EntryUnit.pas' {EntryForm},
  FormsClassCurs in 'UnitsFilesBeforeCompile\FormsClassCurs.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDelphiAndc1, DelphiAndc1);
  Application.CreateForm(TSchetPechForm, SchetPechForm);
  Application.CreateForm(TTemraryPaintForm, TemraryPaintForm);
  Application.CreateForm(TShablonOfShetaForm, ShablonOfShetaForm);
  Application.CreateForm(TCalculatorForm, CalculatorForm);
  Application.CreateForm(TInfoForm, InfoForm);
  Application.CreateForm(TEntryForm, EntryForm);
  //Application.CreateForm(TWriteChisloForm, WriteChisloForm);
  Application.Run;
end.
