object frmConsTransfe: TfrmConsTransfe
  Left = 214
  Top = 54
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Transfer'#234'ncias'
  ClientHeight = 487
  ClientWidth = 741
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 741
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    Color = clBlue
    TabOrder = 0
  end
  object pnlEntrada: TPanel
    Left = 0
    Top = 32
    Width = 741
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 26
      Height = 13
      Caption = '&Data:'
    end
    object edtData: TDateEdit
      Left = 38
      Top = 10
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
      OnKeyPress = edtDataKeyPress
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 73
    Width = 741
    Height = 373
    Align = alClient
    TabOrder = 2
    object GridDados: TRxDBGrid
      Left = 1
      Top = 1
      Width = 739
      Height = 371
      TabStop = False
      Align = alClient
      DataSource = dsTransf
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = GridDadosKeyDown
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'TRA_NRSEQU'
          Title.Caption = 'NUMERO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 69
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TRA_DTTRAN'
          Title.Caption = 'DATA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 63
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TRA_HOTRAN'
          Title.Caption = 'HORA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TRA_NMLOJ1'
          Title.Caption = 'ORIGEM'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 256
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TRA_NMLOJ2'
          Title.Caption = 'DESTINO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 256
          Visible = True
        end>
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 446
    Width = 741
    Height = 41
    Align = alBottom
    TabOrder = 3
    object spFechar: TSpeedButton
      Left = 656
      Top = 7
      Width = 75
      Height = 28
      Cursor = crHandPoint
      Hint = 'Fechar janela'
      Caption = '&Fechar'
      Flat = True
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
      OnClick = spFecharClick
    end
    object spEtiquetas: TSpeedButton
      Left = 8
      Top = 8
      Width = 90
      Height = 28
      Cursor = crHandPoint
      Hint = 'Imprimir etiquetas'
      Caption = '&Etiquetas'
      Flat = True
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000230B0000230B00000001000000010000000000004000
        000080000000FF000000002000004020000080200000FF200000004000004040
        000080400000FF400000006000004060000080600000FF600000008000004080
        000080800000FF80000000A0000040A0000080A00000FFA0000000C0000040C0
        000080C00000FFC0000000FF000040FF000080FF0000FFFF0000000020004000
        200080002000FF002000002020004020200080202000FF202000004020004040
        200080402000FF402000006020004060200080602000FF602000008020004080
        200080802000FF80200000A0200040A0200080A02000FFA0200000C0200040C0
        200080C02000FFC0200000FF200040FF200080FF2000FFFF2000000040004000
        400080004000FF004000002040004020400080204000FF204000004040004040
        400080404000FF404000006040004060400080604000FF604000008040004080
        400080804000FF80400000A0400040A0400080A04000FFA0400000C0400040C0
        400080C04000FFC0400000FF400040FF400080FF4000FFFF4000000060004000
        600080006000FF006000002060004020600080206000FF206000004060004040
        600080406000FF406000006060004060600080606000FF606000008060004080
        600080806000FF80600000A0600040A0600080A06000FFA0600000C0600040C0
        600080C06000FFC0600000FF600040FF600080FF6000FFFF6000000080004000
        800080008000FF008000002080004020800080208000FF208000004080004040
        800080408000FF408000006080004060800080608000FF608000008080004080
        800080808000FF80800000A0800040A0800080A08000FFA0800000C0800040C0
        800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000A0004000
        A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040A0004040
        A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080A0004080
        A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0A00040C0
        A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000C0004000
        C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040C0004040
        C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080C0004080
        C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0C00040C0
        C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000FF004000
        FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040FF004040
        FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080FF004080
        FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0FF0040C0
        FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF00929292929292
        9292929292929292929292929292929292929292929292929292929292929292
        9292929292929292929292929292929292929292929292929292929292929292
        92929292FFFFFFFFFFFFFFDBDBDBDBDBDBDBDBDBDBDBDBDB929292FFFFFFFFFF
        FFFFFFFFFFDBDBDBDBDBDBDBDBDBDBDBDB9292FF00FF000000FF000000FF0000
        DBDBDBDB00DBDB00DB9292FF00FFFF00FFFF00FFFFFFFFFF00FF00000000DB00
        DB9292FF00FFFF00FFFFDB0000FF0000DBFF00DB00DBDB00DB9292FF00FF0000
        FFFFFFFF00FFFFFF00FF00FFFFDBDB00DB9292FF00FFFF00FFFF000000FF0000
        DBFF00FFFFFFDB00DB9292FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDB00
        DB9292FF00FF0000FF00FF00000000FF00FF00FF0000FF00DB9292FF00FF0000
        FF00FF00000000FF00FF00FF0000FF00DB9292FF00FF0000FF00FF00000000FF
        00FF00FF0000FF00FF9292FF00FF0000FF00FF00000000FF00FF00FF0000FF00
        FF9292FF00FF0000FF00FF00000000FF00FF00FF0000FF00FF9292FF00FF0000
        FF00FF00000000FF00FF00FF0000FF00FF9292FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF929292FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        9292929292929292929292929292929292929292929292929292929292929292
        9292929292929292929292929292929292929292929292929292929292929292
        9292929292929292929292929292929292929292929292929292929292929292
        9292929292929292929292929292929292929292929292929292}
      OnClick = spEtiquetasClick
    end
    object spGuia: TSpeedButton
      Left = 116
      Top = 8
      Width = 90
      Height = 28
      Cursor = crHandPoint
      Caption = '&Guia'
      Flat = True
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000C30E0000C30E00000001000000010000006300000084
        00001884000000940000009C0000109C0000298408004A94080031841000298C
        180031AD1800847B29006B942900213131003131310031393100423139003939
        3900424A42004AAD42004A424A00424A4A004A4A4A00524A4A00BD944A00C69C
        4A004AB54A00424A52004A4A520052525200B58C52005A5A5A00CEA55A006363
        6300637B6300D69C630073736B006B737300737373007B7B73007B7B7B008484
        84008C8C8C00948C8C00949494009C9C9C00A5A5A500FFC6A500FFCEA500ADAD
        AD00FFD6AD00B5B5B500EFCEB500BDBDBD00CECECE00D6D6D600E7E7E700EFEF
        F700EFF7F700F7F7F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003C3C3C3C3C3C
        3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C
        3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C
        3C3C3C3C0E0E1111110E0E0D0D0D0D0D0D0D0D0D100E123C3C3C3C1F1D1F1D1D
        1F1F1D1F1D1D1D1D1D1D1D1F1F1F1F1F3C3C3C21282A29282929292725282828
        2828282828222A213C3C3C242C35313131313131313931313131313131313924
        3C3C3C262E363131313131313139313131313131313139263C3C3C2833372929
        292929292939292929292929292939283C3C3C29363831313131313131393737
        37373737373739293C3C3C293639313131313131313937373737373737373929
        3C3C3C29363D29292929292929391A1313131313131339293C3C3C2C363D3131
        3131313131391A010303050A0909392C3C3C3C2C363D31313131313131390300
        0602080C0709392C3C3C3C2C363D29292929292929390B0B1E1819232020392C
        3C3C3C2C363D37373737373737392F2F2F302F2F3234392C3C3C3C2C363D3737
        3737373737393737373737373737392C3C3C3C2C363D21212121212121212121
        212121212121392C3C3C3C2D363D2111161616161B141716151C1C150F21392D
        3C3C3C2D363D21212121212121212121212121212121392D3C3C3C31363B3D3D
        3D3D3D3D3D3D3D3D3D3D3D3D3D3D39363C3C3C3C363636363636363636363636
        36363636363636363C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C
        3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C}
      OnClick = spGuiaClick
    end
  end
  object qryTransferencia: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from SACTRA Where (TRA_DTTRAN=:pDTTRAN)')
    Left = 304
    Top = 40
    ParamData = <
      item
        DataType = ftDate
        Name = 'pDTTRAN'
        ParamType = ptInput
        Value = 0d
      end>
    object qryTransferenciaTRA_NRSEQU: TStringField
      FieldName = 'TRA_NRSEQU'
      Origin = 'DBETIQUETA."SACTRA.DB".TRA_NRSEQU'
      Size = 10
    end
    object qryTransferenciaTRA_CDLOJ1: TStringField
      FieldName = 'TRA_CDLOJ1'
      Origin = 'DBETIQUETA."SACTRA.DB".TRA_CDLOJ1'
      Size = 3
    end
    object qryTransferenciaTRA_CDLOJ2: TStringField
      FieldName = 'TRA_CDLOJ2'
      Origin = 'DBETIQUETA."SACTRA.DB".TRA_CDLOJ2'
      Size = 3
    end
    object qryTransferenciaTRA_DTTRAN: TDateField
      FieldName = 'TRA_DTTRAN'
      Origin = 'DBETIQUETA."SACTRA.DB".TRA_DTTRAN'
    end
    object qryTransferenciaTRA_HOTRAN: TStringField
      FieldName = 'TRA_HOTRAN'
      Origin = 'DBETIQUETA."SACTRA.DB".TRA_HOTRAN'
      Size = 5
    end
    object qryTransferenciaTRA_NMLOJ1: TStringField
      FieldKind = fkLookup
      FieldName = 'TRA_NMLOJ1'
      LookupDataSet = qryLoja
      LookupKeyFields = 'LOJ_CDLOJA'
      LookupResultField = 'LOJ_NMLOJA'
      KeyFields = 'TRA_CDLOJ1'
      Size = 40
      Lookup = True
    end
    object qryTransferenciaTRA_NMLOJ2: TStringField
      FieldKind = fkLookup
      FieldName = 'TRA_NMLOJ2'
      LookupDataSet = qryLoja
      LookupKeyFields = 'LOJ_CDLOJA'
      LookupResultField = 'LOJ_NMLOJA'
      KeyFields = 'TRA_CDLOJ2'
      Size = 40
      Lookup = True
    end
  end
  object dsTransf: TDataSource
    DataSet = qryTransferencia
    Left = 344
    Top = 40
  end
  object qryLoja: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from SACLOJ')
    Left = 432
    Top = 40
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
end
