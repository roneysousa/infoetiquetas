unit ufrmRelFluxoCaixa2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelFluxoCaixa2 = class(TForm)
    qryNatureza: TQuery;
    qryNaturezaNAT_CDNATU: TStringField;
    qryNaturezaNAT_NMNATU: TStringField;
    qryMovCaixa: TQuery;
    qrFluxoCaixa: TQuickRep;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    txtNMRELA: TQRLabel;
    txtPERIODO: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel7: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qryMovCaixaMCA_CDNATU: TStringField;
    qryMovCaixaMCA_TPMOVI: TStringField;
    qryMovCaixaMCA_VLMODA: TFloatField;
    QRDBText4: TQRDBText;
    procedure qryMovCaixaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFluxoCaixa2: TfrmRelFluxoCaixa2;

implementation

uses uFuncoes, udmEtiquetas;

{$R *.dfm}

procedure TfrmRelFluxoCaixa2.qryMovCaixaCalcFields(DataSet: TDataSet);
begin
{     If uFuncoes.Empty(qryMovCaixaMCA_CDNATU.AsString) Then
         qryMovCaixaMCA_NMDESC.AsString := 'NATUREZA NÃO ENCONTRADA';}
{     Else
         qryMovCaixaMCA_NMDESC.AsString := qryMovCaixaMCA_NMNAT2.Value;}

end;

end.
