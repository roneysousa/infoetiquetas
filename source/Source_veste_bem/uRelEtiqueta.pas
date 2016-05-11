unit uRelEtiqueta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, QuickRpt, QRCtrls, ExtCtrls;

type
  TfrmRelEtiqueta = class(TForm)
    qrEtiquetas: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    qryEtiquetas: TQuery;
    qryEtiquetasEQT_CDPROD: TStringField;
    qryEtiquetasEQT_NMPROD: TStringField;
    qryEtiquetasEQT_VLVEND: TFloatField;
    QRDBImage1: TQRDBImage;
    qryEtiquetasEQT_IMGBAR: TGraphicField;
    QRDBText1: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
         
var
  frmRelEtiqueta: TfrmRelEtiqueta;

implementation

{$R *.dfm}

end.
