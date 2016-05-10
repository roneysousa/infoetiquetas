unit uConsTransf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, Grids, DBGrids,
  RXDBCtrl, DB, DBTables;

type
  TfrmConsTransfe = class(TForm)
    Panel3: TPanel;
    pnlEntrada: TPanel;
    pnlGrid: TPanel;
    pnlBotoes: TPanel;
    edtData: TDateEdit;
    Label1: TLabel;
    GridDados: TRxDBGrid;
    spFechar: TSpeedButton;
    qryTransferencia: TQuery;
    dsTransf: TDataSource;
    qryLoja: TQuery;
    qryLojaLOJ_CDLOJA: TStringField;
    qryLojaLOJ_NMLOJA: TStringField;
    qryTransferenciaTRA_NRSEQU: TStringField;
    qryTransferenciaTRA_CDLOJ1: TStringField;
    qryTransferenciaTRA_CDLOJ2: TStringField;
    qryTransferenciaTRA_DTTRAN: TDateField;
    qryTransferenciaTRA_HOTRAN: TStringField;
    qryTransferenciaTRA_NMLOJ1: TStringField;
    qryTransferenciaTRA_NMLOJ2: TStringField;
    spEtiquetas: TSpeedButton;
    spGuia: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spFecharClick(Sender: TObject);
    procedure edtDataKeyPress(Sender: TObject; var Key: Char);
    procedure GridDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure spEtiquetasClick(Sender: TObject);
    procedure spGuiaClick(Sender: TObject);
  private
    Procedure CONSULTA;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsTransfe: TfrmConsTransfe;
  M_DTTRAN : Tdate;

implementation

Uses uFuncoes, uImpEtiTransf, uRelEtiTrans, udmEtiquetas;

{$R *.dfm}

procedure TfrmConsTransfe.CONSULTA;
begin
     M_DTTRAN := edtData.Date;
     //
     With qryTransferencia do
     Begin
          DisableControls;
          Close;
          //
          ParamByName('pDTTRAN').AsDate := M_DTTRAN;
          //
          Prepare;
          Open;
          EnableControls;
     End;
     //
     if (qryTransferencia.RecordCount = 0) Then
     Begin
          Application.MessageBox('Não houve transferência nesta data.',
            'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtData.Date := Date;
          edtData.SetFocus;
     End;
end;

procedure TfrmConsTransfe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmConsTransfe.spFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmConsTransfe.edtDataKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) and (edtData.Text <> '  /  /    ') Then
     Begin
          Key := #0;
          //
          CONSULTA;
     End;
end;

procedure TfrmConsTransfe.GridDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Shift = [ssCtrl]) and (Key = 46) Then
        KEY := 0;
end;

procedure TfrmConsTransfe.FormCreate(Sender: TObject);
begin
    edtData.Date := Date;
end;

procedure TfrmConsTransfe.spEtiquetasClick(Sender: TObject);
begin
  If (qryTransferencia.Active = True)
     And (qryTransferencia.RecordCount = 0) Then
  Begin
        ShowMessage('Não há transferência na data indicada.');
        Exit;
  End;
  {Else
  Begin
        ShowMessage('Tecle Enter!!!');
        Exit;
  End;}
  //
  Try
      pnlBotoes.Enabled := False;
      Application.CreateForm(TfrmImpEtiTrans, frmImpEtiTrans);
      uImpEtiTransf.W_NRSEQU := qryTransferencia.FieldByName('TRA_NRSEQU').AsString;
      frmImpEtiTrans.ShowModal;
  Finally
      frmImpEtiTrans.Free;
      pnlBotoes.Enabled := True;
  End;
end;

procedure TfrmConsTransfe.spGuiaClick(Sender: TObject);
begin
  If (qryTransferencia.Active = True)
     And (qryTransferencia.RecordCount = 0) Then
  Begin
        ShowMessage('Não há transferência na data indicada.');
        Exit;
  End;
  {Else
  Begin
        ShowMessage('Tecle Enter!!!');
        Exit;
  End;}
  //
  Try
      pnlBotoes.Visible := False;
      Application.CreateForm(TfrmRelGuia, frmRelGuia);
      //
      If (dmEtiquetas.tbParametros.Active = False) Then
           dmEtiquetas.tbParametros.Open;
      //
      With frmRelGuia do
      Begin
           txtData.Caption    := qryTransferencia.FieldByName('TRA_DTTRAN').AsString;
           txtOrigem.Caption  := qryTransferencia.FieldByName('TRA_NMLOJ1').AsString;
           txtDestino.Caption := qryTransferencia.FieldByName('TRA_NMLOJ2').AsString;
           //
           frmRelGuia.qryProduto.Open;
           //
           With qryItens do
           Begin
                Close;
                //
                ParamByName('pNRSEQU').AsString := qryTransferencia.FieldByName('TRA_NRSEQU').AsString;
                //
                Prepare;
                Open;
           End;
           //
           qrGuia.Preview;
      End;
  Finally
      frmRelGuia.qryProduto.close;
      frmRelGuia.Free;
      pnlBotoes.Visible := True;
  End;
end;

end.
