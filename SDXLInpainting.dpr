program SDXLInpainting;

uses
  System.StartUpCopy,
  FMX.Forms,
  Skia.FMX,
  uMainForm in 'uMainForm.pas' {MainForm},
  MyPaintBox in 'MyPaintBox.pas';

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
