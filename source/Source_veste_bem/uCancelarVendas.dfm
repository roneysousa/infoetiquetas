object frmCancelamentoVendas: TfrmCancelamentoVendas
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cancelamento de Vendas'
  ClientHeight = 341
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    Color = clBlue
    TabOrder = 0
    object DBText2: TDBText
      Left = 3
      Top = 4
      Width = 91
      Height = 24
      AutoSize = True
      DataField = 'EST_NMPROD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
    end
  end
  object pnlLoja: TPanel
    Left = 0
    Top = 32
    Width = 536
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 52
      Height = 13
      Caption = 'N'#170'. &Venda:'
      FocusControl = edtLoja
    end
    object edtLoja: TEdit
      Left = 73
      Top = 11
      Width = 112
      Height = 21
      MaxLength = 7
      TabOrder = 0
      OnChange = edtLojaChange
      OnKeyPress = edtLojaKeyPress
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 73
    Width = 536
    Height = 227
    Align = alClient
    TabOrder = 2
    object GridGrupos: TRxDBGrid
      Left = 1
      Top = 1
      Width = 534
      Height = 225
      Align = alClient
      DataSource = dsVendas
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      MultiSelect = True
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'MDV_NRVEND'
          Title.Caption = 'N.'#186' VENDA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MDV_NMCLIE'
          Title.Caption = 'CLIENTE'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 375
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'MDV_DTVEND'
          Title.Alignment = taCenter
          Title.Caption = 'DATA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 79
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'MDV_HOVEND'
          Title.Alignment = taCenter
          Title.Caption = 'HORA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 46
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'MDV_VLVEND'
          Title.Alignment = taRightJustify
          Title.Caption = 'VALOR VENDA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 124
          Visible = True
        end>
    end
  end
  object pnlInferior: TPanel
    Left = 0
    Top = 300
    Width = 536
    Height = 41
    Align = alBottom
    TabOrder = 3
    object btSair: TBitBtn
      Left = 677
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 0
      OnClick = btSairClick
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
    object btConfirmar: TBitBtn
      Left = 582
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Confirma Cancelamento'
      Caption = '&Confirma'
      TabOrder = 1
      OnClick = btConfirmarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000E30E0000E30E00000001000000010000104A7B00184A
        840018528C0018529400185A9C00185AA5001863AD001863B500186BBD00186B
        C6001873CE001873D600187BDE00187BE7001884E7001884EF001884F700188C
        F700FF00FF00188CFF001894FF002194FF00299CFF00319CFF0039A5FF004AAD
        FF0052ADFF0063B5FF006BBDFF0084C6FF00ADDEFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00121F1F1F1F1F
        1F1F1F1F1F1F1F1F1F121F1A030404040505040403030201191F1F05080A0A0A
        0A0A0A0A0A090805001F1F060A0C0C0D0E111111110C0906021F1F090C0F0F0F
        1D111111110E0A08031F1F0A0E11131D1F1D1111110E0B09041F1F0C11131D1F
        1D1F1D11110E0B0A051F1F0E131D1F1D11111F1D0F0C0A0A061F1F0F13131D11
        1111111F1D0B0A0A061F1F131515131311100F0F1F1D0A0A061F1F1318181514
        13130F0E0C1F1D0A061F1F151A1916151514110F0E0C1F0A061F1F181C1A1817
        16161513100F0C0A061F1F191D1C1A191817161514110F0A041F1F1E19171513
        1311110F0E0C0A081B1F121F1F1F1F1F1F1F1F1F1F1F1F1F1F12}
    end
  end
  object dsVendas: TDataSource
    DataSet = qryVendas
    Left = 408
    Top = 40
  end
  object qryVendas: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from "SACMDV.DB" Where (MDV_FLSITU="A") '
      'order by MDV_NRVEND')
    Left = 440
    Top = 40
  end
  object qryGravaVenda: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      
        'INSERT INTO SACMDV (MDV_NRVEND, MDV_CDMODA, MDV_CDLOJA, MDV_CDVE' +
        'ND, MDV_DTVEND, MDV_HOVEND, MDV_VLVEND, MDV_VLPAGO, MDV_VLTROC, ' +
        'MDV_FLSITU, MDV_CDUSUA, MDV_NMCLIE, MDV_ENDCLI, MDV_NRFONE)'
      
        'VALUES (:pNRVEND, :pCDMODA,:pCDLOJA, :pCDVEND, :pDTVEND, :pHOVEN' +
        'D, :pVLVEND, :pVLPAGO, :pVLTROC, :pFLSITU, :pCDUSUA, :pNMCLIE, :' +
        'pENDCLI,:pNRFONE)')
    Left = 304
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'pNRVEND'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftUnknown
        Name = 'pCDMODA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCDLOJA'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pCDVEND'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftDate
        Name = 'pDTVEND'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftString
        Name = 'pHOVEND'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftCurrency
        Name = 'pVLVEND'
        ParamType = ptInput
        Value = 0c
      end
      item
        DataType = ftCurrency
        Name = 'pVLPAGO'
        ParamType = ptInput
        Value = 0c
      end
      item
        DataType = ftCurrency
        Name = 'pVLTROC'
        ParamType = ptInput
        Value = 0c
      end
      item
        DataType = ftString
        Name = 'pFLSITU'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pCDUSUA'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pNMCLIE'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pENDCLI'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pNRFONE'
        ParamType = ptInput
        Value = ''
      end>
  end
  object qryItens: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from SACITV Where (ITV_NRVEND = :pNRVEND)')
    Left = 336
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'pNRVEND'
        ParamType = ptInput
        Value = ''
      end>
    object qryItensITV_NRVEND: TStringField
      FieldName = 'ITV_NRVEND'
      Origin = 'DBETIQUETA."SACITV.DB".ITV_NRVEND'
      Size = 7
    end
    object qryItensITV_NRITEM: TStringField
      FieldName = 'ITV_NRITEM'
      Origin = 'DBETIQUETA."SACITV.DB".ITV_NRITEM'
      Size = 3
    end
    object qryItensITV_CDPROD: TStringField
      FieldName = 'ITV_CDPROD'
      Origin = 'DBETIQUETA."SACITV.DB".ITV_CDPROD'
      Size = 13
    end
    object qryItensITV_VLUNI2: TCurrencyField
      FieldName = 'ITV_VLUNI2'
      Origin = 'DBETIQUETA."SACITV.DB".ITV_VLUNI2'
    end
    object qryItensITV_VLDESC: TFloatField
      FieldName = 'ITV_VLDESC'
      Origin = 'DBETIQUETA."SACITV.DB".ITV_VLDESC'
    end
    object qryItensITV_QTPROD: TFloatField
      FieldName = 'ITV_QTPROD'
      Origin = 'DBETIQUETA."SACITV.DB".ITV_QTPROD'
    end
    object qryItensITV_FLSITU: TStringField
      FieldName = 'ITV_FLSITU'
      Origin = 'DBETIQUETA."SACITV.DB".ITV_FLSITU'
      Size = 1
    end
  end
  object qryHistorico: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from SACHIS')
    Left = 480
    Top = 40
  end
  object qryAtualizaEstoque: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from SACEST ')
    Left = 376
    Top = 64
  end
end
