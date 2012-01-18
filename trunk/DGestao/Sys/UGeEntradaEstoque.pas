unit UGeEntradaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, ToolEdit, RXDBCtrl, IBStoredProc;

type
  TfrmGeEntradaEstoque = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    edData: TDateTimePicker;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblFornecedor: TLabel;
    dbFornecedor: TRxDBComboEdit;
    lblDataEmissao: TLabel;
    dbDataEmissao: TDBEdit;
    lblNotaFiscal: TLabel;
    dbNotaFiscal: TDBEdit;
    lblSerie: TLabel;
    dbSerie: TDBEdit;
    lblDataEntrada: TLabel;
    dbDataEntrada: TDBEdit;
    lblCFOPNF: TLabel;
    dbCFOPNF: TRxDBComboEdit;
    dbCFOPNFDescricao: TDBEdit;
    qryProduto: TIBDataSet;
    qryCFOP: TIBDataSet;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    tblCondicaoPagto: TIBTable;
    dtsCondicaoPagto: TDataSource;
    lblSituacao: TLabel;
    dbSituacao: TDBEdit;
    GrpBxDadosValores: TGroupBox;
    lblValorFrete: TLabel;
    dbValorFrete: TDBEdit;
    lblBaseICMS: TLabel;
    dbBaseICMS: TDBEdit;
    lblBaseICMSSubs: TLabel;
    dbBaseICMSSubs: TDBEdit;
    lblTotalProduto: TLabel;
    dbTotalProduto: TDBEdit;
    lblValorOutros: TLabel;
    dbValorOutros: TDBEdit;
    dbTotalNotaFiscal: TDBEdit;
    lblTotalNotaFiscal: TLabel;
    dbValorDesconto: TDBEdit;
    lblValorDesconto: TLabel;
    dbValorIPI: TDBEdit;
    lblValorIPI: TLabel;
    dbValorICMSSubs: TDBEdit;
    lblValorICMSSubs: TLabel;
    dbValorICMS: TDBEdit;
    lblValorICMS: TLabel;
    Bevel5: TBevel;
    pgcMaisDados: TPageControl;
    tbsPagamento: TTabSheet;
    lblObservacao: TLabel;
    lblFormaPagto: TLabel;
    lblCondicaoPagto: TLabel;
    lblPrazo01: TLabel;
    lblPrazo02: TLabel;
    lblPrazo03: TLabel;
    lblPrazo04: TLabel;
    lblPrazo05: TLabel;
    lblPrazo06: TLabel;
    lblPrazo07: TLabel;
    lblPrazo08: TLabel;
    lblPrazo09: TLabel;
    lblPrazo10: TLabel;
    lblPrazo11: TLabel;
    lblPrazo12: TLabel;
    dbObservacao: TDBMemo;
    dbFormaPagto: TDBLookupComboBox;
    dbCondicaoPagto: TDBLookupComboBox;
    dbPrazo01: TDBEdit;
    dbPrazo02: TDBEdit;
    dbPrazo03: TDBEdit;
    dbPrazo04: TDBEdit;
    dbPrazo05: TDBEdit;
    dbPrazo06: TDBEdit;
    dbPrazo07: TDBEdit;
    dbPrazo08: TDBEdit;
    dbPrazo09: TDBEdit;
    dbPrazo10: TDBEdit;
    dbPrazo11: TDBEdit;
    dbPrazo12: TDBEdit;
    tbsDuplicatas: TTabSheet;
    Bevel6: TBevel;
    Bevel7: TBevel;
    pnlBotoesTitulo: TPanel;
    btnRegerarDuplicata: TBitBtn;
    btnTituloEditar: TBitBtn;
    btnTituloExcluir: TBitBtn;
    dbgTitulos: TDBGrid;
    Bevel9: TBevel;
    cdsTabelaItens: TIBDataSet;
    IbUpdTabelaItens: TIBUpdateSQL;
    DtSrcTabelaItens: TDataSource;
    qryDuplicatas: TIBDataSet;
    qryDuplicatasLancamento: TStringField;
    dtsDuplicatas: TDataSource;
    IbStrPrcGerarDuplicatas: TIBStoredProc;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblValorUnit: TLabel;
    lblUnidade: TLabel;
    lblParticipacao: TLabel;
    lblTotalBruto: TLabel;
    lblValorIPIProduto: TLabel;
    Bevel10: TBevel;
    dbProduto: TRxDBComboEdit;
    dbProdutoNome: TDBEdit;
    dbQuantidade: TDBEdit;
    dbValorUnit: TDBEdit;
    dbUnidade: TDBEdit;
    dbParticipacao: TDBEdit;
    dbTotalBruto: TDBEdit;
    dbValorIPIProduto: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    Bevel11: TBevel;
    dbgProdutos: TDBGrid;
    lblFrete: TLabel;
    dbFrete: TDBEdit;
    lblDesconto: TLabel;
    dbDesconto: TDBEdit;
    lblOutros: TLabel;
    dbOutros: TDBEdit;
    lblCustoMedio: TLabel;
    dbCustoMedio: TDBEdit;
    IbDtstTabelaANO: TSmallintField;
    IbDtstTabelaCODCONTROL: TIntegerField;
    IbDtstTabelaCODEMP: TIBStringField;
    IbDtstTabelaCODFORN: TIntegerField;
    IbDtstTabelaNF: TIntegerField;
    IbDtstTabelaNFSERIE: TIBStringField;
    IbDtstTabelaDTLANCAMENTO: TDateTimeField;
    IbDtstTabelaDTEMISS: TDateField;
    IbDtstTabelaDTENT: TDateField;
    IbDtstTabelaNFCFOP: TIntegerField;
    IbDtstTabelaNATUREZA: TIBStringField;
    IbDtstTabelaSTATUS: TSmallintField;
    IbDtstTabelaIPI: TIBBCDField;
    IbDtstTabelaICMSBASE: TIBBCDField;
    IbDtstTabelaICMSVALOR: TIBBCDField;
    IbDtstTabelaICMSSUBSTBASE: TIBBCDField;
    IbDtstTabelaICMSSUBSTVALOR: TIBBCDField;
    IbDtstTabelaFRETE: TIBBCDField;
    IbDtstTabelaOUTROSCUSTOS: TIBBCDField;
    IbDtstTabelaDESCONTO: TIBBCDField;
    IbDtstTabelaTOTALNF: TIBBCDField;
    IbDtstTabelaTOTALPROD: TIBBCDField;
    IbDtstTabelaOBS: TMemoField;
    IbDtstTabelaUSUARIO: TIBStringField;
    IbDtstTabelaFORMAPAGTO_COD: TSmallintField;
    IbDtstTabelaCONDICAOPAGTO_COD: TSmallintField;
    IbDtstTabelaCOMPRA_PRAZO: TSmallintField;
    IbDtstTabelaPRAZO_01: TSmallintField;
    IbDtstTabelaPRAZO_02: TSmallintField;
    IbDtstTabelaPRAZO_03: TSmallintField;
    IbDtstTabelaPRAZO_04: TSmallintField;
    IbDtstTabelaPRAZO_05: TSmallintField;
    IbDtstTabelaPRAZO_06: TSmallintField;
    IbDtstTabelaPRAZO_07: TSmallintField;
    IbDtstTabelaPRAZO_08: TSmallintField;
    IbDtstTabelaPRAZO_09: TSmallintField;
    IbDtstTabelaPRAZO_10: TSmallintField;
    IbDtstTabelaPRAZO_11: TSmallintField;
    IbDtstTabelaPRAZO_12: TSmallintField;
    IbDtstTabelaNOMEFORN: TIBStringField;
    IbDtstTabelaCNPJ: TIBStringField;
    IbDtstTabelaCFOP_DESCRICAO: TIBStringField;
    btbtnFinalizar: TBitBtn;
    Bevel12: TBevel;
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensCODCONTROL: TIntegerField;
    cdsTabelaItensCODEMP: TIBStringField;
    cdsTabelaItensSEQ: TSmallintField;
    cdsTabelaItensCODPROD: TIBStringField;
    cdsTabelaItensCODFORN: TIntegerField;
    cdsTabelaItensDTENT: TDateField;
    cdsTabelaItensQTDE: TSmallintField;
    cdsTabelaItensQTDEANTES: TIntegerField;
    cdsTabelaItensQTDEFINAL: TIntegerField;
    cdsTabelaItensPRECOUNIT: TIBBCDField;
    cdsTabelaItensCUSTOMEDIO: TIBBCDField;
    cdsTabelaItensNF: TIntegerField;
    cdsTabelaItensPERC_PARTICIPACAO: TIBBCDField;
    cdsTabelaItensVALOR_FRETE: TIBBCDField;
    cdsTabelaItensVALOR_DESCONTO: TIBBCDField;
    cdsTabelaItensVALOR_OUTROS: TIBBCDField;
    cdsTabelaItensUNID_COD: TSmallintField;
    cdsTabelaItensDESCRI: TIBStringField;
    cdsTabelaItensESTOQUE: TIntegerField;
    cdsTabelaItensUNP_SIGLA: TIBStringField;
    cdsTabelaItensTOTAL_BRUTO: TIBBCDField;
    cdsTabelaItensTOTAL_LIQUIDO: TIBBCDField;
    cdsTabelaItensVALOR_IPI: TIBBCDField;
    IbDtstTabelaDTFINALIZACAO_COMPRA: TDateTimeField;
    qryDuplicatasANOLANC: TSmallintField;
    qryDuplicatasNUMLANC: TIntegerField;
    qryDuplicatasPARCELA: TSmallintField;
    qryDuplicatasCODFORN: TSmallintField;
    qryDuplicatasNOMEFORN: TIBStringField;
    qryDuplicatasCNPJ: TIBStringField;
    qryDuplicatasNOTFISC: TIBStringField;
    qryDuplicatasTIPPAG: TIBStringField;
    qryDuplicatasDTEMISS: TDateField;
    qryDuplicatasDTVENC: TDateField;
    qryDuplicatasVALORPAG: TIBBCDField;
    qryDuplicatasBANCO: TSmallintField;
    qryDuplicatasBCO_NOME: TIBStringField;
    qryDuplicatasNUMCHQ: TIBStringField;
    qryDuplicatasPAGO_: TIBStringField;
    qryDuplicatasDOCBAIX: TIBStringField;
    IbUpdDuplicatas: TIBUpdateSQL;
    lblNCM_SH: TLabel;
    dbNCM_SH: TDBEdit;
    lblCST: TLabel;
    dbCST: TDBEdit;
    lblCFOPItem: TLabel;
    dbCFOPItem: TDBEdit;
    cdsTabelaItensNCM_SH: TIBStringField;
    cdsTabelaItensCST: TIBStringField;
    cdsTabelaItensCFOP: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure IbDtstTabelaSTATUSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure dbCondicaoPagtoClick(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure IbDtstTabelaBeforeCancel(DataSet: TDataSet);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure cdsTabelaItensNewRecord(DataSet: TDataSet);
    procedure btbtnFinalizarClick(Sender: TObject);
    procedure qryDuplicatasCalcFields(DataSet: TDataSet);
    procedure btnRegerarDuplicataClick(Sender: TObject);
    procedure dbCFOPNFButtonClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
  private
    { Private declarations }
    SQL_Itens   ,
    SQL_Duplicatas : TStringList;
    procedure AbrirTabelaItens(const AnoCompra : Smallint; const ControleCompra : Integer);
    procedure AbrirTabelaDuplicatas(const AnoCompra : Smallint; const ControleCompra : Integer);
    procedure GerarDuplicatas(const AnoCompra : Smallint; const ControleCompra : Integer);
    procedure CarregarDadosProduto( sCodigoAlfa : String);
    procedure CarregarDadosCFOP( iCodigo : Integer );
    procedure HabilitarDesabilitar_Btns;
  public
    { Public declarations }
  end;

var
  frmGeEntradaEstoque: TfrmGeEntradaEstoque;

const
  STATUS_CMP_ABR = 1;
  STATUS_CMP_FIN = 2;
  STATUS_CMP_CAN = 3;

  procedure MostrarControleCompras(const AOwner : TComponent);

implementation

uses DateUtils, UDMBusiness, UGeCondicaoPagto, UGeProduto, UGeTabelaCFOP,
  UGeFornecedor;

{$R *.dfm}

procedure MostrarControleCompras(const AOwner : TComponent);
var
  frm : TfrmGeEntradaEstoque;
  whr : String;
begin
  frm := TfrmGeEntradaEstoque.Create(AOwner);
  try
    whr := 'cast(c.dtent as date) = ' + QuotedStr( FormatDateTime('yyyy-mm-dd', frm.edData.Date) );

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + whr);
      SelectSQL.Add('order by ' + CampoOrdenacao);
      Open;
    end;

    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeEntradaEstoque.FormCreate(Sender: TObject);
