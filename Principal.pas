unit Principal;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Shellapi,
  Printers,
  cxGraphics,
  cxControls,
  Utils;

type
  TfrmPrincipal = class(TForm)
    dlgOpen1: TOpenDialog;
    edtNmArquivoPDF: TEdit;
    btnAbrir: TButton;
    btnImprimir: TButton;
    Label1: TLabel;
    Label2: TLabel;
    cbxImpressoraEmpresa: TComboBox;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnAbrirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FImpressora: TPrinter;
    function VerificaRetornoShellExecute(pRetorno: Cardinal): String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnImprimirClick(Sender: TObject);
var
  lNmArquivoPDF: string;
  lStrImpressora: string;
  lImpressoraSelecionada: string;
  lRetorno: Cardinal;
  lErroImpressao : String;

  lDevice, lDriver, lPort: array[0..255] of Char;
  lHandlePrint: THandle;

begin
  lNmArquivoPDF := edtNmArquivoPDF.Text;

  FImpressora.GetPrinter(lDevice, lDriver, lPort, lHandlePrint);

  lImpressoraSelecionada := PAnsiChar(cbxImpressoraEmpresa.Text);

  lStrImpressora := Format('"%s" "%s" "%s"', [lImpressoraSelecionada, lDriver, lPort]);

  lRetorno := ShellExecute(0, 'printto', PAnsiChar(lNmArquivoPDF), PAnsiChar(lStrImpressora) , nil, SW_HIDE);

  lErroImpressao := VerificaRetornoShellExecute(lRetorno);

  if lErroImpressao <> '' then
    ShowMessage(lErroImpressao);    
end;

function TfrmPrincipal.VerificaRetornoShellExecute(pRetorno: Cardinal): String;
var
  lMensagem : String;
begin
  lMensagem := '';

  Case pRetorno of
      0: lMensagem := 'O sistema operacional está sem memória ou recursos.';
      ERROR_FILE_NOT_FOUND: lMensagem := 'O arquivo especificado não foi encontrado.';
      ERROR_PATH_NOT_FOUND: lMensagem := 'O caminho especificado não foi encontrado.';
      ERROR_BAD_FORMAT: lMensagem := 'O arquivo .exe é inválido (não-Win32 exe ou erro na imagem .exe).';
      SE_ERR_ACCESSDENIED: lMensagem := 'O sistema operacional negou acesso ao arquivo especificado.';
      SE_ERR_ASSOCINCOMPLETE: lMensagem := 'A associação nome do arquivo é incompleta ou inválido.';
      SE_ERR_DDEBUSY: lMensagem := 'A transação DDE não pôde ser concluída porque outras transações DDE estavam sendo processados.';
      SE_ERR_DDEFAIL: lMensagem := 'A transação DDE falhou.';
      SE_ERR_DDETIMEOUT: lMensagem := 'A transação DDE não pôde ser concluída porque o pedido excedeu o tempo.';
      SE_ERR_DLLNOTFOUND: lMensagem := 'A DLL especificada não foi encontrada.';
     // SE_ERR_FNF: lMensagem := 'O arquivo especificado não foi encontrado.';
      SE_ERR_NOASSOC: lMensagem := 'Não há nenhum aplicativo associado com a extensão de nome de arquivo dado. Este erro também será devolvido se você tentar imprimir um arquivo que não pode ser impresso.';
      SE_ERR_OOM: lMensagem := 'Não havia memória suficiente para concluir a operação.';
      //SE_ERR_PNF: lMensagem := 'O caminho especificado não foi encontrado.';
      SE_ERR_SHARE: lMensagem := 'A violação de compartilhamento ocorreu.';
  else
    if pRetorno > 0 then
      lMensagem := 'Retorno desconhecido: ' + IntToStr(pRetorno);
  end;

  Result := lMensagem;
end;

procedure TfrmPrincipal.btnAbrirClick(Sender: TObject);
begin
  dlgOpen1.Title := 'Localizar Danfe';
  dlgOpen1.InitialDir :=  GetWindowsTempPath;
  dlgOpen1.Filter := 'PDF files (*.pdf)|*.PDF';

  if dlgOpen1.Execute then
    edtNmArquivoPDF.Text := dlgOpen1.FileName;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FImpressora := TPrinter.Create;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  cbxImpressoraEmpresa.Items := Printer.Printers;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FImpressora);
end;

end.
