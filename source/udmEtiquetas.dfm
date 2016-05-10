object dmEtiquetas: TdmEtiquetas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 397
  Top = 227
  Height = 395
  Width = 542
  object qryEtiquetas: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from SACEQT')
    Left = 96
    Top = 72
  end
  object tbEtiquetas: TTable
    AfterPost = tbEtiquetasAfterPost
    DatabaseName = 'DBEtiqueta'
    TableName = 'SACEQT.db'
    Left = 24
    Top = 80
    object tbEtiquetasEQT_CDPROD: TStringField
      FieldName = 'EQT_CDPROD'
      Size = 13
    end
    object tbEtiquetasEQT_CDBARR: TStringField
      FieldName = 'EQT_CDBARR'
      Size = 13
    end
    object tbEtiquetasEQT_NMPROD: TStringField
      FieldName = 'EQT_NMPROD'
      Size = 50
    end
    object tbEtiquetasEQT_VLVEND: TFloatField
      FieldName = 'EQT_VLVEND'
    end
    object tbEtiquetasEQT_IMGBAR: TGraphicField
      FieldName = 'EQT_IMGBAR'
      BlobType = ftGraphic
    end
    object tbEtiquetasEQT_TAMANHO: TStringField
      FieldName = 'EQT_TAMANHO'
    end
  end
  object qryProduto: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from "SACPRO.DBF"')
    Left = 96
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
      DisplayFormat = '###,##0.#0'
    end
  end
  object tbParametros: TTable
    AfterPost = tbParametrosAfterPost
    DatabaseName = 'DBEtiqueta'
    TableName = 'SACPAR.DB'
    Left = 24
    Top = 8
    object tbParametrosPAR_NMEMPR: TStringField
      FieldName = 'PAR_NMEMPR'
      Size = 50
    end
    object tbParametrosPAR_ENEMPR: TStringField
      FieldName = 'PAR_ENEMPR'
      Size = 40
    end
    object tbParametrosPAR_BAEMPR: TStringField
      FieldName = 'PAR_BAEMPR'
    end
    object tbParametrosPAR_CIEMPR: TStringField
      FieldName = 'PAR_CIEMPR'
    end
    object tbParametrosPAR_CEPEMP: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_CEPEMP'
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object tbParametrosPAR_UFEMPR: TStringField
      FieldName = 'PAR_UFEMPR'
      Size = 2
    end
    object tbParametrosPAR_CGCEMP: TStringField
      FieldName = 'PAR_CGCEMP'
      Size = 14
    end
    object tbParametrosPAR_INSEST: TStringField
      FieldName = 'PAR_INSEST'
      Size = 14
    end
    object tbParametrosPAR_NRFONE: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_NRFONE'
      EditMask = '(99)9999-9999;0;_'
      Size = 12
    end
    object tbParametrosPAR_NUMFAX: TStringField
      FieldName = 'PAR_NUMFAX'
      Size = 12
    end
    object tbParametrosPAR_CDPROD: TFloatField
      FieldName = 'PAR_CDPROD'
    end
    object tbParametrosPAR_NRSEQU: TFloatField
      FieldName = 'PAR_NRSEQU'
    end
    object tbParametrosPAR_IMLOGO: TGraphicField
      FieldName = 'PAR_IMLOGO'
      BlobType = ftGraphic
    end
    object tbParametrosPAR_TOETIQ: TFloatField
      FieldName = 'PAR_TOETIQ'
    end
    object tbParametrosPAR_CDBARR: TStringField
      FieldName = 'PAR_CDBARR'
      Size = 7
    end
    object tbParametrosPAR_NRVEND: TFloatField
      FieldName = 'PAR_NRVEND'
    end
    object tbParametrosPAR_CDUSUA: TFloatField
      FieldName = 'PAR_CDUSUA'
    end
    object tbParametrosPAR_MDIMPR: TStringField
      FieldName = 'PAR_MDIMPR'
      Size = 1
    end
    object tbParametrosPAR_PADRAO_ETIQ: TIntegerField
      FieldName = 'PAR_PADRAO_ETIQ'
    end
    object tbParametrosPAR_LINHA_INICIAL: TFloatField
      FieldName = 'PAR_LINHA_INICIAL'
    end
    object tbParametrosPAR_COLUNA_INICIAL: TFloatField
      FieldName = 'PAR_COLUNA_INICIAL'
    end
    object tbParametrosPAR_TAMANHO_ETI: TFloatField
      FieldName = 'PAR_TAMANHO_ETI'
    end
    object tbParametrosPAR_LARGURA_ETI: TFloatField
      FieldName = 'PAR_LARGURA_ETI'
    end
    object tbParametrosPAR_IMPRESSORA: TStringField
      FieldName = 'PAR_IMPRESSORA'
      Size = 1
    end
    object tbParametrosPAR_FLPRECO: TStringField
      FieldName = 'PAR_FLPRECO'
      Size = 1
    end
    object tbParametrosPAR_CDSISTEMA: TSmallintField
      FieldName = 'PAR_CDSISTEMA'
    end
    object tbParametrosPAR_MOSTRAR_REGUA: TStringField
      FieldName = 'PAR_MOSTRAR_REGUA'
      Size = 1
    end
    object tbParametrosPAR_CDALFANUMERICO: TStringField
      FieldName = 'PAR_CDALFANUMERICO'
      Size = 1
    end
    object tbParametrosPAR_TAM_FONTE: TFloatField
      FieldName = 'PAR_TAM_FONTE'
    end
    object tbParametrosPAR_MOSTRA_REF: TStringField
      FieldName = 'PAR_MOSTRA_REF'
      Size = 1
    end
  end
  object tbProdutos: TTable
    AfterPost = tbProdutosAfterPost
    DatabaseName = 'DBEtiqueta'
    TableName = 'SACPRO.DBF'
    Left = 176
    Top = 16
    object tbProdutosPRO_CDPROD: TStringField
      FieldName = 'PRO_CDPROD'
      Size = 13
    end
    object tbProdutosPRO_CDBARR: TStringField
      FieldName = 'PRO_CDBARR'
      Size = 13
    end
    object tbProdutosPRO_NMPROD: TStringField
      FieldName = 'PRO_NMPROD'
      Size = 40
    end
    object tbProdutosPRO_CDUNID: TStringField
      FieldName = 'PRO_CDUNID'
      Size = 2
    end
    object tbProdutosPRO_VLVEND: TFloatField
      FieldName = 'PRO_VLVEND'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object tbProdutosPRO_VLAPRA: TFloatField
      FieldName = 'PRO_VLAPRA'
    end
  end
  object qrySecao: TQuery
    Active = True
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from SACSEC order by SEC_CDSECA')
    Left = 176
    Top = 72
  end
  object qryGrupo: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from SACGRU Where (GRU_CDSECA = :pCDSECA) '
      'order by GRU_CDGRUP')
    Left = 176
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'pCDSECA'
        ParamType = ptInput
        Value = ''
      end>
  end
  object tbMovimento: TTable
    AfterPost = tbMovimentoAfterPost
    DatabaseName = 'DBEtiqueta'
    TableName = 'SACMDV.DB'
    Left = 240
    Top = 16
    object tbMovimentoMDV_NRVEND: TStringField
      FieldName = 'MDV_NRVEND'
      Size = 7
    end
    object tbMovimentoMDV_CDLOJA: TStringField
      FieldName = 'MDV_CDLOJA'
      Size = 3
    end
    object tbMovimentoMDV_NMVEND: TStringField
      FieldName = 'MDV_NMVEND'
      Size = 40
    end
    object tbMovimentoMDV_DTVEND: TDateField
      Alignment = taRightJustify
      FieldName = 'MDV_DTVEND'
      EditMask = '99/99/9999;1;_'
    end
    object tbMovimentoMDV_HOVEND: TStringField
      Alignment = taRightJustify
      FieldName = 'MDV_HOVEND'
      EditMask = '99:99;1;_'
      Size = 5
    end
    object tbMovimentoMDV_VLVEND: TCurrencyField
      FieldName = 'MDV_VLVEND'
    end
    object tbMovimentoMDV_VLPAGO: TCurrencyField
      FieldName = 'MDV_VLPAGO'
    end
    object tbMovimentoMDV_VLTROC: TCurrencyField
      FieldName = 'MDV_VLTROC'
    end
    object tbMovimentoMDV_FLSITU: TStringField
      FieldName = 'MDV_FLSITU'
      Size = 1
    end
    object tbMovimentoMDV_CDUSUA: TStringField
      FieldName = 'MDV_CDUSUA'
      Size = 3
    end
  end
  object tbItensVenda: TTable
    DatabaseName = 'DBEtiqueta'
    TableName = 'SACITV.db'
    Left = 240
    Top = 72
    object tbItensVendaITV_NRVEND: TStringField
      FieldName = 'ITV_NRVEND'
      Size = 1
    end
    object tbItensVendaITV_NRITEM: TStringField
      FieldName = 'ITV_NRITEM'
      Size = 3
    end
    object tbItensVendaITV_CDPROD: TStringField
      FieldName = 'ITV_CDPROD'
      Size = 13
    end
    object tbItensVendaITV_QTPROD: TFloatField
      FieldName = 'ITV_QTPROD'
    end
    object tbItensVendaITV_IMGBAR: TGraphicField
      FieldName = 'ITV_IMGBAR'
      BlobType = ftGraphic
    end
    object tbItensVendaITV_VLUNI2: TCurrencyField
      FieldName = 'ITV_VLUNI2'
    end
    object tbItensVendaITV_VLDESC: TFloatField
      FieldName = 'ITV_VLDESC'
    end
  end
  object qryVendedor: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from "SACVEN.DBF" order by VEN_NMVEND')
    Left = 328
    Top = 24
    object qryVendedorVEN_CDVEND: TStringField
      FieldName = 'VEN_CDVEND'
      Origin = 'DBETIQUETA."SACVEN.DBF".VEN_CDVEND'
      Size = 6
    end
    object qryVendedorVEN_NMVEND: TStringField
      FieldName = 'VEN_NMVEND'
      Origin = 'DBETIQUETA."SACVEN.DBF".VEN_NMVEND'
      Size = 40
    end
  end
  object qryLoja: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from "SACLOJ.DBF" order by LOJ_NMLOJA')
    Left = 328
    Top = 80
    object qryLojaLOJ_CDLOJA: TStringField
      FieldName = 'LOJ_CDLOJA'
      Origin = 'DBETIQUETA."SACLOJ.DBF".LOJ_CDLOJA'
      Size = 3
    end
    object qryLojaLOJ_NMLOJA: TStringField
      FieldName = 'LOJ_NMLOJA'
      Origin = 'DBETIQUETA."SACLOJ.DBF".LOJ_NMLOJA'
      Size = 40
    end
  end
  object qryModalidade: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select MOD_CDMODA, MOD_NMMODA from SACMOD ')
    Left = 264
    Top = 128
    object qryModalidadeMOD_CDMODA: TStringField
      FieldName = 'MOD_CDMODA'
      Origin = 'DBETIQUETA."SACMOD.DBF".MOD_CDMODA'
      Size = 2
    end
    object qryModalidadeMOD_NMMODA: TStringField
      FieldName = 'MOD_NMMODA'
      Origin = 'DBETIQUETA."SACMOD.DBF".MOD_NMMODA'
      Size = 30
    end
  end
  object tbEstoque: TTable
    AfterPost = tbEstoqueAfterPost
    DatabaseName = 'DBEtiqueta'
    TableName = 'SACEST.db'
    Left = 32
    Top = 152
    object tbEstoqueEST_CDLOJA: TStringField
      FieldName = 'EST_CDLOJA'
      Size = 3
    end
    object tbEstoqueEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      Size = 13
    end
    object tbEstoqueEST_DTENTR: TDateField
      FieldName = 'EST_DTENTR'
    end
    object tbEstoqueEST_QTENTR: TFloatField
      FieldName = 'EST_QTENTR'
    end
    object tbEstoqueEST_DTSAID: TDateField
      FieldName = 'EST_DTSAID'
    end
    object tbEstoqueEST_QTSAID: TFloatField
      FieldName = 'EST_QTSAID'
    end
    object tbEstoqueEST_QTPROD: TFloatField
      FieldName = 'EST_QTPROD'
    end
  end
  object tbHistorico: TTable
    AfterPost = tbHistoricoAfterPost
    DatabaseName = 'DBEtiqueta'
    TableName = 'SACHIS.db'
    Left = 32
    Top = 208
    object tbHistoricoHIS_NRSEQU: TStringField
      FieldName = 'HIS_NRSEQU'
      Size = 10
    end
    object tbHistoricoHIS_CDLOJA: TStringField
      FieldName = 'HIS_CDLOJA'
      Size = 3
    end
    object tbHistoricoHIS_CDPROD: TStringField
      FieldName = 'HIS_CDPROD'
      Size = 13
    end
    object tbHistoricoHIS_DTHIST: TDateField
      FieldName = 'HIS_DTHIST'
    end
    object tbHistoricoHIS_HOHIST: TStringField
      FieldName = 'HIS_HOHIST'
      Size = 5
    end
    object tbHistoricoHIS_TPHIST: TStringField
      FieldName = 'HIS_TPHIST'
      Size = 1
    end
    object tbHistoricoHIS_QTANTE: TFloatField
      FieldName = 'HIS_QTANTE'
    end
    object tbHistoricoHIS_QTPROD: TFloatField
      FieldName = 'HIS_QTPROD'
    end
    object tbHistoricoHIS_QTATUA: TFloatField
      FieldName = 'HIS_QTATUA'
    end
    object tbHistoricoHIS_CDUSUA: TStringField
      FieldName = 'HIS_CDUSUA'
      Size = 3
    end
  end
  object tbUsuarios: TTable
    AfterPost = tbUsuariosAfterPost
    DatabaseName = 'DBEtiqueta'
    TableName = 'SACSEN.db'
    Left = 96
    Top = 144
    object tbUsuariosSEN_CDUSUA: TStringField
      FieldName = 'SEN_CDUSUA'
      Size = 3
    end
    object tbUsuariosSEN_NMUSUA: TStringField
      FieldName = 'SEN_NMUSUA'
      Size = 40
    end
    object tbUsuariosSEN_SNATUA: TStringField
      FieldName = 'SEN_SNATUA'
      Size = 6
    end
    object tbUsuariosSEN_NMCARG: TStringField
      FieldName = 'SEN_NMCARG'
      Size = 30
    end
  end
  object qryConsultaEstoque: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from SACEST Where (EST_CDLOJA = :pCDLOJA)')
    Left = 176
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'pCDLOJA'
        ParamType = ptInput
        Value = ''
      end>
    object qryConsultaEstoqueEST_CDLOJA: TStringField
      FieldName = 'EST_CDLOJA'
      Origin = 'DBETIQUETA."SACEST.DB".EST_CDLOJA'
      Size = 3
    end
    object qryConsultaEstoqueEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      Origin = 'DBETIQUETA."SACEST.DB".EST_CDPROD'
      Size = 13
    end
    object qryConsultaEstoqueEST_NMPROD: TStringField
      FieldKind = fkLookup
      FieldName = 'EST_NMPROD'
      LookupDataSet = qryProEstoque
      LookupKeyFields = 'PRO_CDBARR'
      LookupResultField = 'PRO_NMPROD'
      KeyFields = 'EST_CDPROD'
      Size = 40
      Lookup = True
    end
    object qryConsultaEstoqueEST_QTPROD: TFloatField
      FieldName = 'EST_QTPROD'
      Origin = 'DBETIQUETA."SACEST.DB".EST_QTPROD'
    end
  end
  object qryProEstoque: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select PRO_CDPROD, PRO_CDBARR, PRO_NMPROD from "SACPRO.DBF"')
    Left = 264
    Top = 184
  end
  object qryConsulta: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from SACMDV')
    Left = 384
    Top = 120
    object qryConsultaMDV_NRVEND: TStringField
      FieldName = 'MDV_NRVEND'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_NRVEND'
      Size = 7
    end
    object qryConsultaMDV_CDLOJA: TStringField
      FieldName = 'MDV_CDLOJA'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_CDLOJA'
      Size = 3
    end
    object qryConsultaMDV_DTVEND: TDateField
      FieldName = 'MDV_DTVEND'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_DTVEND'
    end
    object qryConsultaMDV_HOVEND: TStringField
      FieldName = 'MDV_HOVEND'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_HOVEND'
      Size = 5
    end
    object qryConsultaMDV_VLVEND: TCurrencyField
      FieldName = 'MDV_VLVEND'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_VLVEND'
    end
    object qryConsultaMDV_FLSITU: TStringField
      FieldName = 'MDV_FLSITU'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_FLSITU'
      Size = 1
    end
    object qryConsultaMDV_NMCLIE: TStringField
      FieldName = 'MDV_NMCLIE'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_NMCLIE'
      Size = 40
    end
    object qryConsultaMDV_ENDCLI: TStringField
      FieldName = 'MDV_ENDCLI'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_ENDCLI'
      Size = 50
    end
    object qryConsultaMDV_NRFONE: TStringField
      FieldName = 'MDV_NRFONE'
      Origin = 'DBETIQUETA."SACMDV.DB".MDV_NRFONE'
      Size = 10
    end
    object qryConsultaMDV_NMLOJA: TStringField
      FieldKind = fkLookup
      FieldName = 'MDV_NMLOJA'
      LookupDataSet = qryLoja
      LookupKeyFields = 'LOJ_CDLOJA'
      LookupResultField = 'LOJ_NMLOJA'
      KeyFields = 'MDV_CDLOJA'
      Size = 40
      Lookup = True
    end
  end
  object tbEtiquetas2: TTable
    AfterPost = tbEtiquetas2AfterPost
    DatabaseName = 'DBEtiqueta'
    TableName = 'SACETT.DB'
    Left = 336
    Top = 176
    object tbEtiquetas2ETT_NRITEM: TStringField
      FieldName = 'ETT_NRITEM'
      Size = 3
    end
    object tbEtiquetas2ETT_CDPROD: TStringField
      FieldName = 'ETT_CDPROD'
      Size = 14
    end
    object tbEtiquetas2ETT_NMPROD: TStringField
      FieldName = 'ETT_NMPROD'
      Size = 40
    end
    object tbEtiquetas2ETT_QTPROD: TFloatField
      FieldName = 'ETT_QTPROD'
    end
    object tbEtiquetas2ETT_IMDBAR: TGraphicField
      FieldName = 'ETT_IMDBAR'
      BlobType = ftGraphic
    end
  end
  object qryMovCaixa: TQuery
    OnCalcFields = qryMovCaixaCalcFields
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select MCA_CDNATU, Sum(MCA_VLMODA) AS MCA_TOTAL from'
      'SACMCA Where (MCA_DTMOVI >= :pDTINIC)'
      'AND (MCA_DTMOVI <= :pDTFINA)  '
      'Group By MCA_TPMOVI, MCA_CDNATU')
    Left = 96
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'pDTINIC'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pDTFINA'
        ParamType = ptInput
        Value = ''
      end>
    object qryMovCaixaMCA_TOTAL: TFloatField
      FieldName = 'MCA_TOTAL'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
    end
    object qryMovCaixaMCA_CDNATU: TStringField
      FieldName = 'MCA_CDNATU'
      Origin = 'DBETIQUETA."SACMCA.DBF".MCA_CDNATU'
      Size = 3
    end
    object qryMovCaixaMCA_NMNATU: TStringField
      FieldKind = fkLookup
      FieldName = 'MCA_NMNATU'
      LookupDataSet = qryNatureza
      LookupKeyFields = 'NAT_CDNATU'
      LookupResultField = 'NAT_NMNATU'
      KeyFields = 'MCA_CDNATU'
      Size = 30
      Lookup = True
    end
    object qryMovCaixaMCA_NMDESC: TStringField
      FieldKind = fkCalculated
      FieldName = 'MCA_NMDESC'
      Size = 30
      Calculated = True
    end
  end
  object qryNatureza: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select NAT_CDNATU, NAT_NMNATU from "SACNAT.DBF"')
    Left = 160
    Top = 224
    object qryNaturezaNAT_CDNATU: TStringField
      FieldName = 'NAT_CDNATU'
      Origin = 'DBETIQUETA."SACNAT.DBF".NAT_CDNATU'
      Size = 3
    end
    object qryNaturezaNAT_NMNATU: TStringField
      FieldName = 'NAT_NMNATU'
      Origin = 'DBETIQUETA."SACNAT.DBF".NAT_NMNATU'
      Size = 30
    end
  end
  object qryDadosRel: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from SACRMCA')
    Left = 256
    Top = 232
  end
  object qryExcluir: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Delete from SACETT Where (ETT_CDPROD = :pCODIGO)')
    Left = 392
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TQuery
    DatabaseName = 'DBEtiqueta'
    Left = 432
    Top = 192
  end
  object cdsDados: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 232
    Data = {
      F20000009619E0BD010000001800000009000000000003000000F20004495445
      4D010049000000010005574944544802000200030006434F4449474F01004900
      00000100055749445448020002000D000A5245464552454E4349410100490000
      000100055749445448020002000D00094E4F4D455F50524F4401004900000001
      000557494454480200020028000556414C4F520800040000000000055155414E
      54040001000000000005534543414F0100490000000100055749445448020002
      0003000754414D414E484F01004900000001000557494454480200020002000C
      56414C4F525F415052415A4F08000400000000000000}
    object cdsDadosITEM: TStringField
      FieldName = 'ITEM'
      Size = 3
    end
    object cdsDadosCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 13
    end
    object cdsDadosREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 13
    end
    object cdsDadosNOME_PROD: TStringField
      FieldName = 'NOME_PROD'
      Size = 40
    end
    object cdsDadosVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsDadosQUANT: TIntegerField
      FieldName = 'QUANT'
    end
    object cdsDadosSECAO: TStringField
      FieldName = 'SECAO'
      Size = 3
    end
    object cdsDadosTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 2
    end
    object cdsDadosVALOR_APRAZO: TFloatField
      FieldName = 'VALOR_APRAZO'
    end
  end
  object QryAux2: TQuery
    DatabaseName = 'DBEtiqueta'
    Left = 432
    Top = 240
  end
  object qryValVenda: TQuery
    DatabaseName = 'DBEtiqueta'
    Left = 296
    Top = 288
  end
  object qryModEtiqueta: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'select * from "SACMDE" Where (MDE_CODIGO = :pCODIGO)')
    Left = 32
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    object qryModEtiquetaMDE_CODIGO: TIntegerField
      FieldName = 'MDE_CODIGO'
      Origin = 'DBETIQUETA."SACMDE.DB".MDE_CODIGO'
    end
    object qryModEtiquetaMDE_DESCRICAO: TStringField
      FieldName = 'MDE_DESCRICAO'
      Origin = 'DBETIQUETA."SACMDE.DB".MDE_DESCRICAO'
      Size = 30
    end
    object qryModEtiquetaMDE_COLUNA_INICIAL: TFloatField
      FieldName = 'MDE_COLUNA_INICIAL'
      Origin = 'DBETIQUETA."SACMDE.DB".MDE_COLUNA_INICIAL'
    end
    object qryModEtiquetaMDE_LINHA_INICIAL: TFloatField
      FieldName = 'MDE_LINHA_INICIAL'
      Origin = 'DBETIQUETA."SACMDE.DB".MDE_LINHA_INICIAL'
    end
    object qryModEtiquetaMDE_TAMANHO_ETI: TFloatField
      FieldName = 'MDE_TAMANHO_ETI'
      Origin = 'DBETIQUETA."SACMDE.DB".MDE_TAMANHO_ETI'
    end
    object qryModEtiquetaMDE_LARGURA_ETI: TFloatField
      FieldName = 'MDE_LARGURA_ETI'
      Origin = 'DBETIQUETA."SACMDE.DB".MDE_LARGURA_ETI'
    end
    object qryModEtiquetaMDE_TAMANHO_FONTE: TIntegerField
      FieldName = 'MDE_TAMANHO_FONTE'
      Origin = 'DBETIQUETA."SACMDE.DB".MDE_TAMANHO_FONTE'
    end
    object qryModEtiquetaMDE_TOTAL_LINHAS: TIntegerField
      FieldName = 'MDE_TOTAL_LINHAS'
      Origin = 'DBETIQUETA."SACMDE.DB".MDE_TOTAL_LINHAS'
    end
    object qryModEtiquetaMDE_TOTAL_COLUNAS: TIntegerField
      FieldName = 'MDE_TOTAL_COLUNAS'
      Origin = 'DBETIQUETA."SACMDE.DB".MDE_TOTAL_COLUNAS'
    end
    object qryModEtiquetaMDE_MARGEM_INFERIOR: TFloatField
      FieldName = 'MDE_MARGEM_INFERIOR'
      Origin = 'DBETIQUETA."SACMDE.DB".MDE_MARGEM_INFERIOR'
    end
    object qryModEtiquetaMDE_MARGEM_DIREITA: TFloatField
      FieldName = 'MDE_MARGEM_DIREITA'
      Origin = 'DBETIQUETA."SACMDE.DB".MDE_MARGEM_DIREITA'
    end
  end
  object cdsEtiquetas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 280
    Data = {
      C10000009619E0BD010000001800000007000000000003000000C10004495445
      4D010049000000010005574944544802000200030006434F4449474F01004900
      00000100055749445448020002000D00044E4F4D450100490000000100055749
      4454480200020028000556414C4F520800040000000000064241525241530100
      490000000100055749445448020002000D000C56414C4F525F415052415A4F08
      000400000000000754414D414E484F0100490000000100055749445448020002
      000A000000}
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
      DisplayFormat = '#,##0.#0'
      EditFormat = '#,##0.#0'
    end
    object cdsEtiquetasBARRAS: TStringField
      FieldName = 'BARRAS'
      Size = 13
    end
    object cdsEtiquetasVALOR_APRAZO: TFloatField
      FieldName = 'VALOR_APRAZO'
      DisplayFormat = '#,##0.#0'
      EditFormat = '#,##0.#0'
    end
    object cdsEtiquetasTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
  end
  object rdsEtiquetas10x3: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cdsEtiquetas
    Left = 192
    Top = 288
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 456
    Top = 72
  end
end
