unit uCadItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBTables, QuickRpt, QRCtrls,
  CJVQRBarCode;

type
  TfrmCadItem = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btConfirma: TBitBtn;
    btCancelar: TBitBtn;
    edtCDBARR: TEdit;
    edtQTPROD: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    spLocalizar: TSpeedButton;
    qryInclusao: TQuery;
    codBarras: TCJVQRBarCode;
    Image1: TImage;
    lbl_vlunit: TLabel;
    Panel3: TPanel;
    lbl_NMPROD: TLabel;
    procedure edtCDBARRKeyPress(Sender: TObject; var Key: Char);
    procedure edtQTPRODKeyPress(Sender: TObject; var Key: Char);
    procedure btCancelarClick(Sender: TObject);
    procedure spLocalizarClick(Sender: TObject);
    procedure btConfirmaClick(Sender: TObject);
    procedure edtCDBARRExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadItem: TfrmCadItem;
  W_NRVEND : String;

implementation

Uses uFuncoes, udmEtiquetas, uLocProduto,uCadVendas;

{$R *.dfm}

procedure TfrmCadItem.edtCDBARRKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmCadItem.edtQTPRODKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
    //
    If (key = #13) and not uFuncoes.Empty(edtQTPROD.Text)  Then
    Begin
         key:=#0;
         btConfirma.SetFocus;
    End;
end;

procedure TfrmCadItem.btCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmCadItem.spLocalizarClick(Sender: TObject);
begin
 Try
      Application.CreateForm(TfrmLocProduto, frmLocProduto);
      uLocProduto.frmLocProduto.M_NMFORM := 1;
      frmLocProduto.ShowModal;
  Finally
      frmLocProduto.Free;
      edtCDBARR.SetFocus;
  End;
end;

procedure TfrmCadItem.btConfirmaClick(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDBARR.Text) Then
     Begin
          ShowMessage('Digite o código de barras do produto?');
          edtCDBARR.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtQTPROD.Text) Then
     Begin
          ShowMessage('Digite a quantidade do produto?');
          edtQTPROD.SetFocus;
          Exit;
     End;
     //
     Try
          uCadVendas.M_NRITEM :=  uCadVendas.M_NRITEM+1;
         //
         With qryInclusao do
         Begin
              Close;
              //
              ParamByName('pNRVEND').AsString := W_NRVEND;
              ParamByName('pNRITEM').AsString := uFuncoes.StrZero(InttoStr( uCadVendas.M_NRITEM),3);
              ParamByName('pCDPROD').AsString := uFuncoes.StrZero(edtCDBARR.Text,13);
              ParamByName('pQTPROD').AsFloat  := StrtoFloat(edtQTPROD.Text);
              //
              ExecSQL;
         End;
         //
         //
         dmEtiquetas.tbItensVenda.Close;
         dmEtiquetas.tbItensVenda.Filtered := False;
         dmEtiquetas.tbItensVenda.Filter   := 'ITV_NRVEND='+QuotedStr(uCadVendas.M_NRVEND)+ ' And ITV_CDPROD='+QuotedStr(uFuncoes.StrZero(edtCDBARR.Text,13));
         dmEtiquetas.tbItensVenda.Filtered := True;
         dmEtiquetas.tbItensVenda.Open;
         //
         dmEtiquetas.tbItensVenda.Edit;
         dmEtiquetas.tbItensVenda.FieldByName('ITV_IMGBAR').Assign(Image1.Picture.Bitmap);
         dmEtiquetas.tbItensVenda.Post;
         dmEtiquetas.tbItensVenda.Close;
         //
         Close;
     Except

     End;
end;

procedure TfrmCadItem.edtCDBARRExit(Sender: TObject);
vAR
    W_CDPROD : string;
begin
     If not uFuncoes.Empty(edtCDBARR.Text) Then
     Begin
          W_CDPROD := uFuncoes.StrZero(edtCDBARR.Text,13) ;
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
              codBarras.Texto := edtCDBARR.Text;
              //
              Image1.Canvas.Draw(0,0,codBarras.Picture.Bitmap);
          End
          Else
          Begin
               ShowMessage('Código de barras não cadastro!!!');
               lbl_nmprod.Caption := '.';
               lbl_vlunit.Caption := '0,00';
               edtCDBARR.SetFocus;
               edtCDBARR.Clear;
               Exit;
          End;
     End;
end;

End.
