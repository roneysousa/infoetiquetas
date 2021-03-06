program InfoEtiquetas;

uses
  Forms,
  Windows,
  Dialogs,
  udmEtiquetas in 'udmEtiquetas.pas' {dmEtiquetas: TDataModule},
  uFuncoes in 'uFuncoes.pas',
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  uSplash in 'uSplash.pas' {frmSplash},
  uCadProduto in 'uCadProduto.pas' {frmCadastroProd},
  uConfEtiquetas in 'uConfEtiquetas.pas' {frmConfEtiquetas},
  uQuant in 'uQuant.pas' {frmConfQuant},
  uRelEtiqueta in 'uRelEtiqueta.pas' {frmRelEtiqueta},
  uSobre in 'uSobre.pas' {frmSobre},
  uCadVendas in 'uCadVendas.pas' {frmCadVendas},
  uCadItem in 'uCadItem.pas' {frmCadItem},
  uLocProduto in 'uLocProduto.pas' {frmLocProduto},
  uRelVendas in 'uRelVendas.pas' {frmRelVendas},
  u2ViaVenda in 'u2ViaVenda.pas' {frm2ViaVendas},
  uFecharVenda in 'uFecharVenda.pas' {frmFecharVenda},
  uEntradaSaida in 'uEntradaSaida.pas' {frmEntradaSaida},
  uCadUsuarios in 'uCadUsuarios.pas' {frmCadUsuarios},
  uConsulta in 'uConsulta.pas' {frmConsulta},
  uLogon in 'uLogon.pas' {frmLogon},
  uConfRelatorio in 'uConfRelatorio.pas' {frmConfRelatorio},
  uRelEstoque in 'uRelEstoque.pas' {frmRelEstoque},
  uCadTranferencia in 'uCadTranferencia.pas' {frmTransferencia},
  uConsTransf in 'uConsTransf.pas' {frmConsTransfe},
  uRelEtiTrans in 'uRelEtiTrans.pas' {frmRelGuia},
  uImpEtiTransf in 'uImpEtiTransf.pas' {frmImpEtiTrans},
  uConfSistema in 'uConfSistema.pas' {frmConfigSistema},
  uLocLoja in 'uLocLoja.pas' {frmLocLojas},
  uImpVenda in 'uImpVenda.pas' {frmRelImpVenda},
  uConfRelVendas in 'uConfRelVendas.pas' {frmConfRelVendas},
  uRelVendasPeriodo in 'uRelVendasPeriodo.pas' {frmRelVendasPeriodo},
  uCancelarVendas in 'uCancelarVendas.pas' {frmCancelamentoVendas},
  uConsultaVendas in 'uConsultaVendas.pas' {frmConsultaVendas},
  uPrintEtiquetas in 'uPrintEtiquetas.pas' {frmEtiquetas2},
  uFluxoCaixa in 'uFluxoCaixa.pas' {frmFluxoCaixa},
  uRelFluxoCaixa in 'uRelFluxoCaixa.pas' {frmRelFluxoCaixa},
  ufrmRelFluxoCaixa2 in 'ufrmRelFluxoCaixa2.pas' {frmRelFluxoCaixa2},
  uFrmNewEtiquetas in 'uFrmNewEtiquetas.pas' {frmNewEtiquetaA5},
  frmPedEtiquetas in 'frmPedEtiquetas.pas' {frmPedidoEtiqueta},
  uFrmEtiquetaPedidos in 'uFrmEtiquetaPedidos.pas' {frmEtiqPedidos},
  uFrmAddProduto in 'uFrmAddProduto.pas' {frmAddProduto};

{$R *.res}


begin
  //Application.Initialize;
  {if FindWindow('TFrmPrincipal', nil) > 0 then
  begin
      Hwnd := FindWindow ('TFrmPrincipal', 'InfoEtiquetas');
      Messagedlg('O sistema j� foi inicializado!',mtinformation,[mbok],0);
      //SetForegroundWindow(Hwnd); Application.Handle
      if IsIconic(Hwnd) then
        frmPrincipal.Show;
  End
  Else
  Begin}
      frmSplash := TfrmSplash.create(application);
      frmSplash.show;
      frmSplash.update;
      //
      Application.CreateForm(TdmEtiquetas, dmEtiquetas);
      Application.CreateForm(TFrmPrincipal, FrmPrincipal);
      //
      frmSplash.hide;
      frmSplash.free;
      Application.Run;
  //End;
end.
