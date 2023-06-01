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
    DBGestosc: TDBEdit;
    Nazwa: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBLepkosc: TDBEdit;
    Masa: TLabel;
    Objêtoœæ: TLabel;
    DBObjetosc: TDBEdit;
    DBMasa: TDBEdit;
    Kg: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    DBOpis: TDBMemo;
    Opis: TLabel;
    ZapiszParametry: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ZapiszParametryClick(Sender: TObject);
  private
    { Private declarations }
    polecenie : string;

    procedure Resetuj;
    procedure DP(pol : string);  //dodaj lancuch polecenia
    //ustaw wartosc parametru
    procedure UP(nazwa_param :string; wartosc_param : Variant);
    procedure Wykonaj;

    procedure ZacznijTworzycBD;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Resetuj;
begin
   polecenie := '';
end;

procedure TForm1.Dp (pol : string);
begin
  polecenie := polecenie + pol;
end;

procedure TForm1.UP(nazwa_param: string; wartosc_param: Variant);
begin
   ADOCommand1.Parameters.ParamByName(nazwa_param).Value := wartosc_param;
end;

procedure TForm1.Wykonaj;
begin
  ADOCommand1.CommandText := polecenie;
  ADOCommand1.Execute;
end;

procedure TForm1.ZacznijTworzycBD;
begin
  try
   Resetuj;
   dp('USE SRP;');
   Wykonaj;

   Resetuj;
   dp('CREATE TABLE parametry (');
   dp('ID INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,');
   dp('NAZWA VARCHAR(40) NOT NULL,');
   dp('GESTOSC INTEGER,');
   dp('LEPKOSC INTEGER,');
   dp('MASA INTEGER,');
   dp('OBJETOSC INTEGER,');
   dp('WYGLAD VARCHAR(80)');
   dp(');');
   Wykonaj;

   Resetuj;
   dp('CREATE TABLE probka (');
   dp('ID INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,');
   dp('NAZWA VARCHAR(40) NOT NULL,');
   dp('DATA_UTWORZENIA DATE NOT NULL,');
   dp('DATA_UKONCZENIA_ANALIZY DATE NOT NULL,');
   dp('PARAMETRY_ID INTEGER FOREIGN KEY REFERENCES parametry(ID)');
   dp(');');
   Wykonaj;

  except
    ShowMessage('Blad wykonania SQL');
  end;
end;

procedure TForm1.ZapiszParametryClick(Sender: TObject);
begin
if
  MessageDlg('Czy jesteœ pewien ?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes
  then
   begin

   end;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
const
  komunikat : string = '<Brak danych>';
var
  parametry_id : Variant;
begin
  parametry_id := ADODataSet1.FieldByName('PARAMETRY_ID').AsVariant;
  if VarIsNull(parametry_id) then
     begin
        DBNazwa.Text := ADODataSet1.FieldByName('NAZWA').AsString;
        DBMasa.Text := komunikat;
        DBObjetosc.Text := komunikat;
        DBGestosc.Text := komunikat;
        DBLepkosc.Text := komunikat;
        DBOpis.Text := komunikat;
     end
  else begin
    with ADODataSet2 do
      begin
        Close;
        Parameters.ParamByName('PARAMETRY_ID').Value := parametry_id;
        Open;

        DBNazwa.Text := FieldByName('NAZWA').AsString;
        DBMasa.Text := FieldByName('MASA').AsString;
        DBObjetosc.Text := FieldByName('OBJETOSC').AsString;
        DBGestosc.Text := FieldByName('GESTOSC').AsString;
        DBLepkosc.Text := FieldByName('LEPKOSC').AsString;
        DBOpis.Text := FieldByName('WYGLAD').AsString;

      end;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  try
    ADOConnection1.Connected := True;
  except
    ShowMessage('B³¹d po³¹czenia z serwerem bazy danych');
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
