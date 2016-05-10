object frmAddProduto: TfrmAddProduto
  Left = 192
  Top = 122
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Adicionar Produto'
  ClientHeight = 147
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 461
    Height = 106
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      Transparent = True
    end
    object Label2: TLabel
      Left = 189
      Top = 8
      Width = 55
      Height = 13
      Caption = 'Quantidade'
      Transparent = True
    end
    object spLocalizar: TSpeedButton
      Left = 145
      Top = 22
      Width = 23
      Height = 23
      Hint = 'Localizar produto'
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00840000008400
        0000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008400000084000000840000008400000084000000FF00FF008400000000FF
        FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008400000000FFFF00840000008400000084000000FF00FF008400000000FF
        FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008400000000FFFF00840000008400000084000000FF00FF00840000008400
        00008400000084000000840000008400000084000000FF00FF00840000008400
        00008400000084000000840000008400000084000000FF00FF00840000008400
        000000FFFF0084000000840000008400000084000000840000008400000000FF
        FF008400000084000000840000008400000084000000FF00FF00840000008400
        000000FFFF00840000008400000084000000FF00FF00840000008400000000FF
        FF008400000084000000840000008400000084000000FF00FF00840000008400
        000000FFFF00840000008400000084000000FF00FF00840000008400000000FF
        FF008400000084000000840000008400000084000000FF00FF00FF00FF008400
        0000840000008400000084000000840000008400000084000000840000008400
        000084000000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00
        FF008400000000FFFF00840000008400000084000000FF00FF008400000000FF
        FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008400000084000000840000008400000084000000FF00FF00840000008400
        0000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00840000008400000084000000FF00FF00FF00FF00FF00FF008400
        00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008400000000FFFF0084000000FF00FF00FF00FF00FF00FF008400
        000000FFFF0084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00840000008400000084000000FF00FF00FF00FF00FF00FF008400
        00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      OnClick = spLocalizarClick
    end
    object edtCDPROD: TEdit
      Left = 16
      Top = 24
      Width = 129
      Height = 21
      Hint = 'Digite o c'#243'digo do produto.'
      MaxLength = 13
      TabOrder = 0
      OnChange = edtCDPRODChange
      OnExit = edtCDPRODExit
      OnKeyPress = edtCDPRODKeyPress
    end
    object edtQUANT: TCurrencyEdit
      Left = 189
      Top = 24
      Width = 81
      Height = 21
      Hint = 'Digite a quantidade de etiquetas.'
      AutoSize = False
      DisplayFormat = ',0;-,0'
      MinValue = 1.000000000000000000
      TabOrder = 1
      Value = 1.000000000000000000
      OnKeyPress = edtQUANTKeyPress
    end
    object edtNMPROD: TEdit
      Left = 16
      Top = 48
      Width = 377
      Height = 21
      Hint = 'Descri'#231#227'o do produto.'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtValor: TCurrencyEdit
      Left = 16
      Top = 72
      Width = 121
      Height = 21
      Hint = 'Valor do produto.'
      AutoSize = False
      Color = clSilver
      DisplayFormat = ',0.00;-,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 106
    Width = 461
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnConfirma: TBitBtn
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Confirma dados.'
      Caption = '&OK'
      TabOrder = 0
      OnClick = btnConfirmaClick
    end
    object btnCancelar: TBitBtn
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Cancelar opera'#231#227'o.'
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
end
