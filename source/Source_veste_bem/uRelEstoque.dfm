object frmRelEstoque: TfrmRelEstoque
  Left = 192
  Top = 114
  Width = 544
  Height = 374
  HorzScrollBar.Position = 275
  Caption = 'frmRelEstoque'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object qrEstoque: TQuickRep
    Left = -275
    Top = 0
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = qryEstoque
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    ReportTitle = 'Visualizar Impress'#227'o'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 120
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        317.500000000000000000
        1899.708333333333000000)
      BandType = rbPageHeader
      object QRDBImage1: TQRDBImage
        Left = 6
        Top = 7
        Width = 144
        Height = 84
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          222.250000000000000000
          15.875000000000000000
          18.520833333333330000
          381.000000000000000000)
        DataField = 'PAR_IMLOGO'
        DataSet = dmEtiquetas.tbParametros
        Stretch = True
      end
      object QRLabel1: TQRLabel
        Left = 4
        Top = 103
        Width = 64
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          272.520833333333400000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PRODUTO'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 448
        Top = 102
        Width = 64
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1185.333333333333000000
          269.875000000000000000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ESTOQUE'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 557
        Top = 102
        Width = 47
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1473.729166666667000000
          269.875000000000000000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PRE'#199'O'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 623
        Top = 102
        Width = 91
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1648.354166666667000000
          269.875000000000000000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PRE'#199'O TOTAL'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 491
        Top = 25
        Width = 163
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1299.104166666667000000
          66.145833333333340000
          431.270833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RELAT'#211'RIO DE ESTOQUE'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = -2
        Top = 101
        Width = 720
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          7.937500000000000000
          -5.291666666666667000
          267.229166666666700000
          1905.000000000000000000)
        Pen.Style = psDot
        Shape = qrsHorLine
      end
      object txtLoja: TQRLabel
        Left = 491
        Top = 42
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1299.104166666667000000
          111.125000000000000000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'LOJA : '
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object txtEXERC: TQRLabel
        Left = 491
        Top = 59
        Width = 77
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1299.104166666667000000
          156.104166666666700000
          203.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'EXERCICIO: '
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 491
        Top = 7
        Width = 228
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1299.104166666667000000
          18.520833333333330000
          603.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmEtiquetas.tbParametros
        DataField = 'PAR_NMEMPR'
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
    object DetailBand1: TQRBand
      Left = 38
      Top = 158
      Width = 718
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.270833333333330000
        1899.708333333333000000)
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 3
        Top = 3
        Width = 90
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          7.937500000000000000
          7.937500000000000000
          238.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryEstoque
        DataField = 'EST_NMPROD'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 440
        Top = 0
        Width = 87
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1164.166666666667000000
          0.000000000000000000
          230.187500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryEstoque
        DataField = 'EST_QTPROD'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 524
        Top = 0
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1386.416666666667000000
          0.000000000000000000
          224.895833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryEstoque
        DataField = 'EST_VLVEND'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 632
        Top = 0
        Width = 84
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1672.166666666667000000
          0.000000000000000000
          222.250000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryEstoque
        DataField = 'EST_SUBTOT'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object PageFooterBand1: TQRBand
      Left = 38
      Top = 206
      Width = 718
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1899.708333333333000000)
      BandType = rbPageFooter
      object QRSysData1: TQRSysData
        Left = 529
        Top = 3
        Width = 138
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1399.645833333333000000
          7.937500000000000000
          365.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDateTime
        Text = 'Data/Hora : '
        Transparent = False
        FontSize = 10
      end
      object QRSysData2: TQRSysData
        Left = 629
        Top = 20
        Width = 98
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1664.229166666667000000
          52.916666666666670000
          259.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Text = 'P'#225'gina : '
        Transparent = False
        FontSize = 10
      end
    end
    object SummaryBand1: TQRBand
      Left = 38
      Top = 177
      Width = 718
      Height = 29
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.729166666666680000
        1899.708333333333000000)
      BandType = rbSummary
      object QRExpr1: TQRExpr
        Left = 603
        Top = 2
        Width = 112
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1595.437500000000000000
          5.291666666666667000
          296.333333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(qryEstoque.EST_SUBTOT)'
        Mask = '###,###,##0.#0'
        FontSize = 10
      end
    end
  end
  object qryEstoque: TQuery
    OnCalcFields = qryEstoqueCalcFields
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from "SACEST.DB" Where (EST_CDLOJA = :pCDLOJA) '
      'And (EST_DTENTR>=:pDTINIC) And (EST_DTENTR<=:pDTFINA)')
    Left = 8
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'pCDLOJA'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'pDTFINA'
        ParamType = ptInput
        Value = 0d
      end>
    object qryEstoqueEST_CDLOJA: TStringField
      FieldName = 'EST_CDLOJA'
      Origin = 'DBETIQUETA."SACEST.DB".EST_CDLOJA'
      Size = 3
    end
    object qryEstoqueEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      Origin = 'DBETIQUETA."SACEST.DB".EST_CDPROD'
      Size = 13
    end
    object qryEstoqueEST_DTENTR: TDateField
      FieldName = 'EST_DTENTR'
      Origin = 'DBETIQUETA."SACEST.DB".EST_DTENTR'
    end
    object qryEstoqueEST_QTENTR: TFloatField
      FieldName = 'EST_QTENTR'
      Origin = 'DBETIQUETA."SACEST.DB".EST_QTENTR'
    end
    object qryEstoqueEST_QTPROD: TFloatField
      FieldName = 'EST_QTPROD'
      Origin = 'DBETIQUETA."SACEST.DB".EST_QTPROD'
    end
    object qryEstoqueEST_NMPROD: TStringField
      FieldKind = fkLookup
      FieldName = 'EST_NMPROD'
      LookupDataSet = qryProduto
      LookupKeyFields = 'PRO_CDBARR'
      LookupResultField = 'PRO_NMPROD'
      KeyFields = 'EST_CDPROD'
      Size = 40
      Lookup = True
    end
    object qryEstoqueEST_VLVEND: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'EST_VLVEND'
      LookupDataSet = qryProduto
      LookupKeyFields = 'PRO_CDBARR'
      LookupResultField = 'PRO_VLVEND'
      KeyFields = 'EST_CDPROD'
      Lookup = True
    end
    object qryEstoqueEST_SUBTOT: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'EST_SUBTOT'
      Calculated = True
    end
    object qryEstoqueEST_NMLOJA: TStringField
      FieldKind = fkLookup
      FieldName = 'EST_NMLOJA'
      LookupDataSet = dmEtiquetas.qryLoja
      LookupKeyFields = 'LOJ_CDLOJA'
      LookupResultField = 'LOJ_NMLOJA'
      KeyFields = 'EST_CDLOJA'
      Size = 40
      Lookup = True
    end
  end
  object qryProduto: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select PRO_CDPROD, PRO_CDBARR, PRO_NMPROD, PRO_VLVEND from'
      '"SACPRO.DBF"')
    Left = 48
    Top = 8
    object qryProdutoPRO_CDPROD: TStringField
      FieldName = 'PRO_CDPROD'
      Origin = 'DBETIQUETA."SACPRO.DBF".PRO_CDPROD'
      Size = 13
    end
    object qryProdutoPRO_CDBARR: TStringField
      FieldName = 'PRO_CDBARR'
      Origin = 'DBETIQUETA."SACPRO.DBF".PRO_CDBARR'
      Size = 13
    end
    object qryProdutoPRO_NMPROD: TStringField
      FieldName = 'PRO_NMPROD'
      Origin = 'DBETIQUETA."SACPRO.DBF".PRO_NMPROD'
      Size = 40
    end
    object qryProdutoPRO_VLVEND: TFloatField
      FieldName = 'PRO_VLVEND'
      Origin = 'DBETIQUETA."SACPRO.DBF".PRO_VLVEND'
    end
  end
end
