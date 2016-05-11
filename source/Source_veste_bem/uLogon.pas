unit uLogon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, RxLookup;

type
  TfrmLogon = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btCancelar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image3: TImage;
    edt_SENHA: TEdit;
    btConfirma: TBitBtn;
    edt_NMUSUA: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edt_SENHAExit(Sender: TObject);
    procedure edt_NMUSUAExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_NMUSUAKeyPress(Sender: TObject; var Key: Char);
    procedure edt_SENHAKeyPress(Sender: TObject; var Key: Char);
  private
     M_FECHA: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogon: TfrmLogon;
  M_QTTENT: Integer;


implementation

uses udmEtiquetas, uFuncoes, uPrincipal;

{$R *.DFM}

Function GetStateK (Key: integer): boolean;
begin
  Result := Odd (GetKeyState (Key));
end;

procedure TfrmLogon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      If Not M_FECHA Then
          Action := caNone
      Else
          Action := caFree;

     // Se estiver em branco sai do programa
     If uFuncoes.Empty(edt_NMUSUA.Text) or
        uFuncoes.Empty(edt_SENHA.text) Then
         Application.Terminate;
     //
     dmEtiquetas.tbUsuarios.Close;
     //
     Action := caFree;
end;

procedure TfrmLogon.btCancelarClick(Sender: TObject);
begin
     Application.Terminate;
end;

procedure TfrmLogon.FormActivate(Sender: TObject);
begin
     M_QTTENT:=0;
     edt_NMUSUA.Clear;
     dmEtiquetas.tbUsuarios.Open;
     dmEtiquetas.tbUsuarios.IndexFieldNames := 'SEN_NMUSUA';
     dmEtiquetas.tbUsuarios.First;
     While not (dmEtiquetas.tbUsuarios.Eof) do
     begin
         edt_NMUSUA.Items.Add(dmEtiquetas.tbUsuarios.fieldByName('SEN_NMUSUA').AsString);
         dmEtiquetas.tbUsuarios.Next;
     End;
end;

procedure TfrmLogon.BitBtn1Click(Sender: TObject);
Var
   M_ACHOU :boolean;
begin
     M_QTTENT:=M_QTTENT+1;
     // SE nome do usuario estiver vazio
     If uFuncoes.Empty(edt_NMUSUA.Text) Then
     begin
          Application.MessageBox('Digite o nome de usuário.',
          'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
          edt_NMUSUA.SetFocus;
          Exit;
     end;
     //
     // Se a senha do usuario estiver vazio
     If uFuncoes.Empty(edt_SENHA.Text) Then
     begin
          Application.MessageBox('Digite sua senha de usuário.',
               'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
          edt_SENHA.SetFocus;
          Exit;
     end;
     // Se Super-Usuário
//     If (edt_NMUSUA.Text = uPrincipal.M_USERMASTER) //Then
     If  (edt_Senha.text = uPrincipal.M_SNMASTER) Then
     begin
          uPrincipal.M_CDUSUA := '000';
          uPrincipal.M_NMUSUA := 'USERMASTER';
          frmPrincipal.Info.Panels.Items[3].Text := uPrincipal.M_CDUSUA+' - '+uPrincipal.M_NMUSUA;
          //uPrincipal.M_FLLOGI := True;
          Close;
          Exit;
     End;
     // Procura usuário
     If (M_QTTENT<=4) Then
     begin
          //dmEtiquetas.tbUsuarios.IndexName := 'indSEN_NMUSUA';
          //M_ACHOU := dmEtiquetas.tbUsuarios.FindKey([edt_NMUSUA.Text]);
          M_ACHOU := dmEtiquetas.tbUsuarios.Locate('SEN_NMUSUA',edt_NMUSUA.Text,[]);
          If Not(M_ACHOU) Then
          begin
                 Application.MessageBox( 'Usuário não cadastrado.',
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 edt_NMUSUA.Clear;
                 edt_NMUSUA.SetFocus;
                 Exit;
          end
          else
          begin
               dmEtiquetas.tbUsuarios.edit;
               edt_Senha.text := edt_Senha.text+uFuncoes.Replicate('*',6-uFuncoes.ContaCaracs(edt_Senha.text));
               If (dmEtiquetas.tbUsuariosSEN_SNATUA.Value = uFuncoes.Codifica(edt_Senha.text)) Then
               begin
                    //dmEtiquetas.tbUsuariosSEN_FLLOGA.Value := 'S';
                    uPrincipal.M_CDUSUA := dmEtiquetas.tbUsuariosSEN_CDUSUA.Value;
                    uPrincipal.M_NMUSUA := dmEtiquetas.tbUsuariosSEN_NMUSUA.Value;
                    frmPrincipal.Info.Panels.Items[3].Text := uPrincipal.M_CDUSUA+' - '+uPrincipal.M_NMUSUA;
                    //uEleicoes.M_ACESSO := dmEtiquetas.tbUsuariosSEN_TPACESSO.Value;
                    dmEtiquetas.tbUsuarios.Post;
                    //
                    Close;
               End
               Else
               begin
                    Application.MessageBox( 'Senha incorreta!',
                          'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                    edt_SENHA.Clear;
                    edt_SENHA.SetFocus;
                    Exit;
               End;
          end;
          //
          //uPrincipal.M_FLLOGI := True;
     End
     Else
     begin
          Application.MessageBox('Este sistema será Fechado!',
                  'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          Application.Terminate;
     End;
end;

procedure TfrmLogon.edt_SENHAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edt_Senha.text) Then
        edt_Senha.text := edt_Senha.text+uFuncoes.Replicate('*',6-uFuncoes.ContaCaracs(edt_Senha.text));
end;

procedure TfrmLogon.edt_NMUSUAExit(Sender: TObject);
begin
     If (uFuncoes.Empty(edt_NMUSUA.Text)) Then
     begin
          Application.MessageBox('Digite o nome de usuário',
                  'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
          edt_NMUSUA.SetFocus;
     End;
     {    dmEtiquetas.tbUsuarios.IndexFieldNames := 'SEN_CDUSUA';
    dmEtiquetas.tbUsuarios.FindKey([M_CDUSUA]);
    //
    dmEtiquetas.tbUsuarios.Edit;
    If (dmEtiquetas.tbUsuariosSEN_NMTERM.Value <> ' ') Then
    begin
  //       Application.MessageBox('O usuario já está no computador'+#13
         ShowMessage('O usuario já está no computador'+#13
             +funcoes.StrToPChar(funcoes.SysComputerName));
//                  'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
         edt_NMUSUA.SetFocus;
    End;}
end;

procedure TfrmLogon.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      If GetStateK (VK_LMENU) And (Key = VK_F4) Then
          M_FECHA := False;
end;

procedure TfrmLogon.edt_NMUSUAKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) and not uFuncoes.Empty(edt_NMUSUA.Text) Then
     begin
          Key := #0;
          edt_SENHA.SetFocus;
     End;
end;

procedure TfrmLogon.edt_SENHAKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) and not uFuncoes.Empty(edt_NMUSUA.Text) Then
     begin
          Key := #0;
          BitBtn1Click(Sender);
     End;
end;

End.
