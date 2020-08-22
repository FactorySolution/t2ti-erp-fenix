/*
Title: T2Ti ERP Fenix                                                                
Description: Model que exporta os demais Models
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************/

// módulo cadastros
export 'package:fenix/src/model/cadastros/banco.dart';
export 'package:fenix/src/model/cadastros/banco_agencia.dart';
export 'package:fenix/src/model/cadastros/pessoa.dart';
export 'package:fenix/src/model/cadastros/pessoa_fisica.dart';
export 'package:fenix/src/model/cadastros/pessoa_juridica.dart';
export 'package:fenix/src/model/cadastros/pessoa_contato.dart';
export 'package:fenix/src/model/cadastros/pessoa_endereco.dart';
export 'package:fenix/src/model/cadastros/pessoa_telefone.dart';
export 'package:fenix/src/model/cadastros/produto.dart';
export 'package:fenix/src/model/cadastros/produto_grupo.dart';
export 'package:fenix/src/model/cadastros/produto_subgrupo.dart';
export 'package:fenix/src/model/cadastros/produto_marca.dart';
export 'package:fenix/src/model/cadastros/produto_unidade.dart';
export 'package:fenix/src/model/cadastros/nivel_formacao.dart';
export 'package:fenix/src/model/cadastros/estado_civil.dart';
export 'package:fenix/src/model/cadastros/banco_conta_caixa.dart';
export 'package:fenix/src/model/cadastros/cargo.dart';
export 'package:fenix/src/model/cadastros/cep.dart';
export 'package:fenix/src/model/cadastros/cfop.dart';
export 'package:fenix/src/model/cadastros/cliente.dart';
export 'package:fenix/src/model/cadastros/cnae.dart';
export 'package:fenix/src/model/cadastros/colaborador.dart';
export 'package:fenix/src/model/cadastros/usuario.dart';
export 'package:fenix/src/model/cadastros/papel.dart';
export 'package:fenix/src/model/cadastros/setor.dart';
export 'package:fenix/src/model/cadastros/contador.dart';
export 'package:fenix/src/model/cadastros/csosn.dart';
export 'package:fenix/src/model/cadastros/cst_cofins.dart';
export 'package:fenix/src/model/cadastros/cst_icms.dart';
export 'package:fenix/src/model/cadastros/cst_ipi.dart';
export 'package:fenix/src/model/cadastros/cst_pis.dart';
export 'package:fenix/src/model/cadastros/fornecedor.dart';
export 'package:fenix/src/model/cadastros/municipio.dart';
export 'package:fenix/src/model/cadastros/ncm.dart';
export 'package:fenix/src/model/cadastros/transportadora.dart';
export 'package:fenix/src/model/cadastros/uf.dart';
export 'package:fenix/src/model/cadastros/vendedor.dart';
export 'package:fenix/src/model/cadastros/produto_grupo.dart';
export 'package:fenix/src/model/cadastros/produto_marca.dart';
export 'package:fenix/src/model/cadastros/produto_subgrupo.dart';
export 'package:fenix/src/model/cadastros/produto_unidade.dart';

// bloco financeiro
export 'package:fenix/src/model/financeiro/cheque.dart';
export 'package:fenix/src/model/financeiro/fin_cheque_emitido.dart';
export 'package:fenix/src/model/financeiro/fin_cheque_recebido.dart';
export 'package:fenix/src/model/financeiro/fin_configuracao_boleto.dart';
export 'package:fenix/src/model/financeiro/fin_documento_origem.dart';
export 'package:fenix/src/model/financeiro/fin_extrato_conta_banco.dart';
export 'package:fenix/src/model/financeiro/fin_fechamento_caixa_banco.dart';
export 'package:fenix/src/model/financeiro/fin_lancamento_pagar.dart';
export 'package:fenix/src/model/financeiro/fin_lancamento_receber.dart';
export 'package:fenix/src/model/financeiro/fin_natureza_financeira.dart';
export 'package:fenix/src/model/financeiro/fin_parcela_pagar.dart';
export 'package:fenix/src/model/financeiro/fin_parcela_receber.dart';
export 'package:fenix/src/model/financeiro/fin_status_parcela.dart';
export 'package:fenix/src/model/financeiro/fin_tipo_pagamento.dart';
export 'package:fenix/src/model/financeiro/fin_tipo_recebimento.dart';
export 'package:fenix/src/model/financeiro/talonario_cheque.dart';

