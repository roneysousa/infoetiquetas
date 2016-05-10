unit frmPedEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, RXDBCtrl, Buttons, Mask,
  ToolEdit, CurrEdit, DB, DBClient, RpDefine, RpBase, RpSystem, RpRave,
  RpCon, RpConDS, rpBars, RpConBDE, Rpdevice, DBTables, RpRender,
  RpRenderPDF;
type
  TfrmPedidoEtiqueta = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtPedido: TEdit;
    pnlGrid: TPanel;
    pnlExcluir: TPanel;
    Panel5: TPanel;
    RxDBGrid1: TRxDBGrid;
    btnExcluir: TBitBtn;
    btImprimir: TBitBtn;
    btFechar: TBitBtn;
    dsDados: TDataSource;
    RvSystem1: TRvSystem;
    cdsEtiquetas: TClientDataSet;
    cdsEtiquetasITEM: TStringField;
    cdsEtiquetasCODIGO: TStringField;
    cdsEtiquetasNOME: TStringField;
    cdsEtiquetasVALOR: TFloatField;
    RvProject1: TRvProject;
    dscEtiquetas: TRvDataSetConnection;
    DataSource1: TDataSource;
    btAdicionar: TBitBtn;
    rbTipo: TRadioGroup;
    RPDev1: TRvProject;
    RvSystem2: TRvSystem;
    cdsEtiquetasBARRAS: TStringField;
    PainelEtiqueta: TPanel;
    DataSource2: TDataSource;
    Label5: TLabel;
    edtETATUAL: TEdit;
    cdsEtiquetasVALOR_APRAZO: TFloatField;
    qryEtiquetas: TQuery;
    qryEtiquetasEQT_CDPROD: TStringField;
    qryEtiquetasEQT_CDBARR: TStringField;
    qryEtiquetasEQT_NMPROD: TStringField;
    qryEtiquetasEQT_VLVEND: TFloatField;
    qryEtiquetasEQT_IMGBAR: TGraphicField;
    RvRenderPDF1: TRvRenderPDF;
    Label7: TLabel;
    cmbTamanho: TComboBox;
    RvSystem3: TRvSystem;
    rvPersonalizado: TRvProject;
    lblTotal: TLabel;
    rvCdsEstiquetas: TRvDataSetConnection;
    rvPersonalizado2: TRvProject;
    rvPersonalizado3: TRvProject;
    procedure edtPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure btFecharClick(Sender: TObject);
    procedure edtPedidoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPedidoEnter(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure RvSystem1Print(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsDadosDataChange(Sender: TObject; Field: TField);
    procedure RvSystem2Print(Sender: TObject);
    procedure rbTipoClick(Sender: TObject);
    procedure edtETATUALKeyPress(Sender: TObject; var Key: Char);
    procedure edtPedidoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    EtiquetaSelecionada : integer;
    procedure Paneis(Tipo : Boolean);
    Procedure Carregar_Dados(aDados : TClientDataSet; aFlZero : String);
    Function Quant_Etiquetas(aDados : TClientDataSet) : Integer;
    procedure Atualizar_Legenda;
    procedure Limpa;
    procedure DesmarcarEtiqueta(EtiquetaInicia : integer);
    procedure CriarEtiqueta(NrColunas, NrLinhas : integer);
    procedure ClickEtiqueta(Sender: TObject);
    procedure Posicao_Etiqueta(M_POINIC, M_QTETIQ : integer);
  public
    { Public declarations }
  end;

var
  frmPedidoEtiqueta: TfrmPedidoEtiqueta;
  M_FLBARR : boolean;
  W_QTETIQ, M_ETINIC : INTEGER;

implementation

uses udmEtiquetas, uFuncoes, uFrmEtiquetaPedidos, uFrmAddProduto;

{$R *.dfm}

procedure TfrmPedidoEtiqueta.edtPedidoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
     begin
          key:=#0;
          SendMessage(frmPedidoEtiqueta.Handle,WM_NEXTDLGCTL,0,0);
     End;
end;

procedure TfrmPedidoEtiqueta.btFecharClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmPedidoEtiqueta.edtPedidoExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtPedido.Text) Then
       if not (dmEtiquetas.GetPedido(uFuncoes.StrZero(edtPedido.Text,7))) Then
        begin
             edtPedido.SetFocus;
             raise Exception.Create('Pedido não existe.');
        End
        Else
        begin
            edtPedido.Text := uFuncoes.StrZero(edtPedido.Text,7);
            Paneis(True);
            //
            dmEtiquetas.GetItensPedidos(edtPedido.Text, dmEtiquetas.cdsDados);
            //
            Atualizar_Legenda;
        End;
end;

procedure TfrmPedidoEtiqueta.FormShow(Sender: TObject);
begin
     CriarEtiqueta(5, 13);
     //
     RvProject1.ProjectFile := ExtractFilePath( Application.ExeName )+'\Relatorio\rvEtiPedidos.rav';
     //
     Case dmEtiquetas.tbParametrosPAR_PADRAO_ETIQ.AsInteger of
         1 : cmbTamanho.ItemIndex := 0;
         2 : cmbTamanho.ItemIndex := 1;
         3 : cmbTamanho.ItemIndex := 2;
     End;
     //
     Paneis(False);
     PainelEtiqueta.Enabled := False;
     edtETATUAL.Enabled := False;
     lblTotal.caption := '';
end;

procedure TfrmPedidoEtiqueta.Paneis(Tipo: Boolean);
begin
     //pnlExcluir.Enabled := Tipo;
     //pnlEntrada.Enabled := Tipo;
     //pnlGrid.Enabled    := Tipo;
end;

Procedure PrintBarcodeEAN(RVSystem:TRVSystem; Row, Column:Double; Value:String);
Begin
//   With TRPBarsEAN.Create(RVSystem.BaseReport) do Begin
   With TRPBarsCode128.Create(RVSystem.BaseReport) do
   Begin
     BarHeight  := 0.9;
     //BarWidth   := 0.032;
     BarWidth   := 0.036;
     WideFactor := BarWidth;
     Text := Value;
     PrintXY(Column,Row);
     Free;
   end;
End;

procedure TfrmPedidoEtiqueta.edtPedidoEnter(Sender: TObject);
begin
     Paneis(False);
end;

procedure TfrmPedidoEtiqueta.btnExcluirClick(Sender: TObject);
begin
     If (dmEtiquetas.cdsDados.Active) and not (dmEtiquetas.cdsDados.IsEmpty) Then
     begin
          dmEtiquetas.cdsDados.Delete;
          //
          Atualizar_Legenda; 
     End;
end;

procedure TfrmPedidoEtiqueta.btImprimirClick(Sender: TObject);
begin
     if (dmEtiquetas.cdsDados.IsEmpty) Then
      begin
           raise Exception.Create('Não há dados para impressão.');
           //Exit;
      End;
     //
     if (rbTipo.ItemIndex = 2) Then
        M_FLBARR := True
     Else
        M_FLBARR := False;
     //
   btImprimir.Enabled := false;
   try
     if (rbTipo.ItemIndex = 0) Then
     begin
         If (cmbTamanho.ItemIndex <> 2) Then
         begin
             Carregar_Dados(dmEtiquetas.cdsDados, 'N');
             RvProject1.Execute;
             RvProject1.Close;
         End
         Else
         begin
             Carregar_Dados(dmEtiquetas.cdsDados, 'N');
             rvPersonalizado.Execute;
             rvPersonalizado.Close;
         End;
     End;
     //
     if (rbTipo.ItemIndex = 1) or (rbTipo.ItemIndex = 2) Then
     begin
         If (cmbTamanho.ItemIndex <> 2) Then
         begin
            //
            Carregar_Dados(dmEtiquetas.cdsDados,'N');
            //
            RVSystem2.SystemPrinter.MarginBottom  := 1.0;
            RVSystem2.SystemPrinter.MarginLeft    := 0.4;
            RVSystem2.SystemPrinter.MarginTop     := 1.2;
            RVSystem2.SystemPrinter.MarginRight   := 0.4;
            RVSystem2.SystemPrinter.Units         := unCM;
            RVSystem2.SystemPrinter.UnitsFactor   := 2.54;
            //
            RVSystem2.SystemPrinter.Copies        := 1;
            //
            RPDev.Orientation := poPortrait;
            RVSystem2.SystemPrinter.Orientation   := RPDev.Orientation;
            RPDev.SetPaperSize(DMPAPER_A4,0,0);
            RPDev.SelectPaper('A4 small sheet, 210- by 297-millimeters',false);
            //
            RVSystem2.SystemPreview.FormState     := wsMaximized;
            RVSystem2.SystemSetups := RVSystem2.SystemSetups - [ssAllowSetup];
            // Regua
            //RVSystem2.SystemPreview.RulerType     := rtBothCm;
            RVSystem2.Execute;
         End
         Else
         begin
            //
            Carregar_Dados(dmEtiquetas.cdsDados,'S');
            //
            if (rbTipo.ItemIndex = 1) Then
             begin
                  rvPersonalizado2.Execute;
                  rvPersonalizado2.Close;
             End;
             //
            if (rbTipo.ItemIndex = 2) Then
             begin
                  rvPersonalizado3.Execute;
                  rvPersonalizado3.Close;
             End;
         End;
     End;
     //
     if (rbTipo.ItemIndex > 0) and (cmbTamanho.ItemIndex <> 2) Then
        Posicao_Etiqueta(M_ETINIC, W_QTETIQ);
     //
     Limpa;
  Finally
      btImprimir.Enabled := true;
  End;
end;

procedure TfrmPedidoEtiqueta.Carregar_Dados(aDados: TClientDataSet; aFlZero : String);
Var
  I, Quant : Integer;
  fValorUnitario, fValorAprazo : Double;
begin
      //
      With aDados do
        begin
             cdsEtiquetas.Open;
             cdsEtiquetas.EmptyDataSet;
             //
             //dmEtiquetas.Criar_Etiquetas(cdsEtiquetas, dmEtiquetas.cdsDados, 13, EtiquetaSelecionada);
             if (rbTipo.ItemIndex > 0) and (cmbTamanho.ItemIndex <> 2) Then
             Begin
                  if uFuncoes.Empty(edtETATUAL.Text) Then
                      M_ETINIC := 0
                  Else
                      M_ETINIC := StrtoInt(edtETATUAL.Text);
                 //
                 dmEtiquetas.Criar_Etiquetas(cdsEtiquetas, dmEtiquetas.cdsDados, 13, M_ETINIC);
             End;
             //
             First;
             //
             While not (Eof) do
              begin
                   Quant := FieldByNAme('QUANT').AsInteger;
                   //
                   For I := 1 to Quant do
                    begin
                         With cdsEtiquetas do
                          begin
                               fValorUnitario := 0;
                               fValorAprazo := 0;
                               Append;
                               FieldByName('ITEM').AsString   := aDados.FieldBYName('ITEM').AsString;
                               If (aFlZero = 'N') Then
                                   FieldByName('CODIGO').AsString := aDados.FieldBYName('CODIGO').AsString
                               Else
                                   FieldByName('CODIGO').AsString := uFuncoes.StrZero(aDados.FieldBYName('CODIGO').AsString,13);
                               FieldByName('BARRAS').AsString := aDados.FieldBYName('REFERENCIA').AsString;
                               FieldByName('NOME').AsString   := aDados.FieldBYName('NOME_PROD').AsString;
                               if (dmEtiquetas.tbParametrosPAR_FLPRECO.AsString = 'S') Then
                               begin
                                   fValorUnitario := aDados.FieldBYName('VALOR').AsFloat;
                                   If (fValorUnitario > 0) then
                                      FieldByName('VALOR').AsFloat   := fValorUnitario;
                                   fValorAprazo := dmEtiquetas.GetValorVendaAprazo(aDados.FieldBYName('CODIGO').AsString);
                                   If (fValorAprazo > 0) Then
                                      FieldByName('VALOR_APRAZO').AsFloat := fValorAprazo;
                               End;
                               //
                               Post;
                          End;
                    End;
                   //
                   Next;
              End;
        End;
end;

function TfrmPedidoEtiqueta.Quant_Etiquetas(
  aDados: TClientDataSet): Integer;
Var
  M_QTETIQ : Integer;
begin
     M_QTETIQ := 0;
     With aDados do
      begin
           DisableControls;
           First;
           While not (Eof) do
            begin
                 M_QTETIQ := M_QTETIQ + FieldByName('QUANT').AsInteger;
                 //
                 Next;
            End;
            EnableControls;
      End;
      //
      Result := M_QTETIQ;
end;

procedure TfrmPedidoEtiqueta.RvSystem1Print(Sender: TObject);
{Var Factor      : Double;
    CurLabel    : Integer;
    CurCol      : Double;
    CurRow      : Double;
    MarginTop   : Double;
    MarginLeft  : Double;
    LabelRow    : Integer;
    LabelRows   : Integer;
    LabelCols   : Integer;
    LabelWidth  : Double;
    LabelHeight : Double;}

begin
   // Nova alteração
{   MarginLeft  := dmEtiquetas.tbParametrosPAR_COLUNA_INICIAL.AsFloat;
   //
   If (dmEtiquetas.tbParametrosPAR_IMPRESSORA.AsInteger = 2) Then
      //MarginTop   := 1.9  // Laser
      MarginTop   := dmEtiquetas.tbParametrosPAR_LINHA_INICIAL.AsFloat
   Else
      MarginTop   := dmEtiquetas.tbParametrosPAR_LINHA_INICIAL.AsFloat;
   //
   LabelWidth  := dmEtiquetas.tbParametrosPAR_TAMANHO_ETI.AsFloat;
   LabelHeight := dmEtiquetas.tbParametrosPAR_LARGURA_ETI.AsFloat;
   LabelRows   := 13;
   LabelCols   := 5;

   CurLabel := 0;
   LabelRow := 0;

   RvSystem1.BaseReport.SetFont('Arial',6);
   //
   While not qryEtiquetas.Eof do
   Begin
       Factor   := (CurLabel Mod LabelCols);
       CurCol   := (Factor*LabelWidth)+MarginLeft;
       CurRow   := (LabelRow * LabelHeight) + MarginTop;
       // Referência
       If (qryEtiquetas.FieldByName('EQT_CDBARR').AsString <> '0000000000000') Then
       begin
           RVSystem1.BaseReport.GotoXY(CurCol,CurRow-0.04);
           RVSystem1.BaseReport.PrintLeft(qryEtiquetas.FieldByName('EQT_CDBARR').AsString,CurCol+0.02);
       End;
       //
       If (qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat > 0) Then
       begin
            // Valor de venda
            RVSystem1.BaseReport.GotoXY(CurCol,CurRow-0.04);
            RVSystem1.BaseReport.PrintRight( FormatFloat('###,##0.#0',qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat),CurCol+3.2);
       End;
       // Descrição do produto
       RVSystem1.BaseReport.GotoXY(CurCol,CurRow+0.14);
       RVSystem1.BaseReport.PrintLeft( Copy(qryEtiquetas.FieldByName('EQT_NMPROD').AsString,1,26),CurCol);
       //
       If not Empty(qryEtiquetas.FieldByName('EQT_CDPROD').AsString) Then
          PrintBarCodeEAN(RVSystem1,CurRow + 0.30,CurCol + 0.17, StrZero(FloattoStr(qryEtiquetas.FieldByName('EQT_CDPROD').AsFloat),5));
          //PrintBarCodeEAN(RVSystem2,CurRow + 0.18,CurCol + 0.04, StrZero(qryEtiquetas.FieldByName('EQT_CDPROD').AsString,5));
          //PrintBarCodeEAN(RVSystem2,CurRow + 0.18,CurCol + 0.04,'471026820'+Format('%0.3d',[qryEtiquetas.FieldByName('EQT_CDPROD').AsInteger]));
       //
       Inc(CurLabel);
       If Factor=LabelCols-1 Then Inc(LabelRow);
       qryEtiquetas.Next;
       //
       If (LabelRow>=LabelRows) Then
       Begin
          LabelRow := 0;
          if not (qryEtiquetas.Eof) Then
            Begin
                RVSystem1.BaseReport.NewPage;
               // Nova_Pagina;
            End;
       End;
   End;  }
   //
end;

procedure TfrmPedidoEtiqueta.Atualizar_Legenda;
begin
     W_QTETIQ := Quant_Etiquetas(dmEtiquetas.cdsDados);
     lblTotal.Caption := 'Quantidade Etiquetas: '+InttoStr(W_QTETIQ);
end;

procedure TfrmPedidoEtiqueta.btAdicionarClick(Sender: TObject);
begin
    Application.CreateForm(TfrmAddProduto, frmAddProduto);
    Try
      frmAddProduto.ShowModal;
    Finally
      frmAddProduto.Release;
      frmAddProduto := nil;
      //
      Atualizar_Legenda;
    End;
end;

procedure TfrmPedidoEtiqueta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     If (dmEtiquetas.cdsDados.Active) Then
      begin
           dmEtiquetas.cdsDados.EmptyDataSet;
           dmEtiquetas.cdsDados.Close;
      End;     
end;

procedure TfrmPedidoEtiqueta.Limpa;
begin
     edtPedido.Clear;
     lblTotal.Caption := '';
     Paneis(False);
     If not (dmEtiquetas.cdsDados.Active) Then
        dmEtiquetas.cdsDados.Open;
     //
     dmEtiquetas.cdsDados.EmptyDataSet;
     //
     edtPedido.SetFocus; 
end;

procedure TfrmPedidoEtiqueta.dsDadosDataChange(Sender: TObject;
  Field: TField);
begin
     btnExcluir.Enabled := dmEtiquetas.cdsDados.RecordCount > 0;
end;

procedure TfrmPedidoEtiqueta.RvSystem2Print(Sender: TObject);
Var Factor      : Double;
    CurLabel    : Integer;
    CurCol      : Double;
    CurRow      : Double;
    MarginTop   : Double;
    MarginLeft  : Double;
    LabelRow    : Integer;
    LabelRows   : Integer;
    LabelCols   : Integer;
    LabelWidth  : Double;
    LabelHeight : Double;
    iModelo : integer;
begin
   dmEtiquetas.tbParametros.Close;
   dmEtiquetas.tbParametros.Open;  
   // Nova alteração
   MarginLeft  := dmEtiquetas.tbParametrosPAR_COLUNA_INICIAL.AsFloat;
   //
   If uFuncoes.Empty(dmEtiquetas.tbParametrosPAR_IMPRESSORA.AsString) Then
      iModelo := 1
   Else
      iModelo := dmEtiquetas.tbParametrosPAR_IMPRESSORA.AsInteger;
   //   
   If (iModelo = 2) Then
      //MarginTop   := 1.9  // Laser
      MarginTop   := dmEtiquetas.tbParametrosPAR_LINHA_INICIAL.AsFloat
   Else
      MarginTop   := dmEtiquetas.tbParametrosPAR_LINHA_INICIAL.AsFloat;
   //
   LabelWidth  := dmEtiquetas.tbParametrosPAR_TAMANHO_ETI.AsFloat;
   LabelHeight := dmEtiquetas.tbParametrosPAR_LARGURA_ETI.AsFloat;
   LabelRows   := 13;
   LabelCols   := 5;

   CurLabel := 0;
   LabelRow := 0;
   //
   //
   //RvSystem2.BaseReport.SetFont('Arial',6);
   //
   //
   With qryEtiquetas do
     begin
         SQL.Clear;
         Close;
         SQL.Add('Select * from "SACEQT.DB"');
         //
         Prepare;
         Open;
     End;
   //
   cdsEtiquetas.DisableControls;
   cdsEtiquetas.First;
   //
   While not cdsEtiquetas.Eof do
   Begin
       RvSystem2.BaseReport.SetFont('Arial',6);
       //
       Factor   := (CurLabel Mod LabelCols);
       CurCol   := (Factor*LabelWidth)+MarginLeft;
       CurRow   := (LabelRow * LabelHeight) + MarginTop;
       //
       if not uFuncoes.Empty(cdsEtiquetas.FieldByName('CODIGO').AsString) Then
       begin
           // Referência
           {If (cdsEtiquetas.FieldByName('BARRAS').AsString <> '0000000000000') Then
           begin
               RVSystem2.BaseReport.GotoXY(CurCol,CurRow-0.04);
               RVSystem2.BaseReport.PrintLeft(uFuncoes.StrZero(cdsEtiquetas.FieldByName('BARRAS').AsString,13),CurCol+0.02);
               //RVSystem2.BaseReport.PrintLeft(uFuncoes.StrZero(cdsEtiquetas.FieldByName('CODIGO').AsString,13),CurCol+0.02);
               //
           End;}
           //
           RVSystem2.BaseReport.GotoXY(CurCol,CurRow-0.04);
           RVSystem2.BaseReport.PrintLeft(uFuncoes.StrZero(cdsEtiquetas.FieldByName('CODIGO').AsString,13),CurCol+0.02);
           //
           If (cdsEtiquetas.FieldByName('VALOR').AsFloat > 0) and (M_FLBARR) AND (dmEtiquetas.tbParametrosPAR_FLPRECO.AsString = 'S') Then
           begin
                // Valor de venda
                RVSystem2.BaseReport.GotoXY(CurCol,CurRow-0.04);
                RVSystem2.BaseReport.PrintRight( FormatFloat('###,##0.#0',cdsEtiquetas.FieldByName('VALOR').AsFloat)+' AV',CurCol+2.9);
                // Valor de APRAZO
                RVSystem2.BaseReport.GotoXY(CurCol,CurRow+0.15);
                RVSystem2.BaseReport.PrintRight( FormatFloat('###,##0.#0',cdsEtiquetas.FieldByName('VALOR_APRAZO').AsFloat)+ ' AP',CurCol+2.9);
                // Descrição do produto
                RVSystem2.BaseReport.GotoXY(CurCol,CurRow+0.32);
                RVSystem2.BaseReport.PrintLeft( Copy(cdsEtiquetas.FieldByName('NOME').AsString,1,26),CurCol);
           End
           Else
           begin
               // Descrição do produto
               RVSystem2.BaseReport.GotoXY(CurCol,CurRow+0.14);
               RVSystem2.BaseReport.PrintLeft( Copy(cdsEtiquetas.FieldByName('NOME').AsString,1,26),CurCol);
           End;
           //
           If not Empty(cdsEtiquetas.FieldByName('CODIGO').AsString) and (M_FLBARR) Then
              PrintBarCodeEAN(RVSystem2,CurRow + 0.35,CurCol + 0.17, StrZero(FloattoStr(cdsEtiquetas.FieldByName('CODIGO').AsFloat),6))
           Else
           begin
                //ShowMessage('Coluna : ' +cdsEtiquetas.FieldByName('CODIGO').AsString + '  ' + cdsEtiquetas.FieldByName('VALOR').AsString );
               If (dmEtiquetas.tbParametrosPAR_FLPRECO.AsString = 'S') Then
               begin
                  RvSystem2.BaseReport.SetFont('Arial Black',13);
                  RVSystem2.BaseReport.GotoXY(CurCol ,CurRow + 0.7);  // + 0.03
                  RVSystem2.BaseReport.PrintCenter(FormatFloat('###,##0.#0',cdsEtiquetas.FieldByName('VALOR').AsFloat)+ ' AV',CurCol+1.8);  // 3.2
                  //
                  RVSystem2.BaseReport.GotoXY(CurCol ,CurRow + 1.1);  // + 0.03
                  RVSystem2.BaseReport.PrintCenter(FormatFloat('###,##0.#0',cdsEtiquetas.FieldByName('VALOR_APRAZO').AsFloat)+ ' AP',CurCol+1.8);  // 3.2
               End;
           End;
           //
       End;  //fim-se
       //
       Inc(CurLabel);
       If Factor=LabelCols-1 Then
            Inc(LabelRow);
         // Proximo
        cdsEtiquetas.Next;
        //
        If (LabelRow>=LabelRows) Then
         Begin
              LabelRow := 0;
              if not (cdsEtiquetas.Eof) Then
                    RVSystem2.BaseReport.NewPage;
         End;
     End;  // fim-do-enquanto
     //
     cdsEtiquetas.EnableControls;
     //
   cdsEtiquetas.Close;
End;

procedure TfrmPedidoEtiqueta.ClickEtiqueta(Sender: TObject);
begin
     DesmarcarEtiqueta(TLabel(Sender).Tag);
     EtiquetaSelecionada := TLabel(sender).Tag;
end;

procedure TfrmPedidoEtiqueta.CriarEtiqueta(NrColunas, NrLinhas: integer);
Var
  X, Y : Integer;
  LarguraColuna, AlturaColuna : Double;
  Etiqueta : TLabel;
  lTag : integer;
  Esquerda, Topo : integer;
begin
     for x := PainelEtiqueta.ControlCount - 1 downto 0 do
     begin
          Etiqueta := Tlabel(PainelEtiqueta.Components[x]);
          PainelEtiqueta.RemoveComponent(Etiqueta);
          Etiqueta.Parent := nil;
          Etiqueta.Free;
          Etiqueta := nil;
          //TLabel(PainelEtiqueta.Components[x]).Parent := nil;
          //FreeAndNil(PainelEtiqueta.Components[x]);
     End;
     PainelEtiqueta.Refresh;

     LarguraColuna := PainelEtiqueta.Width/NrColunas;
     AlturaColuna  := PainelEtiqueta.Height/NrLinhas;
     lTag     := 0;
     Esquerda := 0;
     Topo     := 0;

     for x := 1 to NrColunas do   //      for x := 1 to NrColunas do
     begin
         for y := 1 to NrLinhas do   // for y := 1 to NrLinhas do
          begin
               inc(lTag);
               Etiqueta := TLabel.Create(PainelEtiqueta);
               Etiqueta.Alignment := taCenter;
               Etiqueta.Parent    := PainelEtiqueta;
               Etiqueta.autoSize  := False;
               Etiqueta.Height    := Trunc(AlturaColuna);
               Etiqueta.Width     := Trunc(LarguraColuna);
               Etiqueta.Caption   := InttoStr(lTag);
               Etiqueta.Tag       := lTag;
               Etiqueta.Left      := Esquerda;
               Etiqueta.Top       := Topo;
               Etiqueta.Color     := clWhite;
               Etiqueta.Visible   := true;
               Etiqueta.OnClick   := ClickEtiqueta;

               Topo := Topo + Etiqueta.Height;
          End;
          Topo := 0;
          Esquerda := Esquerda + Etiqueta.Width;
     End;
end;

procedure TfrmPedidoEtiqueta.DesmarcarEtiqueta(EtiquetaInicia: integer);
Var
   x : integer;
begin
     with PainelEtiqueta do
      begin
          for x := 0 to controlcount - 1 do
            if  controls[x] is TLabel then
            begin
                 if (Controls[x].Tag >= EtiquetaInicia) Then
                    TLabel(Controls[x]).Transparent := false
                 Else
                    TLabel(Controls[x]).Transparent := True;
            End;
      End;
end;

procedure TfrmPedidoEtiqueta.rbTipoClick(Sender: TObject);
begin
     if (rbTipo.ItemIndex = 0) Then
       edtETATUAL.Enabled := False
     Else
       edtETATUAL.Enabled := True;
end;

procedure TfrmPedidoEtiqueta.edtETATUALKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
    //
    If (key = #13) and not uFuncoes.Empty(edtETATUAL.Text) Then
    Begin
         If (StrtoInt(edtETATUAL.Text)<0)
           Or (StrtoInt(edtETATUAL.Text)> 65) Then
         Begin
              ShowMessage('Quantidade invalida!!!!'+#13
                         +'Digite um valor entre 1 e 65.');
              edtETATUAL.Clear;
              edtETATUAL.SetFocus;
              Exit;
         End;
    End;

end;

procedure TfrmPedidoEtiqueta.Posicao_Etiqueta(M_POINIC, M_QTETIQ: integer);
Var
      W_POFINA, W_SOMA, W_POATUA : Integer;
begin
      W_POFINA := 65;
      //
      W_SOMA := M_POINIC + M_QTETIQ;
      //
      IF (W_SOMA > W_POFINA) Then
         W_POATUA := W_SOMA - W_POFINA
      Else
         W_POATUA := W_SOMA;
      //
      {if (rbTipo.ItemIndex > 0) Then
        W_POATUA := W_POATUA + 1;}
      //
      if (W_POATUA > W_POFINA) Then
         W_POATUA := W_POATUA - W_POFINA;
      //
      edtETATUAL.Text := InttoStr(W_POATUA);
end;

procedure TfrmPedidoEtiqueta.edtPedidoChange(Sender: TObject);
begin
     if uFuncoes.Empty(edtPedido.Text) Then
      begin
           dmEtiquetas.cdsDados.EmptyDataSet;
           dmEtiquetas.cdsDados.Close;
      End;
end;

procedure TfrmPedidoEtiqueta.FormCreate(Sender: TObject);
begin
     rvPersonalizado.ProjectFile := ExtractFilePath( Application.ExeName )+'\Relatorio\rvZebra1Coluna.rav';
     rvPersonalizado2.ProjectFile := ExtractFilePath( Application.ExeName )+'\Relatorio\rvZebra1ColunaPrecos.rav';
     rvPersonalizado3.ProjectFile := ExtractFilePath( Application.ExeName )+'\Relatorio\rvZebra1ColunaBarras.rav';
end;

end.
