unit udmEtiquetas;

interface

uses
  SysUtils, Classes, DB, DBTables, Forms, DBIProcs, DBClient, MidasLib,
  RpDefine, RpCon, RpConDS,Dialogs, AppEvnts;

type
  TdmEtiquetas = class(TDataModule)
    qryEtiquetas: TQuery;
    tbEtiquetas: TTable;
    qryProduto: TQuery;
    tbParametros: TTable;
    tbEtiquetasEQT_CDPROD: TStringField;
    tbEtiquetasEQT_NMPROD: TStringField;
    tbEtiquetasEQT_VLVEND: TFloatField;
    tbEtiquetasEQT_IMGBAR: TGraphicField;
    qryProdutoPRO_CDPROD: TStringField;
    qryProdutoPRO_CDBARR: TStringField;
    qryProdutoPRO_NMPROD: TStringField;
    qryProdutoPRO_VLVEND: TFloatField;
    tbProdutos: TTable;
    qrySecao: TQuery;
    qryGrupo: TQuery;
    tbProdutosPRO_CDPROD: TStringField;
    tbProdutosPRO_CDBARR: TStringField;
    tbProdutosPRO_NMPROD: TStringField;
    tbProdutosPRO_CDUNID: TStringField;
    tbProdutosPRO_VLVEND: TFloatField;
    tbParametrosPAR_NMEMPR: TStringField;
    tbParametrosPAR_ENEMPR: TStringField;
    tbParametrosPAR_BAEMPR: TStringField;
    tbParametrosPAR_CIEMPR: TStringField;
    tbParametrosPAR_CEPEMP: TStringField;
    tbParametrosPAR_UFEMPR: TStringField;
    tbParametrosPAR_CGCEMP: TStringField;
    tbParametrosPAR_INSEST: TStringField;
    tbParametrosPAR_NRFONE: TStringField;
    tbParametrosPAR_NUMFAX: TStringField;
    tbParametrosPAR_CDPROD: TFloatField;
    tbParametrosPAR_NRSEQU: TFloatField;
    tbParametrosPAR_IMLOGO: TGraphicField;
    tbParametrosPAR_TOETIQ: TFloatField;
    tbParametrosPAR_CDBARR: TStringField;
    tbMovimento: TTable;
    tbMovimentoMDV_NRVEND: TStringField;
    tbMovimentoMDV_CDLOJA: TStringField;
    tbMovimentoMDV_DTVEND: TDateField;
    tbMovimentoMDV_HOVEND: TStringField;
    tbMovimentoMDV_VLVEND: TCurrencyField;
    tbMovimentoMDV_VLPAGO: TCurrencyField;
    tbMovimentoMDV_VLTROC: TCurrencyField;
    tbMovimentoMDV_FLSITU: TStringField;
    tbMovimentoMDV_CDUSUA: TStringField;
    tbItensVenda: TTable;
    tbItensVendaITV_NRVEND: TStringField;
    tbItensVendaITV_NRITEM: TStringField;
    tbItensVendaITV_CDPROD: TStringField;
    tbItensVendaITV_QTPROD: TFloatField;
    tbMovimentoMDV_NMVEND: TStringField;
    qryVendedor: TQuery;
    qryLoja: TQuery;
    qryLojaLOJ_CDLOJA: TStringField;
    qryLojaLOJ_NMLOJA: TStringField;
    qryVendedorVEN_CDVEND: TStringField;
    qryVendedorVEN_NMVEND: TStringField;
    tbItensVendaITV_IMGBAR: TGraphicField;
    tbParametrosPAR_NRVEND: TFloatField;
    qryModalidade: TQuery;
    qryModalidadeMOD_CDMODA: TStringField;
    qryModalidadeMOD_NMMODA: TStringField;
    tbItensVendaITV_VLUNI2: TCurrencyField;
    tbItensVendaITV_VLDESC: TFloatField;
    tbEstoque: TTable;
    tbEstoqueEST_CDLOJA: TStringField;
    tbEstoqueEST_CDPROD: TStringField;
    tbEstoqueEST_DTENTR: TDateField;
    tbEstoqueEST_QTENTR: TFloatField;
    tbEstoqueEST_DTSAID: TDateField;
    tbEstoqueEST_QTSAID: TFloatField;
    tbEstoqueEST_QTPROD: TFloatField;
    tbHistorico: TTable;
    tbHistoricoHIS_NRSEQU: TStringField;
    tbHistoricoHIS_CDLOJA: TStringField;
    tbHistoricoHIS_CDPROD: TStringField;
    tbHistoricoHIS_DTHIST: TDateField;
    tbHistoricoHIS_HOHIST: TStringField;
    tbHistoricoHIS_TPHIST: TStringField;
    tbHistoricoHIS_QTANTE: TFloatField;
    tbHistoricoHIS_QTPROD: TFloatField;
    tbHistoricoHIS_QTATUA: TFloatField;
    tbHistoricoHIS_CDUSUA: TStringField;
    tbUsuarios: TTable;
    tbUsuariosSEN_CDUSUA: TStringField;
    tbUsuariosSEN_NMUSUA: TStringField;
    tbUsuariosSEN_SNATUA: TStringField;
    tbUsuariosSEN_NMCARG: TStringField;
    tbParametrosPAR_CDUSUA: TFloatField;
    qryConsultaEstoque: TQuery;
    qryConsultaEstoqueEST_CDLOJA: TStringField;
    qryConsultaEstoqueEST_CDPROD: TStringField;
    qryConsultaEstoqueEST_QTPROD: TFloatField;
    qryProEstoque: TQuery;
    qryConsultaEstoqueEST_NMPROD: TStringField;
    tbParametrosPAR_MDIMPR: TStringField;
    qryConsulta: TQuery;
    qryConsultaMDV_NRVEND: TStringField;
    qryConsultaMDV_CDLOJA: TStringField;
    qryConsultaMDV_DTVEND: TDateField;
    qryConsultaMDV_HOVEND: TStringField;
    qryConsultaMDV_VLVEND: TCurrencyField;
    qryConsultaMDV_FLSITU: TStringField;
    qryConsultaMDV_NMCLIE: TStringField;
    qryConsultaMDV_ENDCLI: TStringField;
    qryConsultaMDV_NRFONE: TStringField;
    qryConsultaMDV_NMLOJA: TStringField;
    tbEtiquetas2: TTable;
    tbEtiquetas2ETT_NRITEM: TStringField;
    tbEtiquetas2ETT_CDPROD: TStringField;
    tbEtiquetas2ETT_NMPROD: TStringField;
    tbEtiquetas2ETT_QTPROD: TFloatField;
    tbEtiquetas2ETT_IMDBAR: TGraphicField;
    qryMovCaixa: TQuery;
    qryNatureza: TQuery;
    qryMovCaixaMCA_TOTAL: TFloatField;
    qryMovCaixaMCA_CDNATU: TStringField;
    qryNaturezaNAT_CDNATU: TStringField;
    qryNaturezaNAT_NMNATU: TStringField;
    qryMovCaixaMCA_NMNATU: TStringField;
    qryMovCaixaMCA_NMDESC: TStringField;
    qryDadosRel: TQuery;
    tbParametrosPAR_PADRAO_ETIQ: TIntegerField;
    tbEtiquetasEQT_CDBARR: TStringField;
    qryExcluir: TQuery;
    tbParametrosPAR_LINHA_INICIAL: TFloatField;
    tbParametrosPAR_COLUNA_INICIAL: TFloatField;
    tbParametrosPAR_TAMANHO_ETI: TFloatField;
    qryAux: TQuery;
    cdsDados: TClientDataSet;
    cdsDadosITEM: TStringField;
    cdsDadosCODIGO: TStringField;
    cdsDadosREFERENCIA: TStringField;
    cdsDadosNOME_PROD: TStringField;
    cdsDadosVALOR: TFloatField;
    cdsDadosQUANT: TIntegerField;
    cdsDadosSECAO: TStringField;
    cdsDadosTAMANHO: TStringField;
    QryAux2: TQuery;
    qryValVenda: TQuery;
    tbParametrosPAR_LARGURA_ETI: TFloatField;
    cdsDadosVALOR_APRAZO: TFloatField;
    tbProdutosPRO_VLAPRA: TFloatField;
    tbParametrosPAR_IMPRESSORA: TStringField;
    tbParametrosPAR_FLPRECO: TStringField;
    tbParametrosPAR_CDSISTEMA: TSmallintField;
    qryModEtiqueta: TQuery;
    qryModEtiquetaMDE_CODIGO: TIntegerField;
    qryModEtiquetaMDE_DESCRICAO: TStringField;
    qryModEtiquetaMDE_COLUNA_INICIAL: TFloatField;
    qryModEtiquetaMDE_LINHA_INICIAL: TFloatField;
    qryModEtiquetaMDE_TAMANHO_ETI: TFloatField;
    qryModEtiquetaMDE_LARGURA_ETI: TFloatField;
    qryModEtiquetaMDE_TAMANHO_FONTE: TIntegerField;
    qryModEtiquetaMDE_TOTAL_LINHAS: TIntegerField;
    qryModEtiquetaMDE_TOTAL_COLUNAS: TIntegerField;
    cdsEtiquetas: TClientDataSet;
    cdsEtiquetasITEM: TStringField;
    cdsEtiquetasCODIGO: TStringField;
    cdsEtiquetasNOME: TStringField;
    cdsEtiquetasVALOR: TFloatField;
    cdsEtiquetasBARRAS: TStringField;
    cdsEtiquetasVALOR_APRAZO: TFloatField;
    cdsEtiquetasTAMANHO: TStringField;
    rdsEtiquetas10x3: TRvDataSetConnection;
    tbEtiquetasEQT_TAMANHO: TStringField;
    tbParametrosPAR_MOSTRAR_REGUA: TStringField;
    qryModEtiquetaMDE_MARGEM_INFERIOR: TFloatField;
    qryModEtiquetaMDE_MARGEM_DIREITA: TFloatField;
    ApplicationEvents1: TApplicationEvents;
    tbParametrosPAR_CDALFANUMERICO: TStringField;
    tbParametrosPAR_TAM_FONTE: TFloatField;
    tbParametrosPAR_MOSTRA_REF: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure tbEtiquetasAfterPost(DataSet: TDataSet);
    procedure tbParametrosAfterPost(DataSet: TDataSet);
    procedure tbProdutosAfterPost(DataSet: TDataSet);
    procedure tbMovimentoAfterPost(DataSet: TDataSet);
    procedure tbEstoqueAfterPost(DataSet: TDataSet);
    procedure tbHistoricoAfterPost(DataSet: TDataSet);
    procedure tbUsuariosAfterPost(DataSet: TDataSet);
    procedure tbEtiquetas2AfterPost(DataSet: TDataSet);
    procedure qryMovCaixaCalcFields(DataSet: TDataSet);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
  private
    Procedure CRIA_TABELA;
    { Private declarations }
  public
    { Public declarations }
    Function GetPedido(M_NRPEDI : String) : Boolean;
    Procedure GetItensPedidos(M_NRPEDI : String; aDados : TClientDataSet);
    Function GetNomeProduto(M_CDPROD : String): String;
    Function GetRefProduto(M_CDPROD : String): String;
    Procedure Adicionar_Dados(M_CDPROD : String; M_QTETIQ : Integer; M_VLPROD : Double);
    Procedure Adicionar_Dados_Gondula(M_CDPROD : String; M_QTETIQ : Integer; M_VLPROD : Double);
    Function GetProduto(M_CDPROD : String): Boolean;
    Function GetValorVendaProduto(M_CDPROD : String): Double;
    Function GetValorVendaAprazo(M_CDPROD : String): Double;
    Procedure Criar_Etiquetas(aCDS, aCDSDados : TClientDataSet; aTotalEtiqueta, aEtiquetaInicial : integer);    
  end;

