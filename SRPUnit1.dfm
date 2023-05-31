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
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Integrated Security=SSPI;Persist Security ' +
      'Info=False;User ID="";Initial Catalog="";Data Source=(localdb)\M' +
      'SSQLLocalDB;Initial File Name="";Server SPN="";Authentication=""' +
      ';Access Token=""'
    DefaultDatabase = 'master'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 712
    Top = 488
  end
  object ADOCommand1: TADOCommand
    Connection = ADOConnection1
    Parameters = <>
    Left = 808
    Top = 488
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    TableName = 'probka'
    Left = 616
    Top = 480
  end
  object ADOTable2: TADOTable
    Connection = ADOConnection1
    TableName = 'parametry'
    Left = 536
    Top = 480
  end
end
