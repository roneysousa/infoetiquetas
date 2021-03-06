unit u2ViaVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, RXDBCtrl, DB, DBTables, StdCtrls,
  Buttons;

type
  Tfrm2ViaVendas = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    qryVendas: TQuery;
    dsVendas: TDataSource;
    qryVendasMDV_NRVEND: TStringField;
    qryVendasMDV_CDLOJA: TStringField;
    qryVendasMDV_CDVEND: TStringField;
    qryVendasMDV_DTVEND: TDateField;
    qryVendasMDV_HOVEND: TStringField;
    qryVendasMDV_VLVEND: TCurrencyField;
    qryVendasMDV_VLPAGO: TCurrencyField;
    qryVendasMDV_VLTROC: TCurrencyField;
    qryVendasMDV_FLSITU: TStringField;
    qryVendasMDV_NMLOJA: TStringField;
    qryVendasMDV_NMVEND: TStringField;
    GridDados: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edtNRVEND: TEdit;
    Label1: TLabel;
    qryVendasMDV_CDMODA: TStringField;
    qryVendasMDV_NMMODA: TStringField;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtNRVENDKeyPress(Sender: TObject; var Key: Char);
    procedure edtNRVENDChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
     Procedure IMPRIMIR;
     Procedure CONSULTA;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm2ViaVendas: Tfrm2ViaVendas;

implementation

Uses uFuncoes, UdmEtiquetas, uRelVendas;

{$R *.dfm}

procedure Tfrm2ViaVendas.BitBtn2Click(Sender: TObject);
begin
    Close;
end;

procedure Tfrm2ViaVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     qryVendas.Close;
     //
     Action := caFree;
end;

procedure Tfrm2ViaVendas.IMPRIMIR;
begin
 Try
      Application.CreateForm(TfrmRelVendas, frmRelVendas);
      //
      With frmRelVendas do
      Begin
           qryProdutos.Open;
           txtData.Caption := qryVendasMDV_DTVEND.AsString;
           txtLOJA.Caption := qryVendasMDV_NMLOJA.AsString;
           txtNMVEND.Caption := qryVendasMDV_NMVEND.AsString;
           txtTOTALVENDA.Caption := FormatFloat('###,##0.#0',qryVendasMDV_VLVEND.AsCurrency);
           //
           With qryItensVendas do
           Begin
                Close;
                ParamByName('pNRVEND').AsString := qryVendasMDV_NRVEND.AsString;
                //
                Prepare;
                Open;
           End;
           //
           //
           qrRelVendas.Preview;
      End;
  Finally
      frmRelVendas.Free;
  End;
end;

procedure Tfrm2ViaVendas.edtNRVENDKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure Tfrm2ViaVendas.edtNRVENDChange(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNRVEND.Text) Then
        qryVendas.Locate('MDV_NRVEND',uFuncoes.StrZero(edtNRVEND.Text,7),[loPartialKey])
     Else
         CONSULTA;
end;

procedure Tfrm2ViaVendas.CONSULTA;
begin
    With qryVendas do
    Begin
         DisableControls;
         SQL.Clear;
         cLOSE;
         SQL.Add('Select * from "SACMDV.DB" order by MDV_NRVEND');
         Prepare;
         Open;
         EnableControls;
    End;
end;

procedure Tfrm2ViaVendas.BitBtn1Click(Sender: TObject);
Var
   W_NRVEND : String;
begin
 If (qryVendas.RecordCount = 0) Then
 Begin
      ShowMessage('N�o h� vendas!!!! ');
      Exit;
 End;
 //
 Try
      W_NRVEND := qryVendas.fieldByName('MDV_NRVEND').AsString;
      //
      Application.CreateForm(TfrmRelVendas, frmRelVendas);
      //
      With frmRelVendas do
      Begin
           qryProdutos.Open;
           txtData.Caption := qryVendas.fieldByName('MDV_DTVEND').AsString;;
           txtLOJA.Caption := qryVendas.fieldByName('MDV_NMLOJA').AsString;;
           txtNMVEND.Caption := qryVendas.fieldByName('MDV_NMVEND').AsString;;
           txtTOTALVENDA.Caption := qryVendas.fieldByName('MDV_VLVEND').AsString;
           txtNMMODA.Caption := qryVendas.fieldByName('MDV_NMMODA').AsString;
           //
           With qryItensVendas do
           Begin
                Close;
                ParamByName('pNRVEND').AsString := W_NRVEND;
                //
                Prepare;
                Open;
           End;
           //
           qrRelVendas.Preview;
      End;
  Finally
      frmRelVendas.Free;
      edtNRVEND.SetFocus;
      //
  End;
end;

procedure Tfrm2ViaVendas.FormCreate(Sender: TObject);
begin
     CONSULTA;
end;

end.
