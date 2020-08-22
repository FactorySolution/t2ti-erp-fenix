/*
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [FIN_DOCUMENTO_ORIGEM] 
                                                                                
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
import 'package:http/http.dart' show Client;

import 'package:fenix/src/service/service_base.dart';
import 'package:fenix/src/model/filtro.dart';
import 'package:fenix/src/model/model.dart';

/// classe responsável por requisições ao servidor REST
class FinDocumentoOrigemService extends ServiceBase {
  var clienteHTTP = Client();

  Future<List<FinDocumentoOrigem>> consultarLista({Filtro filtro}) async {
    var listaFinDocumentoOrigem = List<FinDocumentoOrigem>();

    tratarFiltro(filtro, '/fin-documento-origem/');
    final response = await clienteHTTP.get(url);

    if (response.statusCode == 200) {
      if (response.headers["content-type"].contains("html")) {
        tratarRetornoErro(response.body, response.headers);
        return null;
      } else {
        var parsed = json.decode(response.body) as List<dynamic>;
        for (var finDocumentoOrigem in parsed) {
          listaFinDocumentoOrigem.add(FinDocumentoOrigem.fromJson(finDocumentoOrigem));
        }
        return listaFinDocumentoOrigem;
      }
    } else {
      tratarRetornoErro(response.body, response.headers);
      return null;
    }
  }

  Future<FinDocumentoOrigem> consultarObjeto(int id) async {
    final response = await clienteHTTP.get('$endpoint/fin-documento-origem/$id');

    if (response.statusCode == 200) {
      if (response.headers["content-type"].contains("html")) {
        tratarRetornoErro(response.body, response.headers);
        return null;
      } else {
        var finDocumentoOrigemJson = json.decode(response.body);
        return FinDocumentoOrigem.fromJson(finDocumentoOrigemJson);
      }
    } else {
      tratarRetornoErro(response.body, response.headers);
      return null;
    }
  }

  Future<FinDocumentoOrigem> inserir(FinDocumentoOrigem finDocumentoOrigem) async {
    final response = await clienteHTTP.post(
      '$endpoint/fin-documento-origem',
      headers: {"content-type": "application/json"},
      body: finDocumentoOrigem.objetoEncodeJson(finDocumentoOrigem),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.headers["content-type"].contains("html")) {
        tratarRetornoErro(response.body, response.headers);
        return null;
      } else {
        var finDocumentoOrigemJson = json.decode(response.body);
        return FinDocumentoOrigem.fromJson(finDocumentoOrigemJson);
      }
    } else {
      tratarRetornoErro(response.body, response.headers);
      return null;
    }
  }

  Future<FinDocumentoOrigem> alterar(FinDocumentoOrigem finDocumentoOrigem) async {
    var id = finDocumentoOrigem.id;
    final response = await clienteHTTP.put(
      '$endpoint/fin-documento-origem/$id',
      headers: {"content-type": "application/json"},
      body: finDocumentoOrigem.objetoEncodeJson(finDocumentoOrigem),
    );

    if (response.statusCode == 200) {
      if (response.headers["content-type"].contains("html")) {
        tratarRetornoErro(response.body, response.headers);
        return null;
      } else {
        var finDocumentoOrigemJson = json.decode(response.body);
        return FinDocumentoOrigem.fromJson(finDocumentoOrigemJson);
      }
    } else {
      tratarRetornoErro(response.body, response.headers);
      return null;
    }
  }

  Future<bool> excluir(int id) async {
    final response = await clienteHTTP.delete(
      '$endpoint/fin-documento-origem/$id',
      headers: {"content-type": "application/json"},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      tratarRetornoErro(response.body, response.headers);
      return null;
    }
  }
}