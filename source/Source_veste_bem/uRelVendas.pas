unit uRelVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, DBTables, QRCtrls;

type
  TfrmRelVendas = class(TForm)
    qrRelVendas: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    qryItensVendas: TQuery;
    qryItensVendasITV_NRVEND: TStringField;
    qryItensVendasITV_NRITEM: TStringField;
    qryItensVendasITV_CDPROD: TStringField;
    qryItensVendasITV_QTPROD: TFloatField;
    qryItensVendasITV_IMGBAR: TGraphicField;
    QRDBText1: TQRDBText;
    QRDBImage1: TQRDBImage;
    QRDBText2: TQRDBText;
    txtData: TQRLabel;
    txtLOJA: TQRLabel;
    txtNMVEND: TQRLabel;
    QRDBText3: TQRDBText;
    qryProdutos: TQuery;
    qryItensVendasITV_NMPROD: TStringField;
    qryItensVendasITV_VLVEND: TCurrencyField;
    txtTOTALVENDA: TQRLabel;
    txtNMMODA: TQRLabel;
    QRDBText4: TQRDBText;
    qryItensVendasITV_VLUNI2: TCurrencyField;
    qryItensVendasITV_VLDESC: TFloatField;
    txtCLIEN: TQRLabel;
    txtFONE: TQRLabel;
    qryItensVendasITV_VLDES2: TStringField;
    procedure qryItensVendasCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVendas: TfrmRelVendas;

implementation

Uses udmEtiquetas;

{$R *.dfm}

procedure TfrmRelVendas.qryItensVendasCalcFields(DataSet: TDataSet);
begin
    If (qryItensVendasITV_VLDESC.Value > 0) Then
      qryItensVendasITV_VLDES2.Value :=
         FormatFloat('#0.#0',qryItensVendasITV_VLDESC.Value)+'%'; 
end;

end.
