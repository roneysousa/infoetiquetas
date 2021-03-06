unit uCadTranferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, CurrEdit, QuickRpt,
  QRCtrls, Grids, DBGrids, RXDBCtrl, DB, DBTables, uPrincipal;

type
  TfrmTransferencia = class(TForm)
    Panel3: TPanel;
    pnlSuperior: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btGravar: TSpeedButton;
    btCancelar: TSpeedButton;
    spFechar: TSpeedButton;
    edtNRVEND: TEdit;
    edtDAta: TDateEdit;
    edtLoja: TComboBox;
    Label4: TLabel;
    cmbDestino: TComboBox;
    pnlGrid: TPanel;
    GridDados: TRxDBGrid;
    pnlEntrada: TPanel;
    Label5: TLabel;
    spLocalizar: TSpeedButton;
    Label6: TLabel;
    lbl_vlunit: TLabel;
    Image1: TImage;
    edtCDBARR: TEdit;
    edtQTPROD: TEdit;
    pnlBotoes: TPanel;
    lbl_NMPROD: TLabel;
    pnlTOTAL: TPanel;
    pnlVLTOTAL: TPanel;
    btExcluir: TBitBtn;
    btAdicionar: TBitBtn;
    qryItens: TQuery;
    dsItens: TDataSource;
    qryItensTRP_NRSEQU: TStringField;
    qryItensTRP_CDPROD: TStringField;
    qryItensTRP_QTPROD: TFloatField;
    qryProdutos: TQuery;
    qryItensTRP_NMPROD: TStringField;
    qryInclusao: TQuery;
    qryExcluirItem: TQuery;
    qryGravaTrans: TQuery;
    qryEstoque: TQuery;
    qryEstoqueEST_CDLOJA: TStringField;
    qryEstoqueEST_CDPROD: TStringField;
    qryEstoqueEST_DTENTR: TDateField;
    qryEstoqueEST_QTENTR: TFloatField;
    qryEstoqueEST_DTSAID: TDateField;
    qryEstoqueEST_QTSAID: TFloatField;
    qryEstoqueEST_QTPROD: TFloatField;
    qryAtualizaEstoque: TQuery;
    qryHistorico: TQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure spFecharClick(Sender: TObject);
    procedure spLocalizarClick(Sender: TObject);
    procedure edtCDBARRKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDBARRExit(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
    procedure edtQTPRODKeyPress(Sender: TObject; var Key: Char);
    procedure btCancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btGravarClick(Sender: TObject);
    procedure edtDAtaKeyPress(Sender: TObject; var Key: Char);
    procedure edtLojaKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDestinoKeyPress(Sender: TObject; var Key: Char);
    procedure btExcluirClick(Sender: TObject);
    procedure edtCDBARRChange(Sender: TObject);
  private
    Procedure CARREGAR_DADOS;
    Procedure ITENS_TRANSFERENCIA;
    Procedure NOVO;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransferencia: TfrmTransferencia;
  M_NRTRAN, M_NRSEQU, M_FLSAIR : String;
  M_TOVEND, W_VLVEND : Real;
  M_NRITEM : Integer;

implementation

uses udmEtiquetas, uLocProduto, uFuncoes;

{$R *.dfm}

procedure TfrmTransferencia.CARREGAR_DADOS;
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
              cmbDestino.Items.Add(dmEtiquetas.qryLoja.FieldByName('LOJ_NMLOJA').AsString);
              dmEtiquetas.qryLoja.Next;
          End;
     End;
     //
     edtLoja.ItemIndex    := 0;
     cmbDestino.ItemIndex := 1;
end;

procedure TfrmTransferencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     qryProdutos.Close;
     // 
     Action := caFree;
end;

procedure TfrmTransferencia.FormCreate(Sender: TObject);
begin
      qryProdutos.Open;
      // 
      CARREGAR_DADOS;
      NOVO;
      //
      edtDAta.Date := Date();
      btExcluir.Enabled := False;
      //
      M_FLSAIR := 'N';
end;

procedure TfrmTransferencia.spFecharClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmTransferencia.spLocalizarClick(Sender: TObject);
begin
 Try
      Application.CreateForm(TfrmLocProduto, frmLocProduto);
      uLocProduto.frmLocProduto.M_NMFORM := 4;
      frmLocProduto.ShowModal;
  Finally
      frmLocProduto.Free;
      edtCDBARR.SetFocus;
  End;
end;

procedure TfrmTransferencia.edtCDBARRKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TfrmTransferencia.edtCDBARRExit(Sender: TObject);
vAR
    W_CDPROD : string;
begin
     If not uFuncoes.Empty(edtCDBARR.Text) Then
     Begin
          //W_CDPROD := uFuncoes.StrZero(edtCDBARR.Text,13) ;
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
              //codBarras.Texto := W_CDPROD;
              edtQTPROD.Text  := '1';
              //edtCDBARR.Text;
              //
             // Image1.Canvas.Draw(0,0,codBarras.Picture.Bitmap);
          End
          Else
          Begin
               ShowMessage('C�digo de barras n�o cadastro!!!');
               lbl_nmprod.Caption := '.';
               lbl_vlunit.Caption := '0,00';
               edtCDBARR.SetFocus;
               edtCDBARR.Clear;
               Exit;
          End;
     End;

end;

procedure TfrmTransferencia.NOVO;
begin
     Try
          dmEtiquetas.tbParametros.Close;
          dmEtiquetas.tbParametros.Open;
          //
          dmEtiquetas.tbParametros.Edit;
          dmEtiquetas.tbParametros.FieldByName('PAR_NRSEQU').AsFloat :=
              dmEtiquetas.tbParametros.FieldByName('PAR_NRSEQU').AsFloat+1;
          dmEtiquetas.tbParametros.post;
          //
          M_NRSEQU := uFuncoes.StrZero(dmEtiquetas.tbParametros.FieldByName('PAR_NRSEQU').AsString,10);
          //
          edtNRVEND.Text := M_NRSEQU;
     Except
         ShowMessage('Erro ao tentar criar nova venda!!!');
         Close;
     End;
end;

procedure TfrmTransferencia.cmbDestinoExit(Sender: TObject);
begin
     If (edtLoja.Text = cmbDestino.Text) Then
     begin
          ShowMessage('A loja de destino n�o pode ser a'+#13
                     +'mesma de origem!!!');
          cmbDestino.SetFocus;
          Exit; 
     End;
end;

procedure TfrmTransferencia.ITENS_TRANSFERENCIA;
begin
     M_TOVEND := 0;
     qryItens.DisableControls;
     With qryItens do
     begin
          Close;
          //
          ParamByName('pNRSEQU').AsString := edtNRVEND.Text;
          //
          Prepare;
          Open;
     End;
     //
     {While not (qryItens.Eof) do
     Begin
          M_TOVEND := M_TOVEND+qryItensITV_VLSUBT.AsCurrency;
          qryItens.Next;
     End;}
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

procedure TfrmTransferencia.edtQTPRODKeyPress(Sender: TObject;
  var Key: Char);
begin
    If (key = #13) and uFuncoes.Empty(edtCDBARR.Text) Then
    Begin
        ShowMessage('Digite a c�digo do produto!!!');
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
              ParamByName('pNRSEQU').AsString := M_NRSEQU;
              //ParamByName('pNRITEM').AsString := uFuncoes.StrZero(InttoStr(M_NRITEM),3);
              ParamByName('pCDPROD').AsString := uFuncoes.StrZero(edtCDBARR.Text,13);
              ParamByName('pQTPROD').AsFloat  := StrtoFloat(edtQTPROD.Text);
              ParamByName('pIMGBAR').Assign(Image1.Picture.Bitmap);
              //   := dmEtiquetas.qryProduto.FieldByName('PRO_VLVEND').AsFloat;
              //
              ExecSQL;
         End;
         //
         //
         {dmEtiquetas.tbItensVenda.Close;
         dmEtiquetas.tbItensVenda.Filtered := False;
         dmEtiquetas.tbItensVenda.Filter   := 'ITV_NRVEND='+QuotedStr(M_NRVEND)+ ' And ITV_CDPROD='+QuotedStr(uFuncoes.StrZero(edtCDBARR.Text,13))+' And ITV_NRITEM='+QuotedStr(uFuncoes.StrZero(InttoStr(M_NRITEM),3));
         dmEtiquetas.tbItensVenda.Filtered := True;
         dmEtiquetas.tbItensVenda.Open;
         //
         dmEtiquetas.tbItensVenda.Edit;
         dmEtiquetas.tbItensVenda.FieldByName('ITV_IMGBAR').Assign(Image1.Picture.Bitmap);
         dmEtiquetas.tbItensVenda.Post;
         dmEtiquetas.tbItensVenda.Close;}
         //
         ITENS_TRANSFERENCIA;
         edtCDBARR.Clear;
         edtQTPROD.Clear;
         //
         lbl_NMPROD.Caption := '.';
         lbl_vlunit.Caption := '0,00';
         //
         //codBarras.Texto := '0000000000000';
         edtCDBARR.SetFocus;
     Except
         ShowMessage('Error ao tentar incluir item!!!');
     End;
   //
   End;
end;

procedure TfrmTransferencia.btCancelarClick(Sender: TObject);
begin
    Try
        With qryExcluirItem do
        Begin
             SQL.Clear;
             Close;
             SQL.Add('DELETE FROM SACTRP WHERE (TRP_NRSEQU = :pNRSEQU)');
             ParamByName('pNRSEQU').AsString := M_NRSEQU;
             //
             ExecSQL;
        End;
        //
        M_FLSAIR := 'S';
        Close;
    Except

    End;    
end;

procedure TfrmTransferencia.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    //If (M_TOVEND > 0) Then
    ITENS_TRANSFERENCIA;
    If (qryItens.RecordCount > 0)  AND (M_FLSAIR = 'N') Then
    Begin
           If Application.MessageBox('Gravar altera��es?',
               'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
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

procedure TfrmTransferencia.btGravarClick(Sender: TObject);
Var
    M_CDVEND , M_CDLOJA, M_CDLOJ2, M_CDMODA, W_NRSEQU : String;
    M_QTANTE, W_QTPROD, M_QTATUA : Real;
begin
     If uFuncoes.Empty(edtLoja.text) Then
     begin
          Application.MessageBox('Selecione a loja de origem.',
            'ATEN��O', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
          edtLoja.SetFocus;
          Exit;
     End;
     //
     If (edtDAta.text='  /  /    ') Then
     begin
          Application.MessageBox('Digite a data da venda?',
            'ATEN��O', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
          edtDAta.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(cmbDestino.text) Then
     begin
          Application.MessageBox('Selecione a loja de destino.',
            'ATEN��O', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
          cmbDestino.SetFocus;
          Exit;
     End;
     //
     ITENS_TRANSFERENCIA;
     If (qryItens.RecordCount  = 0) Then
     Begin
          Application.MessageBox('N�o h� itens para transfer�ncia!!!',
            'ATEN��O', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
          edtCDBARR.SetFocus;
          Exit;
     End;
     //
     If not uFuncoes.Empty(edtCDBARR.Text) and uFuncoes.Empty(edtQTPROD.Text) Then
     Begin
          Application.MessageBox('Digite a quantidade do produto!!!',
            'ATEN��O', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
          edtQTPROD.SetFocus;
          Exit;
     End;
     //
     {If uFuncoes.Empty(edtNMCLIE.text) Then
     begin
          Application.MessageBox('Digite o nome do cliente?',
            'ATEN��O', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
          edtNMCLIE.SetFocus;
          Exit;
     End;}
     //

     //
     Try
        If (dmEtiquetas.qryLoja.Locate('LOJ_NMLOJA',edtLoja.Text,[]) ) Then
           M_CDLOJA := dmEtiquetas.qryLoja.FieldByName('LOJ_CDLOJA').AsString;
        //
        If (dmEtiquetas.qryLoja.Locate('LOJ_NMLOJA', cmbDestino.Text,[]) ) Then
           M_CDLOJ2 := dmEtiquetas.qryLoja.FieldByName('LOJ_CDLOJA').AsString;
        // Grava Transferencia
        With qryGravaTrans do
        begin
             SQL.Clear;
             Close;
             SQL.Add('INSERT INTO SACTRA (TRA_NRSEQU, TRA_CDLOJ1, TRA_CDLOJ2, TRA_DTTRAN, TRA_HOTRAN, TRA_CDUSUA)');
             SQL.Add('VALUES (:pNRSEQU, :pCDLOJ1, :pCDLOJ2, :pDTTRAN, :pHOTRAN, :pCDUSUA)');
             //
             ParamByName('pNRSEQU').AsString := M_NRSEQU;
             ParamByName('pCDLOJ1').AsString := M_CDLOJA;
             ParamByName('pCDLOJ2').AsString := M_CDLOJ2;
             ParamByName('pDTTRAN').AsDate   := edtData.Date;
             ParamByName('pHOTRAN').AsString := TimetoStr(Time());
             ParamByName('pCDUSUA').AsString := '000';
             //
             ExecSQL;
        End;
        //
        // Atualizar Estoque
        qryItens.DisableControls;
        qryItens.First;
        While not (qryItens.Eof) do
        Begin
          With qryEstoque do
          begin
               Close;
               //
               ParamByName('pCDPROD').AsString := qryItens.FieldByName('TRP_CDPROD').AsString;
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
             ParamByname('pCDPROD').AsString := qryItens.FieldByName('TRP_CDPROD').AsString;
             ParamByname('pDTSAID').AsDate   := edtDAta.Date;
             ParamByname('pQTSAID').AsFloat  := qryItens.FieldByName('TRP_QTPROD').AsFloat;
             //
             ExecSQL;
          End;
          //
          W_QTPROD := qryItens.FieldByName('TRP_QTPROD').AsFloat;
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
          W_NRSEQU := uFuncoes.StrZero(dmEtiquetas.tbParametros.FieldByName('PAR_NRSEQU').AsString,10);
          //
          With qryHistorico do
          begin
               SQL.Clear;
               Close;
               SQL.Add('INSERT INTO SACHIS (HIS_NRSEQU, HIS_CDLOJA, HIS_CDPROD, HIS_DTHIST, HIS_HOHIST, HIS_TPHIST, HIS_QTANTE, HIS_QTPROD, HIS_QTATUA, HIS_CDUSUA)');
               SQL.Add('VALUES (:pNRSEQU, :pCDLOJA, :pCDPROD, :pDTHIST, :pHOHIST, :pTPHIST, :pQTANTE, :pQTPROD, :pQTATUA, :pCDUSUA)');
               //
               ParamByname('pNRSEQU').AsString := W_NRSEQU;
               ParamByname('pCDLOJA').AsString := M_CDLOJA;
               ParamByname('pCDPROD').AsString := qryItens.FieldByName('TRP_CDPROD').AsString;
               ParamByname('pDTHIST').AsDate   := edtDAta.Date;
               ParamByname('pHOHIST').AsString := TimetoStr(Time);
               ParamByname('pTPHIST').AsString := 'T';
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
        Application.MessageBox('Transfer�ncia realizada com sucesso!!!',
            'CONCLUIDO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        //
        qryItens.Close;
        M_FLSAIR := 'S';
        Close;
        //
        //IMPRIMIR;
        //
     Except
         ShowMessage('Error ao tentar gravar venda!!!');
         Close;
     End;
end;

procedure TfrmTransferencia.edtDAtaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If (key = #13) and not uFuncoes.Empty(edtDAta.Text)  Then
    Begin
         key:=#0;
         edtLoja.SetFocus;
    End;
end;

procedure TfrmTransferencia.edtLojaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If (key = #13) and not uFuncoes.Empty(edtLoja.Text)  Then
    Begin
         key:=#0;
         cmbDestino.SetFocus;
    End;
end;

procedure TfrmTransferencia.cmbDestinoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If (key = #13) and not uFuncoes.Empty(cmbDestino.Text)  Then
    Begin
         key:=#0;
         edtCDBARR.SetFocus;
    End;
end;

procedure TfrmTransferencia.btExcluirClick(Sender: TObject);
Var
    W_NRITEM, W_CDPROD : String;
begin
    W_CDPROD := qryItens.FieldByName('TRP_CDPROD').AsString;
    //
    ITENS_TRANSFERENCIA;
    //
    Try
        //
        With qryExcluirItem do
        Begin
             SQL.Clear;
             Close;
             SQL.Add('DELETE FROM SACTRP WHERE (TRP_NRSEQU = :pNRSEQU)');
             SQL.Add('And (TRP_CDPROD = :pCDPROD)');
             //
             ParamByName('pNRSEQU').AsString := M_NRSEQU;
             ParamByName('pCDPROD').AsString := W_CDPROD;
             //
             ExecSQL;
        End;
        //
        ITENS_TRANSFERENCIA;
    Except

    End;
end;

procedure TfrmTransferencia.edtCDBARRChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDBARR.Text) Then
        //codBarras.Texto := '0000000000000';
end;

end.
