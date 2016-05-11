unit uQuant;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, Printers,
  DB, DBTables, DBCtrls, Spin,  QuickRpt, QRCtrls;

type
  TfrmConfQuant = class(TForm)
    Panel2: TPanel;
    sbImprimir: TSpeedButton;
    spFechar: TSpeedButton;
    Panel1: TPanel;
    edtQTETIQ: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtLINENT: TEdit;
    edtCOLENT: TEdit;
    qryEtiquetas: TQuery;
    qryEtiquetasEQT_CDPROD: TStringField;
    qryEtiquetasEQT_NMPROD: TStringField;
    qryEtiquetasEQT_VLVEND: TFloatField;
    DBText1: TDBText;
    dsProduto: TDataSource;
    sedQTCOLU: TSpinEdit;
    Label4: TLabel;
    dsEtiquetas: TDataSource;
    Image1: TImage;
    dsParametros: TDataSource;
    edtETATUAL: TEdit;
    Label5: TLabel;
    codBarras1: TImage;
    procedure spFecharClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtLINENTKeyPress(Sender: TObject; var Key: Char);
    procedure edtCOLENTKeyPress(Sender: TObject; var Key: Char);
    procedure edtPOSICAOChange(Sender: TObject);
    procedure edtQTETIQKeyPress(Sender: TObject; var Key: Char);
    procedure edtPOSICAOKeyPress(Sender: TObject; var Key: Char);
    procedure sedQTCOLUChange(Sender: TObject);
    procedure sedQTCOLUExit(Sender: TObject);
    procedure edtPOSICAOEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edtETATUALKeyPress(Sender: TObject; var Key: Char);
  private
     Procedure CARREGAR_DADOS;
     Procedure CARREGAR_DADOS_02;
     Procedure IMPRIMIR_ETIQUETAS;
     Procedure IMPRIMIR_ETIQUETAS_02;
     function MMtoPixelX (MM : Integer) : Longint;
     function MMtoPixelY (MM : Integer) : Longint;
     Procedure INCLUIR_REG_BRANCOS;
     Procedure IMAGEM;
     procedure GeraBarrasEAN13(CodBarras: string; Imagem: TCanvas);
     procedure DesenhaBarras(SequenciaHexa: string; Imagem: TCanvas);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfQuant: TfrmConfQuant;
  M_LININI, M_CONINI, W_QTREGI : Integer;
  M_CDPROD , M_NMPROD : String;
  M_VLVEND : Real;
  M_MAXIMO : Integer;

implementation

uses uFuncoes, uRelEtiqueta, udmEtiquetas;

{$R *.dfm}

//------------------------------------------------------------------------------
//
// .------------------------------------.
// | | Tabela A | Tabela B | Tabela C |
// |---+----------+----------+----------|
// | 0 | 0001101 | 0100111 | 1110010 |
// | 1 | 0011001 | 0110011 | 1100110 |
// | 2 | 0010011 | 0011011 | 1101100 |
// | 3 | 0111101 | 0011011 | 1000010 |
// | 4 | 0100011 | 0011101 | 1011100 |
// | 5 | 0110001 | 0111001 | 1001110 |
// | 6 | 0101111 | 0000101 | 1010000 |
// | 7 | 0111011 | 0010001 | 1000100 |
// | 8 | 0110111 | 0001001 | 1001000 |
// | 9 | 0001011 | 0010111 | 1110100 |
// .------------------------------------.
// Tabela Auxiliar
// .-----------------------.
// | Algarismo | Seqüência |
// |-----------+-----------|
// | 0 | AAAAAA |
// | 1 | AABABB |
// | 2 | AABBAB |
// | 3 | AABBBA |
// | 4 | ABAABB |
// | 5 | ABBAAB |
// | 6 | ABBBAA |
// | 7 | ABABAB |
// | 8 | ABABBA |
// | 9 | ABBABA |
// .-----------------------.
//
// Gerae código de barras padrão EAN13


procedure TfrmConfQuant.spFecharClick(Sender: TObject);
begin
     Close;

end;