var
  dmEtiquetas: TdmEtiquetas;

implementation

Uses uFuncoes;

{$R *.dfm}

procedure TdmEtiquetas.CRIA_TABELA;
begin
    If FileExists(ExtractFilePath( Application.ExeName )+'\SACMDV.DB')=false then
    begin
         tbMovimento.Close;
         tbMovimento.DatabaseName := 'DBEtiqueta';
         tbMovimento.TableName:= 'SACMDV.DB';
         tbMovimento.TableType:=ttParadox;
         tbMovimento.FieldDefs.Clear;
         tbMovimento.FieldDefs.Add('MDV_NRVEND',ftString,07,false);
         tbMovimento.FieldDefs.Add('MDV_CDLOJA',ftString,03,false);
         tbMovimento.FieldDefs.Add('MDV_DTVEND',ftDate,10,false);
         tbMovimento.FieldDefs.Add('MDV_HOVEND',ftString,05,false);
         tbMovimento.FieldDefs.Add('MDV_VLVEND',ftFloat,0,false);
         tbMovimento.FieldDefs.Add('MDV_VLPAGO',ftFloat,0,false);
         tbMovimento.FieldDefs.Add('MDV_VLTROC',ftFloat,0,false);
         tbMovimento.FieldDefs.Add('MDV_FLSITU',ftString,1,false);
         tbMovimento.FieldDefs.Add('MDV_CDUSUA',ftString,03,false);
         tbMovimento.IndexDefs.Clear;
         tbMovimento.IndexDefs.Add('iMDV_NRVEND','MDV_NRVEND',[ixPrimary,ixUnique]);
         tbMovimento.CreateTable;
         tbMovimento.Open;
         //ShowMessage('As tabelas foram criadas com êxito!');
    End;
