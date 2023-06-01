object Form1: TForm1
  Left = 183
  Top = 103
  Caption = 'SRP - System Rejestracji Pr'#243'bek'
  ClientHeight = 490
  ClientWidth = 969
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 331
    Height = 13
    Caption = 
      'Kliknij na dan'#261' pr'#243'bk'#281' aby wy'#347'wietli'#263' po prawej stronie jej para' +
      'metry'
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 35
    Width = 545
    Height = 390
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NAZWA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_UTWORZENIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_UKONCZENIA_ANALIZY'
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 583
    Top = 40
    Width = 362
    Height = 385
    Caption = 'Parametry'
    TabOrder = 1
    object Nazwa: TLabel
      Left = 40
      Top = 56
      Width = 32
      Height = 13
      Caption = 'Nazwa'
    end
    object Label2: TLabel
      Left = 40
      Top = 179
      Width = 38
      Height = 13
      Caption = 'G'#281'sto'#347#263
    end
    object Label3: TLabel
      Left = 40
      Top = 206
      Width = 38
      Height = 13
      Caption = 'Lepko'#347#263
    end
    object Masa: TLabel
      Left = 40
      Top = 125
      Width = 25
      Height = 13
      Caption = 'Masa'
    end
    object Objętość: TLabel
      Left = 40
      Top = 152
      Width = 43
      Height = 13
      Caption = 'Obj'#281'to'#347#263
    end
    object Kg: TLabel
      Left = 311
      Top = 125
      Width = 11
      Height = 13
      Caption = 'kg'
    end
    object Label4: TLabel
      Left = 311
      Top = 152
      Width = 14
      Height = 13
      Caption = 'm3'
    end
    object Label5: TLabel
      Left = 311
      Top = 179
      Width = 29
      Height = 13
      Caption = 'kg/m3'
    end
    object Label6: TLabel
      Left = 312
      Top = 208
      Width = 42
      Height = 13
      Caption = 'kg/(m*s)'
    end
    object Opis: TLabel
      Left = 40
      Top = 264
      Width = 36
      Height = 13
      Caption = 'Wygl'#261'd'
    end
    object DBNazwa: TDBEdit
      Left = 96
      Top = 53
      Width = 249
      Height = 21
      DataField = 'NAZWA'
      DataSource = DataSource2
      ReadOnly = True
      TabOrder = 0
    end
    object DBGestosc: TDBEdit
      Left = 95
      Top = 176
      Width = 210
      Height = 21
      DataField = 'GESTOSC'
      DataSource = DataSource2
      ReadOnly = True
      TabOrder = 1
    end
    object DBLepkosc: TDBEdit
      Left = 96
      Top = 203
      Width = 209
      Height = 21
      DataField = 'LEPKOSC'
      DataSource = DataSource2
      ReadOnly = True
      TabOrder = 2
    end
    object DBObjetosc: TDBEdit
      Left = 96
      Top = 149
      Width = 209
      Height = 21
      DataField = 'OBJETOSC'
      DataSource = DataSource2
      ReadOnly = True
      TabOrder = 3
    end
    object DBMasa: TDBEdit
      Left = 96
      Top = 122
      Width = 209
      Height = 21
      DataField = 'MASA'
      DataSource = DataSource2
      ReadOnly = True
      TabOrder = 4
    end
    object DBOpis: TDBMemo
      Left = 96
      Top = 230
      Width = 249
      Height = 89
      DataField = 'WYGLAD'
      DataSource = DataSource2
      ReadOnly = True
      TabOrder = 5
    end
  end
  object WprowadzParametry: TButton
    Left = 24
    Top = 440
    Width = 545
    Height = 25
    Caption = 'Wprowad'#378' parametry dla wybranej pr'#243'bki'
    TabOrder = 2
    OnClick = WprowadzParametryClick
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Integrated Security=SSPI;Persist Security ' +
      'Info=False;User ID="";Initial Catalog="";Data Source=(localdb)\M' +
      'SSQLLocalDB;Initial File Name="";Server SPN="";Authentication=""' +
      ';Access Token=""'
    DefaultDatabase = 'SRP'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 824
  end
  object ADOCommand1: TADOCommand
    Connection = ADOConnection1
    Parameters = <>
    Left = 912
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 472
  end
  object ADODataSet1: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select ID, NAZWA, DATA_UTWORZENIA, DATA_UKONCZENIA_ANALIZY,PARAM' +
      'ETRY_ID'#13#10'from probka;'
    Parameters = <>
    Left = 648
  end
  object DataSource2: TDataSource
    DataSet = ADODataSet2
    Left = 544
  end
  object ADODataSet2: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select id,NAZWA, GESTOSC, LEPKOSC, MASA, OBJETOSC, WYGLAD '#13#10'from' +
      ' parametry where id = :PARAMETRY_ID;'
    Parameters = <
      item
        Name = 'PARAMETRY_ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 728
  end
end