begin
  IbDtstTabela.GeneratorField.Generator := 'GEN_COMPRAS_CONTROLE_' + FormatFloat('0000', YearOf(Date));

  inherited;
  
  SQL_Itens := TStringList.Create;
  SQL_Itens.Clear;
  SQL_Itens.AddStrings( cdsTabelaItens.SelectSQL );

  SQL_Duplicatas := TStringList.Create;
  SQL_Duplicatas.Clear;
  SQL_Duplicatas.AddStrings( qryDuplicatas.SelectSQL );

  edData.Date      := Date;
  ControlFirstEdit := dbEmpresa;

  tblEmpresa.Open;
  tblFormaPagto.Open;
  tblCondicaoPagto.Open;

  DisplayFormatCodigo := '###0000000';
  NomeTabela     := 'TBCOMPRAS';
  CampoCodigo    := 'Codcontrol';
  CampoDescricao := 'f.NomeForn';
  CampoOrdenacao := 'c.dtEnt, f.NomeForn';

  UpdateGenerator( 'where Ano = ' + FormatFloat('0000', YearOf(Date)) );
end;

procedure TfrmGeEntradaEstoque.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := 'cast(c.dtent as date) = ' + QuotedStr( FormatDateTime('yyyy-mm-dd', edData.Date) );
  inherited;
