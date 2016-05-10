unit uConfEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, Grids, DBGrids, DB, StdCtrls;

type
  TfrmConfEtiquetas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    sbReceber: TSpeedButton;
    spFechar: TSpeedButton;
    GridClientes: TDBGrid;
    dsProdutos: TDataSource;
    edtCODIGO: TEdit;
    edtNome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure GridClientesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure spFecharClick(Sender: TObject);
    procedure dsProdutosDataChange(Sender: TObject; Field: TField);
    procedure sbReceberClick(Sender: TObject);
    procedure edtCODIGOChange(Sender: TObject);
    procedure edtNomeChange(Sender: TObject);
    procedure edtNomeEnter(Sender: TObject);
    procedure edtCODIGOEnter(Sender: TObject);
    procedure edtCODIGOKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure GridClientesKeyPress(Sender: TObject; var Key: Char);
    procedure edtCODIGOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
     N_CDPROD : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfEtiquetas: TfrmConfEtiquetas;

implementation

Uses uFuncoes, uQuant, uPrincipal, udmEtiquetas;

{$R *.dfm}

procedure TfrmConfEtiquetas.GridClientesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (Shift = [ssCtrl]) and (Key = 46) Then
        KEY := 0;
end;

procedure TfrmConfEtiquetas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmEtiquetas.qryProduto.Close;
     //
     uFuncoes.Limpar_Status;
     //
     Action := caFree;
end;

procedure TfrmConfEtiquetas.FormActivate(Sender: TObject);
begin
     //
     With dmEtiquetas.qryProduto do
     begin
          SQL.clear;
          Close;
          SQL.Add('Select PRO_CDPROD, PRO_NMPROD, PRO_CDBARR ,PRO_VLVEND from SACPRO');
          SQL.Add('order by PRO_NMPROD');
          Prepare;
          Open;
     End;
end;

procedure TfrmConfEtiquetas.spFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmConfEtiquetas.dsProdutosDataChange(Sender: TObject;
  Field: TField);
begin
     FrmPrincipal.Info.Panels[1].Text := ' Registro: ' + IntToStr(dsProdutos.DataSet.RecNo) +
                          ' de ' + IntToStr(dsProdutos.DataSet.RecordCount);
end;

procedure TfrmConfEtiquetas.sbReceberClick(Sender: TObject);
begin
 Try
      edtCODIGO.Text := dmEtiquetas.qryProduto.FieldByName('PRO_CDPROD').AsString;
      N_CDPROD := dmEtiquetas.qryProduto.FieldByName('PRO_CDPROD').AsString;
      //
      Application.CreateForm(TfrmConfQuant, frmConfQuant);
      frmConfQuant.ShowModal;
  Finally
      frmConfQuant.Free;
      //
      dmEtiquetas.qryProduto.Locate('PRO_CDBARR',N_CDPROD,[]);
      //
      // edtCODIGO.Clear; 
      //edtCODIGO.SetFocus;
  End;
end;

procedure TfrmConfEtiquetas.edtCODIGOChange(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCODIGO.Text) Then
            dmEtiquetas.qryProduto.Locate('PRO_CDPROD',uFuncoes.StrZero(edtCODIGO.Text,13),[loPartialKey]);
end;

procedure TfrmConfEtiquetas.edtNomeChange(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNome.Text) Then
                   dmEtiquetas.qryProduto.Locate('PRO_NMPROD',edtNome.Text,[loPartialKey]);
           //
end;

procedure TfrmConfEtiquetas.edtNomeEnter(Sender: TObject);
begin
     edtCODIGO.Clear;
     edtNome.Clear;
     //
           dmEtiquetas.qryProduto.DisableControls;
           With dmEtiquetas.qryProduto do
           begin
                SQL.clear;
                Close;
                SQL.Add('Select PRO_CDPROD, PRO_CDBARR, PRO_NMPROD, PRO_VLVEND from SACPRO');
                SQL.Add('order by PRO_NMPROD');
                Prepare;
                Open;
           End;
           dmEtiquetas.qryProduto.EnableControls;

end;

procedure TfrmConfEtiquetas.edtCODIGOEnter(Sender: TObject);
begin
     edtNome.Clear;
     edtCODIGO.Clear;
     // 
     dmEtiquetas.qryProduto.DisableControls;
     With dmEtiquetas.qryProduto do
     begin
          SQL.clear;
          Close;
          SQL.Add('Select PRO_CDPROD, PRO_CDBARR ,PRO_NMPROD, PRO_VLVEND from SACPRO');
          SQL.Add('order by PRO_NMPROD');
          Prepare;
          Open;
     End;
     dmEtiquetas.qryProduto.EnableControls;
end;

procedure TfrmConfEtiquetas.edtCODIGOKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;

     If (Key = #13) Then
     begin
          Key := #0;
          //
          If (dmEtiquetas.qryProduto.Locate('PRO_CDPROD',uFuncoes.StrZero(edtCODIGO.Text,13) ,[])) Then
              sbReceberClick(Sender)
          Else
          Begin
               sbReceberClick(Sender);
               {ShowMessage('Produto não cadastrado!!!');
               edtCODIGO.SetFocus;
               edtCODIGO.Clear;}
          End;
     End;
end;

procedure TfrmConfEtiquetas.edtNomeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #13) Then
     begin
          Key := #0;
          sbReceberClick(Sender);
     End;
end;

procedure TfrmConfEtiquetas.GridClientesKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #13) Then
     begin
          Key := #0;
          Try
                Application.CreateForm(TfrmConfQuant, frmConfQuant);
                frmConfQuant.ShowModal;
          Finally
                 frmConfQuant.Free;
                 //
                 edtCODIGO.Clear;
                 edtCODIGO.SetFocus;
          End;
     End;
end;

procedure TfrmConfEtiquetas.edtCODIGOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    If (dmEtiquetas.qryProduto.Active = True) Then
    Begin
       If (Key = VK_UP) Then
          dmEtiquetas.qryProduto.Prior;
       If (Key = VK_DOWN) Then
          dmEtiquetas.qryProduto.Next;
    End;
end;

procedure TfrmConfEtiquetas.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If (dmEtiquetas.qryProduto.Active = True) Then
    Begin
       If (Key = VK_UP) Then
          dmEtiquetas.qryProduto.Prior;
       If (Key = VK_DOWN) Then
          dmEtiquetas.qryProduto.Next;
    End;
end;

end.
