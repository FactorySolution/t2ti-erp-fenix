/*
Title: T2Ti ERP Fenix                                                                
Description: AbaMestre Page relacionada à tabela [COMPRA_COTACAO] 
                                                                                
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
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view_model/view_model.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';

import 'compra_cotacao_persiste_page.dart';
import 'compra_fornecedor_cotacao_lista_page.dart';
import 'compra_cotacao_detalhe_lista_page.dart';

List<Aba> _todasAsAbas = <Aba>[];

List<Aba> getAbasAtivas() {
  List<Aba> retorno = [];
  for (var item in _todasAsAbas) {
    if (item.visible) retorno.add(item);
  }
  return retorno;
}

class CompraCotacaoPage extends StatefulWidget {
  final CompraCotacao compraCotacao;
  final String title;
  final String operacao;

  CompraCotacaoPage({this.compraCotacao, this.title, this.operacao, Key key})
      : super(key: key);

  @override
  CompraCotacaoPageState createState() => CompraCotacaoPageState();
}

class CompraCotacaoPageState extends State<CompraCotacaoPage>
    with SingleTickerProviderStateMixin {
  TabController _abasController;
  String _estiloBotoesAba = 'iconsAndText';

  // CompraCotacao
  final GlobalKey<FormState> _compraCotacaoPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _compraCotacaoPersisteScaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
    atualizarAbas();
    _abasController = TabController(vsync: this, length: getAbasAtivas().length);
    _abasController.addListener(salvarForms);
    ViewUtilLib.paginaMestreDetalheFoiAlterada = false; // vamos controlar as alterações nas paginas filhas aqui para alertar ao usuario sobre possivel perda de dados
  }

  @override
  void dispose() {
    _abasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewUtilLib.getScaffoldAbaPage(
        widget.title,
        context,
        _abasController,
        getAbasAtivas(),
        getIndicator(),
        _estiloBotoesAba,
        salvarCompraCotacao,
        alterarEstiloBotoes,
        avisarUsuarioAlteracoesNaPagina);
  }

  void atualizarAbas() {
    _todasAsAbas.clear();
	 // a primeira aba sempre é a de Persistencia da tabela Mestre
    _todasAsAbas.add(Aba(
        icon: Icons.receipt,
        text: 'Detalhes',
        visible: true,
        pagina: CompraCotacaoPersistePage(
          formKey: _compraCotacaoPersisteFormKey,
          scaffoldKey: _compraCotacaoPersisteScaffoldKey,
          compraCotacao: widget.compraCotacao,
          atualizaCompraCotacaoCallBack: this.atualizarDados,
        )));
    _todasAsAbas.add(Aba(
    	icon: Icons.group,
    	text: 'Fornecedores da Cotação',
    	visible: true,
    	pagina: CompraFornecedorCotacaoListaPage(compraCotacao: widget.compraCotacao)));
    _todasAsAbas.add(Aba(
    	icon: Icons.group,
    	text: 'Produtos da Cotação',
    	visible: true,
    	pagina: CompraCotacaoDetalheListaPage(compraFornecedorCotacao: widget.compraCotacao.listaCompraFornecedorCotacao[0])));
  }

  void atualizarDados() { // serve para atualizar algum dado após alguma ação numa página filha
    setState(() {
    });
  }

  void salvarForms() {
    // valida e salva o form CompraCotacaoDetalhe
    FormState formCompraCotacao = _compraCotacaoPersisteFormKey.currentState;
    if (formCompraCotacao != null) {
      if (!formCompraCotacao.validate()) {
        _abasController.animateTo(0);
      } else {
        _compraCotacaoPersisteFormKey.currentState?.save();
      }
    }

    // valida e salva os forms OneToOne
  }

  void salvarCompraCotacao() async {
    salvarForms();
    var compraCotacaoProvider = Provider.of<CompraCotacaoViewModel>(context);
    if (widget.operacao == 'A') {
      await compraCotacaoProvider.alterar(widget.compraCotacao);
    } else {
      await compraCotacaoProvider.inserir(widget.compraCotacao);
    }
    Navigator.pop(context);
  }

  void alterarEstiloBotoes(String style) {
    setState(() {
      _estiloBotoesAba = style;
    });
  }

  Decoration getIndicator() {
    return ViewUtilLib.getShapeDecorationAbaPage(_estiloBotoesAba);
  }

  Future<bool> avisarUsuarioAlteracoesNaPagina() async {
    if (!ViewUtilLib.paginaMestreDetalheFoiAlterada) return true;
    return await ViewUtilLib.gerarDialogBoxFormAlterado(context);
  }
}