end;

procedure TfrmGeEntradaEstoque.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaAno.Value     := YearOf(Now);
  IbDtstTabelaDTENT.Value   := Date;
  IbDtstTabelaDTLANCAMENTO.Value := Now;
  IbDtstTabelaCODEMP.Value  := GetEmpresaIDDefault;
  IbDtstTabelaFORMAPAGTO_COD.Value    := GetFormaPagtoIDDefault;
  IbDtstTabelaCONDICAOPAGTO_COD.Value := GetCondicaoPagtoIDDefault;
  IbDtstTabelaNFCFOP.Value            := GetCfopIDDefault;
  IbDtstTabelaCFOP_DESCRICAO.Value    := GetCfopNomeDefault;
  IbDtstTabelaNATUREZA.Value          := IntToStr( GetCfopIDDefault );
  IbDtstTabelaSTATUS.Value       := STATUS_CMP_ABR;
  IbDtstTabelaCOMPRA_PRAZO.Value := 0;
  IbDtstTabelaICMSBASE.Value     := 0;
  IbDtstTabelaICMSVALOR.Value      := 0;
  IbDtstTabelaICMSSUBSTBASE.Value  := 0;
  IbDtstTabelaICMSSUBSTVALOR.Value := 0;
  IbDtstTabelaFRETE.Value          := 0;
  IbDtstTabelaOUTROSCUSTOS.Value   := 0;
  IbDtstTabelaIPI.Value            := 0;
  IbDtstTabelaDESCONTO.Value       := 0;
  IbDtstTabelaTOTALNF.Value        := 0;
  IbDtstTabelaTOTALPROD.Value      := 0;
