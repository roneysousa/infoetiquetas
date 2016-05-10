object frmNewEtiquetaA5: TfrmNewEtiquetaA5
  Left = 219
  Top = 136
  Width = 544
  Height = 375
  Caption = 'frmNewEtiquetaA5'
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
  object qrEtiquetas: TQuickRep
    Left = 0
    Top = 0
    Width = 1111
    Height = 783
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = qryEtiquetas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
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
    Page.Orientation = poLandscape
    Page.PaperSize = A5
    Page.Values = (
      80.000000000000000000
      1480.000000000000000000
      170.000000000000000000
      2100.000000000000000000
      80.000000000000000000
      80.000000000000000000
      40.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = First
    PrintIfEmpty = True
    ReportTitle = 'Visualiza'#231#227'o de Etiquetas'
    SnapToGrid = True
    Units = MM
    Zoom = 140
    object DetailBand1: TQRBand
      Left = 42
      Top = 90
      Width = 188
      Height = 123
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
        232.455357142857100000
        355.297619047619000000)
      BandType = rbDetail
      object QRDBText3: TQRDBText
        Left = 13
        Top = 16
        Width = 176
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.348214285714290000
          24.568452380952380000
          30.238095238095240000
          332.619047619047600000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryEtiquetas
        DataField = 'EQT_NMPROD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBImage1: TQRDBImage
        Left = 13
        Top = 49
        Width = 218
        Height = 59
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          111.502976190476200000
          24.568452380952380000
          92.604166666666670000
          411.994047619047600000)
        DataField = 'EQT_IMGBAR'
        DataSet = qryEtiquetas
        Stretch = True
      end
      object QRDBText1: TQRDBText
        Left = 108
        Top = 31
        Width = 73
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.348214285714290000
          204.107142857142900000
          58.586309523809520000
          137.961309523809500000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryEtiquetas
        DataField = 'EQT_VLVEND'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
    end
  end
  object qryEtiquetas: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from "SACEQT.DB"')
    Left = 16
    Top = 24
    object qryEtiquetasEQT_CDPROD: TStringField
      FieldName = 'EQT_CDPROD'
      Origin = 'DBETIQUETA."SACEQT.DBF".EQT_CDPROD'
      Size = 13
    end
    object qryEtiquetasEQT_NMPROD: TStringField
      FieldName = 'EQT_NMPROD'
      Origin = 'DBETIQUETA."SACEQT.DBF".EQT_NMPROD'
      Size = 50
    end
    object qryEtiquetasEQT_VLVEND: TFloatField
      FieldName = 'EQT_VLVEND'
      Origin = 'DBETIQUETA."SACEQT.DBF".EQT_VLVEND'
      DisplayFormat = '#.#0'
    end
    object qryEtiquetasEQT_IMGBAR: TGraphicField
      FieldName = 'EQT_IMGBAR'
      Origin = 'DBETIQUETA."SACEQT.DB".EQT_IMGBAR'
      BlobType = ftGraphic
    end
  end
end
