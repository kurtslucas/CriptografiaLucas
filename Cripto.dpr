program Cripto;

uses
  Vcl.Forms,
  Cripto.View.Principal in 'Cripto.View.Principal.pas' {frmPrincipal},
  Cripto.Interfaces in 'Cripto.Interfaces.pas',
  Cripto.Classe.Criptografia in 'Cripto.Classe.Criptografia.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
