unit uPrintEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Grids, DBGrids, RXDBCtrl, Buttons,
  Mask, ToolEdit, CurrEdit, DB, DBTables, QuickRpt, QRCtrls, CJVQRBarCode,
  RpBase, RpSystem, RpDefine, RpRave, RpCon, RpConDS, RpConBDE, rpBars, Rpdevice,
  RpRender, RpRenderPDF;

type
  TfrmEtiquetas2 = class(TForm)
    Panel3: TPanel;
    dbtNMPROD: TDBText;
    Panel1: TPanel;
    GridDados: TPanel;
    pnlInferior: TPanel;
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    edtCDPROD: TEdit;
    spLocalizar: TSpeedButton;
    edtQUANT: TCurrencyEdit;
    Label2: TLabel;
    qryProduto: TQuery;
    btFechar: TBitBtn;
    btConfirma: TBitBtn;
    qryIncluirDados: TQuery;
    codBarras: TCJVQRBarCode;
    Image1: TImage;
    qryConsulta: TQuery;
    dsConsulta: TDataSource;
    Label5: TLabel;
    edtETATUAL: TEdit;
    qryProdutoPRO_CDPROD: TStringField;
    qryProdutoPRO_CDBARR: TStringField;
    qryProdutoPRO_NMPROD: TStringField;
    qryProdutoPRO_VLVEND: TFloatField;
    Label7: TLabel;
    cmbTamanho: TComboBox;
    rpDevA5: TRvProject;
    RvSystem1: TRvSystem;
    RvQueryConnection1: TRvQueryConnection;
    qryEtiquetas: TQuery;
    qryEtiquetasEQT_CDPROD: TStringField;
    qryEtiquetasEQT_NMPROD: TStringField;
    qryEtiquetasEQT_VLVEND: TFloatField;
    qryEtiquetasEQT_IMGBAR: TGraphicField;
    dsEtiquetas: TDataSource;
    RvSystem2: TRvSystem;
    btImprimir: TBitBtn;
    lblTotal: TLabel;
    RPDev1: TRvProject;
    qryEtiquetasEQT_CDBARR: TStringField;
    Panel2: TPanel;
    btnExcluir: TBitBtn;
    rvPersonalizado: TRvProject;
    RvSystem3: TRvSystem;
    rvTabelaEtiquetas: TRvTableConnection;
    RvRenderPDF1: TRvRenderPDF;
    Label3: TLabel;
    rvpEtiqueta10x3: TRvProject;
    RvSystem4: TRvSystem;
    qryEtiquetasEQT_TAMANHO: TStringField;
    lbl_NMPROD: TEdit;
    lblTamanho: TLabel;
    edtTamanho: TEdit;
    RvSystem16X6: TRvSystem;
    RvSystemA4New: TRvSystem;
    RvPGondula: TRvProject;
    RvSGondula: TRvSystem;
    rvdsDados: TRvDataSetConnection;
    rvsEtiquetaA4_126: TRvSystem;
    procedure spLocalizarClick(Sender: TObject);
    procedure edtQUANTKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDPRODExit(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDPRODChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btConfirmaClick(Sender: TObject);
    procedure edtETATUALKeyPress(Sender: TObject; var Key: Char);
    procedure edtQUANTEnter(Sender: TObject);
    procedure edtQUANTExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RvSystem1Print(Sender: TObject);
    procedure RvSystem2Print(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure edtETATUALExit(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure RvSystem4Print(Sender: TObject);
    procedure edtTamanhoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbTamanhoExit(Sender: TObject);
    procedure RvSystem16X6Print(Sender: TObject);
    procedure RvSystemA4NewPrint(Sender: TObject);
    procedure rvsEtiquetaA4_126Print(Sender: TObject);
  private
    Procedure IMAGEM;
    Procedure CONSULTA;
    Procedure GERAR_ETIQUETAS(aFlZero : String);
    procedure QUANT_MAXIMA;
    function QUANT_ETIQUETAS(aDados : TDataSet) : Integer;
    Procedure Atualizar_Posicao;
    procedure Excluir_Produto(aCodigo : String);
    procedure Nova_Pagina;
    procedure Limpar;
    Procedure PrintBarcodeEAN_Novo(RVSystem:TRVSystem; Row, Column:Double; Value:String;
            fAltura, fLargura : Double);
    Procedure PrintBarcodeEAN_126(RVSystem:TRVSystem; Row, Column:Double; Value:String);            
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEtiquetas2: TfrmEtiquetas2;
  M_CDPROD, W_CDPROD, W_NMPROD, W_CDREFE : String;
  W_VLVEND : Double;
  W_NRITEM, M_MAXIMO : Integer;


implementation

uses uLocProduto, uFuncoes, udmEtiquetas, uRelEtiqueta, uFrmNewEtiquetas;

{$R *.dfm}

procedure TfrmEtiquetas2.spLocalizarClick(Sender: TObject);
begin
 Try
      Application.CreateForm(TfrmLocProduto, frmLocProduto);
      uLocProduto.frmLocProduto.M_NMFORM := 6;
      frmLocProduto.ShowModal;
  Finally
      frmLocProduto.Free;
      //
      if length(edtCDPROD.Text) <> 0 then
         edtQUANT.SetFocus
      else
         edtCDPROD.SetFocus;
  End;
end;

procedure TfrmEtiquetas2.edtQUANTKeyPress(Sender: TObject; var Key: Char);
Var
   M_NRITEM : String;
begin
     If (Key = #13) And (edtQUANT.Value > 0) Then
     Begin
          Key := #0;
          SendMessage(frmEtiquetas2.Handle,WM_NEXTDLGCTL,0,0);
          //
          {M_NRITEM := uFuncoes.StrZero(InttoStr(W_NRITEM),3);
          W_CDPROD := FloattoStr(StrtoFloat(edtCDPROD.Text));
          //W_CDPROD := edtCDPROD.Text;
          //qryProduto.FieldByName('PRO_CDBARR').AsString;
          //
          W_NMPROD := qryProduto.FieldByName('PRO_NMPROD').AsString;
          W_CDREFE := qryProduto.FieldByName('PRO_CDBARR').AsString;
          W_VLVEND := qryProduto.FieldByName('PRO_VLVEND').AsCurrency;
          //
          With qryIncluirDados do
          Begin
               SQL.Clear;
               Close;
               SQL.Add('INSERT INTO SACETT (ETT_NRITEM, ETT_CDPROD, ETT_CDREFE, ETT_NMPROD, ETT_QTPROD, ETT_VLVEND)');
               SQL.Add('VALUES (:pNRITEM, :pCDPROD, :pCDREFE, :pNMPROD, :pQTPROD, :pVLVEND)');
               //
               ParamByName('pNRITEM').AsString := M_NRITEM;
               ParamByName('pCDPROD').AsString := StrZero(W_CDPROD,5);
               ParamByName('pCDREFE').AsString := W_CDREFE;
               ParamByName('pNMPROD').AsString := W_NMPROD;
               ParamByName('pQTPROD').AsFloat  := edtQUANT.Value;
               ParamByName('pVLVEND').AsFloat  := W_VLVEND;
               //
               ExecSQL;
          End;
          //
          dmEtiquetas.tbEtiquetas2.Filtered := False;
          dmEtiquetas.tbEtiquetas2.Filter   := 'ETT_NRITEM='+QuotedStr(M_NRITEM);
          dmEtiquetas.tbEtiquetas2.Filtered := True;
          dmEtiquetas.tbEtiquetas2.open;
          //
          dmEtiquetas.tbEtiquetas2.Edit;
          dmEtiquetas.tbEtiquetas2.FieldByName('ETT_IMDBAR').Assign(Image1.Picture.Bitmap);
          dmEtiquetas.tbEtiquetas2.Post;
          dmEtiquetas.tbEtiquetas2.Filtered := False;
          dmEtiquetas.tbEtiquetas2.Close;
          //
          W_NRITEM := W_NRITEM +1;
          //
          CONSULTA;
          //
          //lblTotal.Caption := 'Total etiquetas: ' + IntToStr(QUANT_ETIQUETAS(qryConsulta));
          //
          codBarras.Texto := '0';
          //
          edtCDPROD.Clear;
          edtQUANT.Clear;
          edtCDPROD.SetFocus; }
     End;
end;

procedure TfrmEtiquetas2.edtCDPRODExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDPROD.Text) Then
     Begin
       try
          M_CDPROD := edtCDPROD.Text;

          //
          With qryProduto do
          Begin
               SQL.Clear;
               Close;
               //
               SQL.Add('Select PRO_CDPROD, PRO_CDBARR, PRO_NMPROD, PRO_VLVEND from SACPRO ');
               SQL.Add('Where (PRO_CDPROD = :pCDPROD) ');
               ParamByName('pCDPROD').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
               //ParamByName('pCDBARR').AsString := InttoStr(StrtoInt(M_CDPROD));
               //
               Prepare;
               Open;
          End;
          //
          If (qryProduto.RecordCount = 0) Then
          Begin
                  ShowMessage('Codigo de produto não cadastrado.');
                  qryProduto.Close;
                  edtCDPROD.Clear;
                  edtCDPROD.SetFocus;
                  Exit;
          End;
          //
          edtCDPROD.Text := uFuncoes.StrZero(edtCDPROD.Text,5);
          codBarras.Texto := Copy(qryProdutoPRO_CDPROD.AsString,1,5);
          //InttoStr(StrtoInt(M_CDPROD));
          lbl_NMPROD.Text := qryProduto.FieldByName('PRO_NMPROD').AsString;
          IMAGEM;
          //
          If (edtTamanho.Visible) Then
             edtTamanho.SetFocus
          Else
             edtQUANT.SetFocus;
        Except
              lbl_NMPROD.Clear;
              edtCDPROD.SetFocus; 
              raise Exception.Create('Código inválido.');
        End;
     End;
end;

procedure TfrmEtiquetas2.btFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmEtiquetas2.edtCDPRODKeyPress(Sender: TObject; var Key: Char);
begin
     {If not( key in['0'..'9',#8, #13] ) then
          key:=#0;}
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
          //edtTamanho.SetFocus;
          Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TfrmEtiquetas2.edtCDPRODChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDPROD.Text) Then
        lbl_NMPROD.Clear;
end;

procedure TfrmEtiquetas2.FormCreate(Sender: TObject);
begin                                                                              
//     RvProject1.ProjectFile := ExtractFilePath( Application.ExeName )+'\Relatorio\rvEtiqueta.rav';
     //
     rvPersonalizado.ProjectFile := ExtractFilePath( Application.ExeName )+'\Relatorio\rvPersonalizado.rav';
     Limpar;
end;

procedure TfrmEtiquetas2.IMAGEM;
begin
    //codBarras.Texto := Floattostr(StrtoFloat(edtCDPROD.Text));
    //codBarras.Texto := StrZero(Floattostr(StrtoFloat(M_CDPROD)),5);
    //codBarras.Texto := Floattostr(StrtoFloat(M_CDPROD));
    codBarras.Texto := M_CDPROD;
    Image1.Canvas.Draw(05,0, codBarras.Picture.Bitmap);
    //GeraBarrasEAN13(edtCDPROD.Text, Image1.Canvas);
    //GeraBarrasEAN13('000000000013', Image1.Canvas);
end;

procedure TfrmEtiquetas2.CONSULTA;
begin
     With qryConsulta do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select * from SACETT order by ETT_NRITEM');
          Prepare;
          Open;
          //
          If (recordCount > 0) Then
            btnExcluir.Enabled := True
          Else
            btnExcluir.Enabled := False;
     End;
     //
     lblTotal.Caption := 'Total etiquetas: ' + IntToStr(QUANT_ETIQUETAS(qryConsulta));
end;

procedure TfrmEtiquetas2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     With qryConsulta do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Delete from SACETT');
          ExecSQL;
     End;
     //
     qryProduto.Close; 
     //
     Action := caFree;
end;

procedure TfrmEtiquetas2.GERAR_ETIQUETAS(aFlZero : String);
Var
   M_CONTAD, M_TOREGI, W_QTREGI : Integer;
   X, M_QTETIQ, W_ETIMPR : Integer;
begin
     M_CONTAD := 1;
     M_TOREGI := dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsInteger;
     W_QTREGI := 1;
     W_ETIMPR := 0;
     //
     //If (dmEtiquetas.tbEtiquetas.Active = False) Then
     dmEtiquetas.tbEtiquetas.close;
     dmEtiquetas.tbEtiquetas.Open;
     //
     If (dmEtiquetas.tbEtiquetas.RecordCount > 0) Then
         uFuncoes.EsvaziaTabela(dmEtiquetas.tbEtiquetas);
     //
     If (dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsInteger > 0) Then
     Begin
       While (W_QTREGI <= M_TOREGI) do
       Begin
            dmEtiquetas.tbEtiquetas.Append;
            dmEtiquetas.tbEtiquetas.Post;
            //
            W_QTREGI := W_QTREGI+1;
       End;
     End;
     //
     qryConsulta.DisableControls;
     qryConsulta.First;
     //
     While not (qryConsulta.Eof) DO
     begin
          M_QTETIQ := qryConsulta.fieldByName('ETT_QTPROD').AsInteger;
          //
          For  X := 1 to M_QTETIQ do
          Begin
               dmEtiquetas.tbEtiquetas.Append;
               If (aFlZero = 'N') Then
                  dmEtiquetas.tbEtiquetas.FieldByName('EQT_CDPROD').AsString := qryConsulta.fieldByName('ETT_CDPROD').AsString
               Else
                  dmEtiquetas.tbEtiquetas.FieldByName('EQT_CDPROD').AsString := uFuncoes.StrZero(qryConsulta.fieldByName('ETT_CDPROD').AsString,13);
               dmEtiquetas.tbEtiquetas.FieldByName('EQT_CDBARR').AsString := qryConsulta.fieldByName('ETT_CDREFE').AsString;
               dmEtiquetas.tbEtiquetas.FieldByName('EQT_NMPROD').AsString := qryConsulta.fieldByName('ETT_NMPROD').AsString;
               If (dmEtiquetas.tbParametrosPAR_FLPRECO.AsString = 'S') Then
                  dmEtiquetas.tbEtiquetas.FieldByName('EQT_VLVEND').AsFloat  := qryConsulta.fieldByName('ETT_VLVEND').AsFloat;
               //
               dmEtiquetas.tbEtiquetas.FieldByName('EQT_IMGBAR').Assign(qryConsulta.fieldByName('ETT_IMDBAR'));
               If not uFuncoes.Empty(qryConsulta.fieldByName('ETT_TAMANHO').AsString) Then
                   dmEtiquetas.tbEtiquetas.FieldByName('EQT_TAMANHO').AsString := qryConsulta.fieldByName('ETT_TAMANHO').AsString;
                 //qryConsulta.fieldByName('ETT_TAMANHO').AsString;
               // Grava
               dmEtiquetas.tbEtiquetas.Post;
               //
               W_ETIMPR := W_ETIMPR+1;
          End;
          //
          qryConsulta.Next;
     End;
     //
     dmEtiquetas.tbEtiquetas.Close;
     //
     dmEtiquetas.tbParametros.Close;
     dmEtiquetas.tbParametros.Open;
     //
     If (cmbTamanho.ItemIndex <> 2) Then
     begin
         dmEtiquetas.tbParametros.Edit;
         dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsFloat :=
                dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsFloat+W_ETIMPR;
         dmEtiquetas.tbParametros.Post;
     End;
end;

procedure TfrmEtiquetas2.btConfirmaClick(Sender: TObject);
begin
 If uFuncoes.Empty(edtETATUAL.Text) Then
 Begin
      ShowMessage('Digite a posição inicial.');
      edtETATUAL.SetFocus;
      Exit;
 End;
 //
 If (qryConsulta.Active = False) Then
 Begin
      ShowMessage('Não há itens para serem impresso.');
      edtCDPROD.SetFocus;
      Exit;
 End;

 //
 If (qryConsulta.Active = True)
   And (qryConsulta.RecordCount = 0) Then
 Begin
      ShowMessage('Inclua itens para serem impresso.');
      edtCDPROD.SetFocus;
      Exit;
 End;
 //
 If not uFuncoes.Empty(edtETATUAL.Text) Then
 begin
     //
     If (dmEtiquetas.tbParametros.Active = False) Then
       dmEtiquetas.tbParametros.Open;
     //
     dmEtiquetas.tbParametros.Edit;
     dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsInteger :=  StrtoInt(edtETATUAL.Text);
     dmEtiquetas.tbParametros.Post;
     //
    if (cmbTamanho.ItemIndex  = 0) Then
    begin
         Application.CreateForm(TfrmRelEtiqueta , frmRelEtiqueta);
         btConfirma.Enabled := False;
         Try
            //
            GERAR_ETIQUETAS('N');
            //
            With frmRelEtiqueta.qryEtiquetas do
            begin
                SQL.Clear;
                Close;
                SQL.Add('Select * from "SACEQT.DB"');
                //
                Prepare;
                Open;
            End;
            //
            frmRelEtiqueta.qrEtiquetas.Preview ;
         Finally
              frmRelEtiqueta.Free;
              btConfirma.Enabled := True;
              // Fecha janela
              Close;
         End;
     End
     Else
     begin
         //Application.CreateForm(TfrmNewEtiquetaA5 , frmNewEtiquetaA5);
         btConfirma.Enabled := False;
         Try
            //
            GERAR_ETIQUETAS('N');
            //
            //With frmNewEtiquetaA5.qryEtiquetas do
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
            RVSystem1.SystemPreview.RulerType := rtBothCm;
            //RVSystem1.Execute;
            //
            rpDevA5.Execute;
            //
            //frmNewEtiquetaA5.qrEtiquetas.Preview ;
            {With ppReport1 do
              begin
                   PrintReport;
              End;}
         Finally
              //frmNewEtiquetaA5.Free;
              //
              btConfirma.Enabled := True;
              // Fecha janela
              Close;
         End;
     End;
  End;
end;

procedure TfrmEtiquetas2.edtETATUALKeyPress(Sender: TObject;
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
                         +'Digite um valor entre 0 e 65.');
              edtETATUAL.Clear;
              edtETATUAL.SetFocus;
              Exit;
         End;
    End;
    //
    If (key = #13) and not uFuncoes.Empty(edtETATUAL.Text) Then
    Begin
         key:=#0;
         //
         Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TfrmEtiquetas2.edtQUANTEnter(Sender: TObject);
begin
     spLocalizar.Enabled := False;
end;

procedure TfrmEtiquetas2.edtQUANTExit(Sender: TObject);
Var
    M_NRITEM, M_TAMANHO : String;
begin
     spLocalizar.Enabled := True;
     //
     If not uFuncoes.Empty(edtQUANT.Text) Then
     begin
          M_NRITEM := uFuncoes.StrZero(InttoStr(W_NRITEM),3);
          If (dmEtiquetas.tbParametrosPAR_CDALFANUMERICO.AsString = 'N') Then
              W_CDPROD := FloattoStr(StrtoFloat(edtCDPROD.Text))
          Else
              W_CDPROD := edtCDPROD.Text;
          //    
          If not uFuncoes.Empty(edtTamanho.Text) Then
             M_TAMANHO := edtTamanho.Text
          Else
             M_TAMANHO := '';
          //W_CDPROD := edtCDPROD.Text;
          //qryProduto.FieldByName('PRO_CDBARR').AsString;
          //
          W_NMPROD := qryProduto.FieldByName('PRO_NMPROD').AsString;
          W_CDREFE := qryProduto.FieldByName('PRO_CDBARR').AsString;
          W_VLVEND := qryProduto.FieldByName('PRO_VLVEND').AsCurrency;
          //
          With qryIncluirDados do
          Begin
               SQL.Clear;
               Close;
               SQL.Add('INSERT INTO SACETT (ETT_NRITEM, ETT_CDPROD, ETT_CDREFE, ETT_NMPROD, ETT_QTPROD, ETT_VLVEND, ETT_TAMANHO)');
               SQL.Add('VALUES (:pNRITEM, :pCDPROD, :pCDREFE, :pNMPROD, :pQTPROD, :pVLVEND, :pTAMANHO)');
               //
               ParamByName('pNRITEM').AsString := M_NRITEM;
               ParamByName('pCDPROD').AsString := StrZero(W_CDPROD,5);
               ParamByName('pCDREFE').AsString := W_CDREFE;
               ParamByName('pNMPROD').AsString := W_NMPROD;
               ParamByName('pQTPROD').AsFloat  := edtQUANT.Value;
               ParamByName('pVLVEND').AsFloat  := W_VLVEND;
               ParamByName('pTAMANHO').AsString := M_TAMANHO;
               //
               ExecSQL;
          End;
          //
          dmEtiquetas.tbEtiquetas2.Filtered := False;
          dmEtiquetas.tbEtiquetas2.Filter   := 'ETT_NRITEM='+QuotedStr(M_NRITEM);
          dmEtiquetas.tbEtiquetas2.Filtered := True;
          dmEtiquetas.tbEtiquetas2.open;
          //
          dmEtiquetas.tbEtiquetas2.Edit;
          dmEtiquetas.tbEtiquetas2.FieldByName('ETT_IMDBAR').Assign(Image1.Picture.Bitmap);
          dmEtiquetas.tbEtiquetas2.Post;
          dmEtiquetas.tbEtiquetas2.Filtered := False;
          dmEtiquetas.tbEtiquetas2.Close;
          //
          W_NRITEM := W_NRITEM +1;
          //
          CONSULTA;
          //
          //lblTotal.Caption := 'Total etiquetas: ' + IntToStr(QUANT_ETIQUETAS(qryConsulta));
          //
          codBarras.Texto := '0';
          //
          edtCDPROD.Clear;
          edtTamanho.Clear;
          edtQUANT.Clear;
          edtCDPROD.SetFocus;
     End;
end;

procedure TfrmEtiquetas2.QUANT_MAXIMA;
begin
     Case cmbTamanho.ItemIndex of
        0 : M_MAXIMO := 65;
        1 : M_MAXIMO := 25;
        2 : M_MAXIMO := 1;
        3 : M_MAXIMO := 33;
        4 : M_MAXIMO := 96;
        5 : M_MAXIMO := 290;
        7 : M_MAXIMO := 126;
        8 : M_MAXIMO := 20;
     End;
     //
     If (dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsFloat >= M_MAXIMO) Then
     Begin
          dmEtiquetas.tbParametros.Edit;
          dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsFloat :=
            dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsFloat-M_MAXIMO;
          dmEtiquetas.tbParametros.Post;
     End;
end;

Procedure PrintBarcodeEAN(RVSystem:TRVSystem; Row, Column:Double; Value:String);
Begin
//   With TRPBarsEAN.Create(RVSystem.BaseReport) do Begin
   With TRPBarsCode128.Create(RVSystem.BaseReport) do
   Begin
     BarHeight  := 1.2;
     //BarWidth   := 0.032;
     BarWidth   := 0.036;
     WideFactor := BarWidth;
     Text := Value;
     PrintXY(Column,Row);
     Free;
   end;
End;


procedure TfrmEtiquetas2.FormShow(Sender: TObject);
begin
     lblTamanho.Visible := false;
     edtTamanho.Visible := false;
     //If (dmEtiquetas.tbParametros.Active = False) Then
     dmEtiquetas.tbParametros.Close;
     dmEtiquetas.tbParametros.Open;
     //
     cmbTamanho.Clear;
     With cmbTamanho.Items do
     begin
          Add('A4');
          Add('A5');
          Add('Zebra 3.00 x 3.80 - 1 Coluna');
          //
          dmEtiquetas.qryModEtiqueta.Close;
          dmEtiquetas.qryModEtiqueta.Params[0].AsInteger := 1;
          dmEtiquetas.qryModEtiqueta.Open;
          //
          If not (dmEtiquetas.qryModEtiqueta.IsEmpty) Then
            Add(dmEtiquetas.qryModEtiquetaMDE_DESCRICAO.AsString);
          //
          Add('A4 - 16 X 6');
          Add('A4 - 290 X 10');
          Add('A4 - Gôndula');
          Add('A4 - 7 X 18');
     End;
     //
     Case dmEtiquetas.tbParametrosPAR_PADRAO_ETIQ.AsInteger of
         1 : cmbTamanho.ItemIndex := 0;
         2 : cmbTamanho.ItemIndex := 1;
         3 : cmbTamanho.ItemIndex := 2;
         4 :
           begin
                cmbTamanho.ItemIndex := 3;
                //
                lblTamanho.Visible := True;
                edtTamanho.Visible := True;
           End;
         5 : cmbTamanho.ItemIndex := 4;
         6 : cmbTamanho.ItemIndex := 5;
         7 : cmbTamanho.ItemIndex := 6;
         8 : cmbTamanho.ItemIndex := 7;
     End;
     //                           ;
     {If (dmEtiquetas.tbParametrosPAR_PADRAO_ETIQ.AsInteger = 1) Then
         cmbTamanho.ItemIndex := 0
     Else
         cmbTamanho.ItemIndex := 1;}
     //
     lbl_NMPROD.Clear;
     lblTotal.Caption := '';
     codBarras.Texto := '0';
     QUANT_MAXIMA;
     edtETATUAL.Text := dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsString;
     //
     btnExcluir.Enabled := False;
     //
     If (cmbTamanho.ItemIndex = 6) Then
     Begin
          Label5.Visible := false;
          edtETATUAL.Visible := false;
     End;
end;

procedure TfrmEtiquetas2.RvSystem1Print(Sender: TObject);
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
    //
    M_COLUNA : array[1..5] of Double;
    M_LINHA  : array[1..13] of Double;
    I, M_LICONT : integer;

begin
   // A4
   //MarginLeft  := 0.6;
   //
   {If (dmEtiquetas.tbParametrosPAR_IMPRESSORA.AsInteger = 2) Then
      MarginTop   := 1.3  // Laser
   Else
      MarginTop   := 1.6; // Jato de tinta}
   // Nova alteração
   MarginLeft  := dmEtiquetas.tbParametrosPAR_COLUNA_INICIAL.AsFloat;
   //
   If (dmEtiquetas.tbParametrosPAR_IMPRESSORA.AsInteger = 2) Then
      MarginTop   := dmEtiquetas.tbParametrosPAR_LINHA_INICIAL.AsFloat
   Else
      MarginTop   := dmEtiquetas.tbParametrosPAR_LINHA_INICIAL.AsFloat;
   //
   {LabelWidth  := 4.1;
   LabelHeight := 2.1;}
   LabelWidth  := dmEtiquetas.tbParametrosPAR_TAMANHO_ETI.AsFloat;
   LabelHeight := dmEtiquetas.tbParametrosPAR_LARGURA_ETI.AsFloat;
   //tbParametrosPAR_LAGURA_ETI
   LabelRows   := 13;
   LabelCols   := 5;

   CurLabel := 0;
   LabelRow := 0;
   //
     // Defini as coodernadas das linhas
     {M_LINHA[1] := MarginTop + 1.20;
     M_LINHA[2] := MarginTop + 3.30;
     M_LINHA[3] := MarginTop + 5.43;
     M_LINHA[4] := MarginTop + 7.54;
     M_LINHA[5] := MarginTop + 9.72;
     //
     M_LINHA[6]  := MarginTop +11.83;
     M_LINHA[7]  := MarginTop +13.96;
     M_LINHA[8]  := MarginTop +16.09;
     M_LINHA[9]  := MarginTop +18.22;
     M_LINHA[10] := MarginTop +20.35;
     //
     M_LINHA[11] := MarginTop +22.48;
     M_LINHA[12] := MarginTop +24.61;
     M_LINHA[13] := MarginTop +26.74;}
     //
     M_LINHA[1] := MarginTop + 1.20;
     M_LINHA[2] := MarginTop + 3.33;
     M_LINHA[3] := MarginTop + 5.46;
     M_LINHA[4] := MarginTop + 7.59;
     M_LINHA[5] := MarginTop + 9.72;
     //
     M_LINHA[6]  := MarginTop +11.85;
     M_LINHA[7]  := MarginTop +13.98;
     M_LINHA[8]  := MarginTop +16.11;
     M_LINHA[9]  := MarginTop +18.24;
     M_LINHA[10] := MarginTop +20.37;
     //
     M_LINHA[11] := MarginTop +22.50;
     M_LINHA[12] := MarginTop +24.63;
     M_LINHA[13] := MarginTop +26.76;

     // Defini as coodernadas das colunas
     M_COLUNA[1] := MarginLeft;
     M_COLUNA[2] := M_COLUNA[1] + LabelWidth;
     M_COLUNA[3] := M_COLUNA[2] + LabelWidth;
     M_COLUNA[4] := M_COLUNA[3] + LabelWidth;
     M_COLUNA[5] := M_COLUNA[4] + LabelWidth + 0.05;
     //

   //GERAR_ETIQUETAS;
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
   RvSystem1.BaseReport.SetFont('Arial',6);
   M_LICONT := 1;
   I := 1;
   //
   While not qryEtiquetas.Eof do
   Begin
       {Factor   := (CurLabel Mod LabelCols);
       CurCol   := (Factor*LabelWidth)+MarginLeft;
       CurRow   := (LabelRow * LabelHeight) + MarginTop;}
       // novo
       Factor   := (CurLabel Mod LabelCols);
       CurCol   := M_COLUNA[I];
       CurRow   := M_LINHA [M_LICONT];
     //
    if (dmEtiquetas.tbParametrosPAR_CDALFANUMERICO.AsString = 'N') Then
    begin
       // Referência
       If (qryEtiquetas.FieldByName('EQT_CDBARR').AsString <> '0000000000000') Then
       begin
           {RVSystem1.BaseReport.GotoXY(CurCol,CurRow-0.04);
           RVSystem1.BaseReport.PrintLeft(qryEtiquetas.FieldByName('EQT_CDBARR').AsString,CurCol+0.02);}
           RVSystem1.BaseReport.GotoXY(CurCol,CurRow + 0.2);
           RVSystem1.BaseReport.PrintLeft(qryEtiquetas.FieldByName('EQT_CDBARR').AsString,CurCol+0.02);
       End;
       //
       If (qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat > 0) AND (dmEtiquetas.tbParametrosPAR_FLPRECO.AsString = 'S') Then
       begin
            // Valor de venda
            {RVSystem1.BaseReport.GotoXY(CurCol,CurRow-0.04);
            RVSystem1.BaseReport.PrintRight( FormatFloat('###,##0.#0',qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat),CurCol+3.2);}
            //
            RVSystem1.BaseReport.GotoXY(CurCol,CurRow+0.2);
            RVSystem1.BaseReport.PrintRight( FormatFloat('###,##0.#0',qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat),CurCol+3.2);
       End;
       // Descrição do produto
       {RVSystem1.BaseReport.GotoXY(CurCol,CurRow+0.14);
       RVSystem1.BaseReport.PrintLeft( Copy(qryEtiquetas.FieldByName('EQT_NMPROD').AsString,1,26),CurCol);}
       RVSystem1.BaseReport.GotoXY(CurCol,CurRow+0.4);
       RVSystem1.BaseReport.PrintLeft( Copy(qryEtiquetas.FieldByName('EQT_NMPROD').AsString,1,26),CurCol);
       //
       If not Empty(qryEtiquetas.FieldByName('EQT_CDPROD').AsString) Then
          //PrintBarCodeEAN(RVSystem1,CurRow + 0.30,CurCol + 0.17, StrZero(FloattoStr(qryEtiquetas.FieldByName('EQT_CDPROD').AsFloat),5));
          PrintBarCodeEAN(RVSystem1,CurRow + 0.5,CurCol + 0.17, StrZero(FloattoStr(qryEtiquetas.FieldByName('EQT_CDPROD').AsFloat),5));
      End
      Else
      begin
           RvSystem1.BaseReport.SetFont('Arial',6);
           If (qryEtiquetas.FieldByName('EQT_CDBARR').AsString <> '0000000000000') Then
           begin
                RVSystem1.BaseReport.GotoXY(CurCol,CurRow + 0.2);
                RVSystem1.BaseReport.PrintLeft(qryEtiquetas.FieldByName('EQT_CDBARR').AsString,CurCol+0.02);
           End;
            // Descrição do produto
            {RVSystem1.BaseReport.GotoXY(CurCol,CurRow+0.14);
            RVSystem1.BaseReport.PrintLeft( Copy(qryEtiquetas.FieldByName('EQT_NMPROD').AsString,1,26),CurCol);}
            RVSystem1.BaseReport.GotoXY(CurCol,CurRow+0.5);
            RVSystem1.BaseReport.PrintLeft( Copy(qryEtiquetas.FieldByName('EQT_NMPROD').AsString,1,26),CurCol);
            //
            If (qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat > 0) AND (dmEtiquetas.tbParametrosPAR_FLPRECO.AsString = 'S') Then
            begin
                 // Valor de venda
                 {RVSystem1.BaseReport.GotoXY(CurCol,CurRow-0.04);
                 RVSystem1.BaseReport.PrintRight( FormatFloat('###,##0.#0',qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat),CurCol+3.2);}
                 //
                 RvSystem1.BaseReport.SetFont('Arial Black',14);
                 RVSystem1.BaseReport.GotoXY(CurCol,CurRow+1.2);
                 RVSystem1.BaseReport.PrintRight( FormatFloat('###,##0.#0',qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat),CurCol+2.5);
            End;
            
      End;
       //
       Inc(CurLabel);
       I := I + 1;
       If Factor=LabelCols-1 Then
        Begin
          Inc(LabelRow);
          I := 1;
          M_LICONT := M_LICONT + 1;
        End;
       // proximo registro
       qryEtiquetas.Next;
       //
       If (LabelRow>=LabelRows) Then
       Begin
          LabelRow := 0;
          if not (qryEtiquetas.Eof) Then
            Begin
                RVSystem1.BaseReport.NewPage;
                M_LICONT := 1;
                // Nova_Pagina;
            End;
       End;
   End;
   qryEtiquetas.Close;
end;

procedure TfrmEtiquetas2.RvSystem2Print(Sender: TObject);
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

begin

   // A5
   //MarginLeft  := 1.4;
   MarginLeft  := dmEtiquetas.tbParametrosPAR_COLUNA_INICIAL.AsFloat;
   //
   If (dmEtiquetas.tbParametrosPAR_IMPRESSORA.AsInteger = 2) Then
      //MarginTop   := 1.9  // Laser
      MarginTop   := dmEtiquetas.tbParametrosPAR_LINHA_INICIAL.AsFloat
   Else
      MarginTop   := dmEtiquetas.tbParametrosPAR_LINHA_INICIAL.AsFloat;
      //MarginTop   := 2.2; // Jato de tinta
   //
   {LabelWidth  := 3.8;
   LabelHeight := 2.4;}
   LabelWidth  := dmEtiquetas.tbParametrosPAR_TAMANHO_ETI.AsFloat;
   LabelHeight := dmEtiquetas.tbParametrosPAR_LARGURA_ETI.AsFloat;
   LabelRows   := 5;
   LabelCols   := 5;

   CurLabel := 0;
   LabelRow := 0;

   //GERAR_ETIQUETAS;
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
   RVSystem2.BaseReport.SetFont('Arial',6);
  //
   While not qryEtiquetas.Eof do
   Begin
       Factor   := (CurLabel Mod LabelCols);
       CurCol   := (Factor*LabelWidth)+MarginLeft;
       CurRow   := (LabelRow * LabelHeight) + MarginTop;

       if (dmEtiquetas.tbParametrosPAR_CDALFANUMERICO.AsString = 'N') Then
       begin
           // Referência
           RVSystem2.BaseReport.GotoXY(CurCol,CurRow-0.04);
           RVSystem2.BaseReport.PrintLeft(qryEtiquetas.FieldByName('EQT_CDBARR').AsString,CurCol+0.02);
           //
           If (qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat > 0) AND (dmEtiquetas.tbParametrosPAR_FLPRECO.AsString = 'S') Then
           begin
                // Valor de venda
                RVSystem2.BaseReport.GotoXY(CurCol,CurRow-0.04);
                RVSystem2.BaseReport.PrintRight( FormatFloat('###,##0.#0',qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat),CurCol+3.2);
           End;
           // Descrição do produto
           RVSystem2.BaseReport.GotoXY(CurCol,CurRow+0.14);
           RVSystem2.BaseReport.PrintLeft( Copy(qryEtiquetas.FieldByName('EQT_NMPROD').AsString,1,26),CurCol);
           //
           If not Empty(qryEtiquetas.FieldByName('EQT_CDPROD').AsString) Then
              PrintBarCodeEAN(RVSystem2,CurRow + 0.18,CurCol + 0.04, StrZero(FloattoStr(qryEtiquetas.FieldByName('EQT_CDPROD').AsFloat),5));
          //PrintBarCodeEAN(RVSystem2,CurRow + 0.18,CurCol + 0.04, StrZero(qryEtiquetas.FieldByName('EQT_CDPROD').AsString,5));
          //PrintBarCodeEAN(RVSystem2,CurRow + 0.18,CurCol + 0.04,'471026820'+Format('%0.3d',[qryEtiquetas.FieldByName('EQT_CDPROD').AsInteger]));
       End
       Else
       begin
           RvSystem2.BaseReport.SetFont('Arial',6);
           If (qryEtiquetas.FieldByName('EQT_CDBARR').AsString <> '0000000000000') Then
           begin
                RVSystem2.BaseReport.GotoXY(CurCol,CurRow + 0.2);
                RVSystem2.BaseReport.PrintLeft(qryEtiquetas.FieldByName('EQT_CDBARR').AsString,CurCol+0.02);
           End;
            // Descrição do produto
            RVSystem2.BaseReport.GotoXY(CurCol,CurRow+0.5);
            RVSystem2.BaseReport.PrintLeft( Copy(qryEtiquetas.FieldByName('EQT_NMPROD').AsString,1,26),CurCol);
            //
            If (qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat > 0) AND (dmEtiquetas.tbParametrosPAR_FLPRECO.AsString = 'S') Then
            begin
                 // Valor de venda
                 {RVSystem1.BaseReport.GotoXY(CurCol,CurRow-0.04);
                 RVSystem1.BaseReport.PrintRight( FormatFloat('###,##0.#0',qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat),CurCol+3.2);}
                 //
                 RvSystem2.BaseReport.SetFont('Arial Black',14);
                 RVSystem2.BaseReport.GotoXY(CurCol,CurRow+1.2);
                 RVSystem2.BaseReport.PrintRight( FormatFloat('###,##0.#0',qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat),CurCol+2.5);
            End; 
       End;
       //
       Inc(CurLabel);
       If Factor=LabelCols-1 Then
          Inc(LabelRow);
       //
       qryEtiquetas.Next;
       //
       If (LabelRow>=LabelRows) Then
       Begin
          LabelRow := 0;
          if not (qryEtiquetas.Eof) Then
           begin
                RVSystem2.BaseReport.NewPage;
           End;
       End;
   End;  //fim-enquanto
   qryEtiquetas.Close;
   //
end;

procedure TfrmEtiquetas2.btImprimirClick(Sender: TObject);
Var
   I, iCont : Integer;
   FValorVenda: Double;
   aCodBarra : String;
begin
 If uFuncoes.Empty(edtETATUAL.Text) Then
 Begin
      ShowMessage('Digite a posição inicial.');
      edtETATUAL.SetFocus;
      Exit;
 End;
 //
 If (qryConsulta.Active = False) Then
 Begin
      ShowMessage('Não há itens para serem impresso.');
      edtCDPROD.SetFocus;
      Exit;
 End;    
 //
 If (qryConsulta.Active = True)
   And (qryConsulta.RecordCount = 0) Then
 Begin
      ShowMessage('Inclua itens para serem impresso.');
      edtCDPROD.SetFocus;
      Exit;
 End;
 //
 If not uFuncoes.Empty(edtETATUAL.Text) Then
 begin
     //
     If (dmEtiquetas.tbParametros.Active = False) Then
       dmEtiquetas.tbParametros.Open;
     //
     If (cmbTamanho.ItemIndex <> 2) Then
     begin
         dmEtiquetas.tbParametros.Edit;
         dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsInteger :=  StrtoInt(edtETATUAL.Text);
         dmEtiquetas.tbParametros.Post;
     End;
     //
    if (cmbTamanho.ItemIndex  = 0) Then
    begin
         //Application.CreateForm(TfrmRelEtiqueta , frmRelEtiqueta);
         btImprimir.Enabled := False;
         Try
            //
            GERAR_ETIQUETAS('N');
            //
            //With frmRelEtiqueta.qryEtiquetas do
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
            RVSystem1.SystemPrinter.MarginBottom  := 1.0;
            RVSystem1.SystemPrinter.MarginLeft    := 0.4;
            RVSystem1.SystemPrinter.MarginTop     := 1.2;
            RVSystem1.SystemPrinter.MarginRight   := 0.4;
            RVSystem1.SystemPrinter.Units         := unCM;
            RVSystem1.SystemPrinter.UnitsFactor   := 2.54;
            //
            RVSystem1.SystemPrinter.Copies        := 1;
            //
            RPDev.Orientation := poPortrait;
            RVSystem1.SystemPrinter.Orientation   := RPDev.Orientation;
            RPDev.SetPaperSize(DMPAPER_A4,0,0);
            RPDev.SelectPaper('A4 small sheet, 210- by 297-millimeters',false);
            //
            RVSystem1.SystemPreview.FormState     := wsMaximized;
            RVSystem1.SystemSetups := RVSystem1.SystemSetups - [ssAllowSetup];
            // Regua
            If (dmEtiquetas.tbParametrosPAR_MOSTRAR_REGUA.AsString = 'S') Then
                RVSystem1.SystemPreview.RulerType  := rtBothCm;
            //RVSystem1.SystemPreview.RulerType     := rtBothCm;
            RVSystem1.Execute;
            //
            //frmRelEtiqueta.qrEtiquetas.Preview ;
         Finally
              //frmRelEtiqueta.Free;
              btImprimir.Enabled := True;
              //RVSystem1.Free;
              // Fecha janela
              Close;
         End;
         Application.ProcessMessages;
    End
    Else If (cmbTamanho.ItemIndex  = 1) Then
    begin
         btImprimir.Enabled := False;
         Try
            //
            GERAR_ETIQUETAS('N');
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
            RVSystem2.SystemPrinter.MarginBottom  := 1.6;
            RVSystem2.SystemPrinter.MarginLeft    := 0.8;
            RVSystem2.SystemPrinter.MarginTop     := 1.7;
            RVSystem2.SystemPrinter.MarginRight   := 0.5;
            RVSystem2.SystemPrinter.Units         := unCM;
            RVSystem2.SystemPrinter.UnitsFactor   := 2.54;
            //
            RVSystem2.SystemPrinter.Copies        := 1;
            RPDev.Orientation := poLandScape;
            //
            RVSystem2.SystemPrinter.Orientation   := RPDev.Orientation;   //poLandScape;
            RPDev.SetPaperSize(DMPAPER_A5,0,0);
            RPDev.SelectPaper('A5 sheet, 148- by 210-millimeters',false);
            //
            RVSystem2.SystemPreview.FormState     := wsMaximized;
            RVSystem2.SystemSetups := RVSystem1.SystemSetups - [ssAllowSetup];
            // Regua
            If (dmEtiquetas.tbParametrosPAR_MOSTRAR_REGUA.AsString = 'S') Then
                RVSystem2.SystemPreview.RulerType  := rtBothCm;
            //RVSystem2.SystemPreview.RulerType     := rtBothCm;
            RVSystem2.Execute;
         Finally
              btImprimir.Enabled := True;
              //RVSystem2.Free;
              // Fecha janela
              Close;
         End;
          Application.ProcessMessages;

     End
     Else If (cmbTamanho.ItemIndex  = 2) Then
      begin
           //
           btConfirma.Enabled := False;
           Try
              //
              GERAR_ETIQUETAS('S');
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
               {RVSystem2.SystemPrinter.MarginBottom  := 1.6;
               RVSystem2.SystemPrinter.MarginLeft    := 0.8;
               RVSystem2.SystemPrinter.MarginTop     := 1.7;
               RVSystem2.SystemPrinter.MarginRight   := 0.5;
               RVSystem2.SystemPrinter.Units         := unCM;
               RVSystem2.SystemPrinter.UnitsFactor   := 2.54;
               //
               RVSystem2.SystemPrinter.Copies        := 1;
               RPDev.Orientation := poLandScape;
               //
               RVSystem2.SystemPrinter.Orientation   := RPDev.Orientation;   //poLandScape;
               RPDev.SetPaperSize(DMPAPER_A5,0,0);
               RPDev.SelectPaper('A5 sheet, 148- by 210-millimeters',false);
               //
               RVSystem2.SystemPreview.FormState     := wsMaximized;
               RVSystem2.SystemSetups := RVSystem1.SystemSetups - [ssAllowSetup];
               // Regua
               //RVSystem2.SystemPreview.RulerType     := rtBothCm;
               RVSystem2.Execute; }
               rvPersonalizado.Execute;
               rvPersonalizado.Close;
            Finally
                 btConfirma.Enabled := True;
                 //RVSystem2.Free;
                 // Fecha janela
                 Close;
            End;
             Application.ProcessMessages;
      End
      Else If (cmbTamanho.ItemIndex = 3) Then
      begin
         btImprimir.Enabled := False;
         Try
            //
            GERAR_ETIQUETAS('N');
            //
            //With frmRelEtiqueta.qryEtiquetas do
            With qryEtiquetas do
            begin
                SQL.Clear;
                Close;
                SQL.Add('Select * from "SACEQT.DB"');
                //
                Prepare;
                Open;
                //
                {If not (IsEmpty) Then
                begin
                     First;
                     dmEtiquetas.cdsEtiquetas.Close;
                     dmEtiquetas.cdsEtiquetas.Open;
                     dmEtiquetas.cdsEtiquetas.EmptyDataSet;
                     //
                     I := 1;
                     While not (Eof) do
                      begin
                           With dmEtiquetas.cdsEtiquetas do
                           begin
                                  Append;
                                  //
                                  Append;
                                  FieldByName('ITEM').AsString   := InttoStr(I);
                                  If not uFuncoes.Empty(qryEtiquetasEQT_CDPROD.AsString) Then
                                  begin
                                       FieldByName('CODIGO').AsString := uFuncoes.StrZero(qryEtiquetasEQT_CDPROD.AsString,13);
                                       FieldByName('BARRAS').AsString := qryEtiquetasEQT_CDBARR.AsString;
                                       FieldByName('NOME').AsString   := qryEtiquetasEQT_NMPROD.AsString;
                                       FieldByName('VALOR').AsFloat   := qryEtiquetasEQT_VLVEND.AsFloat;
                                       FieldByName('TAMANHO').AsString := 'TAM: M';
                                  End;
                                  //
                                  Post;
                           End;
                           //
                           I := I + 1;
                           Next;
                      End;
                End;  }
            End;
            //
            With dmEtiquetas.qryModEtiqueta do
            begin
                 Close;
                 Params[0].AsInteger := 1;
                 Open;
                 //
                 If not (IsEmpty) then
                 begin
                      RVSystem4.SystemPrinter.MarginLeft  := FieldBYName('MDE_COLUNA_INICIAL').AsFloat;
                      RVSystem4.SystemPrinter.MarginTop   := FieldBYName('MDE_LINHA_INICIAL').AsFloat;
                      //
                      RVSystem4.SystemPrinter.MarginBottom  := FieldBYName('MDE_MARGEM_INFERIOR').AsFloat;
                      //0.5;
                      RVSystem4.SystemPrinter.MarginRight   := FieldBYName('MDE_MARGEM_DIREITA').AsFloat;
                      //0.6;
                 End
                 Else
                 begin
                      RVSystem4.SystemPrinter.MarginBottom  := 0.5;
                      RVSystem4.SystemPrinter.MarginLeft    := 0.7;
                      RVSystem4.SystemPrinter.MarginTop     := 1.2;
                      RVSystem4.SystemPrinter.MarginRight   := 0.6;
                 End
            End;
            //
            RVSystem4.SystemPrinter.Units         := unCM;
            RVSystem4.SystemPrinter.UnitsFactor   := 2.54;
            RVSystem4.SystemPrinter.Copies        := 1;
            //
            RPDev.Orientation := poPortrait;
            RVSystem4.SystemPrinter.Orientation   := RPDev.Orientation;
            RPDev.SetPaperSize(DMPAPER_A4,0,0);
            RPDev.SelectPaper('A4 small sheet, 210- by 297-millimeters',false);
            //
            RVSystem4.SystemPreview.FormState     := wsMaximized;
            RVSystem4.SystemSetups := RVSystem1.SystemSetups - [ssAllowSetup];
            // Regua
            If (dmEtiquetas.tbParametrosPAR_MOSTRAR_REGUA.AsString = 'S') Then
                RVSystem4.SystemPreview.RulerType  := rtBothCm;
            RVSystem4.Execute;
            //rvpEtiqueta10x3.Execute;
            //
         Finally
              //
              btImprimir.Enabled := True;
              // Fecha janela
              Close;
         End;
         Application.ProcessMessages;
      End
      Else if (cmbTamanho.ItemIndex = 4) Then
      begin
          btImprimir.Enabled := False;
         Try
            //
            GERAR_ETIQUETAS('N');
            //
            //With frmRelEtiqueta.qryEtiquetas do
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
            RvSystem16X6.SystemPrinter.MarginBottom  := 1.0;
            RvSystem16X6.SystemPrinter.MarginLeft    := 0.4;
            RvSystem16X6.SystemPrinter.MarginTop     := 1.2;
            RvSystem16X6.SystemPrinter.MarginRight   := 0.4;
            RvSystem16X6.SystemPrinter.Units         := unCM;
            RvSystem16X6.SystemPrinter.UnitsFactor   := 2.54;
            //
            RvSystem16X6.SystemPrinter.Copies        := 1;
            //
            RPDev.Orientation := poPortrait;
            RvSystem16X6.SystemPrinter.Orientation   := RPDev.Orientation;
            RPDev.SetPaperSize(DMPAPER_A4,0,0);
            RPDev.SelectPaper('A4 small sheet, 210- by 297-millimeters',false);
            //
            RvSystem16X6.SystemPreview.FormState     := wsMaximized;
            RvSystem16X6.SystemSetups := RvSystem16X6.SystemSetups - [ssAllowSetup];
            // Regua
            If (dmEtiquetas.tbParametrosPAR_MOSTRAR_REGUA.AsString = 'S') Then
                RvSystem16X6.SystemPreview.RulerType  := rtBothCm;
            //RVSystem1.SystemPreview.RulerType     := rtBothCm;
            RvSystem16X6.Execute;
            //
            //frmRelEtiqueta.qrEtiquetas.Preview ;
         Finally
              //frmRelEtiqueta.Free;
              btImprimir.Enabled := True;
              //RVSystem1.Free;
              // Fecha janela
              Close;
         End;
         Application.ProcessMessages;
      End
      Else if (cmbTamanho.ItemIndex = 5) Then
      begin
           btImprimir.Enabled := False;
           Try
                 GERAR_ETIQUETAS('N');
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
            With dmEtiquetas.qryModEtiqueta do
            begin
                 Close;
                 Params[0].AsInteger := 2;
                 Open;
                 //
                 If not (IsEmpty) then
                 begin
                      RvSystemA4New.SystemPrinter.MarginLeft  := FieldBYName('MDE_COLUNA_INICIAL').AsFloat;
                      RvSystemA4New.SystemPrinter.MarginTop   := FieldBYName('MDE_LINHA_INICIAL').AsFloat;
                      //
                      RvSystemA4New.SystemPrinter.MarginBottom  := FieldBYName('MDE_MARGEM_INFERIOR').AsFloat;
                      //0.5;
                      RvSystemA4New.SystemPrinter.MarginRight   := FieldBYName('MDE_MARGEM_DIREITA').AsFloat;
                      //0.6;
                 End
                 Else
                 begin
                      RvSystemA4New.SystemPrinter.MarginBottom  := 0.5;
                      RvSystemA4New.SystemPrinter.MarginLeft    := 0.5;
                      RvSystemA4New.SystemPrinter.MarginTop     := 0.5;
                      RvSystemA4New.SystemPrinter.MarginRight   := 0.5;
                 End
            End;
            //
            RvSystemA4New.SystemPrinter.Units         := unCM;
            RvSystemA4New.SystemPrinter.UnitsFactor   := 2.54;
            RvSystemA4New.SystemPrinter.Copies        := 1;
            //
            RPDev.Orientation := poPortrait;
            RvSystemA4New.SystemPrinter.Orientation   := RPDev.Orientation;
            RPDev.SetPaperSize(DMPAPER_A4,0,0);
            RPDev.SelectPaper('A4 small sheet, 210- by 297-millimeters',false);
            //
            RvSystemA4New.SystemPreview.FormState     := wsMaximized;
            RvSystemA4New.SystemSetups := RVSystem1.SystemSetups - [ssAllowSetup];
            // Regua
            If (dmEtiquetas.tbParametrosPAR_MOSTRAR_REGUA.AsString = 'S') Then
                RvSystemA4New.SystemPreview.RulerType  := rtBothCm;
            RvSystemA4New.Execute;
           Finally
                 btImprimir.Enabled := true;
                 Close;
           End;
           Application.ProcessMessages;
      End
      Else if (cmbTamanho.ItemIndex = 6) Then
      begin
          btImprimir.Enabled := False;
          Try
               dmEtiquetas.cdsDados.Close;
               dmEtiquetas.cdsDados.Open;
               dmEtiquetas.cdsDados.EmptyDataSet;
               //
               With qryConsulta do
               begin
                    First;
                    While not (Eof) do
                    begin
                         FValorVenda := dmEtiquetas.GetValorVendaProduto(uFuncoes.StrZero(fieldByName('ETT_CDPROD').AsString,13));
                         //
                         For iCont :=  1 to fieldByName('ETT_QTPROD').AsInteger do
                            dmEtiquetas.Adicionar_Dados_Gondula(fieldByName('ETT_CDPROD').AsString, 1, FValorVenda);
                         //
                         Next;
                    End;
               End;
               //
               if not (dmEtiquetas.cdsDados.IsEmpty) Then
               begin
                    RvSGondula.SystemPreview.FormState     := wsMaximized;
                    RvSGondula.SystemSetups := RvSGondula.SystemSetups - [ssAllowSetup];
                    //
                    If (dmEtiquetas.tbParametrosPAR_MOSTRAR_REGUA.AsString = 'S') Then
                      RvSGondula.SystemPreview.RulerType  := rtBothCm;
                    //
                    RvPGondula.SetParam('pDATAMOV', DatetoStr(Date));
                    RvPGondula.Execute;
               End;
          Finally
                 btImprimir.Enabled := true;
                 Close;
          End;
           Application.ProcessMessages;
      End;
      //
      if (cmbTamanho.ItemIndex  = 7) Then
      begin
         //
         Application.ProcessMessages;
         btConfirma.Enabled := False;
         Application.ProcessMessages;
         Try
            //
            GERAR_ETIQUETAS('N');
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
            rvsEtiquetaA4_126.SystemPrinter.MarginBottom  := 1.6;
            rvsEtiquetaA4_126.SystemPrinter.MarginLeft    := 0.8;
            rvsEtiquetaA4_126.SystemPrinter.MarginTop     := 1.7;
            rvsEtiquetaA4_126.SystemPrinter.MarginRight   := 0.5;
            rvsEtiquetaA4_126.SystemPrinter.Units         := unCM;
            rvsEtiquetaA4_126.SystemPrinter.UnitsFactor   := 2.54;
            //
            rvsEtiquetaA4_126.SystemPrinter.Copies        := 1;
            RPDev.Orientation := poPortrait;
            //
            rvsEtiquetaA4_126.SystemPrinter.Orientation   := RPDev.Orientation;   //poLandScape;
            RPDev.SetPaperSize(DMPAPER_A4,0,0);
            RPDev.SelectPaper('A4 small sheet, 210- by 297-millimeters',false);
            //
            rvsEtiquetaA4_126.SystemPreview.FormState     := wsMaximized;
            rvsEtiquetaA4_126.SystemSetups := RVSystem1.SystemSetups - [ssAllowSetup];
            // Regua
            If (dmEtiquetas.tbParametrosPAR_MOSTRAR_REGUA.AsString = 'S') Then
               rvsEtiquetaA4_126.SystemPreview.RulerType     := rtBothCm;
            rvsEtiquetaA4_126.Execute;
         Finally
              btConfirma.Enabled := True;
              //RVSystem2.Free;
              // Fecha janela
              Close;
         End;
         Application.ProcessMessages;
      End;

      //
      Limpar;
  End;   
end;

function TfrmEtiquetas2.QUANT_ETIQUETAS(aDados: TDataSet): Integer;
Var
  M_QTETIQ : Integer;
begin
     M_QTETIQ := 0;
     //
     With aDados do
      begin
           DisableControls;
           First;
           While not (Eof) do
            begin
                 M_QTETIQ := M_QTETIQ + FieldByName('ETT_QTPROD').AsInteger;
                 //
                 Next;
            End;
            //
            EnableControls; 
      End;
      //
      result :=  M_QTETIQ;
end;

procedure TfrmEtiquetas2.Atualizar_Posicao;
begin
         If (dmEtiquetas.tbParametros.Active = False) Then
           dmEtiquetas.tbParametros.Open;
         //
          dmEtiquetas.tbParametros.Edit;
          dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsString := edtETATUAL.Text;
          dmEtiquetas.tbParametros.Post;
         //
         edtETATUAL.Text := dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsString;
         edtCDPROD.SetFocus;
end;

procedure TfrmEtiquetas2.edtETATUALExit(Sender: TObject);
begin
      If not Empty(edtETATUAL.Text) Then
          Atualizar_Posicao;
end;

procedure TfrmEtiquetas2.Excluir_Produto(aCodigo: String);
begin
     With dmEtiquetas.qryExcluir do
     begin
          Close;
          ParamByName('pCODIGO').AsString := aCodigo; 
          ExecSQL();
     End;
end;

procedure TfrmEtiquetas2.btnExcluirClick(Sender: TObject);
begin
     If (qryConsulta.Active) and (qryConsulta.RecordCount > 0) Then
     begin
          Excluir_Produto(qryConsulta.FieldByName('ETT_CDPROD').AsString);
          CONSULTA;
     End;
end;

procedure TfrmEtiquetas2.Nova_Pagina;
begin
         If (dmEtiquetas.tbParametros.Active = False) Then
           dmEtiquetas.tbParametros.Open;
         //
          dmEtiquetas.tbParametros.Edit;
          dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsInteger := 0;
          dmEtiquetas.tbParametros.Post;
         //
         edtETATUAL.Text := dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsString;
end;

procedure TfrmEtiquetas2.Limpar;
begin
     With qryConsulta do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Delete from SACETT');
          ExecSQL;
     End;
     //
     {If (dmEtiquetas.tbParametrosPAR_PADRAO_ETIQ.AsInteger = 1) The
          M_MAXIMO := 25
     Else
          M_MAXIMO := 65; }
      Case cmbTamanho.ItemIndex of
        0 : M_MAXIMO := 65;
        1 : M_MAXIMO := 25;
        2 : M_MAXIMO := 1;
        3 : M_MAXIMO := 33;
        4 : M_MAXIMO := 96;
        5 : M_MAXIMO := 290;
     End;
     //
     W_NRITEM := 1;
end;


procedure TfrmEtiquetas2.RvSystem4Print(Sender: TObject);
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

begin
    With dmEtiquetas.qryModEtiqueta do
    begin
          Close;
          Params[0].AsInteger := 1;
          Open;
          //
          If not (IsEmpty) then
          begin
               MarginLeft  := FieldBYName('MDE_COLUNA_INICIAL').AsFloat;
               MarginTop   := FieldBYName('MDE_LINHA_INICIAL').AsFloat;
               //
               LabelHeight := FieldBYName('MDE_LARGURA_ETI').AsFloat;
               LabelWidth  := FieldBYName('MDE_TAMANHO_ETI').AsFloat;
               LabelRows   := FieldBYName('MDE_TOTAL_LINHAS').AsInteger;
               LabelCols   := FieldBYName('MDE_TOTAL_COLUNAS').AsInteger;
          End
          Else
          begin
               MarginLeft  := 1.0;
               MarginTop   := 1.0;
               //
               LabelWidth  := 65.5;
               LabelHeight := 31;

               LabelRows   := 10;
               LabelCols   := 3;
          End;
    End;
    //
    CurLabel := 0;
    LabelRow := 0;

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
   RVSystem4.BaseReport.SetFont('Arial',6);
   //
   qryEtiquetas.First;
   //
   While not qryEtiquetas.Eof do
   Begin
       Factor   := (CurLabel Mod LabelCols);
       CurCol   := (Factor*LabelWidth)+MarginLeft;
       CurRow   := (LabelRow * LabelHeight) + MarginTop;

       // Referência
       If not Empty(qryEtiquetas.FieldByName('EQT_TAMANHO').AsString) Then
       begin
            RVSystem4.BaseReport.GotoXY(CurCol,CurRow-0.04);
            RVSystem4.BaseReport.PrintLeft('TAM: '+ qryEtiquetas.FieldByName('EQT_TAMANHO').AsString ,CurCol+0.02);
       End;
       //
       If (qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat > 0) AND (dmEtiquetas.tbParametrosPAR_FLPRECO.AsString = 'S') Then
       begin
            // Valor de venda
            RVSystem4.BaseReport.GotoXY(CurCol,CurRow-0.04);
            RVSystem4.BaseReport.PrintRight( FormatFloat('###,##0.#0',qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat),CurCol+3.2);
       End;
       // Referência
       RVSystem4.BaseReport.GotoXY(CurCol,CurRow+0.18);
       RVSystem4.BaseReport.PrintLeft( Copy(qryEtiquetas.FieldByName('EQT_CDBARR').AsString,1,26),CurCol);
       // Descrição do produto
       RVSystem4.BaseReport.GotoXY(CurCol,CurRow+0.36);
       RVSystem4.BaseReport.PrintLeft( Copy(qryEtiquetas.FieldByName('EQT_NMPROD').AsString,1,26),CurCol);
       //
       If not Empty(qryEtiquetas.FieldByName('EQT_CDPROD').AsString) Then
          PrintBarCodeEAN(RVSystem4,CurRow + 0.40,CurCol + 0.04, StrZero(FloattoStr(qryEtiquetas.FieldByName('EQT_CDPROD').AsFloat),5));
       //
       Inc(CurLabel);
       If Factor=LabelCols-1 Then
          Inc(LabelRow);
       //
       qryEtiquetas.Next;
       //
       If (LabelRow >= LabelRows) Then
       Begin
          LabelRow := 0;
          if not (qryEtiquetas.Eof) Then
           begin
                RVSystem4.BaseReport.NewPage;
           End;
       End;
   End;  //fim-enquanto
   qryEtiquetas.Close;
   //
end;

procedure TfrmEtiquetas2.edtTamanhoKeyPress(Sender: TObject;
  var Key: Char);
begin
   If (Key = #13) Then
     Begin
          key:=#0;
          //
          Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TfrmEtiquetas2.cmbTamanhoExit(Sender: TObject);
begin
     If (cmbTamanho.ItemIndex = 3) Then
     begin
          lblTamanho.Visible := True;
          edtTamanho.Visible := True;
     End
     Else
     begin
          lblTamanho.Visible := false;
          edtTamanho.Visible := false;
     End;
     //
     If (cmbTamanho.ItemIndex = 6) Then
     Begin
          Label5.Visible := false;
          edtETATUAL.Visible := false;
     End;
end;

procedure TfrmEtiquetas2.RvSystem16X6Print(Sender: TObject);
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
    //
    M_COLUNA : array[1..6] of Double;
    M_LINHA  : array[1..16] of Double;
    I, M_LICONT : integer;

begin
   // A4
   //MarginLeft  := 0.6;
   //
   {If (dmEtiquetas.tbParametrosPAR_IMPRESSORA.AsInteger = 2) Then
      MarginTop   := 1.3  // Laser
   Else
      MarginTop   := 1.6; // Jato de tinta}
   // Nova alteração
   MarginLeft  := dmEtiquetas.tbParametrosPAR_COLUNA_INICIAL.AsFloat;
   //
   If (dmEtiquetas.tbParametrosPAR_IMPRESSORA.AsInteger = 2) Then
      MarginTop   := dmEtiquetas.tbParametrosPAR_LINHA_INICIAL.AsFloat
   Else
      MarginTop   := dmEtiquetas.tbParametrosPAR_LINHA_INICIAL.AsFloat;
   //
   {LabelWidth  := 4.1;
   LabelHeight := 2.1;}
   LabelWidth  := dmEtiquetas.tbParametrosPAR_TAMANHO_ETI.AsFloat;
   LabelHeight := dmEtiquetas.tbParametrosPAR_LARGURA_ETI.AsFloat;
   //tbParametrosPAR_LAGURA_ETI
   LabelRows   := 16;
   LabelCols   := 6;

   CurLabel := 0;
   LabelRow := 0;
   //
     // Defini as coodernadas das linhas
     {M_LINHA[1] := MarginTop + 1.20;
     M_LINHA[2] := MarginTop + 3.30;
     M_LINHA[3] := MarginTop + 5.43;
     M_LINHA[4] := MarginTop + 7.54;
     M_LINHA[5] := MarginTop + 9.72;
     //
     M_LINHA[6]  := MarginTop +11.83;
     M_LINHA[7]  := MarginTop +13.96;
     M_LINHA[8]  := MarginTop +16.09;
     M_LINHA[9]  := MarginTop +18.22;
     M_LINHA[10] := MarginTop +20.35;
     //
     M_LINHA[11] := MarginTop +22.48;
     M_LINHA[12] := MarginTop +24.61;
     M_LINHA[13] := MarginTop +26.74;}
     //
     M_LINHA[1] := MarginTop + 1.30;
     M_LINHA[2] := MarginTop + 3.00;
     M_LINHA[3] := MarginTop + 4.70;
     M_LINHA[4] := MarginTop + 6.40;
     M_LINHA[5] := MarginTop + 8.10;
     //
     M_LINHA[6]  := MarginTop +9.80;
     M_LINHA[7]  := MarginTop +11.50;
     M_LINHA[8]  := MarginTop +13.20;
     M_LINHA[9]  := MarginTop +14.90;
     M_LINHA[10] := MarginTop +16.60;
     //
     M_LINHA[11] := MarginTop +18.30;
     M_LINHA[12] := MarginTop +20.00;
     M_LINHA[13] := MarginTop +21.70;
     //
     M_LINHA[14] := MarginTop +23.40;
     M_LINHA[15] := MarginTop +25.10;
     M_LINHA[16] := MarginTop +26.80;

     // Defini as coodernadas das colunas
     M_COLUNA[1] := MarginLeft;
     M_COLUNA[2] := M_COLUNA[1] + LabelWidth;
     M_COLUNA[3] := M_COLUNA[2] + LabelWidth;
     M_COLUNA[4] := M_COLUNA[3] + LabelWidth + 0.1;
     M_COLUNA[5] := M_COLUNA[4] + LabelWidth + 0.1;
     M_COLUNA[6] := M_COLUNA[5] + LabelWidth;
     //

   //GERAR_ETIQUETAS;
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
   RvSystem16X6.BaseReport.SetFont('Arial',5);
   M_LICONT := 1;
   I := 1;
   //
   While not qryEtiquetas.Eof do
   Begin
       {Factor   := (CurLabel Mod LabelCols);
       CurCol   := (Factor*LabelWidth)+MarginLeft;
       CurRow   := (LabelRow * LabelHeight) + MarginTop;}
       // novo
       Factor   := (CurLabel Mod LabelCols);
       CurCol   := M_COLUNA[I];
       CurRow   := M_LINHA [M_LICONT];
       // Referência
     if (dmEtiquetas.tbParametrosPAR_CDALFANUMERICO.AsString = 'N') then
     begin
          If (qryEtiquetas.FieldByName('EQT_CDBARR').AsString <> '0000000000000') Then
          begin
              {RVSystem1.BaseReport.GotoXY(CurCol,CurRow-0.04);
              RVSystem1.BaseReport.PrintLeft(qryEtiquetas.FieldByName('EQT_CDBARR').AsString,CurCol+0.02);}
              RvSystem16X6.BaseReport.GotoXY(CurCol,CurRow + 0.2);
              RvSystem16X6.BaseReport.PrintLeft(qryEtiquetas.FieldByName('EQT_CDBARR').AsString,CurCol+0.2);
          End;
          //
          If (qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat > 0) AND (dmEtiquetas.tbParametrosPAR_FLPRECO.AsString = 'S') Then
          begin
               //
               RvSystem16X6.BaseReport.GotoXY(CurCol,CurRow+0.2);
               RvSystem16X6.BaseReport.PrintRight( FormatFloat('###,##0.#0',qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat),CurCol+2.9);
          End;
          // Descrição do produto
          {RVSystem1.BaseReport.GotoXY(CurCol,CurRow+0.14);
          RVSystem1.BaseReport.PrintLeft( Copy(qryEtiquetas.FieldByName('EQT_NMPROD').AsString,1,26),CurCol);}
          RvSystem16X6.BaseReport.GotoXY(CurCol,CurRow+0.4);
          RvSystem16X6.BaseReport.PrintLeft( Copy(qryEtiquetas.FieldByName('EQT_NMPROD').AsString,1,26),CurCol + 0.2);
          //
          If not Empty(qryEtiquetas.FieldByName('EQT_CDPROD').AsString) Then
             //PrintBarCodeEAN(RVSystem1,CurRow + 0.30,CurCol + 0.17, StrZero(FloattoStr(qryEtiquetas.FieldByName('EQT_CDPROD').AsFloat),5));
             PrintBarcodeEAN_Novo(RvSystem16X6,CurRow + 0.5,CurCol + 0.17, StrZero(FloattoStr(qryEtiquetas.FieldByName('EQT_CDPROD').AsFloat),5), 0.8, 0.035);
       End
       Else
       begin
           RvSystem16X6.BaseReport.SetFont('Arial',6);
           If (qryEtiquetas.FieldByName('EQT_CDBARR').AsString <> '0000000000000') Then
           begin
                RvSystem16X6.BaseReport.GotoXY(CurCol,CurRow + 0.2);
                RvSystem16X6.BaseReport.PrintLeft(qryEtiquetas.FieldByName('EQT_CDBARR').AsString,CurCol+0.02);
           End;
           // Descrição do produto
           RvSystem16X6.BaseReport.GotoXY(CurCol,CurRow+0.5);
           RvSystem16X6.BaseReport.PrintLeft( Copy(qryEtiquetas.FieldByName('EQT_NMPROD').AsString,1,26),CurCol);
           //
           If (qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat > 0) AND (dmEtiquetas.tbParametrosPAR_FLPRECO.AsString = 'S') Then
            begin
                 // Valor de venda
                 RvSystem16X6.BaseReport.SetFont('Arial Black',14);
                 RvSystem16X6.BaseReport.GotoXY(CurCol,CurRow+1.2);
                 RvSystem16X6.BaseReport.PrintRight( FormatFloat('###,##0.#0',qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat),CurCol+2.5);
            End;
       End;
       //
       Inc(CurLabel);
       I := I + 1;
       If Factor=LabelCols-1 Then
        Begin
          Inc(LabelRow);
          I := 1;
          M_LICONT := M_LICONT + 1;
        End;
       // proximo registro
       qryEtiquetas.Next;
       //
       If (LabelRow>=LabelRows) Then
       Begin
          LabelRow := 0;
          if not (qryEtiquetas.Eof) Then
            Begin
                RvSystem16X6.BaseReport.NewPage;
                M_LICONT := 1;
                // Nova_Pagina;
            End;
       End;
   End;
   qryEtiquetas.Close;
end;

procedure TfrmEtiquetas2.PrintBarcodeEAN_Novo(RVSystem: TRVSystem; Row,
  Column: Double; Value: String; fAltura, fLargura: Double);
begin
   With TRPBarsCode128.Create(RVSystem.BaseReport) do
   Begin
     BarHeight  := fAltura;
     BarWidth   := fLargura;
     WideFactor := BarWidth;
     Text := Value;
     PrintXY(Column,Row);
     Free;
   end;
end;

procedure TfrmEtiquetas2.RvSystemA4NewPrint(Sender: TObject);
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
    aCodProduto, aNomeProduto : String;
    fValorVenda : Double;
begin
    With dmEtiquetas.qryModEtiqueta do
    begin
          Close;
          Params[0].AsInteger := 2;
          Open;
          //
          {If not (IsEmpty) then
          begin
               MarginLeft  := FieldBYName('MDE_COLUNA_INICIAL').AsFloat;
               MarginTop   := FieldBYName('MDE_LINHA_INICIAL').AsFloat;
               //
               LabelHeight := FieldBYName('MDE_LARGURA_ETI').AsFloat;
               LabelWidth  := FieldBYName('MDE_TAMANHO_ETI').AsFloat;
               LabelRows   := FieldBYName('MDE_TOTAL_LINHAS').AsInteger;
               LabelCols   := FieldBYName('MDE_TOTAL_COLUNAS').AsInteger;
          End
          Else
          begin }
               MarginLeft  := 0.5;
               MarginTop   := 0.1;
               //
               LabelWidth  := 1.2;
               LabelHeight := 0.8;
               //
               LabelRows   := 40;
               LabelCols   := 17;
        //  End;
    End;
    //
    CurLabel := 0;
    LabelRow := 0;

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
   RvSystemA4New.BaseReport.SetFont('Arial',5);
   //
   qryEtiquetas.First;
   //
   While not qryEtiquetas.Eof do
   Begin
       Factor   := (CurLabel Mod LabelCols);
       CurCol   := (Factor*LabelWidth)+MarginLeft;
       CurRow   := (LabelRow * LabelHeight) + MarginTop;
       //
       if (Length(qryEtiquetas.FieldByName('EQT_CDBARR').AsString) = 13) Then
          aCodProduto := Copy(qryEtiquetas.FieldByName('EQT_CDBARR').AsString,10,4);
       if (Length(qryEtiquetas.FieldByName('EQT_CDBARR').AsString) = 14) Then
          aCodProduto := Copy(qryEtiquetas.FieldByName('EQT_CDBARR').AsString,11,4);
       //
       aNomeProduto:= Copy(qryEtiquetas.FieldByName('EQT_NMPROD').AsString,1,16);
       //
       // Descrição do produto
       {RvSystemA4New.BaseReport.GotoXY(CurCol,CurRow+0.36);
       RvSystemA4New.BaseReport.PrintLeft(aNomeProduto,CurCol);  }
       //
       If not Empty(aCodProduto) Then
          PrintBarcodeEAN_Novo(RvSystemA4New,CurRow + 0.40,CurCol + 0.04, aCodProduto, 0.5, 0.016);     // 0.4, 0.017
         // PrintBarcodeEAN_Novo(RvSystemA4New,CurRow + 0.40,CurCol + 0.04, aCodProduto, 0.6, 0.028);
       //
       Inc(CurLabel);
       If Factor=LabelCols-1 Then
          Inc(LabelRow);
       //
       qryEtiquetas.Next;
       //
       If (LabelRow >= LabelRows) Then
       Begin
          LabelRow := 0;
          if not (qryEtiquetas.Eof) Then
           begin
                RvSystemA4New.BaseReport.NewPage;
           End;
       End;
   End;  //fim-enquanto
   //
  { If (dmEtiquetas.tbParametros.Active = False) Then
           dmEtiquetas.tbParametros.Open;
         //
          dmEtiquetas.tbParametros.Edit;
          dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsInteger := 0;
          dmEtiquetas.tbParametros.Post;      }
   //
   qryEtiquetas.Close;
end;

procedure TfrmEtiquetas2.rvsEtiquetaA4_126Print(Sender: TObject);
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
    fTamFonte   : Double;
    //
    M_COLUNA : array[1..5] of Double;
    M_LINHA  : array[1..13] of Double;
    I, M_LICONT : integer;

begin
   // A4
   //MarginLeft  := 0.6;
   //
   {If (dmEtiquetas.tbParametrosPAR_IMPRESSORA.AsInteger = 2) Then
      MarginTop   := 1.3  // Laser
   Else
      MarginTop   := 1.6; // Jato de tinta}
   // Nova alteração
   MarginLeft  := dmEtiquetas.tbParametrosPAR_COLUNA_INICIAL.AsFloat;
   fTamFonte   := dmEtiquetas.tbParametrosPAR_TAM_FONTE.AsFloat;
   //
   If not uFuncoes.Empty(dmEtiquetas.tbParametrosPAR_IMPRESSORA.AsString) Then
   begin
     If (dmEtiquetas.tbParametrosPAR_IMPRESSORA.AsInteger = 2) Then
        MarginTop   := dmEtiquetas.tbParametrosPAR_LINHA_INICIAL.AsFloat
     Else
        MarginTop   := dmEtiquetas.tbParametrosPAR_LINHA_INICIAL.AsFloat;
   End
   Else
       MarginTop   := dmEtiquetas.tbParametrosPAR_LINHA_INICIAL.AsFloat;
   //
   LabelWidth  := 2.8;
   LabelHeight := 1.5;
   {LabelWidth  := dmEtiquetas.tbParametrosPAR_TAMANHO_ETI.AsFloat;
   LabelHeight := dmEtiquetas.tbParametrosPAR_LARGURA_ETI.AsFloat;}
   //tbParametrosPAR_LAGURA_ETI
   LabelRows   := 18;
   LabelCols   := 7;

   CurLabel := 0;
   LabelRow := 0;
   //
     // Defini as coodernadas das linhas
     {M_LINHA[1] := MarginTop + 1.20;
     M_LINHA[2] := MarginTop + 3.30;
     M_LINHA[3] := MarginTop + 5.43;
     M_LINHA[4] := MarginTop + 7.54;
     M_LINHA[5] := MarginTop + 9.72;
     //
     M_LINHA[6]  := MarginTop +11.83;
     M_LINHA[7]  := MarginTop +13.96;
     M_LINHA[8]  := MarginTop +16.09;
     M_LINHA[9]  := MarginTop +18.22;
     M_LINHA[10] := MarginTop +20.35;
     //
     M_LINHA[11] := MarginTop +22.48;
     M_LINHA[12] := MarginTop +24.61;
     M_LINHA[13] := MarginTop +26.74;}
     //
     M_LINHA[1] := MarginTop + 1.20;
     M_LINHA[2] := MarginTop + 3.33;
     M_LINHA[3] := MarginTop + 5.46;
     M_LINHA[4] := MarginTop + 7.59;
     M_LINHA[5] := MarginTop + 9.72;
     //
     M_LINHA[6]  := MarginTop +11.85;
     M_LINHA[7]  := MarginTop +13.98;
     M_LINHA[8]  := MarginTop +16.11;
     M_LINHA[9]  := MarginTop +18.24;
     M_LINHA[10] := MarginTop +20.37;
     //
     M_LINHA[11] := MarginTop +22.50;
     M_LINHA[12] := MarginTop +24.63;
     M_LINHA[13] := MarginTop +26.76;

     // Defini as coodernadas das colunas
     M_COLUNA[1] := MarginLeft;
     M_COLUNA[2] := M_COLUNA[1] + LabelWidth;
     M_COLUNA[3] := M_COLUNA[2] + LabelWidth;
     M_COLUNA[4] := M_COLUNA[3] + LabelWidth;
     M_COLUNA[5] := M_COLUNA[4] + LabelWidth;
     //

   //GERAR_ETIQUETAS;
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
   //rvsEtiquetaA4_126.BaseReport.SetFont('Arial',4);
   rvsEtiquetaA4_126.BaseReport.SetFont('Arial', fTamFonte);
   M_LICONT := 1;
   I := 1;
   //
   While not qryEtiquetas.Eof do
   Begin
       Factor   := (CurLabel Mod LabelCols);
       CurCol   := (Factor*LabelWidth)+MarginLeft;
       CurRow   := (LabelRow * LabelHeight) + MarginTop;
       // novo
       {Factor   := (CurLabel Mod LabelCols);
       CurCol   := M_COLUNA[I];
       CurRow   := M_LINHA [M_LICONT];}
       // Referência
     if (dmEtiquetas.tbParametrosPAR_CDALFANUMERICO.AsString = 'N') Then
     begin
          If (dmEtiquetas.tbParametrosPAR_MOSTRA_REF.AsString = 'S') Then
          begin
            If (qryEtiquetas.FieldByName('EQT_CDBARR').AsString <> '0000000000000') Then
            begin
                rvsEtiquetaA4_126.BaseReport.GotoXY(CurCol,CurRow + 0.2);
                rvsEtiquetaA4_126.BaseReport.PrintLeft(qryEtiquetas.FieldByName('EQT_CDBARR').AsString,CurCol+0.02);
            End;
          End;
          //
          If (qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat > 0) Then
          begin
               // Valor de venda
               rvsEtiquetaA4_126.BaseReport.GotoXY(CurCol,CurRow+0.27);
               rvsEtiquetaA4_126.BaseReport.SetFont('Arial', 5);
               rvsEtiquetaA4_126.BaseReport.PrintRight( FormatFloat('###,##0.#0',qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat),CurCol+2.1);
          End;
          // Descrição do produto
          //rvsEtiquetaA4_126.BaseReport.SetFont('Arial',4);
          rvsEtiquetaA4_126.BaseReport.SetFont('Arial', fTamFonte);
          rvsEtiquetaA4_126.BaseReport.GotoXY(CurCol,CurRow+0.47);
          //RVSystem1.BaseReport.GotoXY(CurCol,CurRow+0.4);
          rvsEtiquetaA4_126.BaseReport.PrintLeft( Copy(qryEtiquetas.FieldByName('EQT_NMPROD').AsString,1,26),CurCol);
          //
          If not Empty(qryEtiquetas.FieldByName('EQT_CDPROD').AsString) Then
             PrintBarcodeEAN_126(rvsEtiquetaA4_126,CurRow + 0.5,CurCol + 0.17, StrZero(FloattoStr(qryEtiquetas.FieldByName('EQT_CDPROD').AsFloat),5));
     End
     Else
     begin
          rvsEtiquetaA4_126.BaseReport.SetFont('Arial', 5);
          //
          if not uFuncoes.Empty(qryEtiquetas.FieldByName('EQT_NMPROD').AsString) Then
          begin
              rvsEtiquetaA4_126.BaseReport.Bold := true;
              rvsEtiquetaA4_126.BaseReport.GotoXY(CurCol,CurRow + 0.2);
              rvsEtiquetaA4_126.BaseReport.PrintLeft(Copy(dmEtiquetas.tbParametrosPAR_NMEMPR.AsString,1,22),CurCol+0.02);
              rvsEtiquetaA4_126.BaseReport.Bold := false;
          End;
          //
          If (dmEtiquetas.tbParametrosPAR_MOSTRA_REF.AsString = 'S') Then
          begin
            If (qryEtiquetas.FieldByName('EQT_CDBARR').AsString <> '0000000000000') Then
            begin
                rvsEtiquetaA4_126.BaseReport.GotoXY(CurCol,CurRow + 0.4);
                rvsEtiquetaA4_126.BaseReport.PrintLeft(qryEtiquetas.FieldByName('EQT_CDBARR').AsString,CurCol+0.02);
            End;
          End;
          //

          // Descrição do produto
          //rvsEtiquetaA4_126.BaseReport.SetFont('Arial',4);
          rvsEtiquetaA4_126.BaseReport.SetFont('Arial', 5);
          rvsEtiquetaA4_126.BaseReport.GotoXY(CurCol,CurRow+0.6);
          //RVSystem1.BaseReport.GotoXY(CurCol,CurRow+0.4);
          rvsEtiquetaA4_126.BaseReport.PrintLeft( Copy(qryEtiquetas.FieldByName('EQT_NMPROD').AsString,1,26),CurCol);
          //
          If (qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat > 0) Then
          begin
               rvsEtiquetaA4_126.BaseReport.SetFont('Arial Black', 12);
               // Valor de venda
               rvsEtiquetaA4_126.BaseReport.GotoXY(CurCol,CurRow+1.0);
               rvsEtiquetaA4_126.BaseReport.PrintRight( FormatFloat('###,##0.#0',qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat),CurCol+2.1);
          End;
     End;
       //
       Inc(CurLabel);
       I := I + 1;
       If Factor=LabelCols-1 Then
        Begin
          Inc(LabelRow);
          I := 1;
          M_LICONT := M_LICONT + 1;
        End;
       // proximo registro
       qryEtiquetas.Next;
       //
       If (LabelRow>=LabelRows) Then
       Begin
          LabelRow := 0;

          if not (qryEtiquetas.Eof) Then
            Begin
                rvsEtiquetaA4_126.BaseReport.NewPage;
                // Nova_Pagina;
            End;
       End;
   End;
   qryEtiquetas.Close;
end;

procedure TfrmEtiquetas2.PrintBarcodeEAN_126(RVSystem: TRVSystem; Row,
  Column: Double; Value: String);
begin
  With TRPBarsCode128.Create(RVSystem.BaseReport) do
   Begin
     BarHeight  := 0.7;
     BarWidth   := 0.025;
     WideFactor := BarWidth;
     Text := Value;
     PrintXY(Column,Row);
     Free;
   end;
end;

End.



