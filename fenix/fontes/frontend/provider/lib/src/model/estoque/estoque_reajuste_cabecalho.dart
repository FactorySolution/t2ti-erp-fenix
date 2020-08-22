/*
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [ESTOQUE_REAJUSTE_CABECALHO] 
                                                                                
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
import 'package:fenix/src/model/model.dart';

class EstoqueReajusteCabecalho {
	int id;
	int idColaborador;
	DateTime dataReajuste;
	double taxa;
	String tipoReajuste;
	String justificativa;
	Colaborador colaborador;
	List<EstoqueReajusteDetalhe> listaEstoqueReajusteDetalhe = [];

	EstoqueReajusteCabecalho({
			this.id,
			this.idColaborador,
			this.dataReajuste,
			this.taxa,
			this.tipoReajuste,
			this.justificativa,
			this.colaborador,
			this.listaEstoqueReajusteDetalhe,
		});

	static List<String> campos = <String>[
		'ID', 
		'DATA_REAJUSTE', 
		'TAXA', 
		'TIPO_REAJUSTE', 
		'JUSTIFICATIVA', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Data do Reajuste', 
		'Taxa Reajuste', 
		'Tipo do Reajuste', 
		'Justificativa', 
	];

	EstoqueReajusteCabecalho.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idColaborador = jsonDados['idColaborador'];
		dataReajuste = jsonDados['dataReajuste'] != null ? DateTime.tryParse(jsonDados['dataReajuste']) : null;
		taxa = jsonDados['taxa'] != null ? jsonDados['taxa'].toDouble() : null;
		tipoReajuste = getTipoReajuste(jsonDados['tipoReajuste']);
		justificativa = jsonDados['justificativa'];
		colaborador = jsonDados['colaborador'] == null ? null : new Colaborador.fromJson(jsonDados['colaborador']);
		listaEstoqueReajusteDetalhe = (jsonDados['listaEstoqueReajusteDetalhe'] as Iterable)?.map((m) => EstoqueReajusteDetalhe.fromJson(m))?.toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = new Map<String, dynamic>();

		jsonDados['id'] = this.id ?? 0;
		jsonDados['idColaborador'] = this.idColaborador ?? 0;
		jsonDados['dataReajuste'] = this.dataReajuste != null ? DateFormat('yyyy-MM-ddT00:00:00').format(this.dataReajuste) : null;
		jsonDados['taxa'] = this.taxa;
		jsonDados['tipoReajuste'] = setTipoReajuste(this.tipoReajuste);
		jsonDados['justificativa'] = this.justificativa;
		jsonDados['colaborador'] = this.colaborador == null ? null : this.colaborador.toJson;
		

		var listaEstoqueReajusteDetalheLocal = [];
		for (EstoqueReajusteDetalhe objeto in this.listaEstoqueReajusteDetalhe ?? []) {
			listaEstoqueReajusteDetalheLocal.add(objeto.toJson);
		}
		jsonDados['listaEstoqueReajusteDetalhe'] = listaEstoqueReajusteDetalheLocal;
	
		return jsonDados;
	}
	
    getTipoReajuste(String tipoReajuste) {
    	switch (tipoReajuste) {
    		case 'A':
    			return 'Aumentar';
    			break;
    		case 'D':
    			return 'Diminuir';
    			break;
    		default:
    			return null;
    		}
    	}

    setTipoReajuste(String tipoReajuste) {
    	switch (tipoReajuste) {
    		case 'Aumentar':
    			return 'A';
    			break;
    		case 'Diminuir':
    			return 'D';
    			break;
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(EstoqueReajusteCabecalho objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}