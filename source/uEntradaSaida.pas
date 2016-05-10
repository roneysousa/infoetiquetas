unit uEntradaSaida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Buttons, DB, DBTables, CurrEdit,
  Mask, ToolEdit, uPrincipal;

type
  TfrmEntradaSaida = class(TForm)
    Panel3: TPanel;
    dbtNMPROD: TDBText;
    Panel2: TPanel;
    Panel4: TPanel;
    edtCDPROD: TEdit;
    Label1: TLabel;
    spLocalizar: TSpeedButton;
    qryEstoque: TQuery;
    qryIncProduto: TQuery;
    Label3: TLabel;
    edtNMPROD: TEdit;
    edtDTENT: TDateEdit;
    edtQTATUA: TCurrencyEdit;
    edtQTENTR: TCurrencyEdit;
    qryLoja: TQuery;
    edtQTPROD: TCurrencyEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btConfirma: TBitBtn;
    btCancelar: TBitBtn;
    btFechar: TBitBtn;
    pnlDados: TPanel;
    qryAtualizaEstoque: TQuery;
    cmbTPMOVI: TComboBox;
    Label8: TLabel;
    qryProduto: TQuery;
    qryProdutoPRO_CDPROD: TStringField;
    qryProdutoPRO_CDBARR: TStringField;
    qryProdutoPRO_NMPROD: TStringField;
    qryEstoqueEST_CDLOJA: TStringField;
    qryEstoqueEST_CDPROD: TStringField;
    qryEstoqueEST_DTENTR: TDateField;
    qryEstoqueEST_QTENTR: TFloatField;
    qryEstoqueEST_DTSAID: TDateField;
    qryEstoqueEST_QTSAID: TFloatField;
    qryEstoqueEST_QTPROD: TFloatField;
    qryLojaLOJ_CDLOJA: TStringField;
    qryLojaLOJ_NMLOJA: TStringField;
    edtCDLOJA: TComboBox;
    qryHistorico: TQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure spLocalizarClick(Sender: TObject);
    procedure edtCDLOJAKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDLOJAExit(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btConfirmaClick(Sender: TObject);
    procedure edtQTENTRExit(Sender: TObject);
    procedure cmbTPMOVIExit(Sender: TObject);
    procedure cmbTPMOVIKeyPress(Sender: TObject; var Key: Char);
    procedure edtQTENTRKeyPress(Sender: TObject; var Key: Char);
  private
    Procedure CARREGAR_DADOS;  
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntradaSaida: TfrmEntradaSaida;
  M_FLCADA, M_FLMOVI, M_CDLOJA : String;

implementation

uses uLocProduto, uFuncoes, udmEtiquetas;

{$R *.dfm}

procedure TfrmEntradaSaida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmEntradaSaida.edtCDPRODKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
          key:=#0;
     //
     If (key = #13) and uFuncoes.Empty(edtCDPROD.Text)  Then
     Begin
         key:=#0;
         spLocalizarClick(Sender);
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(edtCDPROD.Text) Then
     Begin
          key:=#0;
          //
          M_FLCADA := 'N';
          //
          If Length(uFuncoes.StrZero(edtCDPROD.Text,13))=14 Then
          Begin
              edtCDPROD.Text := uFuncoes.StrZero(edtCDPROD.Text,13) ;
              edtCDPROD.Text := Copy(edtCDPROD.Text,1,12)+Copy(edtCDPROD.Text,14,1);
          End
          Else
              edtCDPROD.Text := uFuncoes.StrZero(edtCDPROD.Text,13);
          //
          With qryProduto do
          Begin
               CLose;
               //
               ParamByName('pCDBARR').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
               //
               Prepare;
               Open;
          End;
          //
        If (qryProduto.RecordCount = 0) Then
        Begin
             Application.MessageBox('Produto não cadastro!!!',
              'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
             //
             pnlDados.Visible := False;
             spLocalizar.Enabled := True;
             //
             edtCDPROD.SetFocus;
             edtCDPROD.Clear;
             //
             Exit;
        End;
          //
          CARREGAR_DADOS;
          //
          With qryEstoque do
          Begin
               CLose;
               //
               ParamByName('pCDPROD').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
               //ParamByName('pCDLOJA').AsString := M_CDLOJA;
               //
               Prepare;
               Open;
          End;
          //
          If (qryEstoque.RecordCount = 0) Then
          Begin
               M_FLCADA := 'S';
          End;
          //
          spLocalizar.Enabled := False;
          edtCDPROD.Enabled := False;
          pnlDados.Visible := True;
          //
          btConfirma.Enabled := True;
          btCancelar.Enabled := True;
          //
          edtNMPROD.Text  := qryProduto.FieldByName('PRO_NMPROD').AsString;
          edtQTATUA.Value := qryEstoque.FieldByName('EST_QTPROD').AsFloat;
          edtDTENT.Date := Date();
          edtQTENTR.Clear;
          //
          edtCDLOJA.ItemIndex := 0;
          cmbTPMOVI.ItemIndex := 0;
          cmbTPMOVI.SetFocus;
     End;
end;

procedure TfrmEntradaSaida.spLocalizarClick(Sender: TObject);
begin
 Try
      Application.CreateForm(TfrmLocProduto, frmLocProduto);
      uLocProduto.frmLocProduto.M_NMFORM := 3;
      frmLocProduto.ShowModal;
  Finally
      frmLocProduto.Free;
      edtCDPROD.SetFocus;
  End;
end;

procedure TfrmEntradaSaida.CARREGAR_DADOS;
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
              edtCDLOJA.Items.Add(dmEtiquetas.qryLoja.FieldByName('LOJ_NMLOJA').AsString);
              dmEtiquetas.qryLoja.Next;
          End;
     End;
     //
     //edtLoja.ItemIndex := 0;
     //
     {With dmEtiquetas.qryVendedor do
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
     edtNMVEND.ItemIndex := 0;}
     //
end;

procedure TfrmEntradaSaida.edtCDLOJAKeyPress(Sender: TObject;
  var Key: Char);
begin
{     If not( key in['0'..'9',#8, #13] ) then
          key:=#0;}
end;

procedure TfrmEntradaSaida.edtCDLOJAExit(Sender: TObject);
begin
   If not uFuncoes.Empty(edtCDLOJA.Text) THen
   Begin
        With qryLoja do
        begin
             Close;
             //
             ParamByName('pNMLOJA').AsString := edtCDLOJA.Text;
             //
             Prepare;
             Open;
        End;
        //
        If (qryLoja.RecordCount > 0) Then
           M_CDLOJA := qryLojaLOJ_CDLOJA.AsString;
        //
        If (qryEstoque.Locate('EST_CDPROD;EST_CDLOJA',
           VarArrayOf([uFuncoes.StrZero(edtCDPROD.Text,13),M_CDLOJA]),[])) Then
        BEgin
             M_FLCADA := 'N';
             edtQTATUA.Value := qryEstoque.FieldByName('EST_QTPROD').AsFloat;
        End     
        Else
        begin
             M_FLCADA := 'S';
             edtQTATUA.Value := 0;
        End;
   End;
end;

procedure TfrmEntradaSaida.btFecharClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmEntradaSaida.btCancelarClick(Sender: TObject);
begin
     If uFuncoes.Empty(edtQTENTR.Text) Then
        edtQTENTR.Value := 1;
     edtCDPROD.Enabled   := True;
     spLocalizar.Enabled := True;
     pnlDados.Visible := False;
     //
     edtCDPROD.SetFocus;
     edtCDPROD.Clear;
     //
     btConfirma.Enabled := False;
     btCancelar.Enabled := False;
end;

procedure TfrmEntradaSaida.FormCreate(Sender: TObject);
begin
     pnlDados.Visible := False;
     //
     btConfirma.Enabled := False;
     btCancelar.Enabled := False;
end;

procedure TfrmEntradaSaida.btConfirmaClick(Sender: TObject);
Var
    M_NRSEQU : String;
begin
     If not uFuncoes.Empty(edtCDLOJA.Text) THen
     Begin
            With qryLoja do
            begin
                 Close;
                 //
                 ParamByName('pNMLOJA').AsString := edtCDLOJA.Text;
                 //
                 Prepare;
                 Open;
            End;
        //
        If (qryLoja.RecordCount > 0) Then
           M_CDLOJA := qryLojaLOJ_CDLOJA.AsString;
     End
     Else
     Begin
          ShowMessage('Selecione a loja.');
          edtCDLOJA.SetFocus;
          Exit;
     End;
     //
     If (edtQTENTR.Value = 0) Then
     Begin
          ShowMessage('Quantidade não pode ser zero.');
          edtQTENTR.SetFocus;
          Exit;
     End;
     //
     Try
          If (M_FLCADA = 'S') Then
          Begin
               With qryIncProduto do
               Begin
                   Close;
                   //
                   ParamByname('pCDLOJA').AsString := M_CDLOJA;
                   ParamByname('pCDPROD').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
                   ParamByname('pDTENTR').AsDate   := edtDTENT.Date;
                   ParamByname('pQTENTR').AsFloat  := edtQTENTR.Value;
                   If (M_FLMOVI = 'E') Then
                      ParamByname('pQTPROD').AsFloat  := edtQTATUA.Value+edtQTENTR.Value
                   Else
                      ParamByname('pQTPROD').AsFloat  := edtQTATUA.Value-edtQTENTR.Value;
                   //
                   ExecSQL;
               End;
          End
          Else
          Begin
               With qryAtualizaEstoque do
               Begin
                If (M_FLMOVI = 'E') Then
                begin
                   SQL.Clear;
                   Close;
                   SQL.Add('Update SACEST SET EST_DTENTR = :pDTENTR, EST_QTENTR = :pQTENTR, EST_QTPROD = :pQTPROD');
                   SQL.Add('Where (EST_CDLOJA = :pCDLOJA) and (EST_CDPROD = :pCDPROD)');
                   //
                   ParamByname('pCDLOJA').AsString := M_CDLOJA;
                   ParamByname('pCDPROD').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
                   ParamByname('pDTENTR').AsDate   := edtDTENT.Date;
                   ParamByname('pQTENTR').AsFloat  := edtQTENTR.Value;
                   ParamByname('pQTPROD').AsFloat  := edtQTATUA.Value+edtQTENTR.Value;
                   //
                   ExecSQL;
                End;
                //
                If (M_FLMOVI = 'S') Then
                begin
                    SQL.Clear;
                    Close;
                    SQL.Add('Update SACEST SET EST_DTSAID = :pDTSAID, EST_QTSAID = :pQTSAID, EST_QTPROD = :pQTPROD');
                    SQL.Add('Where (EST_CDLOJA = :pCDLOJA) and (EST_CDPROD = :pCDPROD)');
                    //
                    ParamByname('pCDLOJA').AsString := M_CDLOJA;
                    ParamByname('pCDPROD').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
                    ParamByname('pDTSAID').AsDate   := edtDTENT.Date;
                    ParamByname('pQTSAID').AsFloat  := edtQTENTR.Value;
                    ParamByname('pQTPROD').AsFloat  := edtQTATUA.Value-edtQTENTR.Value;
                    ExecSQL;
                End;
                   //
               End;
          End;
          //
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
               ParamByname('pCDPROD').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
               ParamByname('pDTHIST').AsDate   := edtDTENT.Date;
               ParamByname('pHOHIST').AsString := TimetoStr(Time);
               ParamByname('pTPHIST').AsString := M_FLMOVI;
               ParamByname('pQTANTE').AsFloat  := edtQTATUA.Value;
               ParamByname('pQTPROD').AsFloat  := edtQTENTR.Value;
               If (M_FLMOVI = 'E') Then
                   ParamByname('pQTATUA').AsFloat  := edtQTATUA.Value+edtQTENTR.Value
               Else
                   ParamByname('pQTATUA').AsFloat  := edtQTATUA.Value-edtQTENTR.Value;
               ParamByname('pCDUSUA').AsString := uPrincipal.M_CDUSUA;
               //
               ExecSQL;
          End;
          //
          Application.MessageBox('Operação concluida com sucesso.',
              'CONCLUIDO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
          //
          pnlDados.Visible := False;
          btConfirma.Enabled := False;
          btCancelar.Enabled := False;
          //
          edtCDPROD.Enabled := True;
          edtCDPROD.SetFocus;
          edtCDPROD.Clear;
     Except
          Application.MessageBox('Error ao tentar atualizar estoque!!!',
              'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
          //
          pnlDados.Visible := False;
          btConfirma.Enabled := False;
          btCancelar.Enabled := False;
          //
          edtCDPROD.SetFocus;
          edtCDPROD.Clear;
     End;
end;

procedure TfrmEntradaSaida.edtQTENTRExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtQTENTR.Text)
       And (edtQTENTR.Value > 0) Then
     Begin
          If (M_FLMOVI = 'E') Then
             edtQTPROD.Value := edtQTATUA.Value + edtQTENTR.Value
          Else
             edtQTPROD.Value := edtQTATUA.Value - edtQTENTR.Value
     End;
end;

procedure TfrmEntradaSaida.cmbTPMOVIExit(Sender: TObject);
begin
   If not uFuncoes.Empty(cmbTPMOVI.Text) Then
   Begin
     //
     If (cmbTPMOVI.Text = 'ENTRADA') Then
         M_FLMOVI := 'E'
     Else
         M_FLMOVI := 'S';
     //
     //edtQTENTR.SetFocus;     
   End
   Else
   Begin
          ShowMessage('Selecione o tipo de movimento!!!');
          cmbTPMOVI.SetFocus;
          cmbTPMOVI.ItemIndex := 0;
          Exit;
   End;
end;

procedure TfrmEntradaSaida.cmbTPMOVIKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #27) Then
     begin
          Key := #0;
          //
          btCancelar.SetFocus;
          Exit;
     End;
     //
     if (key = #13) and not uFuncoes.Empty(cmbTPMOVI.Text) Then
     Begin
          Key := #0;
          //
          edtQTENTR.SetFocus;
     End;
end;

procedure TfrmEntradaSaida.edtQTENTRKeyPress(Sender: TObject;
  var Key: Char);
begin
     {If (key = #27) Then
     begin
          Key := #0;
          //
          btCancelar.SetFocus;
          Exit;
     End;}
     //
     If (key = #13) and not uFuncoes.Empty(edtQTENTR.Text) Then
     Begin
          Key := #0;
          //
          btConfirma.SetFocus;
     End;
end;

End.
