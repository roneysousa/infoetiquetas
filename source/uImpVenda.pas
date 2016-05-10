unit uImpVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TfrmRelImpVenda = class(TForm)
    qrImpressaoVenda: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBImage1: TQRDBImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    txtCLIENTE: TQRLabel;
    txtENDERECO: TQRLabel;
    txtFONE: TQRLabel;
    SummaryBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    txtFMPAGA: TQRLabel;
    txtTOTAL: TQRLabel;
    txtQTPROD: TQRLabel;
    QRShape1: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelImpVenda: TfrmRelImpVenda;

implementation

Uses uCadVendas;

{$R *.dfm}

end.
