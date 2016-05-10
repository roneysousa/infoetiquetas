unit uCadVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, Grids, DBGrids, RXDBCtrl, DB,
  DBTables, Buttons, QuickRpt, QRCtrls, CJVQRBarCode, CurrEdit;

type
  TfrmCadVendas = class(TForm)
    Panel3: TPanel;
    pnlSuperior: TPanel;
    Label1: TLabel;
    edtNRVEND: TEdit;
    edtDAta: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    pnlGrid: TPanel;
    pnlBotoes: TPanel;
    pnlTOTAL: TPanel;
    dsItens: TDataSource;
    edtLoja: TComboBox;
    edtNMVEND: TComboBox;
    qryItens: TQuery;
    GridDados: TRxDBGrid;
    qryItensITV_NRVEND: TStringField;
    qryItensITV_NRITEM: TStringField;
    qryItensITV_CDPROD: TStringField;
    qryItensITV_QTPROD: TFloatField;
    qryProdutos: TQuery;
    qryItensITV_NMPROD: TStringField;
    qryItensITV_VLUNIT: TCurrencyField;
    qryExcluirItem: TQuery;
    btGravar: TSpeedButton;
    btCancelar: TSpeedButton;
    spFechar: TSpeedButton;
    pnlVLTOTAL: TPanel;
    qryGravaVenda: TQuery;
    pnlEntrada: TPanel;
    edtCDBARR: TEdit;
    Label5: TLabel;
    spLocalizar: TSpeedButton;
    Label6: TLabel;
    edtQTPROD: TEdit;
    lbl_vlunit: TLabel;
    Image1: TImage;
    codBarras: TCJVQRBarCode;
    qryInclusao: TQuery;
    Label7: TLabel;
    cmbMODA: TComboBox;
    btExcluir: TBitBtn;
    btAdicionar: TBitBtn;
    lbl_NMPROD: TLabel;
    Label8: TLabel;
    edtDESC: TCurrencyEdit;
    qryItensITV_VLUNI2: TCurrencyField;
    qryItensITV_VLDESC: TFloatField;
    qryItensITV_VLSUBT: TCurrencyField;
    Label9: TLabel;
    edtNMCLIE: TEdit;
    Label10: TLabel;
    edtNRFONE: TMaskEdit;
    qryHistorico: TQuery;
    qryAtualizaEstoque: TQuery;
    qryEstoque: TQuery;
    qryEstoqueEST_CDLOJA: TStringField;
    qryEstoqueEST_CDPROD: TStringField;
    qryEstoqueEST_DTENTR: TDateField;
    qryEstoqueEST_QTENTR: TFloatField;
    qryEstoqueEST_DTSAID: TDateField;
    qryEstoqueEST_QTSAID: TFloatField;
    qryEstoqueEST_QTPROD: TFloatField;
    qryLocProduto: TQuery;
    qryIncProdutoEst: TQuery;
    Label11: TLabel;
    edtENDCLI: TEdit;
    qryItensITV_VLDES2: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure qryItensCalcFields(DataSet: TDataSet);
    procedure btAdicionarClick(Sender: TObject);
    procedure spFecharClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure edtNMVENDKeyPress(Sender: TObject; var Key: Char);
    procedure edtDAtaKeyPress(Sender: TObject; var Key: Char);
    procedure edtLojaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtCDBARRExit(Sender: TObject);
    procedure edtCDBARRKeyPress(Sender: TObject; var Key: Char);
    procedure spLocalizarClick(Sender: TObject);
    procedure edtQTPRODKeyPress(Sender: TObject; var Key: Char);
    procedure edtNMVENDExit(Sender: TObject);
    procedure edtLojaExit(Sender: TObject);
    procedure edtCDBARRChange(Sender: TObject);
    procedure cmbMODAKeyPress(Sender: TObject; var Key: Char);
    procedure cmbMODAExit(Sender: TObject);
    procedure edtQTPRODExit(Sender: TObject);
    procedure edtDESCKeyPress(Sender: TObject; var Key: Char);
    procedure edtDESCChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtNMCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure edtNRFONEKeyPress(Sender: TObject; var Key: Char);
    procedure GridDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtENDCLIKeyPress(Sender: TObject; var Key: Char);
    procedure edtDESCEnter(Sender: TObject);
  private
    Procedure ITENS_VENDA;
    Procedure VENDA;
    Procedure CARREGAR_DADOS;
    Procedure IMPRIMIR;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadVendas: TfrmCadVendas;
  M_NRVEND : String;
  M_NRITEM : Integer;
  M_TOVEND, W_VLVEND : Real;
  M_FLESCA : Boolean;

implementation

Uses uFuncoes, udmEtiquetas, uCadItem, uPrincipal, uRelVendas, uLocProduto,
  uImpVenda;

{$R *.dfm}

procedure TfrmCadVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmCadVendas.FormCreate(Sender: TObject);
begin
     edtDAta.Date := Date();
     M_NRITEM := 0;
     M_TOVEND := 0;
     //
     VENDA;
     CARREGAR_DADOS;
     //
     btGravar.Enabled  := False;
     //pnlEntrada.Enabled := True;
     btExcluir.Enabled := False;
     //
