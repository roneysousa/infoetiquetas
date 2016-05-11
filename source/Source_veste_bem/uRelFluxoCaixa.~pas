unit uRelFluxoCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBTables;

type
  TfrmRelFluxoCaixa = class(TForm)
    qrFluxoCaixa: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    txtNMRELA: TQRLabel;
    txtPERIODO: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qryMovCaixa: TQuery;
    qryMovCaixaMCA_TOTAL: TFloatField;
    qryMovCaixaMCA_CDNATU: TStringField;
    qryMovCaixaMCA_NMNATU: TStringField;
    qryNatureza: TQuery;
    qryNaturezaNAT_CDNATU: TStringField;
    qryNaturezaNAT_NMNATU: TStringField;
    qryMovCaixaMCA_NMDESC: TStringField;
    qryMovCaixaMCA_TPMOVI: TStringField;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    procedure qryMovCaixaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFluxoCaixa: TfrmRelFluxoCaixa;

implementation

uses uFuncoes;

{$R *.dfm}

procedure TfrmRelFluxoCaixa.qryMovCaixaCalcFields(DataSet: TDataSet);
begin
     If uFuncoes.Empty(qryMovCaixaMCA_CDNATU.AsString) Then
         qryMovCaixaMCA_NMDESC.AsString := 'NATUREZA NÃO ENCONTRADA'
     Else
         qryMovCaixaMCA_NMDESC.AsString := qryMovCaixaMCA_NMNATU.AsString;
end;

end.
