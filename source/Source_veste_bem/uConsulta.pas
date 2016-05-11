unit uConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Grids, DBGrids, RXDBCtrl, DB,
  DBTables, Buttons;

type
  TfrmConsulta = class(TForm)
    Panel1: TPanel;
    DBText2: TDBText;
    pnlLoja: TPanel;
    pnlGrid: TPanel;
    pnlInferior: TPanel;
    GridGrupos: TRxDBGrid;
    edtLoja: TEdit;
    Label1: TLabel;
    dsEstoque: TDataSource;
    btSair: TBitBtn;
    spLocalizar: TSpeedButton;
    lbl_NMLOJA: TLabel;
    btLocalizar: TBitBtn;
    procedure edtLojaKeyPress(Sender: TObject; var Key: Char);
    procedure GridGruposKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btSairClick(Sender: TObject);
    procedure edtLojaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtLojaExit(Sender: TObject);
    procedure spLocalizarClick(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
    procedure dsEstoqueStateChange(Sender: TObject);
  private
     Procedure CONSULTA;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsulta: TfrmConsulta;

implementation

Uses uFuncoes, udmEtiquetas, uLocLoja, uLocProduto;

{$R *.dfm}

{ TfrmConsulta }

procedure TfrmConsulta.CONSULTA;
begin
     With dmEtiquetas.qryProEstoque do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select PRO_CDPROD, PRO_CDBARR, PRO_NMPROD from "SACPRO.DBF"');
          Prepare;
          Open;
     End;
     //
     With dmEtiquetas.qryConsultaEstoque do
     Begin
          Close;
          //
          ParamByName('pCDLOJA').AsString := uFuncoes.StrZero(edtLoja.Text,3) ;
          //
          Prepare;
          Open;
     End;
     //
     GridGrupos.SetFocus; 
end;

procedure TfrmConsulta.edtLojaKeyPress(Sender: TObject; var Key: Char);
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
          CONSULTA;
          //
     End;
end;

procedure TfrmConsulta.GridGruposKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Shift = [ssCtrl]) and (Key = 46) Then
        KEY := 0;
end;

procedure TfrmConsulta.btSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmConsulta.edtLojaChange(Sender: TObject);
begin
      If uFuncoes.Empty(edtLoja.Text) Then
      begin
        dmEtiquetas.qryConsultaEstoque.Close;
        lbl_NMLOJA.Caption := '.';
        btLocalizar.Enabled := False;
      End;
end;
                
procedure TfrmConsulta.FormCreate(Sender: TObject);
begin
     dmEtiquetas.qryConsultaEstoque.Close;
     //
     btLocalizar.Enabled := False;
end;

procedure TfrmConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmEtiquetas.qryConsultaEstoque.Close;
     dmEtiquetas.qryProEstoque.Close;
     //
     Action := caFree;
end;

procedure TfrmConsulta.edtLojaExit(Sender: TObject);
begin
     If not ufuncoes.Empty(edtLoja.Text) Then
     Begin
         edtLoja.Text := uFuncoes.StrZero(edtLoja.Text,3);
         //
         If (dmEtiquetas.qryLoja.Active = False) Then
            dmEtiquetas.qryLoja.Open; 
         //
         If (dmEtiquetas.qryLoja.Locate('LOJ_CDLOJA',edtLoja.Text,[])) Then
            lbl_NMLOJA.Caption := dmEtiquetas.qryLoja.FieldByName('LOJ_NMLOJA').AsString
         Else
         Begin
              ShowMessage('Loja não cadastrada!!!');
              lbl_NMLOJA.Caption := '.';
              edtLoja.SetFocus;
              edtLoja.Clear;
              Exit;  
         End;
     End;
end;

procedure TfrmConsulta.spLocalizarClick(Sender: TObject);
begin
  Try
      edtLoja.Clear;
      //dmEtiquetas.qryConsultaEstoque.Close;
      Application.CreateForm(TfrmLocLojas, frmLocLojas);
      uLocLoja.M_NMFORM := 2;
      frmLocLojas.ShowModal;
  Finally
      frmLocLojas.Free;
      edtLoja.SetFocus; 
  End;
end;

procedure TfrmConsulta.btLocalizarClick(Sender: TObject);
begin
 Try
      Application.CreateForm(TfrmLocProduto, frmLocProduto);
      uLocProduto.frmLocProduto.M_NMFORM := 5;
      frmLocProduto.ShowModal;
  Finally
      frmLocProduto.Free;
  End;
end;

procedure TfrmConsulta.dsEstoqueStateChange(Sender: TObject);
begin
     If (dmEtiquetas.qryConsultaEstoque.Active = True) Then
       btLocalizar.Enabled := dmEtiquetas.qryConsultaEstoque.RecordCount > 0;
end;

end.
