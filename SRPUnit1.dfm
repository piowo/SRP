object Form1: TForm1
  Left = 183
  Top = 103
  Caption = 'SRP - System Rejestracji Pr'#243'bek'
  ClientHeight = 302
  ClientWidth = 959
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
  object DBGrid1: TDBGrid
    Left = 16
    Top = 16
    Width = 545
    Height = 265
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object GroupBox1: TGroupBox
    Left = 583
    Top = 16
    Width = 362
    Height = 265
    Caption = 'Parametry'
    TabOrder = 1
    object Label1: TLabel
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
    object DBNazwa: TDBEdit
      Left = 96
      Top = 53
      Width = 249
      Height = 21
      DataField = 'NAZWA'
      DataSource = DataSource2
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 95
      Top = 176
      Width = 210
      Height = 21
      DataField = 'GESTOSC'
      DataSource = DataSource2
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 96
      Top = 203
      Width = 209
      Height = 21
      DataField = 'LEPKOSC'
      DataSource = DataSource2
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 96
      Top = 149
      Width = 209
      Height = 21
      DataField = 'OBJETOSC'
      DataSource = DataSource2
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 96
      Top = 122
      Width = 209
      Height = 21
      DataField = 'MASA'
      DataSource = DataSource2
      TabOrder = 4
    end
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
      'select NAZWA, DATA_UTWORZENIA, DATA_UKONCZENIA_ANALIZY'#13#10' from pr' +
      'obka;'
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
      'select NAZWA, GESTOSC, LEPKOSC, MASA, OBJETOSC, WYGLAD from para' +
      'metry'
    Parameters = <>
    Left = 728
  end
end
