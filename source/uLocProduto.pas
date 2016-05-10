unit uLocProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DB, DBTables;

type
  TfrmLocProduto = class(TForm)
    edtPROCURA: TLabeledEdit;
    BtnConfirmar: TSpeedButton;
    BtnCancelar: TSpeedButton;
    GridDados: TDBGrid;
    dsProdutos: TDataSource;
    rdCODIGO: TRadioButton;
    rbNOME: TRadioButton;
    qryProduto: TQuery;
    qryProdutoPRO_CDPROD: TStringField;
    qryProdutoPRO_CDBARR: TStringField;
    qryProdutoPRO_NMPROD: TStringField;
    procedure edtPROCURAKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPROCURAChange(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure edtPROCURAEnter(Sender: TObject);
    procedure rdCODIGOClick(Sender: TObject);
    procedure rbNOMEClick(Sender: TObject);
    procedure GridDadosDblClick(Sender: TObject);
    procedure GridDadosKeyPress(Sender: TObject; var Key: Char);
    procedure edtPROCURAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure OrdenarNome();
    procedure OrdenarCodigo();
  public
     M_NMFORM : Integer;
    { Public declarations }
  end;

var
  frmLocProduto: TfrmLocProduto;
  M_CDPROD : String;

implementation

Uses uFuncoes,udmEtiquetas,uCadItem, uCadVendas, uEntradaSaida,
  uCadTranferencia, uCadProduto, uPrintEtiquetas;

{$R *.dfm}

procedure TfrmLocProduto.edtPROCURAKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then Close;
    if key = #13 then btnconfirmar.Click;
    if key = #13 then btncancelar.Click;
end;

procedure TfrmLocProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action := caFree;
end;

procedure TfrmLocProduto.edtPROCURAChange(Sender: TObject);
begin
     If not uFuncoes.Empty(edtPROCURA.Text) Then
     begin
         If (rdCODIGO.Checked = True) Then
         begin
              // Procura pelo codigo
              With qryProduto do
              begin
                   SQL.Clear;
                   Close;
                   Sql.add('Select PRO_CDPROD, PRO_CDBARR, PRO_NMPROD from SACPRO where PRO_CDPROD like '
                       + quotedstr(uFuncoes.StrZero(edtPROCURA.Text,13)+'%') + ' order by PRO_CDPROD');
                   Prepare;
                   Open;
              End;
         End;
         //
         If (rbNOME.Checked = True) Then
         begin
              // Procura pelo nome
              With qryProduto do
              begin
                   SQL.Clear;
                   Close;
                   Sql.add('Select PRO_CDPROD, PRO_CDBARR,PRO_NMPROD from SACPRO where PRO_NMPROD like ' + quotedstr(edtPROCURA.Text+'%') + ' order by PRO_NMPROD');
                   Prepare;
                   Open;
              End;
        End;
     End
     Else
     Begin
          With qryProduto do
          begin
               sql.clear;
               Close;
               sql.add('Select PRO_CDPROD, PRO_CDBARR,PRO_NMPROD from SACPRO order by PRO_NMPROD');
               Prepare;
               open;
          End;
     End;
end;

procedure TfrmLocProduto.BtnConfirmarClick(Sender: TObject);
begin
   Try
     M_CDPROD := qryProduto.fieldByName('PRO_CDPROD').AsString;
     //
     If (M_NMFORM = 1) Then
     Begin
          frmCadVendas.edtCDBARR.Text := M_CDPROD;
     End;
     //
     If (M_NMFORM = 2) Then
     begin
         frmCadastroProd.qryProdutos.Locate('PRO_CDBARR', M_CDPROD,[]);
         {dmEtiquetas.tbItensPedido.FieldByName('ITP_CDPROD').asString :=
              qryProduto.fieldByName('PRO_CDBARR').AsString;}
     End;
     //
     If (M_NMFORM = 3) Then
     begin
         frmEntradaSaida.edtCDPROD.Text := M_CDPROD;
     End;
     //
     If (M_NMFORM = 4) Then
     Begin
          frmTransferencia.edtCDBARR.Text := M_CDPROD;
     End;
     //
     If (M_NMFORM = 5) Then
       dmEtiquetas.qryConsultaEstoque.Locate('EST_CDPROD', M_CDPROD,[]);
     If (M_NMFORM = 6) Then
       frmEtiquetas2.edtCDPROD.Text := M_CDPROD;
     // Fechar janela de localizar
     close;
   Except
        ShowMessage('Erro ao selecionar produto...');
        Close;
   End;
end;

procedure TfrmLocProduto.BtnCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmLocProduto.edtPROCURAEnter(Sender: TObject);
begin
     edtPROCURA.Clear;
end;

procedure TfrmLocProduto.rdCODIGOClick(Sender: TObject);
begin
      OrdenarCodigo;
      edtPROCURA.SetFocus;
end;

procedure TfrmLocProduto.rbNOMEClick(Sender: TObject);
begin
     OrdenarNome;
     edtPROCURA.SetFocus;
end;

procedure TfrmLocProduto.GridDadosDblClick(Sender: TObject);
begin
     //btnconfirmar.Click;
     BtnConfirmarClick(Sender);
end;

procedure TfrmLocProduto.GridDadosKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) Then
     Begin
          Key := #0;
          BtnConfirmarClick(Sender);
     End;
end;

procedure TfrmLocProduto.edtPROCURAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If (qryProduto.Active) Then
   begin
     If (Key = VK_UP) Then
        qryProduto.Prior;
     If (Key = VK_DOWN) Then
        qryProduto.Next;
   End;
end;

procedure TfrmLocProduto.FormCreate(Sender: TObject);
begin
     OrdenarNome;
end;

procedure TfrmLocProduto.OrdenarCodigo;
begin
   With qryProduto do
   begin
         sql.clear;
         Close;
         sql.add('Select PRO_CDPROD, PRO_CDBARR,PRO_NMPROD from SACPRO order by PRO_CDPROD');
         Prepare;
         open;
   End;
end;

procedure TfrmLocProduto.OrdenarNome;
begin
   With qryProduto do
   begin
         sql.clear;
         Close;
         sql.add('Select PRO_CDPROD, PRO_CDBARR,PRO_NMPROD from SACPRO order by PRO_NMPROD');
         Prepare;
         open;
   End;
end;

end.
