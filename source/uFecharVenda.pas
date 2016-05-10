unit uFecharVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit;

type
  TfrmFecharVenda = class(TForm)
    Panel3: TPanel;
    lbl_NMPROD: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    CurrencyEdit1: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFecharVenda: TfrmFecharVenda;

implementation

{$R *.dfm}

procedure TfrmFecharVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

end.
