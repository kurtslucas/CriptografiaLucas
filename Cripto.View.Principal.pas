unit Cripto.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Menus, Cripto.Interfaces;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    pnGeral: TPanel;
    pnTexto: TPanel;
    pnResultado: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mmTexto: TMemo;
    mmResultado: TMemo;
    ActionList1: TActionList;
    acCriptografar: TAction;
    acDecriptografar: TAction;
    edtChave: TEdit;
    acSair: TAction;
    acVisualizarChave: TAction;
    pmChave: TPopupMenu;
    Visualizarchave1: TMenuItem;
    ckCripto: TCheckBox;
    SpeedButton1: TSpeedButton;
    ckDecripto: TCheckBox;
    SpeedButton2: TSpeedButton;
    acReverter: TAction;
    pmGeral: TPopupMenu;
    Reverter1: TMenuItem;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure acCriptografarExecute(Sender: TObject);
    procedure acDecriptografarExecute(Sender: TObject);
    procedure mmResultadoEnter(Sender: TObject);
    procedure acSairExecute(Sender: TObject);
    procedure acVisualizarChaveExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure mmTextoChange(Sender: TObject);
    procedure acReverterExecute(Sender: TObject);
  private
    { Private declarations }
    vCripto: ICriptografia;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

const
  cPasswordView: Char = #0;
  cPasswordChar: Char = '*';

implementation

{$R *.dfm}

uses Cripto.Classe.Criptografia;

procedure TfrmPrincipal.acCriptografarExecute(Sender: TObject);
begin
  ckCripto.Checked := True;
  ckDecripto.Checked := False;
  vCripto := TCriptografia.New;
  mmResultado.Lines.Text := vCripto.Criptografar(mmTexto.Lines.Text, edtChave.Text);
end;

procedure TfrmPrincipal.acDecriptografarExecute(Sender: TObject);
begin
  ckCripto.Checked := False;
  ckDecripto.Checked := True;
  vCripto := TCriptografia.New;
  mmResultado.Lines.Text := vCripto.Decriptografar(mmTexto.Lines.Text, edtChave.Text);
end;

procedure TfrmPrincipal.acReverterExecute(Sender: TObject);
begin
  mmTexto.Lines.Text := mmResultado.Lines.Text;

  if ckCripto.Checked then
    acDecriptografar.Execute
  else
    acCriptografar.Execute;
end;

procedure TfrmPrincipal.acSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.acVisualizarChaveExecute(Sender: TObject);
begin
  acVisualizarChave.Checked := not acVisualizarChave.Checked;

  if acVisualizarChave.Checked then
    edtChave.PasswordChar := cPasswordView
  else
    edtChave.PasswordChar := cPasswordChar;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
begin
  pnResultado.Width := Trunc(pnGeral.Width / 2);
  edtChave.Width := mmResultado.Width;
  edtChave.Left := pnResultado.Left + mmResultado.Left;
end;

procedure TfrmPrincipal.mmResultadoEnter(Sender: TObject);
begin
  TMemo(Sender).SelectAll;
end;

procedure TfrmPrincipal.mmTextoChange(Sender: TObject);
begin
  if ckCripto.Checked then
    acCriptografar.Execute
  else
    acDecriptografar.Execute;
end;

end.
