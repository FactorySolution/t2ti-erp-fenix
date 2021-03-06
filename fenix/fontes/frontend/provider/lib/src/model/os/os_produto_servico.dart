/*
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [OS_PRODUTO_SERVICO] 
                                                                                
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

class OsProdutoServico {
	int id;
	int idOsAbertura;
	int idProduto;
	String tipo;
	String complemento;
	double quantidade;
	double valorUnitario;
	double valorSubtotal;
	double taxaDesconto;
	double valorDesconto;
	double valorTotal;
	Produto produto;

	OsProdutoServico({
			this.id,
			this.idOsAbertura,
			this.idProduto,
			this.tipo,
			this.complemento,
			this.quantidade = 0.0,
			this.valorUnitario = 0.0,
			this.valorSubtotal = 0.0,
			this.taxaDesconto = 0.0,
			this.valorDesconto = 0.0,
			this.valorTotal = 0.0,
			this.produto,
		});

	static List<String> campos = <String>[
		'ID', 
		'TIPO', 
		'COMPLEMENTO', 
		'QUANTIDADE', 
		'VALOR_UNITARIO', 
		'VALOR_SUBTOTAL', 
		'TAXA_DESCONTO', 
		'VALOR_DESCONTO', 
		'VALOR_TOTAL', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Tipo', 
		'Complemento', 
		'Quantidade', 
		'Valor Unitário', 
		'Valor Subtotal', 
		'Taxa Desconto', 
		'Valor Desconto', 
		'Valor Total', 
	];

	OsProdutoServico.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idOsAbertura = jsonDados['idOsAbertura'];
		idProduto = jsonDados['idProduto'];
		tipo = getTipo(jsonDados['tipo']);
		complemento = jsonDados['complemento'];
		quantidade = jsonDados['quantidade'] != null ? jsonDados['quantidade'].toDouble() : null;
		valorUnitario = jsonDados['valorUnitario'] != null ? jsonDados['valorUnitario'].toDouble() : null;
		valorSubtotal = jsonDados['valorSubtotal'] != null ? jsonDados['valorSubtotal'].toDouble() : null;
		taxaDesconto = jsonDados['taxaDesconto'] != null ? jsonDados['taxaDesconto'].toDouble() : null;
		valorDesconto = jsonDados['valorDesconto'] != null ? jsonDados['valorDesconto'].toDouble() : null;
		valorTotal = jsonDados['valorTotal'] != null ? jsonDados['valorTotal'].toDouble() : null;
		produto = jsonDados['produto'] == null ? null : new Produto.fromJson(jsonDados['produto']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = new Map<String, dynamic>();

		jsonDados['id'] = this.id ?? 0;
		jsonDados['idOsAbertura'] = this.idOsAbertura ?? 0;
		jsonDados['idProduto'] = this.idProduto ?? 0;
		jsonDados['tipo'] = setTipo(this.tipo);
		jsonDados['complemento'] = this.complemento;
		jsonDados['quantidade'] = this.quantidade;
		jsonDados['valorUnitario'] = this.valorUnitario;
		jsonDados['valorSubtotal'] = this.valorSubtotal;
		jsonDados['taxaDesconto'] = this.taxaDesconto;
		jsonDados['valorDesconto'] = this.valorDesconto;
		jsonDados['valorTotal'] = this.valorTotal;
		jsonDados['produto'] = this.produto == null ? null : this.produto.toJson;
	
		return jsonDados;
	}
	
    getTipo(String tipo) {
    	switch (tipo) {
    		case 'P':
    			return 'Produto';
    			break;
    		case 'S':
    			return 'Serviço';
    			break;
    		default:
    			return null;
    		}
    	}

    setTipo(String tipo) {
    	switch (tipo) {
    		case 'Produto':
    			return 'P';
    			break;
    		case 'Serviço':
    			return 'S';
    			break;
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(OsProdutoServico objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}