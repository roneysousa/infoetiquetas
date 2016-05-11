unit uConfSistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DBCtrls, DB, Mask,
  ExtDlgs;

type
  TfrmConfigSistema = class(TForm)
    pnlSuperior: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    tbsBasico: TTabSheet;
    Label1: TLabel;
    dbeNMEMPR: TDBEdit;
    dsParametros: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBImage1: TDBImage;
    DBText2: TDBText;
    DBComboBox1: TDBComboBox;
    btEditar: TSpeedButton;
    spOpen: TSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    btGravar: TSpeedButton;
    btCancelar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    spFechar: TSpeedButton;
    TabSheet1: TTabSheet;
    Label8: TLabel;
    dbeMDIMPR: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    Label13: TLabel;
    dbeTamanho: TDBEdit;
    Label15: TLabel;
    DBEdit11: TDBEdit;
    Label16: TLabel;
    DBEdit12: TDBEdit;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
    Label14: TLabel;
    Label17: TLabel;
    procedure btGravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsParametrosStateChange(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure spOpenClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure spFecharClick(Sender: TObject);
    procedure dbeMDIMPRKeyPress(Sender: TObject; var Key: Char);
    procedure dbeMDIMPRExit(Sender: TObject);
    procedure DBEdit11KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit12KeyPress(Sender: TObject; var Key: Char);
    procedure dbeTamanhoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigSistema: TfrmConfigSistema;

implementation

uses udmEtiquetas,uFuncoes;

{$R *.dfm}

procedure TfrmConfigSistema.btGravarClick(Sender: TObject);
begin
     If (dsParametros.State = dsEdit) Then
     Begin
          If uFuncoes.Empty(dmEtiquetas.tbParametros.FieldByName('PAR_MDIMPR').AsString) Then
              dmEtiquetas.tbParametros.FieldByName('PAR_MDIMPR').AsString := '1';
          //
          If Empty(dmEtiquetas.tbParametrosPAR_LINHA_INICIAL.AsString) Then
              dmEtiquetas.tbParametrosPAR_LINHA_INICIAL.AsFloat := 1.9;
          If Empty(dmEtiquetas.tbParametrosPAR_COLUNA_INICIAL.AsString) Then
              dmEtiquetas.tbParametrosPAR_COLUNA_INICIAL.AsFloat := 1.4;
          dmEtiquetas.tbParametros.Post;
     End;
end;

procedure TfrmConfigSistema.btCancelarClick(Sender: TObject);
begin
     dmEtiquetas.tbParametros.Cancel;
end;

procedure TfrmConfigSistema.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmConfigSistema.dsParametrosStateChange(Sender: TObject);
begin
      btEditar.Enabled   :=  dsParametros.State in [dsBrowse];
      spFechar.Enabled   :=  dsParametros.State in [dsBrowse];
      spOpen.Enabled     :=  dsParametros.State in [dsEdit];
      //
      btGravar.Enabled   :=  dsParametros.State in [dsEdit];
      btCancelar.Enabled :=  dsParametros.State in [dsEdit];
end;

procedure TfrmConfigSistema.btEditarClick(Sender: TObject);
begin
     dmEtiquetas.tbParametros.Edit;
     If (PageControl1.ActivePage = tbsBasico) Then
         dbeNMEMPR.SetFocus;
     {If (PageControl1.ActivePage = tbsOutros) Then
         dbeQTATRA.SetFocus;}
end;

procedure TfrmConfigSistema.spOpenClick(Sender: TObject);
var
   BMP: TBitMap;
begin
     If not (dsParametros.State in [dsEdit]) Then
            dmEtiquetas.tbParametros.Edit;
     //
     BMP := TBitMap.Create;
     If OpenPictureDialog1.Execute then
     begin
          If (dsParametros.State in [dsEdit]) then
          begin
               BMP.LoadFromFile(OpenPictureDialog1.FileName);
               dmEtiquetas.tbParametros.FieldByName('PAR_IMLOGO').Assign(BMP);
          end;
     end;
end;

procedure TfrmConfigSistema.SpeedButton1Click(Sender: TObject);
begin
{    uFuncoes.Grava_Imagem_JPEG(dmEtiquetas.tbParametros,
       dmEtiquetas.tbParametrosPAR_IMLOG2 , image1,
    OpenPictureDialog2);}
end;

procedure TfrmConfigSistema.FormActivate(Sender: TObject);
begin
     If (dmEtiquetas.tbParametros.Active = False) Then
         dmEtiquetas.tbParametros.Open; 
     PageControl1.ActivePage := tbsBasico;
end;

procedure TfrmConfigSistema.spFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmConfigSistema.dbeMDIMPRKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['1','2',#8, #13] ) then
        key:=#0;
end;

procedure TfrmConfigSistema.dbeMDIMPRExit(Sender: TObject);
begin
     If (dsParametros.State = dsEdit)
     and not uFuncoes.Empty(dbeMDIMPR.Text) Then
     Begin
          If (StrtoInt(dbeMDIMPR.Text)<1)
           or (StrtoInt(dbeMDIMPR.Text)>2) Then
          Begin
               ShowMessage('Valor inválido!!!');
               dmEtiquetas.tbParametrosPAR_MDIMPR.AsString := '1';
               Exit;
          End;
     End;
end;

procedure TfrmConfigSistema.DBEdit11KeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['1','2',#8, #13] ) then
        key:=#0;
end;

procedure TfrmConfigSistema.DBEdit12KeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['S','N', 's', 'n', #8, #13] ) then
        key:=#0;
end;

procedure TfrmConfigSistema.dbeTamanhoExit(Sender: TObject);
begin
    If (dsParametros.State = dsEdit)
     and not uFuncoes.Empty(dmEtiquetas.tbParametrosPAR_TAM_FONTE.AsString) Then
     begin
          If (dmEtiquetas.tbParametrosPAR_TAM_FONTE.AsInteger < 4 )
           or (dmEtiquetas.tbParametrosPAR_TAM_FONTE.AsInteger > 12) Then
            begin
                 ShowMessage('Valor inválido!!!');
                 dbeTamanho.SetFocus;
                 Exit;
            End;
     End;
end;

end.
