unit uCancelarVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls, Grids, DBGrids, RXDBCtrl,
  DB, DBTables;

type
  TfrmCancelamentoVendas = class(TForm)
    Panel1: TPanel;
    DBText2: TDBText;
    pnlLoja: TPanel;
    Label1: TLabel;
    edtLoja: TEdit;
    pnlGrid: TPanel;
    pnlInferior: TPanel;
    GridGrupos: TRxDBGrid;
    dsVendas: TDataSource;
    qryVendas: TQuery;
    btSair: TBitBtn;
    btConfirmar: TBitBtn;
    qryGravaVenda: TQuery;
    qryItens: TQuery;
    qryHistorico: TQuery;
    qryAtualizaEstoque: TQuery;
    qryItensITV_NRVEND: TStringField;
    qryItensITV_NRITEM: TStringField;
    qryItensITV_CDPROD: TStringField;
    qryItensITV_VLUNI2: TCurrencyField;
    qryItensITV_VLDESC: TFloatField;
    qryItensITV_QTPROD: TFloatField;
    qryItensITV_FLSITU: TStringField;
    procedure edtLojaChange(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure edtLojaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
  private
     Procedure CONSULTA;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCancelamentoVendas: TfrmCancelamentoVendas;

implementation

Uses uFuncoes, udmEtiquetas, uPrincipal;

{$R *.dfm}

procedure TfrmCancelamentoVendas.edtLojaChange(Sender: TObject);
begin
     If not uFuncoes.Empty(edtLoja.Text) Then
        If not qryVendas.Locate('MDV_NRVEND',uFuncoes.StrZero(edtLoja.Text,7),[]) Then
        Begin
            ShowMessage('Venda não encontrada!!!');
            edtLoja.Clear;
            edtLoja.SetFocus;
            Exit;  
        End;
    { Else
        CONSULTA;}
end;

procedure TfrmCancelamentoVendas.btSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmCancelamentoVendas.edtLojaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
          key:=#0;
end;

procedure TfrmCancelamentoVendas.CONSULTA;
begin
     With qryVendas do
     Begin
          DisableControls;
          SQL.Clear;
          Close;
          SQL.Add('Select * from "SACMDV.DB" Where (MDV_FLSITU="A")');
          SQL.Add('order by MDV_NRVEND Desc');
          Prepare;
          Open;
          EnableControls;
     End;
end;

procedure TfrmCancelamentoVendas.FormActivate(Sender: TObject);
begin
     CONSULTA;
end;

procedure TfrmCancelamentoVendas.btConfirmarClick(Sender: TObject);
Var
   W_NRVEND, N_NRSEQU, M_CDLOJA : String;
   W_QTPROD : Double;
begin
    edtLoja.Text := qryVendas.FieldByName('MDV_NRVEND').AsString;
    If Application.MessageBox(PChar('Confirma o cancelamento da'+#13
                                  +'venda : '+qryVendas.FieldByName('MDV_NRVEND').AsString),
        'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
    Begin
         Try
            W_NRVEND := qryVendas.FieldByName('MDV_NRVEND').AsString;
            M_CDLOJA := qryVendas.FieldByName('MDV_CDLOJA').AsString;
            // Cancela venda
            With qryGravaVenda do
            begin
                 SQL.Clear;
                 Close;
                 SQL.Add('UPDATE SACMDV SET MDV_FLSITU=:pFLSITU');
                 SQL.Add('Where (MDV_NRVEND=:pNRVEND)');
                 //
                 ParamByName('pNRVEND').AsString := W_NRVEND;
                 ParamByName('pFLSITU').AsString := 'C';
                 //
                 ExecSQL;
            End;
            // Cancela Itens da Venda
            With qryItens do
            begin
                 SQL.Clear;
                 Close;
                 SQL.Add('UPDATE SACITV SET ITV_FLSITU=:pFLSITU');
                 SQL.Add('Where (ITV_NRVEND=:pNRVEND)');
                 //
                 ParamByName('pNRVEND').AsString := W_NRVEND;
                 ParamByName('pFLSITU').AsString := 'C';
                 //
                 ExecSQL;
            End;
            // Estoque
            With qryItens do
            begin
                 SQL.Clear;
                 Close;
                 SQL.Add('Select * from SACITV');
                 SQL.Add('Where (ITV_NRVEND=:pNRVEND)');
                 //
                 ParamByName('pNRVEND').AsString := W_NRVEND;
                 //
                 Prepare;
                 Open;
                 First;
            End;
            //
            While not (qryItens.Eof) do
            Begin
               //
               dmEtiquetas.tbParametros.Edit;
               dmEtiquetas.tbParametros.FieldByName('PAR_NRSEQU').AsFloat :=
                    dmEtiquetas.tbParametros.FieldByName('PAR_NRSEQU').AsFloat+1;
                dmEtiquetas.tbParametros.Post;
                //
               N_NRSEQU := uFuncoes.StrZero(dmEtiquetas.tbParametros.FieldByName('PAR_NRSEQU').AsString,10);
               // Estoque
               With qryAtualizaEstoque do
               Begin
                    SQL.Clear;
                    Close;
                    SQL.Add('Select * from SACEST Where (EST_CDLOJA = :pCDLOJA) And (EST_CDPROD = :pCDPROD)');
                    //
                    ParamByname('pCDLOJA').AsString := M_CDLOJA;
                    ParamByname('pCDPROD').AsString := qryItens.FieldByName('ITV_CDPROD').AsString;
                    //
                    Prepare;
                    Open;
               End;
               //
               W_QTPROD := qryAtualizaEstoque.FieldByName('EST_QTPROD').AsFloat;
               // Historico
               With qryAtualizaEstoque do
               begin
                    SQL.Clear;
                    Close;
                    SQL.Add('INSERT INTO SACHIS (HIS_NRSEQU, HIS_CDLOJA, HIS_CDPROD, HIS_DTHIST, HIS_HOHIST, HIS_TPHIST, HIS_QTANTE, HIS_QTPROD, HIS_QTATUA, HIS_CDUSUA)');
                    SQL.Add('VALUES (:pNRSEQU, :pCDLOJA, :pCDPROD, :pDTHIST, :pHOHIST, :pTPHIST, :pQTANTE, :pQTPROD, :pQTATUA, :pCDUSUA)');
                    //
                    ParamByname('pNRSEQU').AsString := N_NRSEQU;
                    ParamByname('pCDLOJA').AsString := M_CDLOJA;
                    ParamByname('pCDPROD').AsString := qryItens.FieldByName('ITV_CDPROD').AsString;
                    ParamByname('pDTHIST').AsDate   := Date();
                    ParamByname('pHOHIST').AsString := TimetoStr(Time);
                    ParamByname('pTPHIST').AsString := 'E';
                    ParamByname('pQTANTE').AsFloat  := W_QTPROD;
                    ParamByname('pQTPROD').AsFloat  := qryItens.FieldByName('ITV_QTPROD').AsFloat;
                    ParamByname('pQTATUA').AsFloat  := W_QTPROD+qryItens.FieldByName('ITV_QTPROD').AsFloat;
                    ParamByname('pCDUSUA').AsString := uPrincipal.M_CDUSUA;
                    //
                    ExecSQL;
               End;
               // Estoque
               With qryAtualizaEstoque do
               Begin
                    SQL.Clear;
                    Close;
                    SQL.Add('Update SACEST SET EST_DTENTR = :pDTENTR, EST_QTENTR = :pQTENTR, EST_QTPROD = EST_QTPROD + :pQTENTR');
                    SQL.Add('Where (EST_CDLOJA = :pCDLOJA) and (EST_CDPROD = :pCDPROD)');
                    //
                    ParamByname('pCDLOJA').AsString := M_CDLOJA;
                    ParamByname('pCDPROD').AsString := qryItens.FieldByName('ITV_CDPROD').AsString;
                    ParamByname('pDTENTR').AsDate   := Date();
                    ParamByname('pQTENTR').AsFloat  := qryItens.FieldByName('ITV_QTPROD').AsFloat;
                    //
                    ExecSQL;
               End;
               // Proximo
               qryItens.Next;
            End;
            //
            Application.MessageBox(PChar('Venda : '+qryVendas.FieldByName('MDV_NRVEND').AsString+ ' cancelada!!!'),
               'CONCLUIDO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            //
            edtLoja.Clear;  
            CONSULTA;
         Except
               Application.MessageBox(PChar('Erro ao tentar cancelar a'+#13
                                  +'venda : '+qryVendas.FieldByName('MDV_NRVEND').AsString),
               'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               Exit;
         End;
    End
    Else
        edtLoja.Clear;
end;

end.
