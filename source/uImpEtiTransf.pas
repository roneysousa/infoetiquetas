unit uImpEtiTransf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, DB, StdCtrls, DBTables;

type
  TfrmImpEtiTrans = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    spFechar: TSpeedButton;
    spImprimir: TSpeedButton;
    edtETATUAL: TEdit;
    Label5: TLabel;
    dsTrans: TDataSource;
    qryItens: TQuery;
    qryTOTETI: TQuery;
    qryTOTETITRP_QUANT: TFloatField;
    qryProdutos: TQuery;
    qryProdutosPRO_CDPROD: TStringField;
    qryProdutosPRO_CDBARR: TStringField;
    qryProdutosPRO_NMPROD: TStringField;
    qryProdutosPRO_VLVEND: TFloatField;
    qryItensTRP_NRSEQU: TStringField;
    qryItensTRP_CDPROD: TStringField;
    qryItensTRP_QTPROD: TFloatField;
    qryItensTRP_IMABAR: TGraphicField;
    qryItensTRP_NMPROD: TStringField;
    qryItensTRP_VLVEND: TCurrencyField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spFecharClick(Sender: TObject);
    procedure spImprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtETATUALKeyPress(Sender: TObject; var Key: Char);
  private
    procedure CARREGAR_DADOS;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpEtiTrans: TfrmImpEtiTrans;
  M_CDPROD, M_NMPROD, W_NRSEQU :String;
  M_VLVEND : Real;
  M_MAXIMO : Integer;

implementation

uses uRelEtiTrans, uFuncoes, udmEtiquetas, uRelEtiqueta;

{$R *.dfm}

procedure TfrmImpEtiTrans.CARREGAR_DADOS;
Var
   M_CONTAD, M_TOREGI, W_QTREGI : Integer;
   M_QTETIQ, W_QTETIQ, N_TOTETI : Real;
   M_IMGBAR : TImage;