end;

procedure TfrmCadVendas.ITENS_VENDA;
begin
     M_TOVEND := 0;
     qryItens.DisableControls;
     With qryItens do
     begin
          Close;
          //
          ParamByName('pNRVEND').AsString := edtNRVEND.Text;
          //
          Prepare;
          Open;
     End;
     //
     While not (qryItens.Eof) do
     Begin
          M_TOVEND := M_TOVEND+qryItensITV_VLSUBT.AsCurrency;
          qryItens.Next;
     End;
     //
     qryItens.EnableControls;
     //
     If (qryItens.RecordCount > 0) Then
     Begin
         btExcluir.Enabled := True;
         btGravar.Enabled  := True;
         pnlVLTOTAL.Caption := FormatFloat('###,###,##0.#0', M_TOVEND);
     End
     Else
     Begin
       btExcluir.Enabled := False;
       btGravar.Enabled := False;
       M_TOVEND := 0;
       pnlVLTOTAL.Caption := '0,00';
     End;
     //

end;

procedure TfrmCadVendas.VENDA;
begin
     Try
          dmEtiquetas.tbParametros.Close;
          dmEtiquetas.tbParametros.Open;
          //
          dmEtiquetas.tbParametros.Edit;
          dmEtiquetas.tbParametros.FieldByName('PAR_NRVEND').AsFloat :=
              dmEtiquetas.tbParametros.FieldByName('PAR_NRVEND').AsFloat+1;
          //
          M_NRVEND := uFuncoes.StrZero(dmEtiquetas.tbParametros.FieldByName('PAR_NRVEND').AsString,7);
          //
          dmEtiquetas.tbParametros.Cancel;
          //
          edtNRVEND.Text := M_NRVEND;
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Erro ao tentar criar nova venda!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           Close;
        End;
     End;
end;

procedure TfrmCadVendas.qryItensCalcFields(DataSet: TDataSet);
begin
     qryItensITV_VLSUBT.AsCurrency :=
       //(qryItensITV_QTPROD.AsFloat*qryItensITV_VLUNI2.AsFloat)
         (qryItensITV_VLUNI2.AsFloat-uFuncoes.Gerapercentual(qryItensITV_VLUNI2.AsFloat,qryItensITV_VLDESC.AsFloat))
           *qryItensITV_QTPROD.AsFloat ;
     //
     If (qryItensITV_VLDESC.Value > 0) Then
       qryItensITV_VLDES2.Value :=
          FormatFloat('#0.#0',qryItensITV_VLDESC.Value)+'%';
end;

procedure TfrmCadVendas.CARREGAR_DADOS;
begin
     With dmEtiquetas.qryLoja do
     begin
          Close;
          //
          Prepare;
          Open;
          First;
     End;
     //
     If (dmEtiquetas.qryLoja.RecordCount > 0) Then
     begin
          While not (dmEtiquetas.qryLoja.Eof) do
          Begin
              edtLoja.Items.Add(dmEtiquetas.qryLoja.FieldByName('LOJ_NMLOJA').AsString);
              dmEtiquetas.qryLoja.Next;
          End;
     End;
     //
     edtLoja.ItemIndex := 0;
     //
     With dmEtiquetas.qryVendedor do
     begin
          Close;
          //
          Prepare;
          Open;
          First;
     End;
     //
     If (dmEtiquetas.qryVendedor.RecordCount > 0) Then
     begin
          While not (dmEtiquetas.qryVendedor.Eof) do
          Begin
              edtNMVEND.Items.Add(dmEtiquetas.qryVendedor.FieldByName('VEN_NMVEND').AsString);
              dmEtiquetas.qryVendedor.Next;
          End;
     End;
     //
     edtNMVEND.ItemIndex := 0;
     //
     With dmEtiquetas.qryModalidade do
     begin
          Close;
          //
          Prepare;
          Open;
          First;
     End;
     //
     If (dmEtiquetas.qryModalidade.RecordCount > 0) Then
     begin
          While not (dmEtiquetas.qryModalidade.Eof) do
          Begin
              cmbMODA.Items.Add(dmEtiquetas.qryModalidade.FieldByName('MOD_NMMODA').AsString);
              dmEtiquetas.qryModalidade.Next;
          End;
     End;
     //
     cmbMODA.ItemIndex := 0;
end;

procedure TfrmCadVendas.btAdicionarClick(Sender: TObject);
begin
 Try
      Application.CreateForm(TfrmCadItem, frmCadItem);
      uCadItem.W_NRVEND := M_NRVEND;
      frmCadItem.ShowModal;
  Finally
      frmCadItem.Free;
      ITENS_VENDA;
      //btAdicionar.SetFocus;
  End;
end;

procedure TfrmCadVendas.spFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmCadVendas.btGravarClick(Sender: TObject);
Var
    M_CDVEND , M_CDLOJA, M_CDMODA, M_NRSEQU, N_NRSEQU : String;
    M_QTANTE, W_QTPROD, M_QTATUA : Real;
    W_QTPRO2 : Double;