end;

procedure TfrmGeEntradaEstoque.dbFornecedorButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ   ,
  sNome   : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarFornecedor(Self, iCodigo, sCNPJ, sNome) ) then
    begin
      IbDtstTabelaCODFORN.AsInteger := iCodigo;
      IbDtstTabelaCNPJ.AsString     := sCNPJ;
      IbDtstTabelaNOMEFORN.AsString := sNome;
    end;
end;

procedure TfrmGeEntradaEstoque.IbDtstTabelaSTATUSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Case Sender.AsInteger of
    STATUS_CMP_ABR : Text := 'Aberta';
    STATUS_CMP_FIN : Text := 'Finalizada';
    STATUS_CMP_CAN : Text := 'Cancelada';
    else
      Text := Sender.AsString;
  end;
end;

procedure TfrmGeEntradaEstoque.dbCondicaoPagtoClick(Sender: TObject);
var
  I : Integer;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( tblCondicaoPagto.Locate('cond_cod', dbCondicaoPagto.Field.AsInteger, []) ) then
    begin
      IbDtstTabelaCOMPRA_PRAZO.AsInteger := tblCondicaoPagto.FieldByName('Cond_prazo').AsInteger;
      for I := COND_PARCELA_MIN to COND_PARCELA_MAX do
      begin
        IbDtstTabela.FieldByName('PRAZO_' + FormatFloat('00', I)).Clear;
        if ( not tblCondicaoPagto.FieldByName('Cond_prazo_' + FormatFloat('00', I)).IsNull ) then
          IbDtstTabela.FieldByName('PRAZO_' + FormatFloat('00', I)).AsInteger := tblCondicaoPagto.FieldByName('Cond_prazo_' + FormatFloat('00', I)).AsInteger;
      end;
    end;