procedure TfrmConfQuant.sbImprimirClick(Sender: TObject);
begin
 If uFuncoes.Empty(edtQTETIQ.Text) Then
 Begin
      ShowMessage('Digite a quantidade de etiquetas!!!');
      edtQTETIQ.SetFocus;
      Exit; 
 End;
 //
 If (edtQTETIQ.Value > 0) Then
 begin
     //
     Application.CreateForm(TfrmRelEtiqueta, frmRelEtiqueta);
     Try
        sbImprimir.Enabled := False;
        //
        {Heigth : 76
        Width   : 260   }
        //
        CARREGAR_DADOS_02;
        //
        With frmRelEtiqueta.qryEtiquetas do
        begin
                SQL.Clear;
                Close;
                SQL.Add('Select * from "SACEQT.DB"');
                //SQL.Add('Where (EQT_CDPROD=:pCDPROD)');
                //
                {ParamByName('pCDPROD').AsString :=
                   dmInfoModa.qryProduto.FieldByName('PRO_CDPROD').AsString;}
                //
                Prepare;
                Open;
        End;
        //
        //frmRelEtiqueta.Barras.Texto := dmInfoModa.qryProduto.FieldByName('PRO_CDPROD').AsString;
        frmRelEtiqueta.qrEtiquetas.Preview ;
    Finally
        frmRelEtiqueta.Free;
        sbImprimir.Enabled := True;
        // Fecha janela
        Close;
    End;
  End
  Else
  begin
  End;
end;

procedure TfrmConfQuant.CARREGAR_DADOS;
Var
   M_CONTAD : Integer;
   M_QTETIQ : Real;
begin
     M_CONTAD := 1;
     M_QTETIQ := edtQTETIQ.Value;
     //
     If (dmEtiquetas.tbEtiquetas.Active = False) Then
         dmEtiquetas.tbEtiquetas.Open;
     //
     If (dmEtiquetas.tbEtiquetas.RecordCount > 0) Then
         uFuncoes.EsvaziaTabela(dmEtiquetas.tbEtiquetas);
     //
     //
     M_CDPROD  := dmEtiquetas.qryProduto.FieldByName('PRO_CDPROD').AsString;
     M_NMPROD  := dmEtiquetas.qryProduto.FieldByName('PRO_NMPROD').AsString;
     M_VLVEND  := dmEtiquetas.qryProduto.FieldByName('PRO_VLVEND').AsFloat;
     //
     While (M_CONTAD <= M_QTETIQ) DO
     begin
          dmEtiquetas.tbEtiquetas.Append;
          dmEtiquetas.tbEtiquetas.FieldByName('EQT_CDPROD').AsString := M_CDPROD;
          dmEtiquetas.tbEtiquetas.FieldByName('EQT_NMPROD').AsString := M_NMPROD;
          dmEtiquetas.tbEtiquetas.FieldByName('EQT_VLVEND').AsFloat  := M_VLVEND;
          // Grava
          dmEtiquetas.tbEtiquetas.Post;
          //
          M_CONTAD := M_CONTAD+1;
     End;
     //
     dmEtiquetas.tbEtiquetas.Close;
end;

procedure TfrmConfQuant.FormActivate(Sender: TObject);
begin
     If (dmEtiquetas.tbParametros.Active = False) Then
          dmEtiquetas.tbParametros.Open;
     //
     If (dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsFloat >= M_MAXIMO) Then
     Begin
          dmEtiquetas.tbParametros.Edit;
          dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsFloat :=
            dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsFloat-M_MAXIMO;
          dmEtiquetas.tbParametros.Post;
     End;
     //
     edtETATUAL.Text := dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsString; 
     //
     edtQTETIQ.Value := 0;
     //
    edtLINENT.Text :='1';
    edtCOLENT.Text :='1';
    //
    //GeraBarrasEAN13(dmEtiquetas.qryProduto.FieldByName('PRO_CDBARR').AsString, codBarras1.Canvas);
    GeraBarrasEAN13(dmEtiquetas.qryProduto.FieldByName('PRO_CDBARR').AsString, Image1.Canvas);
    //codBarras.Texto := dmEtiquetas.qryProduto.FieldByName('PRO_CDBARR').AsString;
    //
    //Image1.Canvas.Draw(05,0, codBarras.Picture.Bitmap);
end;

procedure TfrmConfQuant.IMPRIMIR_ETIQUETAS;
Var
   M_LINENT, M_COLENT : String;
   SALTALINHA, TAMLIN , I ,M_CONTAD, M_POSIMP : Integer;
   M_COLUNA : array[1..4] of integer;
   M_LINHA  : array[1..20] of integer;
   M_LICONT : integer;