end;

procedure TdmEtiquetas.DataModuleCreate(Sender: TObject);
Var
    M_NRCONT, M_QTPROD : Double;
begin
  try
     { se o alias não existir... }
     if not Session.IsAlias('DBEtiqueta') then
     begin
          { Adiciona o alias }
          Session.AddStandardAlias('DBEtiqueta', ExtractFilePath( Application.ExeName ), 'PARADOX');
          { Salva o arquivo de configuração do BDE }
          Session.SaveConfigFile;
     end;
     //
     tbEtiquetas.Open;
     //
   Except
     { on EDatabaseError do
      begin
            raise Exception.Create('Erro ao tentar abrir banco de dados.');
      End;}
      //
      on e:Exception do
           raise Exception.Create('Erro ao tentar abrir banco de dados.'+#13+
                     e.Message);
   End;
end;

procedure TdmEtiquetas.DataModuleDestroy(Sender: TObject);
var
i: integer;
begin
    with Session do
    begin
        for i:= 0 to DatabaseCount - 1 do
            Databases[I].Close;
    end;
end;

procedure TdmEtiquetas.tbEtiquetasAfterPost(DataSet: TDataSet);
begin
     DBISaveChanges(tbEtiquetas.Handle);     //Evitando Perdas de Dados.
     tbEtiquetas.FlushBuffers;
     tbEtiquetas.Refresh;
