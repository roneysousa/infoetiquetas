unit uConfRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBTables;

type
  TfrmConfRelatorio = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btVisualizar: TBitBtn;
    btSair: TBitBtn;
    Label1: TLabel;
    edtLoja: TEdit;
    edtEXERC: TEdit;
    Label2: TLabel;
    qryIncDados: TQuery;
    qryProdutos: TQuery;
    qryHistorico: TQuery;
    spLocalizar: TSpeedButton;
    lbl_NMLOJA: TLabel;
    procedure btSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtLojaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btVisualizarClick(Sender: TObject);
    procedure edtLojaExit(Sender: TObject);
    procedure edtEXERCKeyPress(Sender: TObject; var Key: Char);
    procedure spLocalizarClick(Sender: TObject);
    procedure edtLojaChange(Sender: TObject);
  private
     Procedure INCLUIR_DADOS;
    { Private declarations }
  public
     Procedure CONSULTA;
    { Public declarations }
  end;

var
  frmConfRelatorio: TfrmConfRelatorio;

implementation

Uses uFuncoes, udmEtiquetas, uRelEstoque, uLocLoja;

{$R *.dfm}

procedure TfrmConfRelatorio.btSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmConfRelatorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmConfRelatorio.edtLojaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
          key:=#0;
     //

     If (key = #13) and uFuncoes.Empty(edtLoja.Text) Then
     Begin
          Key := #0;
          spLocalizarClick(Sender);
     End;
     //
     If (key = #13) and not uFuncoes.Empty(edtLoja.Text) Then
     Begin
          Key := #0;
          //
          edtLoja.Text := uFuncoes.StrZero(edtLoja.Text,3);
          //
          edtEXERC.SetFocus;
     End;
end;

procedure TfrmConfRelatorio.FormCreate(Sender: TObject);
begin
     edtEXERC.Text := Copy(DatetoStr(Date()),7,4);
     //
     dmEtiquetas.qryLoja.Open;  
end;

procedure TfrmConfRelatorio.btVisualizarClick(Sender: TObject);
begin
     If ufuncoes.Empty(edtLoja.Text) Then
     Begin
          ShowMessage('Digite o codigo da loja.');
          edtLoja.SetFocus;
          Exit;
     End;
     //
     If ufuncoes.Empty(edtEXERC.Text) Then
     Begin
          ShowMessage('Digite o ano em exercicio.');
          edtEXERC.SetFocus;
          Exit;
     End;
     //
     Try
          Application.CreateForm(TfrmRelEstoque, frmRelEstoque);
          //
          If (dmEtiquetas.tbParametros.Active = False) Then
              dmEtiquetas.tbParametros.Open;  
          //
          With frmRelEstoque.qryEstoque do
          begin
              Close;
              //
              ParamByName('pCDLOJA').AsString := uFuncoes.StrZero(edtLoja.Text,3);
              ParamByName('pDTINIC').AsDate   := StrtoDate('01/01/'+edtEXERC.Text);
              ParamByName('pDTFINA').AsDate   := StrtoDate('31/12/'+edtEXERC.Text);
              //
              Prepare;
              Open;
          End;
          //
          With frmRelEstoque do
          Begin
              txtLoja.Caption  := 'LOJA      : '+qryEstoqueEST_NMLOJA.AsString;
              txtEXERC.Caption := 'EXERCICIO : '+edtEXERC.Text;
          End;
          //
          frmRelEstoque.qrEstoque.Preview ;
     Finally
          frmRelEstoque.Free;
          lbl_NMLOJA.Caption := '.';
          edtLoja.Clear;
          edtLoja.SetFocus;  
     End;
end;

procedure TfrmConfRelatorio.edtLojaExit(Sender: TObject);
begin
     If not ufuncoes.Empty(edtLoja.Text) Then
     Begin
         edtLoja.Text := uFuncoes.StrZero(edtLoja.Text,3);
         If (dmEtiquetas.qryLoja.Locate('LOJ_CDLOJA',edtLoja.Text,[])) Then
            lbl_NMLOJA.Caption := dmEtiquetas.qryLoja.FieldByName('LOJ_NMLOJA').AsString
         Else
         Begin
              ShowMessage('Loja n�o cadastrada!!!');
              lbl_NMLOJA.Caption := '.';
              edtLoja.SetFocus;
              edtLoja.Clear;
              Exit;  
         End;
     End;
end;

procedure TfrmConfRelatorio.CONSULTA;
begin
     TRY
         With frmRelEstoque.qryEstoque do
         begin
              Close;
              //
              ParamByName('pCDLOJA').AsString := uFuncoes.StrZero(edtLoja.Text,3);
              ParamByName('pDTINIC').AsDate   := StrtoDate('01/01/'+edtEXERC.Text);
              ParamByName('pDTFINA').AsDate   := StrtoDate('31/12/'+edtEXERC.Text);
              //
              Prepare;
              Open;
         End;
         //
     Except

     End;
end;

procedure TfrmConfRelatorio.edtEXERCKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
          key:=#0;
     //
     If (key = #13) and not uFuncoes.Empty(edtEXERC.Text) Then
     Begin
          Key := #0;
          //
          btVisualizar.SetFocus;
     End;
end;

procedure TfrmConfRelatorio.INCLUIR_DADOS;
Var
    M_QTPROD : Double;
    M_CDPROD, M_CDLOJA : String;
begin
     With qryProdutos do
     Begin
          SQL.CLEAR;
          Close;
          SQL.Add('Select PRO_CDPROD, PRO_CDBARR, PRO_NMPROD, PRO_VLVEND from "SACPRO.DBF"');
          Prepare;
          Open;
          First;
     End;
     //
     M_CDLOJA := edtLoja.Text; 
     //
     While not (qryProdutos.Eof) do
     Begin
          M_QTPROD := 0;
          //M_CDPROD := qryProdutos.FieldBy
          //

          // Proximo registro
          qryProdutos.Next;
     End;
end;

procedure TfrmConfRelatorio.spLocalizarClick(Sender: TObject);
begin
  Try
      Application.CreateForm(TfrmLocLojas, frmLocLojas);
      uLocLoja.M_NMFORM := 1;
      frmLocLojas.ShowModal;
  Finally
      frmLocLojas.Free;
  End;

end;

procedure TfrmConfRelatorio.edtLojaChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtLoja.Text) Then
        lbl_NMLOJA.Caption := '.';
end;

end.
