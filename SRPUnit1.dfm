object Form1: TForm1
  Left = 183
  Top = 103
  Caption = 'SRP - System Rejestracji Pr'#243'bek'
  ClientHeight = 541
  ClientWidth = 857
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
    Width = 825
    Height = 457
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
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
    Left = 696
    Top = 488
  end
  object ADOCommand1: TADOCommand
    Connection = ADOConnection1
    Parameters = <>
    Left = 784
    Top = 488
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 480
    Top = 488
  end
  object ADODataSet1: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from  probka;'
    Parameters = <>
    Left = 600
    Top = 488
  end
end