end;

procedure TdmEtiquetas.tbParametrosAfterPost(DataSet: TDataSet);
begin
     DBISaveChanges(tbParametros.Handle);     //Evitando Perdas de Dados.
     tbParametros.FlushBuffers;
     tbParametros.Refresh;
end;

procedure TdmEtiquetas.tbProdutosAfterPost(DataSet: TDataSet);
begin
     DBISaveChanges(tbProdutos.Handle);     //Evitando Perdas de Dados.
     tbProdutos.FlushBuffers;
     tbProdutos.Refresh;
end;

procedure TdmEtiquetas.tbMovimentoAfterPost(DataSet: TDataSet);
begin
     DBISaveChanges(tbMovimento.Handle);     //Evitando Perdas de Dados.
     tbMovimento.FlushBuffers;
     tbMovimento.Refresh;
end;

procedure TdmEtiquetas.tbEstoqueAfterPost(DataSet: TDataSet);
begin
     DBISaveChanges(tbEstoque.Handle);     //Evitando Perdas de Dados.
     tbEstoque.FlushBuffers;
     tbEstoque.Refresh;
end;

procedure TdmEtiquetas.tbHistoricoAfterPost(DataSet: TDataSet);
begin
     DBISaveChanges(tbHistorico.Handle);     //Evitando Perdas de Dados.
     tbHistorico.FlushBuffers;
     tbHistorico.Refresh;
end;

procedure TdmEtiquetas.tbUsuariosAfterPost(DataSet: TDataSet);
begin
     DBISaveChanges(tbUsuarios.Handle);     //Evitando Perdas de Dados.
     tbUsuarios.FlushBuffers;
     tbUsuarios.Refresh;
end;

procedure TdmEtiquetas.tbEtiquetas2AfterPost(DataSet: TDataSet);
begin
     DBISaveChanges(tbEtiquetas2.Handle);     //Evitando Perdas de Dados.
     tbEtiquetas2.FlushBuffers;
     tbEtiquetas2.Refresh;
end;

procedure TdmEtiquetas.qryMovCaixaCalcFields(DataSet: TDataSet);
begin
     If uFuncoes.Empty(qryMovCaixaMCA_CDNATU.AsString) Then
         qryMovCaixaMCA_NMDESC.AsString := 'NATUREZA NÃO ENCONTRADA'
     Else
         qryMovCaixaMCA_NMDESC.AsString := qryMovCaixaMCA_NMNATU.AsString;
