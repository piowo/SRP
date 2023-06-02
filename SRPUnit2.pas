unit SRPUnit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB;

type
  TForm2 = class(TForm)
    Masa: TLabel;
    Objêtoœæ: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Opis: TLabel;
    EdMasa: TEdit;
    EdObjetosc: TEdit;
    EdGestosc: TEdit;
    EdLepkosc: TEdit;
    EdWyglad: TMemo;
    ZapiszParametry: TButton;
    Kg: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    EdNazwa: TLabel;
    ADODataSet3: TADODataSet;
    procedure ZapiszParametryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses SRPUnit1;

{$R *.dfm}

procedure TForm2.ZapiszParametryClick(Sender: TObject);
var
  parametry_id : Variant;
begin
if
  MessageDlg('Czy jesteœ pewien ?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes
  then
   begin
    try
     //sprawdz czy parametry do zmodyfikowania czy do nowego utworzenia jako rekord
     parametry_id := Form1.ADODataSet1.FieldByName('PARAMETRY_ID').AsVariant;
     if VarIsNull(parametry_id) then
     //wariant typu: do utworzenia jako nowy rekord
     with Form1 do
      begin
        //wprowadz nowe parametry do tabeli parametry
        Resetuj;
        dp('INSERT INTO parametry(NAZWA,MASA,OBJETOSC,GESTOSC,LEPKOSC,WYGLAD) ');
        dp('VALUES (:NAZWA,:MASA,:OBJETOSC,:GESTOSC,:LEPKOSC,:WYGLAD);');
        Wprowadz;
        up('NAZWA',EdNazwa.Caption);
        up('MASA',EdMasa.Text);
        up('OBJETOSC',EdObjetosc.Text);
        up('GESTOSC',EdGestosc.Text);
        up('LEPKOSC',EdLepkosc.Text);
        up('WYGLAD',EdWyglad.Text);
        Wykonaj;

        //pobierz nowo utworzony numer ID dla parametrow
        ADODataSet3.Close;
        ADODataSet3.Parameters.ParamByName('NAZWA').Value := EdNazwa.Caption;
        ADODataSet3.Open;
        parametry_id := ADODataSet3.Fields.FieldByName('ID').Value;

        //Wprowadz pobrany numer ID jako obcy klucz w tabeli probki
        Resetuj;
        dp('UPDATE probka SET ');
        dp('PARAMETRY_ID = :PARAMETRY_ID ');
        dp('WHERE ID = :ID;');
        Wprowadz;
        up('PARAMETRY_ID',parametry_id);
        up('ID',ADODataSet1.FieldByName('ID').AsVariant);
        Wykonaj;
      end
     //wariant typu: do zmodyfikowania
     else with Form1 do
      begin
        Resetuj;
        dp('UPDATE parametry SET ');
        dp('NAZWA = :NAZWA,');
        dp('MASA = :MASA,');
        dp('OBJETOSC = :OBJETOSC,');
        dp('GESTOSC = :GESTOSC,');
        dp('LEPKOSC = :LEPKOSC,');
        dp('WYGLAD = :WYGLAD ');
        dp('WHERE ID = :ID;');
        Wprowadz;
        up('NAZWA',EdNazwa.Caption);
        up('MASA',EdMasa.Text);
        up('OBJETOSC',EdObjetosc.Text);
        up('GESTOSC',EdGestosc.Text);
        up('LEPKOSC',EdLepkosc.Text);
        up('WYGLAD',EdWyglad.Text);
        up('ID',parametry_id);
        Wykonaj;
      end;
    except
     ShowMessage('B³¹d wykonania SQL!'+chr(13)+chr(10)+
                'Prawdopodobnie u¿y³eœ nieprawid³owy format danych!');
    end;
   end;

   Form2.Hide;
   with Form1 do
    begin
      ADODataSet1.Close;
      ADODataSet1.Open;
      ADODataSet2.Close;
      ADODataSet2.Open;
    end;
end;

procedure TForm2.FormActivate(Sender: TObject);
const
  komunikat : string = '<Brak danych>';
var
  parametry_id : Variant;

begin
  ADODataSet3.Active := True;
  EdNazwa.Caption := Form1.ADODataSet1.FieldByName('NAZWA').Value;
  parametry_id := Form1.ADODataSet1.FieldByName('PARAMETRY_ID').AsVariant;
  if VarIsNull(parametry_id) then
     begin
        EdMasa.Text := komunikat;
        EdObjetosc.Text := komunikat;
        EdGestosc.Text := komunikat;
        EdLepkosc.Text := komunikat;
        EdWyglad.Text := komunikat;
     end
  else begin
    with Form1.ADODataSet2 do
      begin
        Close;
        Parameters.ParamByName('PARAMETRY_ID').Value := parametry_id;
        Open;

        EdMasa.Text := FieldByName('MASA').AsString;
        EdObjetosc.Text := FieldByName('OBJETOSC').AsString;
        EdGestosc.Text := FieldByName('GESTOSC').AsString;
        EdLepkosc.Text := FieldByName('LEPKOSC').AsString;
        EdWyglad.Text := FieldByName('WYGLAD').AsString;
      end;
  end;
end;

end.
