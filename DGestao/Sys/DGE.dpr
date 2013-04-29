program DGESTAO;

uses
  Forms,
  IniFiles,
  SysUtils,
  HPL_Strings in 'lib\HPL_Strings.pas',
  UPrinc in 'UPrinc.pas' {frmPrinc},
  UDMBusiness in 'UDMBusiness.pas' {DMBusiness: TDataModule},
  UGrDepositos in 'UGrDepositos.pas' {frmGrDepositos},
  USobre in 'USobre.pas' {frmSobre},
  UPesq in 'UPesq.pas' {frmPesq},
  UPesqProd in 'UPesqProd.pas' {frmPesqProd},
  UGrupoProd in 'UGrupoProd.pas' {frmGrupoProd},
  uAjustEstoq in 'uAjustEstoq.pas' {frmAjustEstoq},
  uKardex in 'uKardex.pas' {frmKardex},
  uRelCli in 'uRelCli.pas' {frmRelCli},
  uRelFornec in 'uRelFornec.pas' {frmRelFornec},
  uRelProdutos in 'uRelProdutos.pas' {frmRelProdutos},
  uGerRelCR in 'uGerRelCR.pas' {frmGerRelCR},
  uRelCR in 'uRelCR.pas' {frmRelCR},
  uGerRelCP in 'uGerRelCP.pas' {frmGerRelCP},
  uRelCP in 'uRelCP.pas' {frmRelCP},
  UfrmRelVendas in 'UfrmRelVendas.pas' {frmRelVendas},
  UGrPadraoCadastro in 'lib\UGrPadraoCadastro.pas' {frmGrPadraoCadastro},
  UGrPadrao in 'lib\UGrPadrao.pas' {frmGrPadrao},
  UGeBancos in 'UGeBancos.pas' {frmGeBancos},
  UGeTipoLogradouro in 'UGeTipoLogradouro.pas' {frmGeTipoLogradouro},
  UGeEstado in 'UGeEstado.pas' {frmGeEstado},
  UGeCidade in 'UGeCidade.pas' {frmGeCidade},
  UGeDistrito in 'UGeDistrito.pas' {frmGeDistrito},
  UGeBairro in 'UGeBairro.pas' {frmGeBairro},
  UGeLogradouro in 'UGeLogradouro.pas' {frmGeLogradouro},
  UGeEmpresa in 'UGeEmpresa.pas' {frmGeEmpresa},
  UGeCliente in 'UGeCliente.pas' {frmGeCliente},
  UGeFornecedor in 'UGeFornecedor.pas' {frmGeFornecedor},
  UGeGrupoProduto in 'UGeGrupoProduto.pas' {frmGeGrupoProduto},
  UGeSecaoProduto in 'UGeSecaoProduto.pas' {frmGeSecaoProduto},
  UGeUnidade in 'UGeUnidade.pas' {frmGeUnidade},
  UGeTabelaCFOP in 'UGeTabelaCFOP.pas' {frmGeTabelaCFOP},
  UGeFormaPagto in 'UGeFormaPagto.pas' {frmGeFormaPagto},
  UGeProduto in 'UGeProduto.pas' {frmGeProduto},
  UGeVendedor in 'UGeVendedor.pas' {frmGeVendedor},
  UGeVenda in 'UGeVenda.pas' {frmGeVenda},
  UGeCondicaoPagto in 'UGeCondicaoPagto.pas' {frmGeCondicaoPagto},
  UGeTeste in 'UGeTeste.pas' {frmGeTeste},
  UGeEntradaEstoque in 'UGeEntradaEstoque.pas' {frmGeEntradaEstoque},
  UGeContasAReceber in 'UGeContasAReceber.pas' {frmGeContasAReceber},
  UGrPadraoCadastroSimples in 'lib\UGrPadraoCadastroSimples.pas' {frmGrPadraoCadastroSimples},
  UGeEfetuarPagtoREC in 'UGeEfetuarPagtoREC.pas' {frmGeEfetuarPagtoREC},
  UGeContasAPagar in 'UGeContasAPagar.pas' {frmGeContasAPagar},
  UGeEfetuarPagtoPAG in 'UGeEfetuarPagtoPAG.pas' {frmGeEfetuarPagtoPAG},
  UDMNFe in 'UDMNFe.pas' {DMNFe: TDataModule},
  UGeVendaGerarNFe in 'UGeVendaGerarNFe.pas' {frmGeVendaGerarNFe},
  UGeConfigurarNFeACBr in 'UGeConfigurarNFeACBr.pas' {frmGeConfigurarNFeACBr},
  UGeEntradaEstoqueCancelar in 'UGeEntradaEstoqueCancelar.pas' {frmGeEntradaEstoqueCancelar},
  UEnviarLoteNFe in 'UEnviarLoteNFe.pas' {frmEnviarLoteNFe},
  UGeTipoDespesa in 'UGeTipoDespesa.pas' {frmGeTipoDespesa},
  UfrmAcessoSistema in 'UfrmAcessoSistema.pas' {frmAcessoSistema},
  UGeVendaCancelar in 'UGeVendaCancelar.pas' {frmGeVendaCancelar},
  ChkDgVer in 'lib\ChkDgVer.pas',
  UGrCampoRequisitado in 'lib\UGrCampoRequisitado.pas' {frmCampoRequisitado},
  UGeGerarBoletos in 'UGeGerarBoletos.pas' {frmGeGerarBoleto},
  UGeRemessaBoletos in 'UGeRemessaBoletos.pas' {frmGeRemessaBoleto},
  UGeRetornoBoletos in 'UGeRetornoBoletos.pas' {frmGeRetornoBoleto},
  UGeEntradaConfirmaDuplicatas in 'UGeEntradaConfirmaDuplicatas.pas' {frmGeEntradaConfirmaDuplicatas},
  UGePromocao in 'UGePromocao.pas' {frmGePromocao},
  UGeContaCorrente in 'UGeContaCorrente.pas' {frmGeContaCorrente},
  UGeCaixa in 'UGeCaixa.pas' {frmGeCaixa},
  UGeFluxoCaixa in 'UGeFluxoCaixa.pas' {frmGeFluxoCaixa},
  UFuncoes in 'lib\UFuncoes.pas',
  UInfoVersao in 'lib\UInfoVersao.pas',
  UGeFabricante in 'UGeFabricante.pas' {frmGeFabricante},
  UConstantesDGE in 'UConstantesDGE.pas',
  FormFactoryU in 'lib\FormFactoryU.pas',
  FuncoesFormulario in 'lib\FuncoesFormulario.pas',
  UGrUsuarioAlterarSenha in 'lib\UGrUsuarioAlterarSenha.pas' {frmGrUsuarioAlterarSenha},
  UGeVendaFormaPagto in 'UGeVendaFormaPagto.pas' {frmGeVendaFormaPagto},
  UGeEntradaEstoqueGerarNFe in 'UGeEntradaEstoqueGerarNFe.pas' {frmGeEntradaEstoqueGerarNFe},
  UGeExportarNFeGerada in 'UGeExportarNFeGerada.pas' {frmGeExportarNFeGerada},
  UfrmRelEstoque in 'UfrmRelEstoque.pas' {frmRelEstoque},
  UfrmRelVendasFormPag in 'UfrmRelVendasFormPag.pas' {frmRelVendasFormPag};

{$R *.res}

begin
  FileINI := TIniFile.Create( ExtractFilePath(ParamStr(0)) + 'Conexao.ini' );

  Application.Initialize;
  Application.Title := 'DGE - Sistema Integrado de Gest�o Empresarial';
  Application.CreateForm(TDMBusiness, DMBusiness);
  Application.CreateForm(TDMNFe, DMNFe);
  Application.CreateForm(TfrmPrinc, frmPrinc);
  Application.CreateForm(TfrmPesq, frmPesq);
  Application.CreateForm(TfrmRelVendasFormPag, frmRelVendasFormPag);
  Application.Run;
end.
