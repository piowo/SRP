program SRP;

uses
  Vcl.Forms,
  SRPUnit1 in 'SRPUnit1.pas' {Form1},
  DMUnit1 in 'DMUnit1.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
