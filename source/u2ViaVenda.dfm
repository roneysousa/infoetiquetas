object frm2ViaVendas: Tfrm2ViaVendas
  Left = 209
  Top = 127
  BorderStyle = bsSingle
  Caption = '2'#170' Via de Vendas'
  ClientHeight = 341
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 540
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    Color = clBlue
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 32
    Width = 540
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 52
      Height = 13
      Caption = '&N'#186'. Venda:'
      FocusControl = edtNRVEND
    end
    object edtNRVEND: TEdit
      Left = 81
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = edtNRVENDChange
      OnKeyPress = edtNRVENDKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 540
    Height = 227
    Align = alClient
    TabOrder = 2
    object GridDados: TRxDBGrid
      Left = 1
      Top = 1
      Width = 538
      Height = 225
      TabStop = False
      Align = alClient
      DataSource = dsVendas
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'MDV_NRVEND'
          Title.Caption = 'VENDA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'MDV_DTVEND'
          Title.Caption = 'DATA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MDV_NMLOJA'
          Title.Caption = 'LOJA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 195
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MDV_NMVEND'
          Title.Caption = 'VENDEDOR'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 175
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MDV_VLVEND'
          Title.Alignment = taRightJustify
          Title.Caption = 'VL. VENDA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 84
          Visible = True
        end>
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 300
    Width = 540
    Height = 41
    Align = alBottom
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 600
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FF485360FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FF4380B7
        1F6FC2656B86F3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FF32A3FF1672D76B6A80F2DABCF2D5B2EF
        D0A9EECB9EEDC796EBC28CE9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        A0675B34A1FF1572D45E6782F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFA7756BFFFBF033A6FF4078AD8E675EAC
        7F7597645EAC7D6FCAA083EDC695EBC28AEFC583A46769FF00FFFF00FFFF00FF
        A7756BFFFFFCFAF0E6AD8A88B78F84D8BAA5EED5B6D7B298B58877CBA083EBC7
        93F2C98CA46769FF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2AF847FDAC0B4F7
        E3CFF6E0C5FFFFF4D7B198AC7D6FEECC9EF3CE97A46769FF00FFFF00FFFF00FF
        BC8268FFFFFFFFFEFC976560F6E9E0F7EADAF6E3CFFFFFEBEFD4B797645EF0D0
        A6F6D3A0A46769FF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFB08884DECAC4FA
        EFE5F8EAD9FFFFD4D9B8A5AC7F74F4D8B1EBCFA4A46769FF00FFFF00FFFF00FF
        D1926DFFFFFFFFFFFFD5BFBCBA9793DECAC4F6E9DEDAC0B4B78F84B28C7BDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFD5BFBCB0
        8884976560AF867FCAA79DA56B5FA56B5FA56B5FA46769FF00FFFF00FFFF00FF
        DA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAA56B5FE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE7AB79FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDCC7C5A56B5FF8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E7AB79FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79D1926DD1926DD1926DD1926DD1
        926DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00FFFF00FF}
    end
    object BitBtn2: TBitBtn
      Left = 688
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4BA64B4BA9
        4D4D4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        824B4B824B4BB64F50C24F50C54D4EB24D4E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FF824B4BD45859CB5556C95455C95253B7
        4F524E1E1FFE8B8CFB9A9CF8AAABF7B5B6F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BD75C5DD05A5BCF595ACF5758BD53564E1E1F23B54A13C14816BD480CBC
        41F7B5B6824B4BFF00FFFF00FFFF00FF824B4BDD6364D75F60D55E5FD55C5DC2
        575A4E1E1F2AB44D1CBF4C1EBC4C13BC45F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BE36869DD6566DA6364DE6667C6595B4E1E1F26B14916BC481BBB4910BB
        43F7B5B6824B4BFF00FFFF00FFFF00FF824B4BEB6D6EE26768E67E7FFAD3D4CC
        6E704E1E1FA5D89750D16F42C9662DC758F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BF27374E96C6DEB8182FCD1D3CF6E704E1E1FFFF2CCFFFFD7FFFFD4E6FC
        C7F7B5B6824B4BFF00FFFF00FFFF00FF824B4BF87879F07576EE7273F07374D1
        65664E1E1FFCEFC7FFFFD5FFFFD3FFFFD7F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFE7F80F77A7BF6797AF77779D76B6B4E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4BFF8384FC7F80FB7E7FFE7F80DA
        6E6F4E1E1FFCEFC7FFFFD5FFFFD3FFFFD5F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFF8889FF8283FF8182FF8283E073744E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4B824B4BE27576FE8182FF8687E5
        76774E1E1FFAEBC5FCFBD1FCFBCFFCFBD1F7B5B6824B4BFF00FFFF00FFFF00FF
        FF00FFFF00FF824B4B9C5657CB6C6DCF6E6E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B82
        4B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object qryVendas: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from "SACMDV.DB" order by MDV_NRVEND')
    Left = 424
    Top = 40
    object qryVendasMDV_NRVEND: TStringField
      FieldName = 'MDV_NRVEND'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_NRVEND'
      Size = 7
    end
    object qryVendasMDV_CDLOJA: TStringField
      FieldName = 'MDV_CDLOJA'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_CDLOJA'
      Size = 3
    end
    object qryVendasMDV_CDVEND: TStringField
      FieldName = 'MDV_CDVEND'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_CDVEND'
      Size = 6
    end
    object qryVendasMDV_DTVEND: TDateField
      FieldName = 'MDV_DTVEND'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_DTVEND'
    end
    object qryVendasMDV_HOVEND: TStringField
      FieldName = 'MDV_HOVEND'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_HOVEND'
      Size = 5
    end
    object qryVendasMDV_VLVEND: TCurrencyField
      FieldName = 'MDV_VLVEND'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_VLVEND'
    end
    object qryVendasMDV_VLPAGO: TCurrencyField
      FieldName = 'MDV_VLPAGO'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_VLPAGO'
    end
    object qryVendasMDV_VLTROC: TCurrencyField
      FieldName = 'MDV_VLTROC'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_VLTROC'
    end
    object qryVendasMDV_FLSITU: TStringField
      FieldName = 'MDV_FLSITU'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_FLSITU'
      Size = 1
    end
    object qryVendasMDV_NMLOJA: TStringField
      FieldKind = fkLookup
      FieldName = 'MDV_NMLOJA'
      LookupDataSet = dmEtiquetas.qryLoja
      LookupKeyFields = 'LOJ_CDLOJA'
      LookupResultField = 'LOJ_NMLOJA'
      KeyFields = 'MDV_CDLOJA'
      Size = 40
      Lookup = True
    end
    object qryVendasMDV_NMVEND: TStringField
      FieldKind = fkLookup
      FieldName = 'MDV_NMVEND'
      LookupDataSet = dmEtiquetas.qryVendedor
      LookupKeyFields = 'VEN_CDVEND'
      LookupResultField = 'VEN_NMVEND'
      KeyFields = 'MDV_CDVEND'
      Size = 40
      Lookup = True
    end
    object qryVendasMDV_CDMODA: TStringField
      FieldName = 'MDV_CDMODA'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_CDMODA'
      Size = 2
    end
    object qryVendasMDV_NMMODA: TStringField
      FieldKind = fkLookup
      FieldName = 'MDV_NMMODA'
      LookupDataSet = dmEtiquetas.qryModalidade
      LookupKeyFields = 'MOD_CDMODA'
      LookupResultField = 'MOD_NMMODA'
      KeyFields = 'MDV_CDMODA'
      Size = 40
      Lookup = True
    end
  end
  object dsVendas: TDataSource
    DataSet = qryVendas
    Left = 376
    Top = 40
  end
end