end;

function TdmEtiquetas.GetPedido(M_NRPEDI: String): Boolean;
begin
     Result := False;
     With qryAux do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select PED_NRPEDI from "SACPED.DBF" Where (PED_NRPEDI = :pNRPEDI)');
           ParamByName('pNRPEDI').AsString := M_NRPEDI;
           Open;
           //
           If (recordCount > 0) Then
              Result := True;
      End;
end;


procedure TdmEtiquetas.GetItensPedidos(M_NRPEDI: String;
  aDados: TClientDataSet);
Var
   Item : Integer;
begin
     aDados.Active := True;
     aDados.EmptyDataSet;
     //
     With qryAux do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select * from "SACPEP.DBF" Where (PEP_NRPEDI = :pNRPEDI)');
           ParamByName('pNRPEDI').AsString := M_NRPEDI;
           Open;
           //
           If (qryAux.recordCount > 0) Then
            begin
                 First;
                 Item := 1;
                 While not (qryAux.Eof) do
                  begin
                       With cdsDados do
                        begin
                             Append;
                             FieldByName('ITEM').AsString       := uFuncoes.StrZero(inttoStr(Item),3);
                             FieldByName('CODIGO').AsString     := InttoStr(qryAux.FieldByname('PEP_CDPROD').AsInteger);
                             FieldByName('REFERENCIA').AsString := qryAux.FieldByname('PEP_CDPROD').AsString;
                             FieldByName('NOME_PROD').AsString  := GetNomeProduto(qryAux.FieldByname('PEP_CDPROD').AsString);
                             FieldByName('VALOR').AsFloat       := GetValorVendaProduto(qryAux.FieldByname('PEP_CDPROD').AsString);
                             FieldByName('VALOR_APRAZO').AsFloat := GetValorVendaAprazo(qryAux.FieldByname('PEP_CDPROD').AsString);
                             //qryAux.FieldByname('PEP_VLUNIT').AsFloat;
                             FieldByName('QUANT').AsInteger     := qryAux.FieldByname('PEP_QTPROD').AsInteger;
                             //FieldByName('').AsString :=
                             Post;
                        End;
                       Item := Item + 1;
                       //
                       qryAux.Next;
                  End;
                  //
                  First;
            End;
      End;
end;

function TdmEtiquetas.GetNomeProduto(M_CDPROD  : String ): String;
begin
     With QryAux2 do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select PRO_CDPROD, PRO_NMPROD from "SACPRO.DBF" Where (PRO_CDPROD = :pCDPROD)');
           ParamByName('pCDPROD').AsString := M_CDPROD;
           Open;
           //
           If (recordCount > 0) Then
              Result := FieldByName('PRO_NMPROD').AsString;
      End;
end;

procedure TdmEtiquetas.Adicionar_Dados(M_CDPROD : String;
   M_QTETIQ: Integer; M_VLPROD: Double);
Var
   itens : integer;
begin
     if not (cdsDados.Active) Then
        cdsDados.Open;
     //
     With cdsDados do
        begin
             itens := RecordCount;
             Append;
             FieldByName('ITEM').AsString       := uFuncoes.StrZero(inttoStr(itens),3);
             FieldByName('CODIGO').AsString     := InttoStr(StrtoInt(M_CDPROD));
             FieldByName('REFERENCIA').AsString := GetRefProduto(M_CDPROD);
             FieldByName('NOME_PROD').AsString  := GetNomeProduto(M_CDPROD);
             FieldByName('VALOR').AsFloat       := GetValorVendaProduto(M_CDPROD);
             //M_VLPROD;
             FieldByName('QUANT').AsInteger     := M_QTETIQ;
             //FieldByName('').AsString :=
             Post;
         End;
end;

function TdmEtiquetas.GetRefProduto(M_CDPROD: String): String;
begin
     With QryAux2 do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select PRO_CDPROD, PRO_CDBARR from "SACPRO.DBF" Where (PRO_CDPROD = :pCDPROD)');
           ParamByName('pCDPROD').AsString := M_CDPROD;
           Open;
           //
           If (recordCount > 0) Then
              Result := FieldByName('PRO_CDBARR').AsString;
      End;
end;

function TdmEtiquetas.GetProduto(M_CDPROD: String): Boolean;
begin
     Result := False;
     With QryAux2 do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select PRO_CDPROD, PRO_CDBARR, PRO_NMPROD, PRO_VLVEND from "SACPRO.DBF" Where (PRO_CDPROD = :pCDPROD)');
           ParamByName('pCDPROD').AsString := M_CDPROD;
           Open;
           //
           If (recordCount > 0) Then
              Result := True;
      End;