begin
{     //M_LININI := 300;    // Linha inicial da página
     M_LININI := MMtoPixelY(2);
     M_CONINI := 300;    // Coluna inicial da página
     //
     M_LINENT := edtLINENT.Text;
     M_COLENT := edtCOLENT.Text;
     //
     //M_LINHA  := M_LININI * StrtoInt(M_LINENT);
     //
     M_LINHA[1] := MMtoPixelX(20);
     M_LINHA[2] := M_LINHA[1]+300;
     M_LINHA[3] := M_LINHA[2]+300;
     M_LINHA[4] := M_LINHA[3]+300;
     M_LINHA[5] := M_LINHA[4]+300;
     //
     M_LINHA[6] := M_LINHA[5]+300;
     M_LINHA[7] := M_LINHA[6]+300;
     M_LINHA[8] := M_LINHA[7]+300;
     M_LINHA[9] := M_LINHA[8]+300;
     M_LINHA[10] := M_LINHA[9]+300;
     //
     M_LINHA[11] := M_LINHA[10]+300;
     M_LINHA[12] := M_LINHA[11]+300;
     M_LINHA[13] := M_LINHA[12]+300;
     M_LINHA[14] := M_LINHA[13]+300;
     M_LINHA[15] := M_LINHA[14]+300;
     //
     M_LINHA[16] := M_LINHA[15]+300;
     M_LINHA[17] := M_LINHA[16]+300;
     M_LINHA[18] := M_LINHA[17]+300;
     M_LINHA[19] := M_LINHA[18]+300;
     M_LINHA[20] := M_LINHA[19]+300;
     //
     M_COLUNA[1] := MMtoPixelY(10); // 10 milímetros
     M_COLUNA[2] := MMtoPixelY(58); // 58 milímetros
     M_COLUNA[3] := MMtoPixelY(106); // 106 milímetros
     M_COLUNA[4] := MMtoPixelY(153); // 153 milímetros
     //
     Printer.BeginDoc;
     Printer.Canvas.Font.Size := 6;
     //
     qryEtiquetas.First;
     //tamlin := 75;
     tamlin := 2;
      //
     M_POSIMP := strtoint(edtPOSICAO.text);
     M_CONTAD := 1;
     M_LICONT := StrtoInt(edtLINENT.Text);
     //
     While (M_CONTAD <= edtQTETIQ.Value) do
     begin
          //
          for i:=strtoint(m_colent) to 4 do
              begin
                 inc(m_posimp);
                 Printer.Canvas.Font.Size := 8;
                 Printer.Canvas.TextOut(M_COLUNA[i], M_LINHA[M_LICONT] , M_CDPROD);
                 if ((i+M_contad) > edtqtetiq.Value) then
                     break;
              end;

          //M_LINHA := M_LINHA + tamlin ;
          for i:=strtoint(m_colent) to 4 do
              begin
                 Printer.Canvas.Font.Size := 6;
                 Printer.Canvas.TextOut(M_COLUNA[i],M_LINHA[M_LICONT]+50 ,uFuncoes.Padl(M_NMPROD,35));
                 if ((i+M_contad) > edtqtetiq.Value) then
                     break;
              end;
          //M_LINHA := M_LINHA + tamlin ;
          for i:=strtoint(m_colent) to 4 do
              begin
                Printer.Canvas.Font.Size := 8;
                Printer.Canvas.TextOut(M_COLUNA[i], M_LINHA[M_LICONT]+100 ,'R$ '+FormatFloat('###,##0.#0',M_VLVEND));
                if ((i+M_contad) > edtqtetiq.Value) then
                    break;
              end;

          //
          M_CONTAD := M_CONTAD+(5-strtoint(m_colent));
          M_COLENT := '1';
          // linha atual mais 1.
          M_LICONT := M_LICONT+1;
          //
          if (m_posimp > 80) then
              Begin
                 //M_LINHA  := M_LININI * StrtoInt(M_LINENT);
                 M_POSIMP := 1;
                 // Nova pagina
                 Printer.NewPage;
              End;
     end;
     // Finaliza a Impressão
     Printer.EndDoc;
     //
     ShowMessage('Aguarde Impressão...');}
end;

