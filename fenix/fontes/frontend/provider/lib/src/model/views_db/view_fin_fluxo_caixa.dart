/*
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_FIN_FLUXO_CAIXA] 
                                                                                
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

import 'package:intl/intl.dart';

class ViewFinFluxoCaixa {
	int id;
	int idContaCaixa;
	String nomeContaCaixa;
	String nomePessoa;
	DateTime dataLancamento;
	DateTime dataVencimento;
	double valor;
	String codigoSituacao;
	String descricaoSituacao;
	String operacao;

	ViewFinFluxoCaixa({
			this.id,
			this.idContaCaixa,
			this.nomeContaCaixa,
			this.nomePessoa,
			this.dataLancamento,
			this.dataVencimento,
			this.valor,
			this.codigoSituacao,
			this.descricaoSituacao,
			this.operacao,
		});

	static List<String> campos = <String>[
		'ID', 
		'NOME_CONTA_CAIXA', 
		'NOME_PESSOA', 
		'DATA_LANCAMENTO', 
		'DATA_VENCIMENTO', 
		'VALOR', 
		'CODIGO_SITUACAO', 
		'DESCRICAO_SITUACAO', 
		'OPERACAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Nome Conta Caixa', 
		'Nome Pessoa', 
		'Data Lancamento', 
		'Data Vencimento', 
		'Valor', 
		'Codigo Situacao', 
		'Descricao Situacao', 
		'Operacao', 
	];

	ViewFinFluxoCaixa.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idContaCaixa = jsonDados['idContaCaixa'];
		nomeContaCaixa = jsonDados['nomeContaCaixa'];
		nomePessoa = jsonDados['nomePessoa'];
		dataLancamento = jsonDados['dataLancamento'] != null ? DateTime.tryParse(jsonDados['dataLancamento']) : null;
		dataVencimento = jsonDados['dataVencimento'] != null ? DateTime.tryParse(jsonDados['dataVencimento']) : null;
		valor = jsonDados['valor'] != null ? jsonDados['valor'].toDouble() : null;
		codigoSituacao = jsonDados['codigoSituacao'];
		descricaoSituacao = jsonDados['descricaoSituacao'];
		operacao = jsonDados['operacao'] == 'S' ? 'Saída' : 'Entrada';
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = new Map<String, dynamic>();

		jsonDados['id'] = this.id ?? 0;
		jsonDados['idContaCaixa'] = this.idContaCaixa ?? 0;
		jsonDados['nomeContaCaixa'] = this.nomeContaCaixa;
		jsonDados['nomePessoa'] = this.nomePessoa;
		jsonDados['dataLancamento'] = this.dataLancamento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(this.dataLancamento) : null;
		jsonDados['dataVencimento'] = this.dataVencimento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(this.dataVencimento) : null;
		jsonDados['valor'] = this.valor;
		jsonDados['codigoSituacao'] = this.codigoSituacao;
		jsonDados['descricaoSituacao'] = this.descricaoSituacao;
		jsonDados['operacao'] = this.operacao;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(ViewFinFluxoCaixa objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}