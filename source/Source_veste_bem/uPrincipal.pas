{                           INFOG2

 PROGRAMADOR ...: RONEY ERDEMANN
 LINGUAGEM .....: DELPHI 7
 DATA INÍCIO ...: 26/09/2005
 DATA TÉRMINO ..:  VERSÃO 1.0
 DATA ALTERAÇÃO.: 26/09/2005
 VERSÃO ATUAL ..: 1.0
}

unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, AppEvnts, ExtCtrls, jpeg, Menus, Buttons, ToolWin, Printers,
  StdCtrls, ImgList, uConfEtiquetas, u2ViaVenda,uCadUsuarios, uConfSistema;

type
  TFrmPrincipal = class(TForm)
    Image1: TImage;
    Hora: TTimer;
    ApplicationEvents1: TApplicationEvents;
    MenuPrincipal: TMainMenu;
    Sistema1: TMenuItem;
    mnuEtiquetasItem: TMenuItem;
    Preos1: TMenuItem;
    mnuSobre: TMenuItem;
    ToolBar1: TToolBar;
    BtnClientes: TSpeedButton;
    BtnVendas: TSpeedButton;
    Bevel2: TBevel;
    BtnSair: TSpeedButton;
    Bevel1: TBevel;
    Label1: TLabel;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    mnuSairItem: TMenuItem;
    Info: TStatusBar;
    CadastrosProdutos1: TMenuItem;
    spProdutos: TSpeedButton;
    ToolButton3: TToolButton;
    Movimento1: TMenuItem;
    Vendas1: TMenuItem;
    Relatorios1: TMenuItem;
    N2ViadeVendas1: TMenuItem;
    N1: TMenuItem;
    mnuEntradaSaidaItem: TMenuItem;
    Consulta1: TMenuItem;
    mnuConEstoqueItem: TMenuItem;
    Utilitarios1: TMenuItem;
    Usuarios1: TMenuItem;
    mnuEstoqueItem: TMenuItem;
    mnuRelVendasItem: TMenuItem;
    N2: TMenuItem;
    ransferncia1: TMenuItem;
    mnuConTransfernciaItem: TMenuItem;
    mnuConfiguraesItem: TMenuItem;
    CancelamentodeVendas1: TMenuItem;
    ItemConsVendas: TMenuItem;
    mnuRelEtiquetasItem: TMenuItem;
    N3: TMenuItem;
    mnuFluxodeCaixaItem: TMenuItem;
    spEtipedidos: TSpeedButton;
    ImpressodePedifdos1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Hint(Sender: TObject);
    procedure mnuSobreClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Preos1Click(Sender: TObject);
    procedure HoraTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnSairClick(Sender: TObject);
    procedure mnuEtiquetasItemClick(Sender: TObject);
    procedure BtnVendasClick(Sender: TObject);
    procedure CadastrosProdutos1Click(Sender: TObject);
    procedure N2ViadeVendas1Click(Sender: TObject);
    procedure mnuEntradaSaidaItemClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mnuConEstoqueItemClick(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuEstoqueItemClick(Sender: TObject);
    procedure ransferncia1Click(Sender: TObject);
    procedure mnuConTransfernciaItemClick(Sender: TObject);
    procedure mnuConfiguraesItemClick(Sender: TObject);
    procedure mnuRelVendasItemClick(Sender: TObject);
    procedure CancelamentodeVendas1Click(Sender: TObject);
    procedure ItemConsVendasClick(Sender: TObject);
    procedure mnuRelEtiquetasItemClick(Sender: TObject);
    procedure mnuFluxodeCaixaItemClick(Sender: TObject);
    procedure spEtipedidosClick(Sender: TObject);
    procedure ImpressodePedifdos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Function DifData(dataini,datafin:string):integer;
    Function ExisteForm(pForm:TForm):boolean;
    procedure ImpStrings(Strings: TStrings);
    procedure Log(UserName, Erro: String); // GERA LOG DE ERROS E INFORMAÇÕES
    Procedure FECHAR;
  end;

Const
    M_USERMASTER = 'ADMIN';
    M_SNMASTER   = 'GAB200';
    M_AUTEN      = 'SuperSonic';

var
  FrmPrincipal: TFrmPrincipal;
  frmConfEtiquetas : TfrmConfEtiquetas;
  frm2ViaVendas : Tfrm2ViaVendas;
  frmCadUsuarios : TfrmCadUsuarios;
  frmConfigSistema : TfrmConfigSistema;
  M_CDUSUA, M_NMUSUA : String;

implementation

uses uSobre, uCadProduto, uCadVendas, udmEtiquetas, uEntradaSaida,
  uConsulta, uLogon, uConfRelatorio, uCadTranferencia, uConsTransf,
  uConfRelVendas, uCancelarVendas, uConsultaVendas, uPrintEtiquetas,
  uFluxoCaixa, frmPedEtiquetas;

{$R *.dfm}

Function TFrmPrincipal.DifData(dataini,datafin:string):integer;
Var
  a, b, c : tdatetime;
  ct, s : integer;

begin

 If StrToDate(DataFin) < StrtoDate(DataIni) Then
 Begin
  Result := 0;
  Exit;
 End;
 ct := 0;
 s := 1;
 a := StrToDate(DataFin);
 b := StrToDate(DataIni);
 If a > b Then
 Begin
  c := a;
  a := b;
  b := c;
  s := 1;
 End;
 a := a + 1;
 While (Dayofweek(a) <> 2) And (a <= b) Do
 Begin
  If Dayofweek(a) In [2..7] Then
  Begin
   Inc(ct);
  End;
  a := a + 1;
 End;
 ct := ct + round(( 5 * Int((b-a) / 7 )));
 a := a + ( 7 * Int(( b - a ) / 7 ));
 While a <= b do
 Begin
  If Dayofweek(a) In [2..7] Then
  Begin
   Inc(ct);
  End;
  a := a + 1;
 End;
 If ct < 0 then
 Begin
  ct := 0;
 End;
 Result := s * ct;

end;

procedure TFrmPrincipal.Log(UserName, Erro: String);
begin

 // PROCEDURE RESPONSÁVEL PELA DOCUMENTAÇÃO DOS ERROS OCORRIDOS DURANTE A
 // EXECUÇÃO DO SISTEMA, TODOS OS ERROS SERÃO DOCUMENTADOS NUM ARQUIVO TXT

{ log := TStringList.Create;
 if fileexists(extractfilepath(application.ExeName)+'log.txt') then
 begin
  Log.LoadFromFile(extractfilepath(application.ExeName)+'log.txt');
  log.Add('');
  Log.Add('DATA - HORA : ' + DateToStr(Date) + ' - ' + TimeToStr(Time));
  Log.Add('USUÁRIO ......: ' + UserName);
  Log.Add('INFORMAÇÃO : ' + Erro);
  Log.SaveToFile(extractfilepath(application.ExeName)+'log.txt');
 end
 else
 begin
  Log.Add('DATA - HORA : ' + DateToStr(Date) + ' - ' + TimeToStr(Time));
  Log.Add('USUÁRIO ......: ' + UserName);
  Log.Add('INFORMAÇÃO : ' + Erro);
  Log.SaveToFile(extractfilepath(application.ExeName)+'log.txt');
 end;
 log.Free;}

end;

procedure TFrmPrincipal.ImpStrings(Strings: TStrings);
Var
  Prn: TextFile;
  i: Word;

begin

 AssignPrn(Prn);
 try
  Rewrite(Prn);
  try
   for i := 0 to Strings.Count -1 do
    writeln(Prn, Strings.Strings[i]);
  finally
   CloseFile(Prn);
  end;
 except
  on EInOutError do
   MessageDlg('Erro na impressão.', mtError, [mbOK], 0);
 end;

end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
     //
     Application.Title := 'InfoEtiquetas 2.0';
     ShortDateFormat := 'dd/mm/yyyy';
     Info.Panels.Items[0].Text :=  DateTOStr(Date) + ' - ' + TimeToStr(Time);
     Info.Panels.Items[2].Text := 'InfoEtiqueta 2.0 ® - InfoG2 Sistemas';
end;

procedure TFrmPrincipal.ApplicationEvents1Hint(Sender: TObject);
begin

 if application.Hint = '' then  Info.Panels.Items[2].Text := 'InfoEtiquetas 2.0 ® - InfoG2 Sistemas'
 else Info.Panels.Items[2].Text := application.Hint;

end;

procedure TFrmPrincipal.mnuSobreClick(Sender: TObject);
begin
 Try
      Application.CreateForm(TfrmSobre, frmSobre);
      frmSobre.ShowModal;
  Finally
      frmSobre.Free;
  End;
end;

procedure TFrmPrincipal.FormResize(Sender: TObject);
begin

 Image1.Left := (FrmPrincipal.Width Div 2) - (Image1.Width Div 2);
 Image1.Top := (FrmPrincipal.Height Div 2) - (Image1.Height Div 2 + Info.Height);
 Label1.Left := 4;
 Label1.Top := FrmPrincipal.Height - (Info.Height + 70);
 Label1.Caption := 'InfoG2 Sistemas  ® Copyright Inc 2008 - 2014';

end;

procedure TFrmPrincipal.Preos1Click(Sender: TObject);
begin

 btnclientes.Click;

end;

procedure TFrmPrincipal.HoraTimer(Sender: TObject);
begin
 Info.Panels.Items[0].Text :=  DateTOStr(Date) + ' - ' + TimeToStr(Time);
end;

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If Application.MessageBox('Sair do Programa?',
     'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
        Canclose:=False;
end;

procedure TFrmPrincipal.BtnSairClick(Sender: TObject);
begin
     If Application.MessageBox('Sair do Programa?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
          Application.Terminate;
end;

procedure TFrmPrincipal.mnuEtiquetasItemClick(Sender: TObject);
begin
  Try
      //
      FECHAR;
      Application.CreateForm(TfrmEtiquetas2, frmEtiquetas2);
      frmEtiquetas2.ShowModal;
  Finally
      frmEtiquetas2.Free;
  End;
{    If ExisteForm(frmConfEtiquetas) = False Then
    begin
         FECHAR;
         LockWindowUpdate(Handle);
         frmConfEtiquetas := TfrmConfEtiquetas.Create(Self);
         LockWindowUpdate(0);
    End
    Else
    begin
         frmConfEtiquetas.BringToFront;
         frmConfEtiquetas.Focused;
    End;}
    
end;

function TFrmPrincipal.ExisteForm(pForm: TForm): boolean;
Var
    I:integer;
begin
    ExisteForm := False;
    For I:= 0 to Screen.FormCount -1 do
        If Screen.Forms[I] = pForm Then
        begin
            ExisteForm := True;
            Break;
        End;
end;

procedure TFrmPrincipal.BtnVendasClick(Sender: TObject);
begin
     With dmEtiquetas.qryProduto do
     Begin
          SQL.Clear;
          Close; 
          SQL.Add('Select * from "SACPRO.DBF"');
          Prepare;
          Open;
     End;
     //
 If (dmEtiquetas.qryProduto.RecordCount = 0) Then
 Begin
      ShowMessage('Não há produtos para ser vendido!!!! ');
      Exit;
 End;
 //
 Try
      FECHAR;
      Application.CreateForm(TfrmCadVendas, frmCadVendas);
      frmCadVendas.ShowModal;
  Finally
      frmCadVendas.Free;
  End;
end;

procedure TFrmPrincipal.CadastrosProdutos1Click(Sender: TObject);
begin
 Try
      FECHAR;
      Application.CreateForm(TfrmCadastroProd, frmCadastroProd);
      frmCadastroProd.ShowModal;
  Finally
      frmCadastroProd.Free;
  End;
end;

procedure TFrmPrincipal.N2ViadeVendas1Click(Sender: TObject);
begin
    If ExisteForm(frm2ViaVendas) = False Then
    begin
         FECHAR;
         LockWindowUpdate(Handle);
         frm2ViaVendas := Tfrm2ViaVendas.Create(Self);
         LockWindowUpdate(0);
    End
    Else
    begin
         frm2ViaVendas.BringToFront;
         frm2ViaVendas.Focused;
    End;
end;

procedure TFrmPrincipal.FECHAR;
//Fechar todas as janelas abertas.
var
  I: Integer;
begin
  with frmPrincipal do
    for I := MDIChildCount-1 downto 0 do
      MDIChildren[I].Close;
end;

procedure TFrmPrincipal.mnuEntradaSaidaItemClick(Sender: TObject);
begin
 Try
      FECHAR;
      Application.CreateForm(TfrmEntradaSaida, frmEntradaSaida);
      frmEntradaSaida.ShowModal;
  Finally
      frmEntradaSaida.Free;
  End;
end;

procedure TFrmPrincipal.FormActivate(Sender: TObject);
begin
     M_CDUSUA := '000';
     M_NMUSUA := 'INFOG2';
end;

procedure TFrmPrincipal.mnuConEstoqueItemClick(Sender: TObject);
begin
 Try
      FECHAR;
      Application.CreateForm(TfrmConsulta, frmConsulta);
      frmConsulta.ShowModal;
  Finally
      frmConsulta.Free;
  End;
end;

procedure TFrmPrincipal.Usuarios1Click(Sender: TObject);
begin
    If ExisteForm(frmCadUsuarios) = False Then
    begin
         FECHAR;
         LockWindowUpdate(Handle);
         frmCadUsuarios := TfrmCadUsuarios.Create(Self);
         LockWindowUpdate(0);
    End
    Else
    begin
         frmCadUsuarios.BringToFront;
         frmCadUsuarios.Focused;
    End;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
{  Try
      Application.CreateForm(TfrmLogon, frmLogon);
      frmLogon.ShowModal;
  Finally
      frmLogon.Free;
  End;}
end;

procedure TFrmPrincipal.mnuEstoqueItemClick(Sender: TObject);
begin
  Try
      FECHAR;
      Application.CreateForm(TfrmConfRelatorio, frmConfRelatorio);
      frmConfRelatorio.ShowModal;
  Finally
      frmConfRelatorio.Free;
  End;
end;

procedure TFrmPrincipal.ransferncia1Click(Sender: TObject);
begin
  Try
      FECHAR;
      Application.CreateForm(TfrmTransferencia, frmTransferencia);
      frmTransferencia.ShowModal;
  Finally
      frmTransferencia.Free;
  End;
end;

procedure TFrmPrincipal.mnuConTransfernciaItemClick(Sender: TObject);
begin
  Try
      FECHAR;
      Application.CreateForm(TfrmConsTransfe, frmConsTransfe);
      frmConsTransfe.ShowModal;
  Finally
      frmConsTransfe.Free;
  End;
end;

procedure TFrmPrincipal.mnuConfiguraesItemClick(Sender: TObject);
begin
    If ExisteForm(frmConfigSistema) = False Then
    begin
         FECHAR;
         LockWindowUpdate(Handle);
         frmConfigSistema := TfrmConfigSistema.Create(Self);
         LockWindowUpdate(0);
    End
    Else
    begin
         frmConfigSistema.BringToFront;
         frmConfigSistema.Focused;
    End;
end;

procedure TFrmPrincipal.mnuRelVendasItemClick(Sender: TObject);
begin
  Try
      FECHAR;
      Application.CreateForm(TfrmConfRelVendas, frmConfRelVendas);
      frmConfRelVendas.ShowModal;
  Finally
      frmConfRelVendas.Free;
  End;
end;

procedure TFrmPrincipal.CancelamentodeVendas1Click(Sender: TObject);
begin
  Try
      FECHAR;
      Application.CreateForm(TfrmCancelamentoVendas, frmCancelamentoVendas);
      frmCancelamentoVendas.ShowModal;
  Finally
      frmCancelamentoVendas.Free;
  End;
end;

procedure TFrmPrincipal.ItemConsVendasClick(Sender: TObject);
begin
  Try
      FECHAR;
      Application.CreateForm(TfrmConsultaVendas, frmConsultaVendas);
      frmConsultaVendas.ShowModal;
  Finally
      frmConsultaVendas.Free;
  End;
end;

procedure TFrmPrincipal.mnuRelEtiquetasItemClick(Sender: TObject);
begin
  Try
      FECHAR;
      Application.CreateForm(TfrmEtiquetas2, frmEtiquetas2);
      frmEtiquetas2.ShowModal;
  Finally
      frmEtiquetas2.Free;
  End;
end;

procedure TFrmPrincipal.mnuFluxodeCaixaItemClick(Sender: TObject);
begin
  Try
      FECHAR;
      Application.CreateForm(TfrmFluxoCaixa, frmFluxoCaixa);
      frmFluxoCaixa.ShowModal;
  Finally
      frmFluxoCaixa.Release;
      frmFluxoCaixa := nil;
  End;
end;

procedure TFrmPrincipal.spEtipedidosClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPedidoEtiqueta, frmPedidoEtiqueta);
    Try
      FECHAR;
      frmPedidoEtiqueta.ShowModal;
    Finally
      frmPedidoEtiqueta.Release;
      frmPedidoEtiqueta := nil;
    End;
end;

procedure TFrmPrincipal.ImpressodePedifdos1Click(Sender: TObject);
begin
     spEtipedidosClick(Sender);
end;

end.
