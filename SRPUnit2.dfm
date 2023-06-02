object Form2: TForm2
  Left = 366
  Top = 206
  Caption = 'Parametry'
  ClientHeight = 372
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Masa: TLabel
    Left = 32
    Top = 69
    Width = 25
    Height = 13
    Caption = 'Masa'
  end
  object Objętość: TLabel
    Left = 32
    Top = 104
    Width = 43
    Height = 13
    Caption = 'Obj'#281'to'#347#263
  end
  object Label2: TLabel
    Left = 32
    Top = 139
    Width = 38
    Height = 13
    Caption = 'G'#281'sto'#347#263
  end
  object Label3: TLabel
    Left = 32
    Top = 174
    Width = 38
    Height = 13
    Caption = 'Lepko'#347#263
  end
  object Opis: TLabel
    Left = 32
    Top = 208
    Width = 36
    Height = 13
    Caption = 'Wygl'#261'd'
  end
  object Kg: TLabel
    Left = 287
    Top = 69
    Width = 11
    Height = 13
    Caption = 'kg'
  end
  object Label4: TLabel
    Left = 287
    Top = 104
    Width = 14
    Height = 13
    Caption = 'm3'
  end
  object Label5: TLabel
    Left = 287
    Top = 139
    Width = 29
    Height = 13
    Caption = 'kg/m3'
  end
  object Label6: TLabel
    Left = 287
    Top = 174
    Width = 42
    Height = 13
    Caption = 'kg/(m*s)'
  end
  object Label1: TLabel
    Left = 32
    Top = 32
    Width = 82
    Height = 13
    Caption = 'Pr'#243'bka o nazwie:'
  end
  object EdNazwa: TLabel
    Left = 136
    Top = 32
    Width = 44
    Height = 13
    Caption = 'EdNazwa'
  end
  object EdMasa: TEdit
    Left = 96
    Top = 66
    Width = 185
    Height = 21
    TabOrder = 0
    Text = 'EdMasa'
  end
  object EdObjetosc: TEdit
    Left = 96
    Top = 101
    Width = 185
    Height = 21
    TabOrder = 1
    Text = 'EdObjetosc'
  end
  object EdGestosc: TEdit
    Left = 96
    Top = 136
    Width = 185
    Height = 21
    TabOrder = 2
    Text = 'EdGestosc'
  end
  object EdLepkosc: TEdit
    Left = 96
    Top = 171
    Width = 185
    Height = 21
    TabOrder = 3
    Text = 'EdLepkosc'
  end
  object EdWyglad: TMemo
    Left = 96
    Top = 211
    Width = 185
    Height = 89
    Lines.Strings = (
      'EdWyglad')
    TabOrder = 4
  end
  object ZapiszParametry: TButton
    Left = 32
    Top = 320
    Width = 297
    Height = 25
    Caption = 'Zapisz Parametry'
    TabOrder = 5
    OnClick = ZapiszParametryClick
  end
  object ADODataSet3: TADODataSet
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    CommandText = 'select ID from parametry where NAZWA = :NAZWA;'
    Parameters = <
      item
        Name = 'NAZWA'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 40
        Value = Null
      end>
    Left = 304
    Top = 240
  end
end
