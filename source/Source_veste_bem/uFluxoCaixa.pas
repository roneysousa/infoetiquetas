unit uFluxoCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, DB, DBTables;

type
  TfrmFluxoCaixa = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    btVisualizar: TBitBtn;
    btFechar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    edtDTINIC: TDateEdit;
    edtDTFINA: TDateEdit;
    qryDados: TQuery;
    qryDadosMCA_TPMOVI: TStringField;
    qryDadosMCA_TOTAL: TFloatField;
    qryDadosMCA_CDNATU: TStringField;
    qryDadosMCA_NMNATU: TStringField;
    qryDadosMCA_NMDESC: TStringField;
    procedure btFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btVisualizarClick(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFluxoCaixa: TfrmFluxoCaixa;

implementation

uses uFuncoes, uRelFluxoCaixa, udmEtiquetas, ufrmRelFluxoCaixa2;

{$R *.dfm}

procedure TfrmFluxoCaixa.btFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmFluxoCaixa.FormActivate(Sender: TObject);
begin
    edtDTINIC.Date := Date();
    edtDTFINA.Date := Date();
end;

procedure TfrmFluxoCaixa.btVisualizarClick(Sender: TObject);
Var
   M_DTINIC, M_DTFINA, M_CDNATU, M_TPMOVI, M_NMNATU : String;
   M_VLTOTA, M_VLMODA : Double;
begin
      If not uFuncoes.Empty(edtDTINIC.Text )
       and not uFuncoes.Empty(edtDTFINA.Text) Then
      Begin
           btVisualizar.Enabled := False;
           Try
              If (dmEtiquetas.tbParametros.Active = False) Then
                  dmEtiquetas.tbParametros.Open;
              //
              Application.CreateForm(TfrmRelFluxoCaixa, frmRelFluxoCaixa);
              //
              With frmRelFluxoCaixa do
              Begin
                 txtNMRELA.Caption  := 'FLUXO DE CAIXA';
                 txtPERIODO.Caption := edtDTINIC.Text +' A '+ edtDTFINA.Text;
                 //
              End;
              //
              M_DTINIC := Copy(edtDTINIC.Text,7,4)+Copy(edtDTINIC.Text,4,2)+Copy(edtDTINIC.Text,1,2);
              M_DTFINA := Copy(edtDTFINA.Text,7,4)+Copy(edtDTFINA.Text,4,2)+Copy(edtDTFINA.Text,1,2);
              //
              With frmRelFluxoCaixa.qryMovCaixa do
              Begin
                   SQL.Clear;
                   Close;
                   //
                   SQL.Add('Select MCA_CDNATU, MCA_TPMOVI, Sum(MCA_VLMODA) AS MCA_TOTAL from ');
                   SQL.Add('SACMCA Where (MCA_DTMOVI >= :pDTINIC) ');
                   SQL.Add('AND (MCA_DTMOVI <= :pDTFINA) ');
                   SQL.Add('Group By MCA_TPMOVI, MCA_CDNATU');
                   //
                   ParamByName('pDTINIC').AsString := M_DTINIC;
                   ParamByName('pDTFINA').AsString := M_DTFINA;
                   //
                   Open;
              End;
              //
              M_VLMODA := 0;
              //
              {While not (frmRelFluxoCaixa2.qryMovCaixa.Eof) do
              Begin
                   M_CDNATU := frmRelFluxoCaixa2.qryMovCaixa.FieldByName('MCA_CDNATU').AsString;
                   M_TPMOVI := frmRelFluxoCaixa2.qryMovCaixa.FieldByName('MCA_TPMOVI').AsString;
                   M_NMNATU := 'TESTE';
                   M_VLMODA := frmRelFluxoCaixa2.qryMovCaixa.FieldByName('MCA_VLMODA').AsFloat;
                   //
                        With dmEtiquetas.qryDadosRel do
                        Begin
                             SQL.Clear;
                             Close;
                             SQL.Add('Select * from SACRMCA');
                             SQL.Add('Where (MCA_TPMOVI = :pTPMOVI)'); // (MCA_CDNATU = :pCDNATU) AND
                             //ParamByName('pCDNATU').AsString := M_CDNATU;
                             ParamByName('pTPMOVI').AsString := M_TPMOVI;
                             //
                             Open;
                        End;
                        //
                        If (dmEtiquetas.qryDadosRel.RecordCount = 0) Then
                        Begin
                            With qryDados do
                            Begin
                                 SQL.Clear;
                                 Close;
                                 SQL.Add('INSERT INTO SACRMCA(MCA_CDNATU, MCA_TPMOVI, MCA_NMNATU, MCA_VLMODA)');
                                 SQL.Add('VALUES (:pCDNATU, :pTPMOVI, :pNMNATU, :pVLMODA)');
                                 //
                                 ParamByName('pCDNATU').AsString := M_CDNATU;
                                 ParamByName('pTPMOVI').AsString := M_TPMOVI;
                                 ParamByName('pNMNATU').AsString := M_NMNATU;
                                 ParamByName('pVLMODA').AsFloat  := M_VLMODA;
                                 //
                                 ExecSQL;
                            End;
                        End
                        Else
                        Begin
                            With qryDados do
                            Begin
                                 SQL.Clear;
                                 Close;
                                 SQL.Add('UPDATE SACRMCA SET (MCA_VLMODA = MCA_VLMODA + :pVLMODA)');
                                 SQL.Add('Where (MCA_CDNATU = :pCDNATU) AND (MCA_TPMOVI = :pTPMOVI)');
                                 //
                                 ParamByName('pCDNATU').AsString := M_CDNATU;
                                 ParamByName('pTPMOVI').AsString := M_TPMOVI;
                                 ParamByName('pVLMODA').AsFloat  := M_VLMODA;
                                 //
                                 ExecSQL;
                            End;
                        End;
                   // Proximo
                   frmRelFluxoCaixa2.qryMovCaixa.Next;
              End;}
              //
              frmRelFluxoCaixa.qrFluxoCaixa.Preview;
              //
           Finally
                frmRelFluxoCaixa.Free;
                btVisualizar.Enabled := True;
           End;

      End;
end;

procedure TfrmFluxoCaixa.edtDTINICExit(Sender: TObject);
begin
   If not uFuncoes.Empty(edtDTINIC.Text) Then
   Begin
      try
          StrToDate(edtDTINIC.Text);
      except
          on EConvertError do
          begin
            ShowMessage ('Data Inválida!');
            edtDTINIC.Date := Date();
            edtDTINIC.SetFocus;
            Exit;
          End;
      end;
   End;
end;

procedure TfrmFluxoCaixa.edtDTFINAExit(Sender: TObject);
begin
   If not uFuncoes.Empty(edtDTFINA.Text) Then
   Begin
      try
          StrToDate(edtDTFINA.Text);
      except
          on EConvertError do
          begin
            ShowMessage ('Data Inválida!');
            edtDTFINA.Date := Date();
            edtDTFINA.SetFocus;
            Exit;
          End;
      end;
   End;
end;

end.
