program ImprimirPDF;

uses
  Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  Utils in 'Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