begin
     If uFuncoes.Empty(edtLoja.text) Then
     begin
          Application.MessageBox('Selecione a loja?',
            'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
          edtLoja.SetFocus;
          Exit;
     End;
     //
     If (edtDAta.text='  /  /    ') Then
     begin
          Application.MessageBox('Digite a data da venda?',
            'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
          edtDAta.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtNMVEND.text) Then
     begin
          Application.MessageBox('Selecione o vendedor.',
            'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
          edtNMVEND.SetFocus;
          Exit;
     End;
     //
     If (M_TOVEND = 0) Then
     Begin
          Application.MessageBox('Total da venda igual a Zero!!!',
            'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
          //btAdicionar.SetFocus;
          edtNMVEND.SetFocus;
          Exit;
     End;
     //
     If not uFuncoes.Empty(edtCDBARR.Text) and uFuncoes.Empty(edtQTPROD.Text) Then
     Begin
          Application.MessageBox('Digite a quantidade do produto!!!',
            'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
          edtQTPROD.SetFocus;
          Exit;
     End;
     //
     {If uFuncoes.Empty(edtNMCLIE.text) Then
     begin
          Application.MessageBox('Digite o nome do cliente?',
            'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
          edtNMCLIE.SetFocus;
          Exit;
     End;}
     //

     //
     Try
        If (dmEtiquetas.qryLoja.Locate('LOJ_NMLOJA',edtLoja.Text,[]) ) Then
           M_CDLOJA := dmEtiquetas.qryLoja.FieldByName('LOJ_CDLOJA').AsString;
        //
        If (dmEtiquetas.qryVendedor.Locate('VEN_NMVEND',edtNMVEND.Text,[]) ) Then
           M_CDVEND := dmEtiquetas.qryVendedor.FieldByName('VEN_CDVEND').AsString;
        //
        If (dmEtiquetas.qryModalidade.Locate('MOD_NMMODA',cmbMODA.Text,[]) ) Then
           M_CDMODA := dmEtiquetas.qryModalidade.FieldByName('MOD_CDMODA').AsString;
        //
        dmEtiquetas.tbParametros.Edit;
        dmEtiquetas.tbParametros.FieldByName('PAR_NRVEND').AsFloat :=
              dmEtiquetas.tbParametros.FieldByName('PAR_NRVEND').AsFloat+1;
        dmEtiquetas.tbParametros.Post;
        //
        M_NRVEND := uFuncoes.StrZero(dmEtiquetas.tbParametros.FieldByName('PAR_NRVEND').AsString,7);
        // Grava venda
        With qryGravaVenda do
        begin
             Close;
             //
             ParamByName('pNRVEND').AsString := M_NRVEND;
             ParamByName('pCDLOJA').AsString := M_CDLOJA;
             ParamByName('pCDMODA').AsString := M_CDMODA;
             ParamByName('pCDVEND').AsString := M_CDVEND;
             ParamByName('pDTVEND').AsDate   := edtData.Date;
             ParamByName('pHOVEND').AsString := TimetoStr(Time());
             ParamByName('pVLVEND').AsCurrency := M_TOVEND;
             ParamByName('pVLPAGO').AsCurrency := M_TOVEND;
             ParamByName('pVLTROC').AsCurrency := 0;
             ParamByName('pFLSITU').AsString := 'A';
             ParamByName('pCDUSUA').AsString := '000';
             ParamByName('pNMCLIE').AsString := edtNMCLIE.Text;
             ParamByName('pENDCLI').AsString := edtENDCLI.Text;
             ParamByName('pNRFONE').AsString := edtNRFONE.Text;
             //
             ExecSQL;
        End;
        //
        // Atualizar Estoque
        qryItens.DisableControls;
        qryItens.First;
        While not (qryItens.Eof) do
        Begin
          //
          With qryLocProduto do
          Begin
               Close;
               //
               ParamByName('pCDPROD').AsString := qryItens.FieldByName('ITV_CDPROD').AsString;
               ParamByName('pCDLOJA').AsString := M_CDLOJA;
               //
               Prepare;
               Open;
          End;
          //
          If (qryLocProduto.RecordCount = 0) Then
          Begin
               //ShowMessage('Incluir...');
               //
               With qryIncProdutoEst do
               Begin
                   Close;
                   //
                   ParamByname('pCDLOJA').AsString := M_CDLOJA;
                   ParamByname('pCDPROD').AsString := qryItens.FieldByName('ITV_CDPROD').AsString;
                   ParamByname('pDTENTR').AsDate   := edtDAta.Date;
                   ParamByname('pQTENTR').AsFloat  := 0;
                   ParamByname('pQTPROD').AsFloat  := 0;
                   //
                   ExecSQL;
               End;
               // Tabela Historico
               IF (dmEtiquetas.tbParametros.Active = False) THEN
                   dmEtiquetas.tbParametros.Open;
               //
               dmEtiquetas.tbParametros.Edit;
               dmEtiquetas.tbParametros.FieldByName('PAR_NRSEQU').AsFloat :=
                    dmEtiquetas.tbParametros.FieldByName('PAR_NRSEQU').AsFloat+1;
                dmEtiquetas.tbParametros.Post;
                //
               N_NRSEQU := uFuncoes.StrZero(dmEtiquetas.tbParametros.FieldByName('PAR_NRSEQU').AsString,10);
               // Historico
               With qryHistorico do
               begin
                    SQL.Clear;
                    Close;
                    SQL.Add('INSERT INTO SACHIS (HIS_NRSEQU, HIS_CDLOJA, HIS_CDPROD, HIS_DTHIST, HIS_HOHIST, HIS_TPHIST, HIS_QTANTE, HIS_QTPROD, HIS_QTATUA, HIS_CDUSUA)');
                    SQL.Add('VALUES (:pNRSEQU, :pCDLOJA, :pCDPROD, :pDTHIST, :pHOHIST, :pTPHIST, :pQTANTE, :pQTPROD, :pQTATUA, :pCDUSUA)');
                    //
                    ParamByname('pNRSEQU').AsString := N_NRSEQU;
                    ParamByname('pCDLOJA').AsString := M_CDLOJA;
                    ParamByname('pCDPROD').AsString := qryItens.FieldByName('ITV_CDPROD').AsString;
                    ParamByname('pDTHIST').AsDate   := edtDAta.Date;
                    ParamByname('pHOHIST').AsString := TimetoStr(Time);
                    ParamByname('pTPHIST').AsString := 'E';
                    ParamByname('pQTANTE').AsFloat  := 0;
                    ParamByname('pQTPROD').AsFloat  := 0;
                    ParamByname('pQTATUA').AsFloat  := 0;
                    ParamByname('pCDUSUA').AsString := uPrincipal.M_CDUSUA;
                    //
                    ExecSQL;
               End;
          End;
          //
          With qryEstoque do
          begin
               Close;
               //
               ParamByName('pCDPROD').AsString := qryItens.FieldByName('ITV_CDPROD').AsString;
               ParamByName('pCDLOJA').AsString := M_CDLOJA;
               //
               Prepare;
               Open;
          end;
          //
          M_QTANTE := qryEstoque.FieldByName('EST_QTPROD').AsFloat;
          //
          With qryAtualizaEstoque do
          begin
             SQL.Clear;
             Close;
             SQL.Add('Update SACEST SET EST_DTSAID = :pDTSAID, EST_QTSAID = :pQTSAID, EST_QTPROD = EST_QTPROD - :pQTSAID');
             SQL.Add('Where (EST_CDLOJA = :pCDLOJA) and (EST_CDPROD = :pCDPROD)');
             //
             ParamByname('pCDLOJA').AsString := M_CDLOJA;
             ParamByname('pCDPROD').AsString := qryItens.FieldByName('ITV_CDPROD').AsString;
             ParamByname('pDTSAID').AsDate   := edtDAta.Date;
             ParamByname('pQTSAID').AsFloat  := qryItens.FieldByName('ITV_QTPROD').AsFloat;
             //ParamByname('pQTPROD').AsFloat  := edtQTATUA.Value-edtQTENTR.Value;
             //
             ExecSQL;
          End;
          //
          W_QTPROD := qryItens.FieldByName('ITV_QTPROD').AsFloat;
          M_QTATUA := M_QTANTE-W_QTPROD;
          // Tabela Historico
          IF (dmEtiquetas.tbParametros.Active = False) THEN
             dmEtiquetas.tbParametros.Open;
          //
          dmEtiquetas.tbParametros.Edit;
          dmEtiquetas.tbParametros.FieldByName('PAR_NRSEQU').AsFloat :=
              dmEtiquetas.tbParametros.FieldByName('PAR_NRSEQU').AsFloat+1;
          dmEtiquetas.tbParametros.Post;
          //
          M_NRSEQU := uFuncoes.StrZero(dmEtiquetas.tbParametros.FieldByName('PAR_NRSEQU').AsString,10);
          //
          With qryHistorico do
          begin
               SQL.Clear;
               Close;
               SQL.Add('INSERT INTO SACHIS (HIS_NRSEQU, HIS_CDLOJA, HIS_CDPROD, HIS_DTHIST, HIS_HOHIST, HIS_TPHIST, HIS_QTANTE, HIS_QTPROD, HIS_QTATUA, HIS_CDUSUA)');
               SQL.Add('VALUES (:pNRSEQU, :pCDLOJA, :pCDPROD, :pDTHIST, :pHOHIST, :pTPHIST, :pQTANTE, :pQTPROD, :pQTATUA, :pCDUSUA)');
               //
               ParamByname('pNRSEQU').AsString := M_NRSEQU;
               ParamByname('pCDLOJA').AsString := M_CDLOJA;
               ParamByname('pCDPROD').AsString := qryItens.FieldByName('ITV_CDPROD').AsString;
               ParamByname('pDTHIST').AsDate   := edtDAta.Date;
               ParamByname('pHOHIST').AsString := TimetoStr(Time);
               ParamByname('pTPHIST').AsString := 'V';
               ParamByname('pQTANTE').AsFloat  := M_QTANTE;
               ParamByname('pQTPROD').AsFloat  := W_QTPROD;
               ParamByname('pQTATUA').AsFloat  := M_QTATUA;
               ParamByname('pCDUSUA').AsString := uPrincipal.M_CDUSUA;
               //
               ExecSQL;
          End;
          // Proximo Registro
          qryItens.Next;
        End;
        //
        qryItens.EnableControls;
        //
        Application.MessageBox(PChar('Venda '+M_NRVEND+ ' realizada com sucesso!!!'),
            'CONCLUÍDO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        //ShowMessage('Venda '+M_NRVEND+ ' realizada com sucesso!!!');
        //
        If (dmEtiquetas.tbParametros.Active = False) Then
            dmEtiquetas.tbParametros.Open;
        //
        If (dmEtiquetas.tbParametrosPAR_MDIMPR.AsString = '2') Then
        Begin
             Application.CreateForm(TfrmRelImpVenda, frmRelImpVenda);
             pnlVLTOTAL.Visible := False;
             btExcluir.Visible := False;
             //
             W_QTPRO2 := 0;
             qryItens.DisableControls;
             qryItens.First;
             While not (qryItens.Eof) do
             Begin
                  W_QTPRO2 := W_QTPRO2+qryItens.FieldByName('ITV_QTPROD').AsFloat;
                  qryItens.Next;
             End;
             qryItens.EnableControls;
             //
             Try
                 With frmRelImpVenda do
                 Begin
                      txtCLIENTE.Caption := edtNMCLIE.Text;
                      txtENDERECO.Caption := edtENDCLI.Text;
                      txtFONE.Caption := edtNRFONE.Text;
                      //
                      txtFMPAGA.Caption  := cmbMODA.Text;
                      txtTOTAL.Caption   := FormatFloat('###,###,##0.#0', M_TOVEND);
                      txtQTPROD.Caption  := FormatFloat('###,##0', W_QTPRO2);
                      //
                      qrImpressaoVenda.Preview;
                 End;
                 //
             Finally
                  frmRelImpVenda.Free;
                  pnlVLTOTAL.Visible := True;
                  btExcluir.Visible := True;
                  pnlVLTOTAL.Caption := '0,00';
                  M_TOVEND := 0;
                  Close;
             End;
             //
        End
        Else
            IMPRIMIR;
        //
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar venda!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           Close;
        End;
     End;
end;

procedure TfrmCadVendas.btCancelarClick(Sender: TObject);
begin
    Try
        With qryExcluirItem do
        Begin
             SQL.Clear;
             Close;
             SQL.Add('DELETE FROM SACITV WHERE (ITV_NRVEND = :pNRVEND)');
             ParamByName('pNRVEND').AsString := M_NRVEND;
             //
             ExecSQL;
        End;
        //
        Close;
    Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar cancelar venda!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
    End;
end;

procedure TfrmCadVendas.btExcluirClick(Sender: TObject);
Var
    W_NRITEM : String;
begin
    W_NRITEM := qryItens.FieldByName('ITV_NRITEM').AsString;
    //
    ITENS_VENDA;
    //
    Try
        //
        With qryExcluirItem do
        Begin
             SQL.Clear;
             Close;
             SQL.Add('DELETE FROM SACITV WHERE (ITV_NRVEND = :pNRVEND)');
             SQL.Add('And (ITV_NRITEM = :pNRITEM)');
             //
             ParamByName('pNRVEND').AsString := M_NRVEND;
             ParamByName('pNRITEM').AsString := W_NRITEM;
             //
             ExecSQL;
        End;
        //
        ITENS_VENDA;
    Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           Exit;           
        End;
    End;
end;

procedure TfrmCadVendas.edtNMVENDKeyPress(Sender: TObject; var Key: Char);
begin
    If (key = #13) and not uFuncoes.Empty(edtNMVEND.Text)
      And not uFuncoes.Empty(edtLoja.Text)
      And not uFuncoes.Empty(cmbMODA.Text)
      And not uFuncoes.Empty(edtNMVEND.Text) Then
    Begin
         key:=#0;
         //
         pnlEntrada.Enabled := True;
         edtCDBARR.Clear;
         edtCDBARR.SetFocus;
    End;
end;

procedure TfrmCadVendas.edtDAtaKeyPress(Sender: TObject; var Key: Char);
begin
    If (key = #13) and not uFuncoes.Empty(edtDAta.Text)  Then
    Begin
         key:=#0;
         cmbMODA.SetFocus; 
         //edtLoja.SetFocus;
    End;
end;

procedure TfrmCadVendas.edtLojaKeyPress(Sender: TObject; var Key: Char);
begin
    If (key = #13) and not uFuncoes.Empty(edtLoja.Text)  Then
    Begin
         key:=#0;
         edtNMVEND.SetFocus;
    End;
end;

procedure TfrmCadVendas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);

begin
    // Se total do pedido for maior que Zero
    //If (StrtoFloat(pnlVLTOTAL.Caption)  > 0) Then
    If (M_TOVEND > 0) Then
    Begin
           If Application.MessageBox('Gravar alterações?',
               'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
           begin
                CanClose := False;
                Exit;
           End
           Else
           begin
                btCancelarClick(Sender);
                CanClose := True;
                Exit;
            End;
    End
    Else
    begin
         CanClose := True;
         Exit;
    End;
end;

procedure TfrmCadVendas.IMPRIMIR;
begin
 Try
      Application.CreateForm(TfrmRelVendas, frmRelVendas);
      //
      With frmRelVendas do
      Begin
           With qryProdutos do
           Begin
                SQL.Clear;
                Close;
                SQL.Add('Select PRO_CDPROD, PRO_CDBARR, PRO_NMPROD, PRO_VLVEND');
                SQL.Add('from "SACPRO.DBF" order by PRO_NMPROD');
                Prepare;
                Open;
           End;
           //
           txtData.Caption := edtDAta.Text;
           txtLOJA.Caption := edtLoja.Text;
           txtNMVEND.Caption := edtNMVEND.Text;
           txtTOTALVENDA.Caption := FormatFloat('###,###,##0.#0',M_TOVEND);
           txtNMMODA.Caption := cmbMODA.Text;
           txtCLIEN.Caption  := edtNMCLIE.Text;
           txtFONE.Caption   := edtNRFONE.Text;
           //
           With qryItensVendas do
           Begin
                Close;
                ParamByName('pNRVEND').AsString := M_NRVEND;
                //
                Prepare;
                Open;
           End;
           //
           pnlVLTOTAL.Visible := fALSE;
           btExcluir.Visible := fALSE;
           //
           qrRelVendas.Preview;
      End;
  Finally
      frmRelVendas.Free;
      pnlVLTOTAL.Visible := True;
      btExcluir.Visible := True;
      pnlVLTOTAL.Caption := '0,00';
      M_TOVEND := 0;
      Close;
      //
  End;
end;

procedure TfrmCadVendas.edtCDBARRExit(Sender: TObject);
vAR
    W_CDPROD : string;
begin
     If not uFuncoes.Empty(edtCDBARR.Text) Then
     Begin
          If Length(uFuncoes.StrZero(edtCDBARR.Text,13))=14 Then
          Begin
              W_CDPROD := uFuncoes.StrZero(edtCDBARR.Text,13) ;
              W_CDPROD := Copy(W_CDPROD,1,12)+Copy(W_CDPROD,14,1);
          End
          Else
              W_CDPROD := uFuncoes.StrZero(edtCDBARR.Text,13);
          //
          With dmEtiquetas.qryProduto do
          Begin
               SQL.Clear;
               Close;
               Sql.add('Select * from SACPRO Where (PRO_CDBARR = :pCDBARR)');
               Sql.add('order by PRO_NMPROD');
               ParamByName('pCDBARR').AsString := W_CDPROD;
               Prepare;
               open;
          End;
          //
          If (dmEtiquetas.qryProduto.Locate('PRO_CDBARR',W_CDPROD,[])) Then
          begin
              lbl_nmprod.Caption := dmEtiquetas.qryProduto.FieldByName('PRO_NMPROD').AsString;
              lbl_vlunit.Caption := FormatFloat('###,##0.#0',dmEtiquetas.qryProduto.FieldByName('PRO_VLVEND').AsFloat);
              //
              edtCDBARR.Text  := W_CDPROD;
              codBarras.Texto := W_CDPROD;
              //edtQTPROD.Text  := '1';
              edtQTPROD.Clear ;
              //edtCDBARR.Text;
              //
              Image1.Canvas.Draw(0,0,codBarras.Picture.Bitmap);
              M_FLESCA := False;
          End
          Else
          Begin
               ShowMessage('Código de barras não cadastro!!!');
               lbl_nmprod.Caption := '.';
               lbl_vlunit.Caption := '0,00';
               edtCDBARR.SetFocus;
               edtCDBARR.Clear;
               Exit;
          End;
     End;
end;

procedure TfrmCadVendas.edtCDBARRKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
    //
    If (key = #13) and uFuncoes.Empty(edtCDBARR.Text)  Then
    Begin
         key:=#0;
         spLocalizarClick(Sender);
    End;
    //
    If (key = #13) and NOT uFuncoes.Empty(edtCDBARR.Text)  Then
    Begin
         key:=#0;
         edtQTPROD.SetFocus;
    End;
end;

procedure TfrmCadVendas.spLocalizarClick(Sender: TObject);
begin
 Try
      Application.CreateForm(TfrmLocProduto, frmLocProduto);
      uLocProduto.frmLocProduto.M_NMFORM := 1;
      frmLocProduto.ShowModal;
  Finally
      frmLocProduto.Free;
      If not uFuncoes.Empty(edtCDBARR.Text) Then
          edtQTPROD.SetFocus 
      Else
          edtCDBARR.SetFocus;
  End;
end;

procedure TfrmCadVendas.edtQTPRODKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13, #27] ) then
        key:=#0;
    //
    If (key = #27) and uFuncoes.Empty(edtQTPROD.Text) Then
    Begin
         M_FLESCA := True;
         edtCDBARR.Clear;
         edtCDBARR.SetFocus;
         Exit;
    End;
    //
    If (key = #13) and uFuncoes.Empty(edtCDBARR.Text) Then
    Begin
        ShowMessage('Digite a código do produto!!!');
        edtQTPROD.Clear;
        edtCDBARR.SetFocus;
        Exit;
    End;
    //
    If (key = #13) and not uFuncoes.Empty(edtCDBARR.Text)
       and not uFuncoes.Empty(edtQTPROD.Text)  Then
    Begin
         key:=#0;
         edtDESC.SetFocus;
         Exit; 
         //
     {Try
        M_NRITEM :=  M_NRITEM+1;
        //
         With qryInclusao do
         Begin
              Close;
              //
              ParamByName('pNRVEND').AsString := M_NRVEND;
              ParamByName('pNRITEM').AsString := uFuncoes.StrZero(InttoStr(M_NRITEM),3);
              ParamByName('pCDPROD').AsString := uFuncoes.StrZero(edtCDBARR.Text,13);
              ParamByName('pQTPROD').AsFloat  := StrtoFloat(edtQTPROD.Text);
              //
              ExecSQL;
         End;
         //
         //
         dmEtiquetas.tbItensVenda.Close;
         dmEtiquetas.tbItensVenda.Filtered := False;
         dmEtiquetas.tbItensVenda.Filter   := 'ITV_NRVEND='+QuotedStr(M_NRVEND)+ ' And ITV_CDPROD='+QuotedStr(uFuncoes.StrZero(edtCDBARR.Text,13));
         dmEtiquetas.tbItensVenda.Filtered := True;
         dmEtiquetas.tbItensVenda.Open;
         //
         dmEtiquetas.tbItensVenda.Edit;
         dmEtiquetas.tbItensVenda.FieldByName('ITV_IMGBAR').Assign(Image1.Picture.Bitmap);
         dmEtiquetas.tbItensVenda.Post;
         dmEtiquetas.tbItensVenda.Close;
         //
         ITENS_VENDA;
         edtCDBARR.Clear;
         edtQTPROD.Clear;
         //
         lbl_NMPROD.Caption := '.';
         lbl_vlunit.Caption := '0,00';
         //
         codBarras.Texto := '0000000000000';
         edtCDBARR.SetFocus;
     Except
         ShowMessage('Error ao tentar incluir item!!!');
     End;                   }
   //
   End;
end;

procedure TfrmCadVendas.edtNMVENDExit(Sender: TObject);
begin
    If not uFuncoes.Empty(edtNMVEND.Text)
      And not uFuncoes.Empty(cmbMODA.Text)
      And not uFuncoes.Empty(edtLoja.Text)
      And not uFuncoes.Empty(edtNMVEND.Text) Then
    Begin
         //
         pnlEntrada.Enabled := True;
         edtCDBARR.Clear;
         edtCDBARR.SetFocus;
    End;
end;

procedure TfrmCadVendas.edtLojaExit(Sender: TObject);
begin
    If not uFuncoes.Empty(edtNMVEND.Text)
      And not uFuncoes.Empty(cmbMODA.Text)
      And not uFuncoes.Empty(edtLoja.Text)
      And not uFuncoes.Empty(edtNMVEND.Text) Then
    Begin
         //
         pnlEntrada.Enabled := True;
         //
         edtCDBARR.SetFocus;
         edtCDBARR.Clear;
    End;
end;

procedure TfrmCadVendas.edtCDBARRChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDBARR.Text) Then
     Begin
          lbl_NMPROD.Caption := '.';
          lbl_vlunit.Caption := '0,00';
          codBarras.Texto := '0000000000000';
          edtQTPROD.Clear;
     End;
end;

procedure TfrmCadVendas.cmbMODAKeyPress(Sender: TObject; var Key: Char);
begin
    If (key = #13) and not uFuncoes.Empty(edtDAta.Text)  Then
    Begin
         key:=#0;
         edtLoja.SetFocus;
    End;
end;

procedure TfrmCadVendas.cmbMODAExit(Sender: TObject);
begin
    If not uFuncoes.Empty(edtNMVEND.Text)
      And not uFuncoes.Empty(cmbMODA.Text) 
      And not uFuncoes.Empty(edtLoja.Text)
      And not uFuncoes.Empty(edtNMVEND.Text) Then
    Begin
         //
         pnlEntrada.Enabled := True;
         //
         edtCDBARR.SetFocus;
         edtCDBARR.Clear;
    End;
end;

procedure TfrmCadVendas.edtQTPRODExit(Sender: TObject);
begin
     If uFuncoes.Empty(edtQTPROD.Text) and (M_FLESCA = False) Then
     Begin
         ShowMessage('Digite a quantidade!!!');
         edtQTPROD.SetFocus;
         Exit;
     End;
     //
     If (StrtoFloat(edtQTPROD.Text)<=0) Then
     Begin
         ShowMessage('Quantidade inválida!!!');
         edtQTPROD.Clear;
         edtQTPROD.SetFocus;
         Exit;
     End;
     //
     If (StrtoFloat(edtQTPROD.Text)>0 ) Then
     Begin
          lbl_vlunit.Caption := FormatFloat('###,##0.#0',
             dmEtiquetas.qryProduto.FieldByName('PRO_VLVEND').AsFloat*StrtoFloat(edtQTPROD.Text));
     End;
end;

procedure TfrmCadVendas.edtDESCKeyPress(Sender: TObject; var Key: Char);
begin
    {If not( key in['0'..'9',#8, #13] ) then
        key:=#0;}
    //
    If (key = #13) and uFuncoes.Empty(edtCDBARR.Text) Then
    Begin
        ShowMessage('Digite a código do produto!!!');
        edtQTPROD.Clear;
        edtCDBARR.SetFocus;
        Exit;
    End;
    //
    If (key = #13) and not uFuncoes.Empty(edtCDBARR.Text)
       and not uFuncoes.Empty(edtQTPROD.Text)  Then
    Begin
         key:=#0;
         //
     Try
        M_NRITEM :=  M_NRITEM+1;
        //
         With qryInclusao do
         Begin
              Close;
              //
              ParamByName('pNRVEND').AsString := M_NRVEND;
              ParamByName('pNRITEM').AsString := uFuncoes.StrZero(InttoStr(M_NRITEM),3);
              ParamByName('pCDPROD').AsString := uFuncoes.StrZero(edtCDBARR.Text,13);
              ParamByName('pQTPROD').AsFloat  := StrtoFloat(edtQTPROD.Text);
              ParamByName('pVLUNI2').AsFloat  := dmEtiquetas.qryProduto.FieldByName('PRO_VLVEND').AsFloat;
              ParamByName('pVLDESC').AsFloat  := edtDESC.Value;
              //
              ExecSQL;
         End;
         //
         dmEtiquetas.tbItensVenda.Close;
         dmEtiquetas.tbItensVenda.Filtered := False;
         dmEtiquetas.tbItensVenda.Filter   := 'ITV_NRVEND='+QuotedStr(M_NRVEND)+ ' And ITV_CDPROD='+QuotedStr(uFuncoes.StrZero(edtCDBARR.Text,13))+' And ITV_NRITEM='+QuotedStr(uFuncoes.StrZero(InttoStr(M_NRITEM),3));
         dmEtiquetas.tbItensVenda.Filtered := True;
         dmEtiquetas.tbItensVenda.Open;
         //
         dmEtiquetas.tbItensVenda.Edit;
         dmEtiquetas.tbItensVenda.FieldByName('ITV_IMGBAR').Assign(Image1.Picture.Bitmap);
         dmEtiquetas.tbItensVenda.Post;
         dmEtiquetas.tbItensVenda.Close;
         //
         ITENS_VENDA;
         edtCDBARR.Clear;
         edtQTPROD.Clear;
         edtDESC.Value := 0;
         //
         lbl_NMPROD.Caption := '.';
         lbl_vlunit.Caption := '0,00';
         //
         codBarras.Texto := '0000000000000';
         edtCDBARR.SetFocus;
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar incluir item!!!.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           Exit;
        End;
     End;
   //
   End;
end;

procedure TfrmCadVendas.edtDESCChange(Sender: TObject);
Var
   W_VLUNIT, W_VLPROD,W_VLDESC : Real;
begin
     //
     If (edtDESC.Value > 0) Then
     Begin
         //W_VLPROD := StrtoFloat(lbl_vlunit.Caption);
         W_VLUNIT := dmEtiquetas.qryProduto.FieldByName('PRO_VLVEND').AsFloat;
         W_VLDESC := edtDESC.Value;
         W_VLVEND := StrtoFloat(edtQTPROD.Text)*(W_VLUNIT-uFuncoes.Gerapercentual(W_VLUNIT,W_VLDESC));
         //
         lbl_vlunit.Caption := FormatFloat('###,##0.#0',W_VLVEND);
     End
     Else
     Begin
          W_VLDESC := edtDESC.Value;
          W_VLVEND := dmEtiquetas.qryProduto.FieldByName('PRO_VLVEND').AsFloat;
     End;
end;

procedure TfrmCadVendas.FormActivate(Sender: TObject);
begin
     edtNMCLIE.SetFocus;
     //edtCDBARR.SetFocus;
end;

procedure TfrmCadVendas.edtNMCLIEKeyPress(Sender: TObject; var Key: Char);
begin
    If (key = #13) Then
    Begin
         key:=#0;
         edtENDCLI.SetFocus;
         //edtNRFONE.SetFocus;
         //
    End;
end;

procedure TfrmCadVendas.edtNRFONEKeyPress(Sender: TObject; var Key: Char);
begin
    If (key = #13) Then
    Begin
         key:=#0;
         edtCDBARR.SetFocus;
         //
    End;
end;

procedure TfrmCadVendas.GridDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Shift = [ssCtrl]) and (Key = 46) Then
        KEY := 0;
end;

procedure TfrmCadVendas.edtENDCLIKeyPress(Sender: TObject; var Key: Char);
begin
    If (key = #13) Then
    Begin
         key:=#0;
         edtNRFONE.SetFocus;
         //
    End;
end;

procedure TfrmCadVendas.edtDESCEnter(Sender: TObject);
begin
     If uFuncoes.Empty(edtQTPROD.Text) Then
        edtQTPROD.SetFocus;
end;

End.