begin
     M_CONTAD := 1;
     //M_QTETIQ := edtQTETIQ.Value;
     W_QTREGI := 1;
     //
     If (dmEtiquetas.tbEtiquetas.Active = False) Then
         dmEtiquetas.tbEtiquetas.Open;
     //
     If (dmEtiquetas.tbEtiquetas.RecordCount > 0) Then
         uFuncoes.EsvaziaTabela(dmEtiquetas.tbEtiquetas);
     //
     If (dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsInteger > 0) Then
     Begin
       //And (dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsInteger < 50) Then
       //
       With qryItens do
       Begin
            Close;
            //
            ParamByName('pNRSEQU').AsString := W_NRSEQU;
            //
            Prepare;
            Open;
            First;
       End;
       //
       M_TOREGI := dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsInteger;
       //
       While (W_QTREGI < M_TOREGI) do
       Begin
            dmEtiquetas.tbEtiquetas.Append;
            dmEtiquetas.tbEtiquetas.Post;
            //
            W_QTREGI := W_QTREGI+1;
       End;
      //
      //N_TOTETI := 0;
      //
      While not (qryItens.Eof) do
      begin
         //
         M_CDPROD  := qryItens.FieldByName('TRP_CDPROD').AsString;
         M_NMPROD  := qryItens.FieldByName('TRP_NMPROD').AsString;
         M_VLVEND  := qryItens.FieldByName('TRP_VLVEND').AsFloat;
         M_QTETIQ  := qryItens.FieldByName('TRP_QTPROD').AsFloat;
         W_QTETIQ  := 1;
         //N_TOTETI  := N_TOTETI+M_QTETIQ;
         //
         While (W_QTETIQ <= M_QTETIQ) do
         Begin
           dmEtiquetas.tbEtiquetas.Append;
           dmEtiquetas.tbEtiquetas.FieldByName('EQT_CDPROD').AsString := M_CDPROD;
           dmEtiquetas.tbEtiquetas.FieldByName('EQT_NMPROD').AsString := M_NMPROD;
           dmEtiquetas.tbEtiquetas.FieldByName('EQT_VLVEND').AsFloat  := M_VLVEND;
           //
           dmEtiquetas.tbEtiquetas.FieldByName('EQT_IMGBAR').Assign
                (qryItens.FieldByName('TRP_IMABAR'));
           // Grava
           dmEtiquetas.tbEtiquetas.Post;
           //
           M_CONTAD := M_CONTAD+1;
           W_QTETIQ := W_QTETIQ+1;
           //
         End;
           qryItens.Next;
      End;
      //
      dmEtiquetas.tbEtiquetas.Close;
      //
      dmEtiquetas.tbParametros.Close;
      dmEtiquetas.tbParametros.Open;
      //
      dmEtiquetas.tbParametros.Edit;
      dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsFloat :=
              dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsFloat+(M_CONTAD-1);
      dmEtiquetas.tbParametros.Post;
      //
     End
     Else  // Se for zero
     Begin
      With qryItens do
      Begin
           Close;
           //
           ParamByName('pNRSEQU').AsString := W_NRSEQU;
           //
           Prepare;
           Open;
           First;
      End;
      //
      M_TOREGI := dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsInteger;
      //
     While not (qryItens.Eof) do
     //(M_CONTAD <= M_QTETIQ) DO
     begin
        //
        M_CDPROD  := qryItens.FieldByName('TRP_CDPROD').AsString;
        M_NMPROD  := qryItens.FieldByName('TRP_NMPROD').AsString;
        M_VLVEND  := qryItens.FieldByName('TRP_VLVEND').AsFloat;
        M_QTETIQ  := qryItens.FieldByName('TRP_QTPROD').AsFloat;
        W_QTETIQ  := 1;
        //
        While (W_QTETIQ <= M_QTETIQ) do
        Begin
          dmEtiquetas.tbEtiquetas.Append;
          dmEtiquetas.tbEtiquetas.FieldByName('EQT_CDPROD').AsString := M_CDPROD;
          dmEtiquetas.tbEtiquetas.FieldByName('EQT_NMPROD').AsString := M_NMPROD;
          dmEtiquetas.tbEtiquetas.FieldByName('EQT_VLVEND').AsFloat  := M_VLVEND;
          //
          dmEtiquetas.tbEtiquetas.FieldByName('EQT_IMGBAR').Assign
               (qryItens.FieldByName('TRP_IMABAR'));
          // Grava
          dmEtiquetas.tbEtiquetas.Post;
          //
          M_CONTAD := M_CONTAD+1;
          W_QTETIQ := W_QTETIQ+1;
          //
        End;
          qryItens.Next;
     End;
     //
     dmEtiquetas.tbEtiquetas.Close;
     //
     dmEtiquetas.tbParametros.Close;
     dmEtiquetas.tbParametros.Open;
     //
     dmEtiquetas.tbParametros.Edit;
     dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsFloat :=  M_CONTAD-1;
           //   dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsFloat+(M_CONTAD-1);
     dmEtiquetas.tbParametros.Post;
     //
     End;
end;

procedure TfrmImpEtiTrans.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmImpEtiTrans.spFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmImpEtiTrans.spImprimirClick(Sender: TObject);
begin
 If uFuncoes.Empty(edtETATUAL.Text) Then
 Begin
      ShowMessage('Digite a posição inicial.');
      edtETATUAL.SetFocus;
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
     {If (StrtoInt(edtETATUAL.Text)>0) Then
        dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsInteger :=  StrtoInt(edtETATUAL.Text)-1
     Else}
        dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsInteger :=  StrtoInt(edtETATUAL.Text);
     dmEtiquetas.tbParametros.Post;
     //
     Application.CreateForm(TfrmRelEtiqueta , frmRelEtiqueta);
     spImprimir.Enabled := False;
     Try
        //
        CARREGAR_DADOS;
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
        spImprimir.Enabled := True;
        // Fecha janela
        Close;
    End;
  End
end;

procedure TfrmImpEtiTrans.FormActivate(Sender: TObject);
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

end;

procedure TfrmImpEtiTrans.FormCreate(Sender: TObject);
begin
     M_MAXIMO := 65;
end;

procedure TfrmImpEtiTrans.edtETATUALKeyPress(Sender: TObject;
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
         If (dmEtiquetas.tbParametros.Active = False) Then
           dmEtiquetas.tbParametros.Open;
         //
          dmEtiquetas.tbParametros.Edit;
          dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsString := edtETATUAL.Text;
          dmEtiquetas.tbParametros.Post;
         //
         edtETATUAL.Text := dmEtiquetas.tbParametros.FieldByName('PAR_TOETIQ').AsString;
    End;
    //  
end;

end.