end;

procedure TdmEtiquetas.Criar_Etiquetas(aCDS, aCDSDados: TClientDataSet;
  aTotalEtiqueta, aEtiquetaInicial: integer);
Var
   W_QTREGI, X, M_QTETIQ, W_ETIMPR : Integer;
begin
     If (aCDS.Active = False) Then
         aCDS.Open;
     //
     aCDS.EmptyDataSet;
     //
     W_QTREGI := 1;
     //
     While (W_QTREGI < aEtiquetaInicial) do
       Begin
            With aCDS do
            begin
                 Append;
                 Post;
            End;
            //
            W_QTREGI := W_QTREGI + 1;
       End;
end;

function TdmEtiquetas.GetValorVendaProduto(M_CDPROD: String): Double;
begin
     With qryValVenda do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select PRO_CDPROD, PRO_CDBARR, PRO_NMPROD, PRO_VLVEND from "SACPRO.DBF" Where (PRO_CDPROD = :pCDPROD)');
           ParamByName('pCDPROD').AsString := M_CDPROD;
           Open;
           //
           If (recordCount > 0) Then
              Result := FieldByName('PRO_VLVEND').AsFloat;
      End;
end;

function TdmEtiquetas.GetValorVendaAprazo(M_CDPROD: String): Double;
Var
  QrAux  : TQuery;
  aTexto, aCampo : String;
begin
    If not (tbParametros.Active) Then
       tbParametros.Open;
    //
    If (tbParametrosPAR_CDSISTEMA.AsInteger = 1) Then
        aCampo := 'PRO_VLAPRA'
    Else
        aCampo := 'PRO_VLATAC';
    atexto := 'Select PRO_CDPROD, PRO_CDBARR, PRO_VLVEND, '+aCampo+' from "SACPRO.DBF" Where (PRO_CDPROD = :pCDPROD) ';
    QrAux := TQuery.Create(nil);
    with QrAux do
     try
       DatabaseName := 'DBEtiqueta';
       sql.Add(atexto);
       Params.ParamByName('pCDPROD').AsString := uFuncoes.StrZero(M_CDPROD,13);
       Open;
       //
       if not (IsEmpty) Then
        Begin
             If (tbParametrosPAR_CDSISTEMA.AsInteger = 1) Then
                 result := FieldByName('PRO_VLAPRA').AsFloat
             Else
                 result := FieldByName('PRO_VLATAC').AsFloat;
        End;
       finally
         free;
       end;
end;

procedure TdmEtiquetas.Adicionar_Dados_Gondula(M_CDPROD: String;
  M_QTETIQ: Integer; M_VLPROD: Double);
Var
   itens : integer;
begin
     if not (cdsDados.Active) Then
        cdsDados.Open;
     //
     With cdsDados do
        begin
             itens := RecordCount;
             Append;
             FieldByName('ITEM').AsString       := uFuncoes.StrZero(inttoStr(itens),3);
             FieldByName('CODIGO').AsString     := InttoStr(StrtoInt(M_CDPROD));
             FieldByName('REFERENCIA').AsString := GetRefProduto(uFuncoes.StrZero( M_CDPROD,13));
             FieldByName('NOME_PROD').AsString  := GetNomeProduto(uFuncoes.StrZero( M_CDPROD,13));
             FieldByName('VALOR').AsFloat       := M_VLPROD;
             //M_VLPROD;
             FieldByName('QUANT').AsInteger     := M_QTETIQ;
             //FieldByName('').AsString :=
             Post;
         End;
end;

procedure TdmEtiquetas.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
var
  NomeDoLog: string;
  Arquivo: TextFile;
begin
  NomeDoLog := ChangeFileExt(Application.Exename, '.log');
  AssignFile(Arquivo, NomeDoLog);
  if FileExists(NomeDoLog) then
    Append(arquivo) { se existir, apenas adiciona linhas }
  else
    ReWrite(arquivo); { cria um novo se não existir }
  try
    WriteLn(arquivo, DateTimeToStr(Now) + ':' + E.Message);
    WriteLn(arquivo, '----------------------------------------------------------------------');
    Application.ShowException(E);
  finally
    CloseFile(arquivo)
  end;
end;

end.