end;

procedure TfrmGeEntradaEstoque.DtSrcTabelaItensStateChange(
  Sender: TObject);
begin
  btnProdutoInserir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) );
  btnProdutoEditar.Enabled  := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( cdsTabelaItens.State in [dsEdit, dsInsert] );

  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
end;

procedure TfrmGeEntradaEstoque.AbrirTabelaItens(const AnoCompra: Smallint;
  const ControleCompra: Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.Ano        = ' + IntToStr(AnoCompra));
    Add('  and i.Codcontrol = ' + IntToStr(ControleCompra));
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeEntradaEstoque.AbrirTabelaDuplicatas(
  const AnoCompra: Smallint; const ControleCompra: Integer);
begin
  qryDuplicatas.Close;

  with qryDuplicatas, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Duplicatas );
    Add('where p.AnoCompra = ' + IntToStr(AnoCompra));
    Add('  and p.NumCompra = ' + IntToStr(ControleCompra));
    Add('order by p.numlanc, p.parcela');
  end;

  qryDuplicatas.Open;
end;

procedure TfrmGeEntradaEstoque.CarregarDadosProduto(sCodigoAlfa: String);
begin
  if ( not cdsTabelaItens.Active ) then
    Exit
  else
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    with qryProduto do
    begin
      Close;
      ParamByName('CodigoAlfa').AsString := sCodigoAlfa;
      Open;
      if not IsEmpty then
      begin
        cdsTabelaItensDESCRI.AsString      := FieldByName('Descri').AsString;
        cdsTabelaItensUNP_SIGLA.AsString   := FieldByName('Unp_sigla').AsString;
        cdsTabelaItensQTDEANTES.AsInteger  := FieldByName('Qtde').AsInteger;

        if ( FieldByName('Codunidade').AsInteger > 0 ) then
          cdsTabelaItensUNID_COD.AsInteger   := FieldByName('Codunidade').AsInteger;
      end
      else
      begin
        ShowWarning('C�digo de produto n�o cadastrado');
        cdsTabelaItensCODPROD.Clear;
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGeEntradaEstoque.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    btbtnFinalizar.Enabled := (IbDtstTabelaSTATUS.AsInteger < STATUS_CMP_FIN) and (not cdsTabelaItens.IsEmpty);
//    btbtnGerarNFe.Enabled  := (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_FIN) and (not cdsTabelaItens.IsEmpty);
  end
  else
  begin
    btbtnFinalizar.Enabled := False;
