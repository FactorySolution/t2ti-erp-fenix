/*
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [REQUISICAO_INTERNA_DETALHE] 
                                                                                
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
import 'dart:convert';

import 'package:fenix/src/model/model.dart';

class RequisicaoInternaDetalhe {
	int id;
	int idRequisicaoInternaCabecalho;
	int idProduto;
	double quantidade;
	Produto produto;

	RequisicaoInternaDetalhe({
			this.id,
			this.idRequisicaoInternaCabecalho,
			this.idProduto,
			this.quantidade,
			this.produto,
		});

	static List<String> campos = <String>[
		'ID', 
		'QUANTIDADE', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Quantidade', 
	];

	RequisicaoInternaDetalhe.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idRequisicaoInternaCabecalho = jsonDados['idRequisicaoInternaCabecalho'];
		idProduto = jsonDados['idProduto'];
		quantidade = jsonDados['quantidade'] != null ? jsonDados['quantidade'].toDouble() : null;
		produto = jsonDados['produto'] == null ? null : new Produto.fromJson(jsonDados['produto']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = new Map<String, dynamic>();

		jsonDados['id'] = this.id ?? 0;
		jsonDados['idRequisicaoInternaCabecalho'] = this.idRequisicaoInternaCabecalho ?? 0;
		jsonDados['idProduto'] = this.idProduto ?? 0;
		jsonDados['quantidade'] = this.quantidade;
		jsonDados['produto'] = this.produto == null ? null : this.produto.toJson;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(RequisicaoInternaDetalhe objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}