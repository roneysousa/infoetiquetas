unit uConfRelVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Mask, ToolEdit, Buttons;

type
  TfrmConfRelVendas = class(TForm)
    pnlSuperior: TPanel;
    pnlCentral: TPanel;
    pnlInferior: TPanel;
    edtDTINIC: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtDTFINA: TDateEdit;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    edtLoja: TEdit;
    spLocalizar: TSpeedButton;
    btConfirma: TBitBtn;
    lbl_NMLOJA: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btConfirmaClick(Sender: TObject);
    procedure spLocalizarClick(Sender: TObject);
    procedure edtLojaExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure edtLojaChange(Sender: TObject);
    procedure edtLojaKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTINICKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTFINAKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTINICExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfRelVendas: TfrmConfRelVendas;

implementation

uses uRelVendasPeriodo, udmEtiquetas, uFuncoes, uLocLoja;

{$R *.dfm}

procedure TfrmConfRelVendas.FormCreate(Sender: TObject);
begin
    edtDTINIC.Date := Date();
    edtDTFINA.Date := Date();
end;

procedure TfrmConfRelVendas.BitBtn2Click(Sender: TObject);
begin
      Close;
end;

procedure TfrmConfRelVendas.btConfirmaClick(Sender: TObject);
begin
    If uFuncoes.Empty(edtLoja.Text) Then
    Begin
         ShowMessage('Digite o codigo da loja!!!');
         edtLoja.SetFocus;
         Exit;
    End;
    //
     If (edtDTFINA.Date < edtDTINIC.Date) Then
     Begin
          ShowMessage('Data final menor que a inicial!!!');
          edtDTFINA.Date := edtDTINIC.Date;
          Exit;
     End;
    //
    Try
       Application.CreateForm(TfrmRelVendasPeriodo, frmRelVendasPeriodo);
       btConfirma.Enabled := False;
       //
       If (dmEtiquetas.tbParametros.Active = False) Then
           dmEtiquetas.tbParametros.Open;
       //
       With frmRelVendasPeriodo.qryVendas do
       Begin
            Close;
            //
            ParamByName('pDTINIC').AsDate := edtDTINIC.Date;
            ParamByName('pDTFINA').AsDate := edtDTFINA.Date;
            ParamByName('pCDLOJA').AsString := uFuncoes.StrZero(edtLoja.Text,3);
            //
            Prepare;
            Open;
       End;
       //
       With frmRelVendasPeriodo do
       Begin
            txtCLIENTE.Caption  := 'RELATORIO DE VENDAS';
            txtLOJA.Caption     := 'LOJA : '+ lbl_NMLOJA.Caption;
            txtENDERECO.Caption := 'PERIODO : ' + edtDTINIC.Text +' A '+ edtDTFINA.Text;
            //
            qrImpressaoVenda.Preview;
       End;
    Finally
         frmRelVendasPeriodo.Free;
         btConfirma.Enabled := True;
         edtLoja.Clear;
         edtDTINIC.Date := Date();
         edtDTFINA.Date := Date();
         //
         edtLoja.SetFocus;
    End;
end;

procedure TfrmConfRelVendas.spLocalizarClick(Sender: TObject);
begin
  Try
      Application.CreateForm(TfrmLocLojas, frmLocLojas);
      uLocLoja.M_NMFORM := 3;
      frmLocLojas.ShowModal;
  Finally
      frmLocLojas.Free;
  End;
end;

procedure TfrmConfRelVendas.edtLojaExit(Sender: TObject);
begin
     If not ufuncoes.Empty(edtLoja.Text) Then
     Begin
         edtLoja.Text := uFuncoes.StrZero(edtLoja.Text,3);
         //
         If (dmEtiquetas.qryLoja.Active = False) Then
            dmEtiquetas.qryLoja.Open;
         //
         If (dmEtiquetas.qryLoja.Locate('LOJ_CDLOJA',edtLoja.Text,[])) Then
            lbl_NMLOJA.Caption := dmEtiquetas.qryLoja.FieldByName('LOJ_NMLOJA').AsString
         Else
         Begin
              ShowMessage('Loja n�o cadastrada!!!');
              lbl_NMLOJA.Caption := '.';
              edtLoja.SetFocus;
              edtLoja.Clear;
              Exit;
         End;
     End;
end;

procedure TfrmConfRelVendas.edtDTFINAExit(Sender: TObject);
begin
   If not uFuncoes.Empty(edtDTFINA.Text) Then
   Begin
      try
          StrToDate(edtDTFINA.Text);
      except
          on EConvertError do
          begin
            ShowMessage ('Data Inv�lida!');
            edtDTFINA.SetFocus;
            Exit;
          End;
      end;
   End;
   //

     If (edtDTFINA.Date < edtDTINIC.Date) Then
     Begin
          ShowMessage('Data final menor que a inicial!!!');
          edtDTFINA.Date := edtDTINIC.Date;
          Exit;
     End;
end;

procedure TfrmConfRelVendas.edtLojaChange(Sender: TObject);
begin
      If uFuncoes.Empty(edtLoja.Text) Then
      begin
          lbl_NMLOJA.Caption := '.';
          //btLocalizar.Enabled := False;
      End;
end;

procedure TfrmConfRelVendas.edtLojaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
          key:=#0;
     //
     If (key = #13) and uFuncoes.Empty(edtLoja.Text) Then
     Begin
          Key := #0;
          spLocalizarClick(Sender);
     End;
     //
     If (key = #13) and not uFuncoes.Empty(edtLoja.Text) Then
     Begin
          Key := #0;
          //
          edtLoja.Text := uFuncoes.StrZero(edtLoja.Text,3);
          //
          edtDTINIC.SetFocus;
          //
     End;

end;

procedure TfrmConfRelVendas.edtDTINICKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
          key:=#0;
     //
     If (key = #13) and (edtDTINIC.Text<>'  /  /    ') Then
     Begin
          Key := #0;
          //
          edtDTFINA.SetFocus;
          //
     End;
end;

procedure TfrmConfRelVendas.edtDTFINAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and (edtDTFINA.Text<>'  /  /    ') Then
     Begin
          Key := #0;
          //
          btConfirma.SetFocus;
          //
     End;
end;

procedure TfrmConfRelVendas.edtDTINICExit(Sender: TObject);
begin
   If not uFuncoes.Empty(edtDTINIC.Text) Then
   Begin
      try
          StrToDate(edtDTINIC.Text);
      except
          on EConvertError do
          begin
            ShowMessage ('Data Inv�lida!');
            edtDTINIC.SetFocus;
            Exit;
          End;
      end;
   End;

end;

end.
