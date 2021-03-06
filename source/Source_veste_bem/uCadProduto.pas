unit uCadProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, RxLookup, DB, Mask, Grids, DBGrids,
  RXDBCtrl, Buttons, DBTables;

type
  TfrmCadastroProd = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dbtNMPROD: TDBText;
    Label1: TLabel;
    dbeCDBARR: TDBEdit;
    dsProdutos: TDataSource;
    Label2: TLabel;
    dbeNMDESC: TDBEdit;
    Label3: TLabel;
    cmbSECAO: TRxDBLookupCombo;
    Label4: TLabel;
    Label5: TLabel;
    dbeVLVENDA: TDBEdit;
    cmbGRUPO: TRxDBLookupCombo;
    btAdicionar: TBitBtn;
    btEditar: TBitBtn;
    btExcluir: TBitBtn;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    btFechar: TBitBtn;
    btLocalizar: TBitBtn;
    qryProdutos: TQuery;
    dsQryProdutos: TDataSource;
    qryProdutosPRO_CDPROD: TStringField;
    qryProdutosPRO_CDBARR: TStringField;
    qryProdutosPRO_NMPROD: TStringField;
    qryProdutosPRO_VLVEND: TFloatField;
    chbAlterar: TCheckBox;
    qryCDBARR: TQuery;
    qryNMPROD: TQuery;
    qryProdutosPRO_CDSECA: TStringField;
    GridDados: TRxDBGrid;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsProdutosStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure cmbSECAOExit(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
    procedure GridDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chbAlterarClick(Sender: TObject);
    procedure dbeCDBARRKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCDBARRExit(Sender: TObject);
    procedure dbeNMDESCExit(Sender: TObject);
  private
    procedure GRUPOS;
    procedure CONSULTA;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProd: TfrmCadastroProd;

implementation

uses udmEtiquetas, uFuncoes, uLocProduto;

{$R *.dfm}

procedure TfrmCadastroProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmEtiquetas.qryGrupo.Close;
     dmEtiquetas.qrySecao.Close;    
     dmEtiquetas.tbProdutos.Close;
     //
     Action := caFree;
end;

procedure TfrmCadastroProd.dsProdutosStateChange(Sender: TObject);
begin
    GridDados.Visible  := dsProdutos.State in [dsBrowse];
    chbAlterar.Visible := dsProdutos.State in [dsinsert];
    //
    btAdicionar.Enabled := dsProdutos.State in [dsBrowse];
    btEditar.Enabled    := dsProdutos.State in [dsBrowse];
    btExcluir.Enabled   := dsProdutos.State in [dsBrowse];
    //
    btGravar.Enabled := dsProdutos.State in [dsinsert,dsEdit];
    btCancelar.Enabled := dsProdutos.State in [dsinsert,dsEdit];
    //
    btFechar.Enabled    := dsProdutos.State in [dsBrowse];
    btLocalizar.Enabled := dsProdutos.State in [dsBrowse];
end;

procedure TfrmCadastroProd.FormActivate(Sender: TObject);
begin
    GridDados.Align := alClient;
end;

procedure TfrmCadastroProd.FormCreate(Sender: TObject);
begin
     If (dmEtiquetas.tbProdutos.Active = False) Then
        dmEtiquetas.tbProdutos.Open;
     //
     If (dmEtiquetas.qrySecao.Active = False) Then
     Begin
          With dmEtiquetas.qrySecao do
          Begin
               SQL.Clear;
               Close;
               SQL.Add('Select * from SACSEC order by SEC_CDSECA');
               Prepare;
               Open;
          End;
     End;
     //
     CONSULTA;
end;

procedure TfrmCadastroProd.GRUPOS;
Var
   M_CDSECA : String;
begin
     //M_CDSECA := dmEtiquetas.tbProdutos.FieldByName('PRO_CDSECA').AsString;
     M_CDSECA := qryProdutos.FieldByName('PRO_CDSECA').AsString;
     //
     With dmEtiquetas.qryGrupo do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select * from SACGRU  Where (GRU_CDSECA = :pCDSECA)');
          SQL.Add('order by GRU_NMGRUP');
          ParamByName('pCDSECA').AsString := M_CDSECA;
          Prepare;
          Open;
     End;
end;

procedure TfrmCadastroProd.btEditarClick(Sender: TObject);
Var
   M_CDBARR : String;
begin
     Try
         dbeCDBARR.ReadOnly := True;
         M_CDBARR := qryProdutos.FieldByName('PRO_CDBARR').AsString;
         //
       { With dmEtiquetas.qryGrupo do
        Begin
          SQL.Clear;
          Close;
          SQL.Add('Select * from SACGRU  Where (GRU_CDSECA = :pCDSECA)');
          SQL.Add('order by GRU_NMGRUP');
          ParamByName('pCDSECA').AsString := qryProdutos.FieldByName('PRO_CDSECA').AsString;
          Prepare;
          Open;
        End;}
         //
         GRUPOS;
         //
         If (dmEtiquetas.tbProdutos.locate('PRO_CDBARR',M_CDBARR,[])) Then
         Begin
             GridDados.Visible := False;
             dbtNMPROD.Visible := False;
             dmEtiquetas.tbProdutos.Edit;
             //GRUPOS;
             dbeNMDESC.SetFocus;
         End;
           //
     Except
            Application.MessageBox('Error ao tentar editar registro!',
               'ERROR', MB_Ok+MB_ICONQUESTION+MB_APPLMODAL);
     End;
end;

procedure TfrmCadastroProd.btCancelarClick(Sender: TObject);
Var
   N_CDBARR : String;
begin
     N_CDBARR := dmEtiquetas.tbProdutos.fieldByName('PRO_CDBARR').AsString;
     dmEtiquetas.tbProdutos.Cancel;
     CONSULTA;
     //
     qryProdutos.Locate('PRO_CDBARR', N_CDBARR,[]); 
     //
     dbtNMPROD.Visible := True;
     GridDados.Visible := True;
end;

procedure TfrmCadastroProd.cmbSECAOExit(Sender: TObject);
begin
     GRUPOS;
end;

procedure TfrmCadastroProd.btFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmCadastroProd.btAdicionarClick(Sender: TObject);
begin
      Try
           GridDados.Visible := False;
           chbAlterar.Checked := False;
           dmEtiquetas.tbProdutos.Append;
           dbtNMPROD.Visible := False;
           dbeNMDESC.SetFocus;
           //
      Except
            Application.MessageBox('Error ao tentar adicionar registro!',
               'ERROR', MB_Ok+MB_ICONQUESTION+MB_APPLMODAL);
      End;
end;

procedure TfrmCadastroProd.btGravarClick(Sender: TObject);
Var
    W_CDBARR : String;
begin
      Try
           If (dsProdutoS.State in [dsInsert,dsEdit]) Then
           begin
                 //
                 If (uFuncoes.Empty(dbeNMDESC.Text)) Then
                 begin
                      Application.MessageBox('Digite a descri��o do produto!',
                         'ATEN��O', MB_Ok+MB_ICONINFORMATION+MB_APPLMODAL);
                      dbeNMDESC.SetFocus;
                      Exit;
                 End;
                 //
                 If (uFuncoes.Empty(cmbSECAO.Text)) Then
                 begin
                      Application.MessageBox('Selecione a se��o!',
                         'ATEN��O', MB_Ok+MB_ICONINFORMATION+MB_APPLMODAL);
                      cmbSECAO.SetFocus;
                      Exit;
                 End;
                 //
                 If (uFuncoes.Empty(cmbGRUPO.Text)) Then
                 begin
                      Application.MessageBox('Selecione o grupo!',
                         'ATEN��O', MB_Ok+MB_ICONINFORMATION+MB_APPLMODAL);
                      cmbGRUPO.SetFocus;
                      Exit;
                 End;
                 //
                 If (uFuncoes.Empty(dbeVLVENDA.Text)) Then
                 begin
                      Application.MessageBox('Digite o valor de venda!!!',
                         'ATEN��O', MB_Ok+MB_ICONINFORMATION+MB_APPLMODAL);
                      dbeVLVENDA.SetFocus;
                      Exit;
                 End;
                 //
                 If (dsProdutos.State in [dsInsert]) Then
                 begin
                     If (dmEtiquetas.tbParametros.Active = False) then
                         dmEtiquetas.tbParametros.Open;
                     //
                     If (chbAlterar.Checked = False) Then
                     Begin
                       dmEtiquetas.tbParametros.Edit;
                       dmEtiquetas.tbParametros.FieldByName('PAR_CDBARR').Value :=
                             dmEtiquetas.tbParametros.FieldByName('PAR_CDBARR').Value+1;
                       dmEtiquetas.tbParametros.Post;
                       //
                       W_CDBARR := dmEtiquetas.tbProdutos.FieldByName('PRO_CDSECA').AsString+
                                   dmEtiquetas.tbProdutos.FieldByName('PRO_CDGRUP').AsString+
                                   dmEtiquetas.tbParametros.FieldByName('PAR_CDBARR').AsString;
                       //
                       dmEtiquetas.tbProdutos.FieldByName('PRO_CDBARR').AsString := uFuncoes.StrZero(W_CDBARR,13);
                       dmEtiquetas.tbProdutos.FieldByName('PRO_CDPROD').AsString := uFuncoes.StrZero(W_CDBARR,13);
                     End
                     Else
                     begin
                          If (uFuncoes.Empty(dbeCDBARR.Text)) Then
                          begin
                              Application.MessageBox('Digite o c�digo de barra!!!',
                               'ATEN��O', MB_Ok+MB_ICONINFORMATION+MB_APPLMODAL);
                              dbeCDBARR.SetFocus;
                              Exit;
                          End;
                     End;
                 End;
           End;
           // Grava as altera��es;
           dmEtiquetas.tbProdutos.Post;
           //
           CONSULTA;
           dbtNMPROD.Visible := True;
           //
           GridDados.Visible := True;
           qryProdutos.Locate('PRO_NMPROD', dbeNMDESC.Text,[]);
      Except
            Application.MessageBox('Error ao tentar gravar registro!',
               'ERROR', MB_Ok+MB_ICONQUESTION+MB_APPLMODAL);
      End;

end;

procedure TfrmCadastroProd.btExcluirClick(Sender: TObject);
Var
   M_CDBARR : String;
begin
    If Application.MessageBox('Deseja eliminar este registro?', 'Exclus�o de produto',
                  MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
    Begin
         M_CDBARR := qryProdutos.FieldByName('PRO_CDBARR').AsString;
         //
         If (dmEtiquetas.tbProdutos.locate('PRO_CDBARR',M_CDBARR,[])) Then
         begin
               dmEtiquetas.tbProdutos.delete;             // Apagar o regitro atual.
               //
               CONSULTA;
         End;      
    End;
end;

procedure TfrmCadastroProd.CONSULTA;
begin
     With qryProdutos do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select PRO_CDPROD, PRO_CDBARR, PRO_NMPROD, PRO_VLVEND, PRO_CDSECA');
          SQL.Add('from SACPRO order by PRO_NMPROD');
          Prepare;
          Open;
      End;
end;

procedure TfrmCadastroProd.btLocalizarClick(Sender: TObject);
{Var
   W_NMPROD : String;}
begin
 Try
      Application.CreateForm(TfrmLocProduto, frmLocProduto);
      uLocProduto.frmLocProduto.M_NMFORM := 2;
      frmLocProduto.ShowModal;
  Finally
      if not uFuncoes.Empty(uLocProduto.M_CDPROD) Then
         qryProdutos.Locate('PRO_CDPROD',uLocProduto.M_CDPROD,[]);
      frmLocProduto.Free;
//      edtCDBARR.SetFocus;
  End;

    {W_NMPROD := InputBox('LOCALIZAR','Digite a descri��o do produto?', '');
    If not uFuncoes.Empty(W_NMPROD) Then
    begin
         qryProdutos.Locate('PRO_NMPROD', UpperCase(W_NMPROD),[loPartialKey]);
    End;}
end;

procedure TfrmCadastroProd.GridDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Shift = [ssCtrl]) and (Key = 46) Then
        KEY := 0;

end;

procedure TfrmCadastroProd.chbAlterarClick(Sender: TObject);
begin
     If (chbAlterar.Checked = True) Then
     Begin
        dbeCDBARR.ReadOnly := False;
        dbeCDBARR.SetFocus;
     End
     Else
        dbeCDBARR.ReadOnly := True;
end;

procedure TfrmCadastroProd.dbeCDBARRKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmCadastroProd.dbeCDBARRExit(Sender: TObject);
begin
  if (dsProdutos.State in [dsInsert]) Then
  begin
     If not uFuncoes.Empty(dbeCDBARR.Text) Then
     begin
         dbeCDBARR.Text := uFuncoes.StrZero(dbeCDBARR.Text,13);
         //
         With qryCDBARR do
         Begin
              Close;
              //
              ParamByName('pCDBARR').AsString := dbeCDBARR.Text;
              //
              Prepare;
              Open;
         End;
         //
         If (qryCDBARR.RecordCount = 0) Then
            dmEtiquetas.tbProdutos.FieldByName('PRO_CDPROD').AsString := dbeCDBARR.Text
         Else
         Begin
              ShowMessage('C�digo de barras j� cadastrado.');
              dbeCDBARR.SetFocus;
              dbeCDBARR.Clear;
              Exit;
         End;
         //
         qryCDBARR.Close;
     End;
   End;
end;

procedure TfrmCadastroProd.dbeNMDESCExit(Sender: TObject);
begin
  if (dsProdutos.State in [dsInsert]) Then
  begin
    If not uFuncoes.Empty(dbeNMDESC.Text) then
    begin
         With qryNMPROD do
         Begin
              Close;
              //
              ParamByName('pNMPROD').AsString := dbeNMDESC.Text;
              //
              Prepare;
              Open;
         End;
         //
         If (qryNMPROD.RecordCount > 0) Then
         Begin
              ShowMessage('Descri��o de produto j� cadastrado.');
              dbeNMDESC.SetFocus;
              dbeNMDESC.Clear;
              Exit;
         End;
         //
         qryNMPROD.Close;
    End;
  End;  
end;

end.
