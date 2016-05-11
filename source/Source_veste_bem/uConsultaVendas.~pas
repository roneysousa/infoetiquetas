unit uConsultaVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Buttons, Grids, DBGrids, RXDBCtrl,
  DB, DBTables;

type
  TfrmConsultaVendas = class(TForm)
    Panel3: TPanel;
    pnlEntrada: TPanel;
    pnlGrid: TPanel;
    pnlInferior: TPanel;
    GridDados: TRxDBGrid;
    btFechar: TBitBtn;
    dsConsulta: TDataSource;
    btData: TBitBtn;
    btNRVEND: TBitBtn;
    btCliente: TBitBtn;
    pnlTOTAL: TPanel;
    lblTOTAL: TLabel;
    lbl_VLTOTAL: TLabel;
    procedure btFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btDataClick(Sender: TObject);
    procedure dsConsultaDataChange(Sender: TObject; Field: TField);
    procedure btNRVENDClick(Sender: TObject);
    procedure btClienteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaVendas: TfrmConsultaVendas;
  M_VLTOTA : Real;

implementation

Uses uFuncoes, udmEtiquetas, uPrincipal;

{$R *.dfm}

procedure TfrmConsultaVendas.btFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmConsultaVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmEtiquetas.qryConsulta.Close;
     frmPrincipal.Info.Panels[1].Text := ' ';
     //
     Action := caFree;
end;

procedure TfrmConsultaVendas.btDataClick(Sender: TObject);
Var
    M_DTVEND : String;
