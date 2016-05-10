unit uRelEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables;

type
  TfrmRelEstoque = class(TForm)
    qrEstoque: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBImage1: TQRDBImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    qryEstoque: TQuery;
    qryEstoqueEST_CDLOJA: TStringField;
    qryEstoqueEST_CDPROD: TStringField;
    qryEstoqueEST_DTENTR: TDateField;
    qryEstoqueEST_QTENTR: TFloatField;
    qryEstoqueEST_QTPROD: TFloatField;
    qryEstoqueEST_NMPROD: TStringField;
    qryEstoqueEST_VLVEND: TCurrencyField;
    qryEstoqueEST_SUBTOT: TCurrencyField;
    qryProduto: TQuery;
    qryProdutoPRO_CDPROD: TStringField;
    qryProdutoPRO_CDBARR: TStringField;
    qryProdutoPRO_NMPROD: TStringField;
    qryProdutoPRO_VLVEND: TFloatField;
    QRSysData2: TQRSysData;
    txtLoja: TQRLabel;
    txtEXERC: TQRLabel;
    qryEstoqueEST_NMLOJA: TStringField;
    QRDBText5: TQRDBText;
    procedure qryEstoqueCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEstoque: TfrmRelEstoque;

implementation

Uses uConfRelatorio, udmEtiquetas;

{$R *.dfm}

procedure TfrmRelEstoque.qryEstoqueCalcFields(DataSet: TDataSet);
begin
     qryEstoqueEST_SUBTOT.AsCurrency :=
         qryEstoqueEST_QTPROD.AsFloat * qryEstoqueEST_VLVEND.AsCurrency;
end;

end.
