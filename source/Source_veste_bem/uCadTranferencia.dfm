object frmTransferencia: TfrmTransferencia
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Transfer'#234'ncia'
  ClientHeight = 397
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    Color = clBlue
    TabOrder = 0
  end
  object pnlSuperior: TPanel
    Left = 0
    Top = 32
    Width = 536
    Height = 110
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 89
      Height = 13
      Caption = 'N'#186'. Transfer'#234'ncia :'
      Transparent = True
    end
    object Label2: TLabel
      Left = 10
      Top = 35
      Width = 26
      Height = 13
      Caption = '&Data:'
      FocusControl = edtDAta
      Transparent = True
    end
    object Label3: TLabel
      Left = 11
      Top = 63
      Width = 74
      Height = 13
      Caption = '&Loja de Origem:'
      FocusControl = edtLoja
      Transparent = True
    end
    object btGravar: TSpeedButton
      Left = 518
      Top = 18
      Width = 82
      Height = 55
      Cursor = crHandPoint
      Hint = 'Gravar Venda'
      Caption = '&Gravar'
      Flat = True
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000330B0000330B00000001000000010000005AAD000063
        B5000063BD00006BC600006BCE000073D600007BDE00007BE700007BEF000084
        EF000084F700FF00FF000084FF00008CFF00088CFF001094FF001894FF00219C
        FF00299CFF0031A5FF0039A5FF0042ADFF004AADFF0052ADFF0052B5FF005AB5
        FF0063B5FF006BBDFF0073C6FF007BC6FF0084C6FF008CCEFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000B0B0B0B0B0B
        0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
        0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
        0B0B0B0B1704000202020202020101020102010001170B0B0B0B0B0B0707090A
        0A0A0A0A0A090A090907060503020B0B0B0B0B0B060D0F10101010100E0F0F0E
        0D0D0A0706000B0B0B0B0B0B090E0F1212131212110F0F0E0E0D090A06000B0B
        0B0B0B0B090F11131313121E11100F0E0E0E0D0A07000B0B0B0B0B0B09111313
        13131E201E100F0F0E0D0A0D07020B0B0B0B0B0B10121414141E201E201E100F
        0E0D0D0D09020B0B0B0B0B0B101414141E201E1311201E0F0E0D0A0E0A030B0B
        0B0B0B0B1015141E201E13131110201E0E0D0E0F0A020B0B0B0B0B0B13141515
        1E131313111010201E0F0E0E0D030B0B0B0B0B0B121615151413131312100F0F
        201E0A0E0D030B0B0B0B0B0B131716161514131312100F0E0E201E0F0E020B0B
        0B0B0B0B13191A17161413141211100F0E0F200F0D030B0B0B0B0B0B141B1A19
        1615141312111110100E0E0F0E040B0B0B0B0B0B151D1C1A1917161514131312
        131111100D030B0B0B0B0B0B161F1F1C1A1A191716161615141313110E020B0B
        0B0B0B0B191E1F1C1A17171616161615141312100A050B0B0B0B0B0B19191614
        131312121213110F1010090909170B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
        0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
        0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      OnClick = btGravarClick
    end
    object btCancelar: TSpeedButton
      Left = 607
      Top = 18
      Width = 82
      Height = 55
      Cursor = crHandPoint
      Hint = 'Cancelar'
      Caption = '&Cancelar'
      Flat = True
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000330B0000330B00000001000000010000005AAD000063
        B5000063BD00006BC600006BCE000073D600007BDE00007BE700007BEF000084
        EF000084F700FF00FF000084FF00008CFF00088CFF001094FF001894FF00219C
        FF00299CFF0031A5FF0039A5FF0042ADFF004AADFF0052ADFF0052B5FF005AB5
        FF0063B5FF006BBDFF0073C6FF007BC6FF0084C6FF008CCEFF00ADDEFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000B0B0B0B0B0B
        0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
        0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
        0B0B0B0B1704000202020202020101020102010001170B0B0B0B0B0B0707090A
        0A0A0A0A0A090A090907060503020B0B0B0B0B0B060D0F10101010100E0F0F0E
        0D0D0A0706000B0B0B0B0B0B090E0F1212131212110F0F0E0E0D090A06000B0B
        0B0B0B0B090F1113211E121111100F0E1E210D0A07000B0B0B0B0B0B09111313
        13211E1211100F1E210D0A0D07020B0B0B0B0B0B101214141413211E11101E21
        0E0D0D0D09020B0B0B0B0B0B10141414141413211E1E210F0E0D0A0E0A030B0B
        0B0B0B0B101514151414131321210F0F0E0D0E0F0A020B0B0B0B0B0B13141515
        1513131E21211E100F0F0E0E0D030B0B0B0B0B0B1216151514131E211210211E
        0E0E0A0E0D030B0B0B0B0B0B13171616151E211312100F211E0E0E0F0E020B0B
        0B0B0B0B13191A171E2113141211100F211E100F0D030B0B0B0B0B0B141B1A19
        211514131211111010210E0F0E040B0B0B0B0B0B151D1C1A1917161514131312
        131111100D030B0B0B0B0B0B161F1F1C1A1A191716161615141313110E020B0B
        0B0B0B0B191E1F1C1A17171616161615141312100A050B0B0B0B0B0B20191614
        131312121213110F1010090909170B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
        0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
        0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      OnClick = btCancelarClick
    end
    object spFechar: TSpeedButton
      Left = 703
      Top = 18
      Width = 82
      Height = 55
      Cursor = crHandPoint
      Hint = 'Fechar'
      Caption = '&Fechar'
      Flat = True
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E
        1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B
        8C4B4B914B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B89
        4B4B9C4B4CB64B4CBD4B4C9F4B4C4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B
        4B9A4D4EAF4E4FC14E4FC04D4EBF4C4DBF4C4D9F4B4C4E1E1F994B4B824B4B82
        4B4B824B4B824B4B824B4B824B4B824B4B824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BC55455C95455C75354C65253C55152C45051C24F50A04C4D4E1E
        1FFE8B8CFC9293FB9A9CFAA3A4F8AAABF7B1B1F7B5B6F7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BCE5859CC5758CB5657CA5556C95455C75354
        C65253A34E4F4E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BD15B5CD05A5BCF595ACE
        5859CC5758CB5657CA5556A550504E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C
        1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BD55E
        5FD55E5FD45D5ED35C5DD15B5CD05A5BCF595AA651524E1E1F3F9E4C1EBC4C1E
        BC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BDA6364D96263D86062D75F60D55E5FD45D5ED35C5DA953544E1E
        1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BDE6667DD6566DC6465DA6364D96263D86062
        D75F60AB55554E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BE2696AE16869E06768DE
        6667E06D6EE69091DC6465AC56574E1E1F58A55B1EBC4C1EBC4C1EBC4C1EBC4C
        1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BE76D
        6EE66C6DE56B6CE36A6BEEA6A7FFFFFFEB9C9CAF58594E1E1FEECEAFB7EBAA5E
        D3775ED37745CA6745CA6745CA67F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BEB7072EA6F70E96E6FE76D6EF2A9AAFFFFFFEB9596B15A5A4E1E
        1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3D9F6BDD9F6BDF7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BEF7475EE7374ED7273EB7072EA6F70EF9091
        E76D6EB25B5C4E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF37778F37778F27677F0
        7576EF7475EE7374ED7273B55D5D4E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3
        FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF87B
        7DF77A7BF6797AF47879F37778F27677F07576B75F5F4E1E1FEECEAFFFFFD3FF
        FFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BFC7F80FB7E7FFA7D7EF87B7DF77A7BF6797AF47879B860624E1E
        1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BFF8182FF8182FE8081FC7F80FC7F80FB7E7F
        FA7D7EBB63634E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BFF8182FF8182FF8182FF
        8182FF8182FE8081FE8081BD65654E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3
        FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF77E
        7FFF8182FF8182FF8182FF8182FF8182FF8182BF66664E1E1FEECEAFFFFFD3FF
        FFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4B824B4BAF5E5FD56F70FF8182FF8182FF8182FF8182BF66664E1E
        1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B915152B66263EE7A7B
        FF8182BF66664E1E1F914B4B824B4B824B4B824B4B824B4B824B4B824B4B824B
        4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF824B4B824B4B9855559F58584E1E1FFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      OnClick = spFecharClick
    end
    object Label4: TLabel
      Left = 11
      Top = 87
      Width = 77
      Height = 13
      Caption = '&Loja de Destino:'
      FocusControl = cmbDestino
      Transparent = True
    end
    object edtNRVEND: TEdit
      Left = 102
      Top = 9
      Width = 121
      Height = 21
      TabStop = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtDAta: TDateEdit
      Left = 102
      Top = 31
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnKeyPress = edtDAtaKeyPress
    end
    object edtLoja: TComboBox
      Left = 101
      Top = 55
      Width = 247
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 2
      OnKeyPress = edtLojaKeyPress
    end
    object cmbDestino: TComboBox
      Left = 101
      Top = 79
      Width = 247
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 3
      OnExit = cmbDestinoExit
      OnKeyPress = cmbDestinoKeyPress
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 142
    Width = 536
    Height = 98
    Align = alClient
    TabOrder = 2
    object GridDados: TRxDBGrid
      Left = 1
      Top = 1
      Width = 534
      Height = 96
      TabStop = False
      Align = alClient
      DataSource = dsItens
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'TRP_CDPROD'
          Title.Caption = 'CD. BARRAS'
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
          FieldName = 'TRP_NMPROD'
          Title.Caption = 'DESCRI'#199#195'O'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 313
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TRP_QTPROD'
          Title.Alignment = taCenter
          Title.Caption = 'QUANT'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 65
          Visible = True
        end>
    end
  end
  object pnlEntrada: TPanel
    Left = 0
    Top = 240
    Width = 536
    Height = 75
    Align = alBottom
    TabOrder = 3
    object Label5: TLabel
      Left = 158
      Top = 5
      Width = 55
      Height = 13
      Caption = 'C'#243'd.&Barras:'
      FocusControl = edtCDBARR
      Transparent = True
    end
    object spLocalizar: TSpeedButton
      Left = 283
      Top = 23
      Width = 23
      Height = 22
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
    object Label6: TLabel
      Left = 313
      Top = 7
      Width = 58
      Height = 13
      Caption = '&Quantidade:'
      FocusControl = edtQTPROD
      Transparent = True
    end
    object lbl_vlunit: TLabel
      Left = 423
      Top = 20
      Width = 40
      Height = 24
      Hint = 'Valor unitario'
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object Image1: TImage
      Left = 628
      Top = 0
      Width = 163
      Height = 75
      Stretch = True
      Visible = False
    end
    object edtCDBARR: TEdit
      Left = 159
      Top = 23
      Width = 121
      Height = 21
      MaxLength = 14
      TabOrder = 0
      OnChange = edtCDBARRChange
      OnExit = edtCDBARRExit
      OnKeyPress = edtCDBARRKeyPress
    end
    object edtQTPROD: TEdit
      Left = 311
      Top = 23
      Width = 85
      Height = 21
      TabOrder = 1
      OnKeyPress = edtQTPRODKeyPress
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 315
    Width = 536
    Height = 41
    Align = alBottom
    TabOrder = 4
    object lbl_NMPROD: TLabel
      Left = 4
      Top = 4
      Width = 31
      Height = 37
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -32
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object pnlTOTAL: TPanel
    Left = 0
    Top = 356
    Width = 536
    Height = 41
    Align = alBottom
    TabOrder = 5
    object pnlVLTOTAL: TPanel
      Left = 304
      Top = 1
      Width = 231
      Height = 39
      Align = alRight
      Alignment = taRightJustify
      Caption = '0,00'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -32
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Visible = False
    end
    object btExcluir: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 1
      OnClick = btExcluirClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000E30E0000E30E0000000100000001000031319C003131
        A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
        E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
        FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
        FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
        0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
        0E0E0E0E0E0E0B08031B1B0A0E0E0E0E0E0E0E0E0E0E0E09041B1B0E0E0E0E0E
        0E0E0E0E0E0E0E0A051B1B0E0E1818181818181818180B0A061B1B0E0E1B1B1B
        1B1B1B1B1B1B0A0A061B1B0E10100E0E0E0E0E0E0E0B0A0A061B1B0E1313100E
        0E0E0E0E0E0B0A0A061B1B1015141110100E0E0E0E0E0B0B061B1B1318151312
        11110E0E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
        0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
    end
    object btAdicionar: TBitBtn
      Left = 120
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Adicionar'
      TabOrder = 2
      Visible = False
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000E30E0000E30E0000000100000001000031319C003131
        A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
        E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
        FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
        FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
        0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
        0E1B180E0E0E0B08031B1B0A0E0E0E0E0E1B180E0E0E0E09041B1B0E0E0E0E0E
        0E1B180E0E0E0E0A051B1B0E0E181818181B181818180B0A061B1B0E0E1B1B1B
        1B1B1B1B1B1B0A0A061B1B0E10100E0E0E1B180E0E0B0A0A061B1B0E1313100E
        0E1B180E0E0B0A0A061B1B1015141110101B180E0E0E0B0B061B1B1318151312
        111B180E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
        0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
    end
  end
  object qryItens: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from SACTRP Where (TRP_NRSEQU = :pNRSEQU)')
    Left = 40
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'pNRSEQU'
        ParamType = ptInput
        Value = ''
      end>
    object qryItensTRP_NRSEQU: TStringField
      FieldName = 'TRP_NRSEQU'
      Origin = 'DBETIQUETA."SACTRP.DB".TRP_NRSEQU'
      Size = 10
    end
    object qryItensTRP_CDPROD: TStringField
      FieldName = 'TRP_CDPROD'
      Origin = 'DBETIQUETA."SACTRP.DB".TRP_CDPROD'
      Size = 13
    end
    object qryItensTRP_NMPROD: TStringField
      FieldKind = fkLookup
      FieldName = 'TRP_NMPROD'
      LookupDataSet = qryProdutos
      LookupKeyFields = 'PRO_CDBARR'
      LookupResultField = 'PRO_NMPROD'
      KeyFields = 'TRP_CDPROD'
      Size = 40
      Lookup = True
    end
    object qryItensTRP_QTPROD: TFloatField
      FieldName = 'TRP_QTPROD'
      Origin = 'DBETIQUETA."SACTRP.DB".TRP_QTPROD'
    end
  end
  object dsItens: TDataSource
    DataSet = qryItens
    Left = 88
    Top = 136
  end
  object qryProdutos: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select PRO_CDPROD, PRO_CDBARR, PRO_NMPROD, PRO_VLVEND from'
      '"SACPRO.DBF" ')
    Left = 304
    Top = 40
  end
  object qryInclusao: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      
        'INSERT INTO SACTRP (TRP_NRSEQU, TRP_CDPROD, TRP_QTPROD, TRP_IMAB' +
        'AR)'
      'VALUES (:pNRSEQU, :pCDPROD, :pQTPROD, :pIMGBAR) ')
    Left = 384
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'pNRSEQU'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pCDPROD'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftFloat
        Name = 'pQTPROD'
        ParamType = ptInput
        Value = 0.000000000000000000
      end
      item
        DataType = ftGraphic
        Name = 'pIMGBAR'
        ParamType = ptInput
        Value = ''
      end>
  end
  object qryExcluirItem: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from SACTRP')
    Left = 352
    Top = 40
  end
  object qryGravaTrans: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      'Select * from SACTRA')
    Left = 240
    Top = 136
  end
  object qryEstoque: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      
        'Select * from SACEST Where (EST_CDPROD=:pCDPROD) And (EST_CDLOJA' +
        ' = :pCDLOJA)')
    Left = 424
    Top = 96
    ParamData = <
      item
        DataType = ftString
        Name = 'pCDPROD'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pCDLOJA'
        ParamType = ptInput
        Value = ''
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
    object qryEstoqueEST_DTSAID: TDateField
      FieldName = 'EST_DTSAID'
      Origin = 'DBETIQUETA."SACEST.DB".EST_DTSAID'
    end
    object qryEstoqueEST_QTSAID: TFloatField
      FieldName = 'EST_QTSAID'
      Origin = 'DBETIQUETA."SACEST.DB".EST_QTSAID'
    end
    object qryEstoqueEST_QTPROD: TFloatField
      FieldName = 'EST_QTPROD'
      Origin = 'DBETIQUETA."SACEST.DB".EST_QTPROD'
    end
  end
  object qryAtualizaEstoque: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      
        'Update SACEST SET EST_DTSAID = :pDTSAID, EST_QTSAID = :pQTSAID, ' +
        'EST_QTPROD = :pQTPROD'
      'Where (EST_CDLOJA = :pCDLOJA) and (EST_CDPROD = :pCDPROD)')
    Left = 392
    Top = 96
    ParamData = <
      item
        DataType = ftDate
        Name = 'pDTSAID'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftFloat
        Name = 'pQTSAID'
        ParamType = ptInput
        Value = 0.000000000000000000
      end
      item
        DataType = ftFloat
        Name = 'pQTPROD'
        ParamType = ptInput
        Value = 0.000000000000000000
      end
      item
        DataType = ftString
        Name = 'pCDLOJA'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pCDPROD'
        ParamType = ptInput
        Value = ''
      end>
  end
  object qryHistorico: TQuery
    DatabaseName = 'DBEtiqueta'
    SQL.Strings = (
      
        'INSERT INTO SACHIS (HIS_NRSEQU, HIS_CDLOJA, HIS_CDPROD, HIS_DTHI' +
        'ST, HIS_HOHIST, HIS_TPHIST, HIS_QTANTE, HIS_QTPROD, HIS_QTATUA, ' +
        'HIS_CDUSUA)'
      
        'VALUES (:pNRSEQU, :pCDLOJA, :pCDPROD, :pDTHIST, :pHOHIST, :pTPHI' +
        'ST, :pQTANTE, :pQTPROD, :pQTATUA, :pCDUSUA)')
    Left = 360
    Top = 96
    ParamData = <
      item
        DataType = ftString
        Name = 'pNRSEQU'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pCDLOJA'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pCDPROD'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftDate
        Name = 'pDTHIST'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftString
        Name = 'pHOHIST'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pTPHIST'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftFloat
        Name = 'pQTANTE'
        ParamType = ptInput
        Value = 0.000000000000000000
      end
      item
        DataType = ftFloat
        Name = 'pQTPROD'
        ParamType = ptInput
        Value = 0.000000000000000000
      end
      item
        DataType = ftFloat
        Name = 'pQTATUA'
        ParamType = ptInput
        Value = 0.000000000000000000
      end
      item
        DataType = ftString
        Name = 'pCDUSUA'
        ParamType = ptInput
        Value = ''
      end>
  end
end
