unit SRPUnit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOCommand1: TADOCommand;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADODataSet1: TADODataSet;
    GroupBox1: TGroupBox;
    DataSource2: TDataSource;
    ADODataSet2: TADODataSet;
    DBNazwa: TDBEdit;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Masa: TLabel;
    Obj�to��: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Kg: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure ZacznijTworzycBD;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ZacznijTworzycBD;
var
   p : String;

procedure resetuj;
begin
   p := '';
end;

procedure dp (pl : string);
begin
  p := p + pl;
end;

procedure wykonaj;
begin
  ADOCommand1.CommandText := p;
  ADOCommand1.Execute;
end;

begin
  try
   resetuj;
   dp('USE SRP;');
   wykonaj;

   resetuj;
   dp('CREATE TABLE parametry (');
   dp('ID INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,');
   dp('NAZWA VARCHAR(40) NOT NULL,');
   dp('GESTOSC INTEGER,');
   dp('LEPKOSC INTEGER,');
   dp('MASA INTEGER,');
   dp('OBJETOSC INTEGER,');
   dp('WYGLAD VARCHAR(80)');
   dp(');');
   wykonaj;

   resetuj;
   dp('CREATE TABLE probka (');
   dp('ID INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,');
   dp('NAZWA VARCHAR(40) NOT NULL,');
   dp('DATA_UTWORZENIA DATE NOT NULL,');
   dp('DATA_UKONCZENIA_ANALIZY DATE NOT NULL,');
   dp('PARAMETRY_ID INTEGER FOREIGN KEY REFERENCES parametry(ID)');
   dp(');');
   wykonaj;

  except
    ShowMessage('Blad wykonania SQL');
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  try
    ADOConnection1.Connected := True;
  except
    ShowMessage('B��d po��czenia z serwerem bazy danych');
    Application.Terminate;
  end;
  try
    ADOCommand1.CommandText := 'CREATE DATABASE SRP;';
    ADOCommand1.Execute;
    ZacznijTworzycBD;
  except
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  ADOConnection1.Connected := False;
end;

end.