// tributação
export'package:fenix/src/model/tributacao/tribut_cofins.dart';
export'package:fenix/src/model/tributacao/tribut_configura_of_gt.dart';
export'package:fenix/src/model/tributacao/tribut_grupo_tributario.dart';
export'package:fenix/src/model/tributacao/tribut_icms_custom_cab.dart';
export'package:fenix/src/model/tributacao/tribut_icms_custom_det.dart';
export'package:fenix/src/model/tributacao/tribut_icms_uf.dart';
export'package:fenix/src/model/tributacao/tribut_ipi.dart';
export'package:fenix/src/model/tributacao/tribut_iss.dart';
export'package:fenix/src/model/tributacao/tribut_operacao_fiscal.dart';
export'package:fenix/src/model/tributacao/tribut_pis.dart';

// estoque
export 'package:fenix/src/model/estoque/estoque_reajuste_cabecalho.dart';
export 'package:fenix/src/model/estoque/estoque_reajuste_detalhe.dart';
export 'package:fenix/src/model/estoque/requisicao_interna_cabecalho.dart';
export 'package:fenix/src/model/estoque/requisicao_interna_detalhe.dart';

// vendas
export 'package:fenix/src/model/vendas/nota_fiscal_modelo.dart';
export 'package:fenix/src/model/vendas/nota_fiscal_tipo.dart';
export 'package:fenix/src/model/vendas/venda_cabecalho.dart';
export 'package:fenix/src/model/vendas/venda_comissao.dart';
export 'package:fenix/src/model/vendas/venda_condicoes_pagamento.dart';
export 'package:fenix/src/model/vendas/venda_condicoes_parcelas.dart';
export 'package:fenix/src/model/vendas/venda_detalhe.dart';
export 'package:fenix/src/model/vendas/venda_frete.dart';
export 'package:fenix/src/model/vendas/venda_orcamento_cabecalho.dart';
export 'package:fenix/src/model/vendas/venda_orcamento_detalhe.dart';

// compras
export 'package:fenix/src/model/compras/compra_cotacao.dart';
export 'package:fenix/src/model/compras/compra_cotacao_detalhe.dart';
export 'package:fenix/src/model/compras/compra_fornecedor_cotacao.dart';
export 'package:fenix/src/model/compras/compra_pedido.dart';
export 'package:fenix/src/model/compras/compra_pedido_detalhe.dart';
export 'package:fenix/src/model/compras/compra_requisicao.dart';
export 'package:fenix/src/model/compras/compra_requisicao_detalhe.dart';
export 'package:fenix/src/model/compras/compra_tipo_pedido.dart';
export 'package:fenix/src/model/compras/compra_tipo_requisicao.dart';

// comissões
export 'package:fenix/src/model/comissoes/comissao_objetivo.dart';
export 'package:fenix/src/model/comissoes/comissao_perfil.dart';

// ordem de serviço
export 'package:fenix/src/model/os/os_abertura.dart';
export 'package:fenix/src/model/os/os_abertura_equipamento.dart';
export 'package:fenix/src/model/os/os_equipamento.dart';
export 'package:fenix/src/model/os/os_evolucao.dart';
export 'package:fenix/src/model/os/os_produto_servico.dart';
export 'package:fenix/src/model/os/os_status.dart';

// afv
export 'package:fenix/src/model/afv/tabela_preco.dart';
export 'package:fenix/src/model/afv/tabela_preco_produto.dart';
export 'package:fenix/src/model/afv/vendedor_meta.dart';
export 'package:fenix/src/model/afv/vendedor_rota.dart';

// nfs-e
export 'package:fenix/src/model/nfse/nfse_cabecalho.dart';
export 'package:fenix/src/model/nfse/nfse_detalhe.dart';
export 'package:fenix/src/model/nfse/nfse_intermediario.dart';
export 'package:fenix/src/model/nfse/nfse_lista_servico.dart';

// views
export 'package:fenix/src/model/views_db/view_pessoa_colaborador.dart';
export 'package:fenix/src/model/views_db/view_pessoa_fornecedor.dart';
export 'package:fenix/src/model/views_db/view_pessoa_cliente.dart';
export 'package:fenix/src/model/views_db/view_fin_lancamento_pagar.dart';
export 'package:fenix/src/model/views_db/view_fin_movimento_caixa_banco.dart';
export 'package:fenix/src/model/views_db/view_fin_cheque_nao_compensado.dart';
export 'package:fenix/src/model/views_db/view_fin_fluxo_caixa.dart';