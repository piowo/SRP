program SRP;

uses
  Vcl.Forms,
  SRPUnit1 in 'SRPUnit1.pas' {Form1},
  SRPUnit2 in 'SRPUnit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