procedure TfrmConfQuant.edtLINENTKeyPress(Sender: TObject; var Key: Char);
begin
   If not( key in['0'..'9',#8] ) then
     key:=#0;
end;

procedure TfrmConfQuant.edtCOLENTKeyPress(Sender: TObject; var Key: Char);
begin
   If not( key in['0'..'9',#8,#13] ) then
     key:=#0;
   //
     If (Key = #13) Then
     begin
          Key := #0;
          sbImprimirClick(Sender);
     End;
                         
end;

procedure TfrmConfQuant.IMPRIMIR_ETIQUETAS_02;
Var
   M_LINENT, M_COLENT : String;
   SALTALINHA, TAMLIN , I ,M_CONTAD, M_POSIMP : Integer;
   M_COLUNA : array[1..3] of integer;
   M_LINHA  : array[1..10] of integer;
   M_LICONT : integer;
begin
{     M_LININI := 550;    // Linha inicial da página
     M_CONINI := 200;    // Coluna inicial da página
     //
     M_LINENT := edtLINENT.Text;
     M_COLENT := edtCOLENT.Text;
     //
     //M_LINHA  := M_LININI * StrtoInt(M_LINENT);
     // Defini as coodernadas das linhas
     M_LINHA[1] := MMtoPixelX(25);
     M_LINHA[2] := M_LINHA[1]+300;
     M_LINHA[3] := M_LINHA[2]+300;
     M_LINHA[4] := M_LINHA[3]+300;
     M_LINHA[5] := M_LINHA[4]+300;
     //
     M_LINHA[6]  := M_LINHA[5]+300;
     M_LINHA[7]  := M_LINHA[6]+300;
     M_LINHA[8]  := M_LINHA[7]+300;
     M_LINHA[9]  := M_LINHA[8]+300;
     M_LINHA[10] := M_LINHA[9]+300;
     // Defini as coodernadas das colunas
     M_COLUNA[1] := MMtoPixelY(7);
     M_COLUNA[2] := MMtoPixelY(75);
     M_COLUNA[3] := MMtoPixelY(145);
     //
     Printer.BeginDoc;
     Printer.Canvas.Font.Size := 8;
     //
     qryEtiquetas.First;
     tamlin := 75;
     //
     M_CONTAD := 1;
     M_POSIMP := strtoint(edtPOSICAO.text);
     M_LICONT := StrtoInt(edtLINENT.Text);
     //
     //Printer.Canvas.TextOut(M_COLUNA[StrtoInt(edtLINENT.Text)], M_LINHA , ' ');
     //M_LINHA := M_LINHA + tamlin ;
     //
     While (M_CONTAD <= edtQTETIQ.Value) do
     begin
          //
          for i:=strtoint(m_colent) to 3 do
              begin
                 inc(m_posimp);
                 Printer.Canvas.TextOut(M_COLUNA[i], M_LINHA[M_LICONT] ,M_CDPROD);
                 if ((i+M_contad) > edtqtetiq.Value) then
                     break;
              end;

          //M_LINHA := M_LINHA + tamlin ;
          for i:=strtoint(m_colent) to 3 do
              begin
                 Printer.Canvas.TextOut(M_COLUNA[i], M_LINHA[M_LICONT]+40,uFuncoes.Padl(M_NMPROD,35));
                 if ((i+M_contad) > edtqtetiq.Value) then
                     break;
              end;
          //M_LINHA := M_LINHA + tamlin ;
          for i:=strtoint(m_colent) to 3 do
              begin
                Printer.Canvas.TextOut(M_COLUNA[i], M_LINHA[M_LICONT]+80,'R$ '+FormatFloat('###,##0.#0',M_VLVEND));
                if ((i+M_contad) > edtqtetiq.Value) then
                    break;
              end;

          // salta de uma etiqueta para outra



          M_CONTAD := M_CONTAD+(4-strtoint(m_colent));
          M_COLENT := '1';
          // linha atual mais 1.
          M_LICONT := M_LICONT+1;
          //
          if (m_posimp > 30) then
              Begin
                 //M_LINHA  := M_LININI * StrtoInt(M_LINENT);
                 M_POSIMP := 1;
                 // Nova pagina
                 Printer.NewPage;
              End;

     end;
     // Finaliza a Impressão
     Printer.EndDoc;
     //
     ShowMessage('Aguarde Impressão...');}
end;

procedure TfrmConfQuant.edtPOSICAOChange(Sender: TObject);
Var
    W_LINHA, W_COLUNA : Real;
begin
{     If not uFuncoes.Empty(edtPOSICAO.Text) Then
     begin
       If (sedQTCOLU.Value = 4) Then
       begin
         W_LINHA  := Int(edtPOSICAO.Value/4)+1;
         W_COLUNA := Int(edtPOSICAO.Value)-(Int(edtPOSICAO.Value/4)*4);
         //
         If (W_COLUNA = 0) Then
         begin
             edtCOLENT.Text := '4';
             edtLINENT.Text := FloattoStr(W_LINHA-1);
         End
         Else
         begin
             edtCOLENT.Text := FloattoStr(Int(W_COLUNA));
             edtLINENT.Text := FloattoStr(W_LINHA);
         End;
      End;
      //
       If (sedQTCOLU.Value = 3) Then
       begin
         If (edtPOSICAO.Value/3=0) Then
            W_LINHA  := Int(edtPOSICAO.Value/3)
         Else
            W_LINHA  := Int(edtPOSICAO.Value/3)+1;
         //
         W_COLUNA := Int(edtPOSICAO.Value)-(Int(edtPOSICAO.Value/3)*3);
         //
         If (W_COLUNA = 0) Then
         begin
             edtCOLENT.Text := '3';
             edtLINENT.Text := FloattoStr(Int(W_LINHA-1));
         End
         Else
         begin
             edtCOLENT.Text := FloattoStr(Int(W_COLUNA));
             edtLINENT.Text := FloattoStr(W_LINHA);
         End;
         //
       End;
     End
     else
     begin
         edtLINENT.Text := '1';
         edtCOLENT.Text := '1';
     End;}

end;

procedure TfrmConfQuant.edtQTETIQKeyPress(Sender: TObject; var Key: Char);
begin
     {If not( key in['0'..'9',#8, #27] ) then
          key:=#0;}
     //
     If (Key = #13) and (edtQTETIQ.Value > 0) Then
     begin
          Key := #0;
          sbImprimirClick(Sender);
     End;
     //
     If (Key = #27) Then
       Close;   
end;

procedure TfrmConfQuant.edtPOSICAOKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
          key:=#0;
     //
     If (Key = #13) Then
     begin
          Key := #0;
          sbImprimirClick(Sender);
     End;
end;

procedure TfrmConfQuant.sedQTCOLUChange(Sender: TObject);
begin
{   If not uFuncoes.Empty(sedQTCOLU.Text) Then
   begin
     If (sedQTCOLU.Value >= 3) or (sedQTCOLU.Value <= 4) Then
     begin
         //
         If (sedQTCOLU.Value = 3) Then
         begin
            edtPOSICAO.MaxValue := 30;
            edtPOSICAO.Value    := 1;
         End;
         //
         If (sedQTCOLU.Value = 4) Then
         begin
            edtPOSICAO.MaxValue := 80;
            edtPOSICAO.Value    := 1;
         End;
    End;
  End;}

end;

Procedure TfrmConfQuant.sedQTCOLUExit(Sender: TObject);
begin
     If uFuncoes.Empty(sedQTCOLU.Text) Then
       sedQTCOLU.Value := 4;
end;

procedure TfrmConfQuant.edtPOSICAOEnter(Sender: TObject);
begin
     If uFuncoes.Empty(edtQTETIQ.Text) or (edtQTETIQ.Value = 0)  Then
        edtQTETIQ.SetFocus;
end;

function TfrmConfQuant.MMtoPixelX (MM : Integer) : Longint;
var
mmPointX : Real;
PageSize, OffSetUL : TPoint;
begin
mmPointX := Printer.PageWidth / GetDeviceCaps(Printer.Handle,HORZSIZE);
Escape (Printer.Handle,GETPRINTINGOFFSET,0,nil,@OffSetUL);
Escape (Printer.Handle,GETPHYSPAGESIZE,0,nil,@PageSize);
if MM > 0 then
Result := round ((MM * mmPointX) - OffSetUL.X)
else
Result := round (MM * mmPointX);
end;


function TfrmConfQuant.MMtoPixelY(MM: Integer): Longint;
var
mmPointY : Real;
PageSize, OffSetUL : TPoint;
begin
mmPointY := Printer.PageHeight /
GetDeviceCaps(Printer.Handle,VERTSIZE);
Escape (Printer.Handle,GETPRINTINGOFFSET,0,nil,@OffSetUL);
Escape (Printer.Handle,GETPHYSPAGESIZE,0,nil,@PageSize);
if MM > 0 then
Result := round ((MM * mmPointY) - OffSetUL.Y)
else
Result := round (MM * mmPointY);
end;

procedure TfrmConfQuant.CARREGAR_DADOS_02;
Var
   M_CONTAD, M_TOREGI : Integer;
   M_QTETIQ : Real;
   M_IMGBAR : TImage;
begin
     M_CONTAD := 1;
     M_QTETIQ := edtQTETIQ.Value;
     M_TOREGI := dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsInteger;
     W_QTREGI := 1;
     //
     If (dmEtiquetas.tbEtiquetas.Active = False) Then
         dmEtiquetas.tbEtiquetas.Open;
     //
     If (dmEtiquetas.tbEtiquetas.RecordCount > 0) Then
         uFuncoes.EsvaziaTabela(dmEtiquetas.tbEtiquetas);
     //
     If (dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsInteger > 0) Then
      //And (dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsInteger < 50) Then
       While (W_QTREGI <= M_TOREGI) do
       Begin
            dmEtiquetas.tbEtiquetas.Append;
            dmEtiquetas.tbEtiquetas.Post;
            //
            W_QTREGI := W_QTREGI+1;
       End;
     //
     M_CDPROD  := dmEtiquetas.qryProduto.FieldByName('PRO_CDPROD').AsString;
     M_NMPROD  := dmEtiquetas.qryProduto.FieldByName('PRO_NMPROD').AsString;
     M_VLVEND  := dmEtiquetas.qryProduto.FieldByName('PRO_VLVEND').AsFloat;
     //
     While (M_CONTAD <= M_QTETIQ) DO
     begin
          dmEtiquetas.tbEtiquetas.Append;
          dmEtiquetas.tbEtiquetas.FieldByName('EQT_CDPROD').AsString := M_CDPROD;
          dmEtiquetas.tbEtiquetas.FieldByName('EQT_NMPROD').AsString := M_NMPROD;
          dmEtiquetas.tbEtiquetas.FieldByName('EQT_VLVEND').AsFloat  := M_VLVEND;
          //
          dmEtiquetas.tbEtiquetas.FieldByName('EQT_IMGBAR').Assign(Image1.Picture.Bitmap);
          // Grava
          dmEtiquetas.tbEtiquetas.Post;
          //
          M_CONTAD := M_CONTAD+1;
     End;
     //
     dmEtiquetas.tbEtiquetas.Close;
     //
     Image1.Free;
     //
     dmEtiquetas.tbParametros.Close;
     dmEtiquetas.tbParametros.Open;
     //
     dmEtiquetas.tbParametros.Edit;
     dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsFloat :=
              dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsFloat+edtQTETIQ.Value;
     dmEtiquetas.tbParametros.Post;
end;

procedure TfrmConfQuant.INCLUIR_REG_BRANCOS;
Var
    M_TOREGI : Integer;
begin
     W_QTREGI := StrtoInt(edtQTETIQ.Text);
     M_TOREGI := 1;
     //
     If (dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsInteger > 0) Then
       While (M_TOREGI<=W_QTREGI) do
       Begin
            dmEtiquetas.tbEtiquetas.Append;
            dmEtiquetas.tbEtiquetas.Post;
       End;
     //
     //dmEtiquetas.tbEtiquetas.Close;
end;


procedure TfrmConfQuant.IMAGEM;
var
  bitmap : tbitmap;
  dc : hdc;
  desktoprect : trect;
  desktopcanvas : tcanvas;
  x, y : integer;
Begin
  dc:=getdc(getdesktopwindow);
 try
   desktopcanvas:=tcanvas.create;
   bitmap:=tbitmap.create;
   try
     bitmap.Width  := codBarras1.Width;
     bitmap.Height := codBarras1.Height;
     desktopcanvas.handle:=dc;
     desktoprect := rect(codBarras1.Left,codBarras1.Top,codBarras1.Width,codBarras1.Height);
     bitmap.canvas.CopyRect(desktoprect,desktopcanvas,desktoprect);
     Image1.Picture.Bitmap := bitmap;
   finally
   bitmap.free;
   desktopcanvas.free;
   end;
 finally
 releasedc(getdesktopwindow,dc);
 end;

end;

procedure TfrmConfQuant.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmEtiquetas.tbEtiquetas.Close;
     //
     Action := caFree;
end;

procedure TfrmConfQuant.FormCreate(Sender: TObject);
begin
     M_MAXIMO := 65;
end;

procedure TfrmConfQuant.edtETATUALKeyPress(Sender: TObject; var Key: Char);
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
         If (dmEtiquetas.tbParametros.Active = False) Then
           dmEtiquetas.tbParametros.Open;
         //
          dmEtiquetas.tbParametros.Edit;
          dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsString := edtETATUAL.Text;
          dmEtiquetas.tbParametros.Post;
         //
         edtETATUAL.Text := dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsString;
         edtQTETIQ.Clear;
         edtQTETIQ.SetFocus;
    End;
    //
end;

procedure TfrmConfQuant.GeraBarrasEAN13(CodBarras: string;
  Imagem: TCanvas);
const
  TabelaA: array[0..9] of string[7] = ('0001101', '0011001', '0010011', '0111101', '0100011', '0110001', '0101111', '0111011', '0110111', '0001011');
  TabelaB: array[0..9] of string[7] = ('0100111', '0110011', '0011011', '0011011', '0011101', '0111001', '0000101', '0010001', '0001001', '0010111');
  TabelaC: array[0..9] of string[7] = ('1110010', '1100110', '1101100', '1000010', '1011100', '1001110', '1010000', '1000100', '1001000', '1110100');
  TabAux: array[0..9] of string[6] = ('AAAAAA', 'AABABB', 'AABBAB', 'AABBBA', 'ABAABB', 'ABBAAB', 'ABBBAA', 'ABABAB', 'ABABBA', 'ABBABA');
var
  Codigo: string;
  Formato: string;
  PegaDaTabela: string;
  DecimoTerceiroDig: Byte;
  Cont: Byte;
begin
  Formato := '';
  Codigo := CodBarras;
  DecimoTerceiroDig := StrToIntDef(CodBarras[1], 0);
  {----------------------------------------------------------------------------}
  { Tendo o 13º dígito definido, posso definir o padrão de impressão das barras}
  { no primeiro conjunto de 6 dígitos baseado na tabela Auxiliar. }
  {----------------------------------------------------------------------------}
  PegaDaTabela := TabAux[DecimoTerceiroDig] + 'CCCCCC';
  Formato := Formato + '101'; //--> Barra Auxiliar de Guarda 'Esquerda'
  for Cont := 1 to Length(PegaDaTabela) do
  begin

    case PegaDaTabela[Cont] of
      'A': Formato := Formato + TabelaA[StrToInt(Codigo[Cont + 1])];
      'B': Formato := Formato + TabelaB[StrToInt(Codigo[Cont + 1])];
      'C': Formato := Formato + TabelaC[StrToInt(Codigo[Cont + 1])];
    end;

    if Cont = 6 then
      Formato := Formato + '01010'; //--> Barra Auxiliar de Guarda 'Central'

  end;
  Formato := Formato + '101'; //--> Barra Auxiliar de Guarda 'Direita'

  //------ Desenha o código alfa-numérico na imagem
  Imagem.Font.Size := 10;
  Imagem.Brush.Color := ClWhite;
  Imagem.Pen.Color := ClBlack;
  Imagem.TextOut(02, 51, Copy(CodBarras, 01, 01));
  Imagem.TextOut(13, 51, Copy(CodBarras, 02, 06));
  Imagem.TextOut(60, 51, Copy(CodBarras, 08, 06));
  //------ Desenha as barras na imagem
  DesenhaBarras(Formato, Imagem);
end;

procedure TfrmConfQuant.DesenhaBarras(SequenciaHexa: string;
  Imagem: TCanvas);
var
  X, Y, H: LongInt;
  A, B, C, D: TPoint;
  I: Boolean;
begin

  Imagem.Brush.Color := ClWhite;
  Imagem.Pen.Color := ClBlack;
  x := 10;
  i := True;
  for y := 1 to Length(SequenciaHexa) do
  begin
    if SequenciaHexa[y] = '0' then
      Imagem.Pen.Color := ClWhite
    else
      Imagem.Pen.Color := ClBlack;
    h := 1;
    a.x := x;
    a.y := 0;
    b.x := x;
    b.y := 50;
    c.x := x + h - 1;
    c.y := 50;
    d.x := x + h - 1;
    d.y := 0;
    case Y of
      1..3, 46..50, 93..95:
        begin
          b.y := 55;
          c.y := 55;
        end;
    end;
    Imagem.Polygon([A, B, C, D]);
    i := not (i);
    x := x + h;
  end;
end;


End.
