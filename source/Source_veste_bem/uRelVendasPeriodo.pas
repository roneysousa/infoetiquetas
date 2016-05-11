unit uRelVendasPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBTables;

type
  TfrmRelVendasPeriodo = class(TForm)
    qrImpressaoVenda: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    txtCLIENTE: TQRLabel;
    txtENDERECO: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    SummaryBand1: TQRBand;
    txtQTPROD: TQRLabel;
    qryVendas: TQuery;
    qryVendasMDV_NRVEND: TStringField;
    qryVendasMDV_CDLOJA: TStringField;
    qryVendasMDV_CDVEND: TStringField;
    qryVendasMDV_DTVEND: TDateField;
    qryVendasMDV_HOVEND: TStringField;
    qryVendasMDV_VLVEND: TCurrencyField;
    qryVendasMDV_VLPAGO: TCurrencyField;
    qryVendasMDV_VLTROC: TCurrencyField;
    qryVendasMDV_FLSITU: TStringField;
    qryVendasMDV_CDUSUA: TStringField;
    qryVendasMDV_CDMODA: TStringField;
    qryVendasMDV_NMCLIE: TStringField;
    qryVendasMDV_ENDCLI: TStringField;
    qryVendasMDV_NRFONE: TStringField;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRExpr1: TQRExpr;
    txtLOJA: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel2: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVendasPeriodo: TfrmRelVendasPeriodo;

implementation

{$R *.dfm}

end.