//    btbtnGerarNFe.Enabled  := False;
  end;
end;

procedure TfrmGeEntradaEstoque.IbDtstTabelaBeforeCancel(DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
end;

procedure TfrmGeEntradaEstoque.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_CMP_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_CMP_FIN : sMsg := 'Esta entrada n�o pode ser alterada porque est� finalizada.';
      STATUS_CMP_CAN : sMsg := 'Esta entrada n�o pode ser alterada porque est� cancelada';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
      AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    end;
  end;
end;

procedure TfrmGeEntradaEstoque.btnProdutoInserirClick(Sender: TObject);
begin
  if ( IbDtstTabelaTOTALPROD.AsCurrency = 0 ) then
  begin
    ShowWarning('Favor informar valor Total de Produtos');
    dbTotalProduto.SetFocus;
  end
  else
  if ( IbDtstTabelaTOTALNF.AsCurrency = 0 ) then
  begin
    ShowWarning('Favor informar valor Total da Nota Fiscal');
    dbTotalNotaFiscal.SetFocus;
  end
  else
  if ( cdsTabelaItens.Active ) then
  begin
    cdsTabelaItens.Append;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeEntradaEstoque.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
  begin
    cdsTabelaItens.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeEntradaEstoque.btnProdutoExcluirClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
    if ( ShowConfirm('Deseja excluir o �tem selecionado?') ) then
      cdsTabelaItens.Delete;
end;

procedure TfrmGeEntradaEstoque.btnProdutoSalvarClick(Sender: TObject);
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    if ( cdsTabelaItensQTDE.Value < 0 ) then
    begin
      ShowWarning('QUantidade inv�lida.');
      dbQuantidade.SetFocus;
    end
    else
    if ( cdsTabelaItensPRECOUNIT.Value < 0 ) then
    begin
      ShowWarning('Valor unit�rio inv�lida.');
      dbValorUnit.SetFocus;
    end
    else
    if ( cdsTabelaItensVALOR_IPI.Value < 0 ) then
    begin
      ShowWarning('Valor IPI inv�lida.');
      dbValorIPIProduto.SetFocus;
    end
    else
    begin

      cdsTabelaItens.Post;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;

    end;
  end;
end;

procedure TfrmGeEntradaEstoque.btbtnSalvarClick(Sender: TObject);
begin
  if ( cdsTabelaItens.IsEmpty ) then
    ShowWarning('Favor informar o(s) produto(s) da compra.')
  else
  begin
    inherited;

    if ( not OcorreuErro ) then
    begin
      if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
        cdsTabelaItens.Post;
      cdsTabelaItens.ApplyUpdates;
    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeEntradaEstoque.ControlEditExit(Sender: TObject);
begin
  inherited;

  if ( Sender = dbCFOPNF ) then
    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
      CarregarDadosCFOP( IbDtstTabelaNFCFOP.AsInteger );

  if ( Sender = dbProduto ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      CarregarDadosProduto( cdsTabelaItensCODPROD.AsString );

  if ( Sender = dbQuantidade ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      cdsTabelaItensQTDEFINAL.Value := cdsTabelaItensQTDEANTES.Value + cdsTabelaItensQTDE.Value;

  if ( (Sender = dbValorUnit) or (Sender = dbValorIPIProduto) ) then
  begin
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    begin
      cdsTabelaItensCUSTOMEDIO.Value  := cdsTabelaItensPRECOUNIT.Value + cdsTabelaItensVALOR_IPI.Value;
      cdsTabelaItensTOTAL_BRUTO.Value := cdsTabelaItensPRECOUNIT.Value * cdsTabelaItensQTDE.Value;

      if ( IbDtstTabelaTOTALPROD.AsCurrency > 0 ) then
      begin
        cdsTabelaItensPERC_PARTICIPACAO.Value := cdsTabelaItensTOTAL_BRUTO.Value / IbDtstTabelaTOTALPROD.Value * 100;
        cdsTabelaItensVALOR_FRETE.Value       := cdsTabelaItensPERC_PARTICIPACAO.Value * IbDtstTabelaFRETE.Value / 100;
        cdsTabelaItensVALOR_DESCONTO.Value    := cdsTabelaItensPERC_PARTICIPACAO.Value * IbDtstTabelaDESCONTO.Value / 100;
        cdsTabelaItensVALOR_OUTROS.Value      := cdsTabelaItensPERC_PARTICIPACAO.Value * IbDtstTabelaOUTROSCUSTOS.Value / 100;

        cdsTabelaItensTOTAL_LIQUIDO.Value := cdsTabelaItensCUSTOMEDIO.AsCurrency * cdsTabelaItensQTDE.AsInteger;
      end;
    end;
  end;

  if ( Sender = dbTotalBruto ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;

end;

procedure TfrmGeEntradaEstoque.pgcGuiasChange(Sender: TObject);
begin
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
end;

procedure TfrmGeEntradaEstoque.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
  begin
    AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  end;
end;

procedure TfrmGeEntradaEstoque.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_CMP_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_CMP_FIN : sMsg := 'Esta entrada n�o pode ser alterada porque est� finalizada.';
      STATUS_CMP_CAN : sMsg := 'Esta entrada n�o pode ser alterada porque est� cancelada';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
      AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    end;
  end;
end;

procedure TfrmGeEntradaEstoque.dbProdutoButtonClick(Sender: TObject);
var
  iCodigo  ,
  iCFOP    ,
  iUnidade : Integer;
  sCodigoAlfa,
  sDescricao ,
  sUnidade   ,
  sCST       : String;
  cAliquota  ,
  cValorVenda,
  cValorIPI  : Currency;
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( SelecionarProduto(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sCST, iUnidade, iCFOP, cAliquota, cValorVenda, cValorIPI) ) then
    begin
      cdsTabelaItensCODPROD.AsString     := sCodigoAlfa;
      cdsTabelaItensDESCRI.AsString      := sDescricao;
      cdsTabelaItensUNP_SIGLA.AsString   := sUnidade;

      if ( iUnidade > 0 ) then
        cdsTabelaItensUNID_COD.AsInteger := iUnidade;
    end;
end;

procedure TfrmGeEntradaEstoque.cdsTabelaItensNewRecord(DataSet: TDataSet);
begin
  cdsTabelaItensANO.Value        := IbDtstTabelaANO.Value;
  cdsTabelaItensCODCONTROL.Value := IbDtstTabelaCODCONTROL.Value;
  cdsTabelaItensDTENT.Value      := IbDtstTabelaDTENT.Value;
  cdsTabelaItensCODEMP.Value     := IbDtstTabelaCODEMP.Value;
  cdsTabelaItensCODFORN.Value    := IbDtstTabelaCODFORN.Value;
  cdsTabelaItensNF.Value         := IbDtstTabelaNF.Value;
  cdsTabelaItensCFOP.Value       := GetCfopIDDefault;
  cdsTabelaItensSEQ.Value        := cdsTabelaItens.RecordCount + 1;
end;

procedure TfrmGeEntradaEstoque.btbtnFinalizarClick(Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  IbDtstTabela.Edit;

  if ( IbDtstTabelaCODFORN.AsInteger = 0 ) then
  begin
    ShowWarning('Favor informar o fornecedor');
    dbFornecedor.SetFocus;
  end
  else
  if ( IbDtstTabelaTOTALPROD.AsCurrency = 0 ) then
  begin
    ShowWarning('Favor informar valor Total de Produtos');
    dbTotalProduto.SetFocus;
  end
  else
  if ( IbDtstTabelaTOTALNF.AsCurrency = 0 ) then
  begin
    ShowWarning('Favor informar valor Total da Nota Fiscal');
    dbTotalNotaFiscal.SetFocus;
  end
  else
  if ( IbDtstTabelaFORMAPAGTO_COD.AsInteger = 0 ) then
  begin
    ShowWarning('Favor informar a forma de pagamento');
    dbFormaPagto.SetFocus;
  end
  else
  if ( IbDtstTabelaCONDICAOPAGTO_COD.AsInteger = 0 ) then
  begin
    ShowWarning('Favor informar a condi��o de pagamento');
    dbCondicaoPagto.SetFocus;
  end
  else
  if ( ShowConfirm('Confirma a finaliza��o da entrada selecionada?') ) then
  begin
    IbDtstTabelaSTATUS.Value               := STATUS_CMP_FIN;
    IbDtstTabelaDTFINALIZACAO_COMPRA.Value := Now;
    IbDtstTabela.Open;
    IbDtstTabela.ApplyUpdates;

    GerarDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );

    ShowInformation('Entrada finalizada com sucesso !');

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeEntradaEstoque.GerarDuplicatas(const AnoCompra: Smallint;
  const ControleCompra: Integer);
begin
  try

    try

      UpdateSequence('GEN_CONTAPAG_NUM_' + IntToStr(AnoCompra), 'TBCONTPAG', 'NUMLANC', 'where ANOLANC = ' + IntToStr(AnoCompra));

      with IbStrPrcGerarDuplicatas do
      begin
        ParamByName('anocompra').AsInteger := AnoCompra;
        ParamByName('numcompra').AsInteger := ControleCompra;
        ExecProc;
      end;

    except
      On E : Exception do
      begin
        DMBusiness.ibtrnsctnBusiness.Rollback;
        ShowError('Erro ao tentar gerar duplicatas.' + #13#13 + E.Message);
      end;
    end;

  finally
  end;
end;

procedure TfrmGeEntradaEstoque.qryDuplicatasCalcFields(DataSet: TDataSet);
begin
  qryDuplicatasLancamento.AsString := FormatFloat('0000', qryDuplicatasANOLANC.AsInteger) + FormatFloat('000000', qryDuplicatasNUMLANC.AsInteger);
end;

procedure TfrmGeEntradaEstoque.btnRegerarDuplicataClick(Sender: TObject);
begin
  if ( IbDtstTabelaSTATUS.AsInteger <> STATUS_CMP_FIN ) then
    ShowWarning('� permitida a gera��o de duplicatas apenas para entradas finalizadas')
  else
  if ( not qryDuplicatas.IsEmpty ) then
    ShowWarning('J� existe(m) duplicata(s) gerado(s) para esta entrada')
  else
  if ( ShowConfirm('Confirma gera��o do(s) duplicata(s) a receber da entrada?') ) then
  begin
    GerarDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  end;
end;

procedure TfrmGeEntradaEstoque.dbCFOPNFButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sDescricao : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCFOP(Self, iCodigo, sDescricao) ) then
    begin
      IbDtstTabelaNFCFOP.AsInteger        := iCodigo;
      IbDtstTabelaCFOP_DESCRICAO.AsString := sDescricao;
    end;
end;

procedure TfrmGeEntradaEstoque.CarregarDadosCFOP(iCodigo: Integer);
begin
  if ( not IbDtstTabela.Active ) then
    Exit
  else
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
  begin
    with qryCFOP do
    begin
      Close;
      ParamByName('Cfop_cod').AsInteger := iCodigo;
      Open;
      if not IsEmpty then
        IbDtstTabelaCFOP_DESCRICAO.AsString := FieldByName('cfop_descricao').AsString
      else
      begin
        ShowWarning('C�digo CFOP n�o cadastrado');
        IbDtstTabelaNFCFOP.Clear;
        if ( dbCFOPNF.Visible and dbCFOPNF.Enabled ) then
          dbCFOPNF.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGeEntradaEstoque.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex := 0;

  DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (IbDtstTabelaSTATUS.AsInteger < STATUS_CMP_FIN );
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );
end;

end.