begin
     dmEtiquetas.qryConsulta.Close;
     M_DTVEND := InputBox('Localizar','Digite a data da venda?',DatetoStr(Date));
     If uFuncoes.Empty(M_DTVEND) Then
     Begin
          dmEtiquetas.qryConsulta.Close;
          Exit;
     End;
 Try
        StrToDate(M_DTVEND);
        M_VLTOTA := 0;
        //
        If Not uFuncoes.Empty(M_DTVEND) Then
        begin
              With dmEtiquetas.qryConsulta do
              begin
                  // DisableControls;
                   SQL.Clear;
                   Close;
                   SQL.Add('Select * from SACMDV Where (MDV_DTVEND = :pDTATUA) And (MDV_FLSITU="A") order by MDV_NRVEND');
                   ParamByName('pDTATUA').AsDate := StrtoDate(M_DTVEND);
                   Prepare;
                   Open;
                   First;
                  // EnableControls;
              End;
              //
              If (dmEtiquetas.qryConsulta.RecordCount = 0) Then
              Begin
                   Application.MessageBox('Data não encontada.',
                           'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
                   //
                   dmEtiquetas.qryConsulta.Close;
                   //
                   lblTOTAL.Visible  := False;
                   lbl_VLTOTAL.Visible  := False;
                   //
                   Exit;
              End
              Else
              Begin
                  //
                  dmEtiquetas.qryConsulta.DisableControls;
                  While not (dmEtiquetas.qryConsulta.Eof) do
                  Begin
                        M_VLTOTA := M_VLTOTA+ dmEtiquetas.qryConsulta.FieldByname('MDV_VLVEND').AsCurrency;
                        dmEtiquetas.qryConsulta.Next;
                  End;
                  //
                  dmEtiquetas.qryConsulta.First;
                  dmEtiquetas.qryConsulta.EnableControls;
                  //
                  lbl_VLTOTAL.Caption := FormatFloat('###,###,##0.#0',M_VLTOTA);
                  lblTOTAL.Visible  := True;
                  lbl_VLTOTAL.Visible  := True;
              End;
        End;
    Except
      on EConvertError do
          Application.MessageBox('Data Inválida!.',
                    'ATENÇÃO', MB_OK+MB_ICONERROR);
    End;
    //
    GridDados.SetFocus;
end;

procedure TfrmConsultaVendas.dsConsultaDataChange(Sender: TObject;
  Field: TField);
begin
     // barra de status
     frmPrincipal.Info.Panels[1].Text := ' Registro: ' + IntToStr(dsConsulta.DataSet.RecNo) +
                          ' de ' + IntToStr(dsConsulta.DataSet.RecordCount);
end;

procedure TfrmConsultaVendas.btNRVENDClick(Sender: TObject);
Var
    M_NRVEND : String;
begin
      dmEtiquetas.qryConsulta.Close;
     M_NRVEND := InputBox('Localizar','Digite o número da venda?', '');
     //
     If uFuncoes.Empty(M_NRVEND) Then
        Exit;

 Try
        //
        M_NRVEND := uFuncoes.StrZero(M_NRVEND,7);
        //
        If Not uFuncoes.Empty(M_NRVEND) Then
        begin
              With dmEtiquetas.qryConsulta do
              begin
                  // DisableControls;
                   SQL.Clear;
                   Close;
                   SQL.Add('Select * from SACMDV Where (MDV_NRVEND = :pNRVEND) And (MDV_FLSITU="A") order by MDV_NRVEND');
                   ParamByName('pNRVEND').AsString := M_NRVEND;
                   Prepare;
                   Open;
                  // EnableControls;
              End;
              //
              If (dmEtiquetas.qryConsulta.RecordCount = 0) Then
              Begin
                   Application.MessageBox('Nº. da venda não encontada.',
                           'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
                   //
                   dmEtiquetas.qryConsulta.Close;
                   //
                   lblTOTAL.Visible  := False;
                   lbl_VLTOTAL.Visible  := False;
                   Exit;
              End
              Else
              Begin
                  M_VLTOTA := 0;
                  dmEtiquetas.qryConsulta.DisableControls;
                  While not (dmEtiquetas.qryConsulta.Eof) do
                  Begin
                        M_VLTOTA := M_VLTOTA+ dmEtiquetas.qryConsulta.FieldByname('MDV_VLVEND').AsCurrency;
                        dmEtiquetas.qryConsulta.Next;
                  End;
                  //
                  dmEtiquetas.qryConsulta.First;
                  dmEtiquetas.qryConsulta.EnableControls;
                  //
                  lbl_VLTOTAL.Caption := FormatFloat('###,###,##0.#0',M_VLTOTA);
                  //
                  lblTOTAL.Visible  := True;
                  lbl_VLTOTAL.Visible  := True;
              End;

        End;
    Except

    End;
    //
    GridDados.SetFocus;
end;

procedure TfrmConsultaVendas.btClienteClick(Sender: TObject);
Var
   M_NMCLIE : String;
begin
      dmEtiquetas.qryConsulta.Close;
     M_NMCLIE := InputBox('Localizar','Digite o nome do cliente?', '');
 Try
        If uFuncoes.Empty(M_NMCLIE) Then
            Exit;
        //
        M_NMCLIE := UpperCase(M_NMCLIE);
        //
        If Not uFuncoes.Empty(M_NMCLIE) Then
        begin
              With dmEtiquetas.qryConsulta do
              begin
                  // DisableControls;
                   SQL.Clear;
                   Close;
                   Sql.add('Select * from SACMDV where MDV_NMCLIE like ' + quotedstr(M_NMCLIE+'%') + ' And (MDV_FLSITU="A") order by MDV_DTVEND, MDV_NRVEND');
                   Prepare;
                   Open;
                  // EnableControls;
              End;
              //
              If (dmEtiquetas.qryConsulta.RecordCount = 0) Then
              Begin
                   Application.MessageBox('Cliente não encontado.',
                           'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
                   //
                   dmEtiquetas.qryConsulta.Close;
                   //
                   lblTOTAL.Visible  := False;
                   lbl_VLTOTAL.Visible  := False;
                   Exit;
              End
              Else
              Begin
                  M_VLTOTA := 0;
                  dmEtiquetas.qryConsulta.DisableControls;
                  While not (dmEtiquetas.qryConsulta.Eof) do
                  Begin
                        M_VLTOTA := M_VLTOTA+ dmEtiquetas.qryConsulta.FieldByname('MDV_VLVEND').AsCurrency;
                        dmEtiquetas.qryConsulta.Next;
                  End;
                  //
                  dmEtiquetas.qryConsulta.First;
                  dmEtiquetas.qryConsulta.EnableControls;
                  //
                  lbl_VLTOTAL.Caption := FormatFloat('###,###,##0.#0',M_VLTOTA);
                  //
                  lblTOTAL.Visible  := True;
                  lbl_VLTOTAL.Visible  := True;
              End;
        End;
    Except

    End;
    //
    GridDados.SetFocus;

end;

procedure TfrmConsultaVendas.FormActivate(Sender: TObject);
begin
     With dmEtiquetas.qryConsulta do
     begin
          DisableControls;
          SQL.Clear;
          Close;
          SQL.Add('Select * from SACMDV Where (MDV_FLSITU="A") order by MDV_NRVEND Desc');
          Prepare;
          Open;
          First;
          EnableControls;
     End;
     //
     M_VLTOTA := 0;
     dmEtiquetas.qryConsulta.DisableControls;
     While not (dmEtiquetas.qryConsulta.Eof) do
     Begin
          M_VLTOTA := M_VLTOTA+ dmEtiquetas.qryConsulta.FieldByname('MDV_VLVEND').AsCurrency;
          dmEtiquetas.qryConsulta.Next;
     End;
     //
     dmEtiquetas.qryConsulta.First;
     dmEtiquetas.qryConsulta.EnableControls;
     //
     lbl_VLTOTAL.Caption := FormatFloat('###,###,##0.#0',M_VLTOTA);
     //
     lblTOTAL.Visible  := True;
     lbl_VLTOTAL.Visible  := True;
end;

end.
