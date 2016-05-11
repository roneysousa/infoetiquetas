unit uRelEtiTrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBTables;

type
  TfrmRelGuia = class(TForm)
    qrGuia: TQuickRep;
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    txtData: TQRLabel;
    txtOrigem: TQRLabel;
    txtDestino: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRShape1: TQRShape;
    qryItens: TQuery;
    QRDBText1: TQRDBText;
    qryItensTRP_NRSEQU: TStringField;
    qryItensTRP_CDPROD: TStringField;
    qryItensTRP_QTPROD: TFloatField;
    qryItensTRP_IMABAR: TGraphicField;
    qryProduto: TQuery;
    qryProdutoPRO_CDPROD: TStringField;
    qryProdutoPRO_CDBARR: TStringField;
    qryProdutoPRO_NMPROD: TStringField;
    qryProdutoPRO_VLVEND: TFloatField;
    qryItensTRP_NMPROD: TStringField;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel4: TQRLabel;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel9: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelGuia: TfrmRelGuia;

implementation

Uses udmEtiquetas;

{$R *.dfm}

end.
