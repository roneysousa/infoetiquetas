object frmEtiqPedidos: TfrmEtiqPedidos
  Left = 191
  Top = 127
  Width = 544
  Height = 375
  Caption = 'frmEtiqPedidos'
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
  object QuickRep1: TQuickRep
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = cdsEtiquetas
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
    Page.Columns = 5
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      10.000000000000000000
      2970.000000000000000000
      10.000000000000000000
      2100.000000000000000000
      10.000000000000000000
      10.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object DetailBand1: TQRBand
      Left = 4
      Top = 4
      Width = 157
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Style = psDot
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.200000000000000000
        415.395833333333300000)
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 3
        Top = 2
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          7.937500000000000000
          5.291666666666667000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = cdsEtiquetas
        DataField = 'CODIGO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 109
        Top = 2
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          288.395833333333300000
          5.291666666666667000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = cdsEtiquetas
        DataField = 'VALOR'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object cdsEtiquetas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 56
    Data = {
      750000009619E0BD010000001800000004000000000003000000750004495445
      4D010049000000010005574944544802000200030006434F4449474F01004900
      00000100055749445448020002000D00044E4F4D450100490000000100055749
      4454480200020028000556414C4F5208000400000000000000}
    object cdsEtiquetasITEM: TStringField
      FieldName = 'ITEM'
      Size = 3
    end
    object cdsEtiquetasCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 13
    end
    object cdsEtiquetasNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsEtiquetasVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '###,##0.#0'
    end
  end
end
