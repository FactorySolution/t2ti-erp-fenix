/*
Title: T2Ti ERP Fenix                                                                
Description: AbaDetalhe ListaPage relacionada à tabela [OS_ABERTURA_EQUIPAMENTO] 
                                                                                
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
import 'package:flutter/material.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'os_abertura_equipamento_detalhe_page.dart';
import 'os_abertura_equipamento_persiste_page.dart';

class OsAberturaEquipamentoListaPage extends StatefulWidget {
  final OsAbertura osAbertura;

  const OsAberturaEquipamentoListaPage({Key key, this.osAbertura}) : super(key: key);

  @override
  _OsAberturaEquipamentoListaPageState createState() => _OsAberturaEquipamentoListaPageState();
}

class _OsAberturaEquipamentoListaPageState extends State<OsAberturaEquipamentoListaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: ViewUtilLib.getBackgroundColorBotaoInserir(),
          child: ViewUtilLib.getIconBotaoInserir(),
          onPressed: () {
            var osAberturaEquipamento = new OsAberturaEquipamento();
            widget.osAbertura.listaOsAberturaEquipamento.add(osAberturaEquipamento);
            Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        OsAberturaEquipamentoPersistePage(
                            osAbertura: widget.osAbertura,
                            osAberturaEquipamento: osAberturaEquipamento,
                            title: 'Os Abertura Equipamento - Inserindo',
                            operacao: 'I')))
                .then((_) {
              setState(() {
                if (osAberturaEquipamento.numeroSerie == null || osAberturaEquipamento.numeroSerie == "") { // se esse atributo estiver vazio, o objeto será removido
                  widget.osAbertura.listaOsAberturaEquipamento.remove(osAberturaEquipamento);
                }
                getRows();
              });
            });
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Card(
                color: Colors.white,
                elevation: 2.0,
                child: DataTable(columns: getColumns(), rows: getRows()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DataColumn> getColumns() {
    List<DataColumn> lista = [];
	lista.add(DataColumn(numeric: true, label: Text('Id')));
	lista.add(DataColumn(label: Text('Equipamento')));
	lista.add(DataColumn(label: Text('Número de Série')));
	lista.add(DataColumn(label: Text('Tipo Cobertura')));
    return lista;
  }

  List<DataRow> getRows() {
    if (widget.osAbertura.listaOsAberturaEquipamento == null) {
      widget.osAbertura.listaOsAberturaEquipamento = [];
    }
    List<DataRow> lista = [];
    for (var osAberturaEquipamento in widget.osAbertura.listaOsAberturaEquipamento) {
      List<DataCell> celulas = new List<DataCell>();

      celulas = [
        DataCell(Text('${ osAberturaEquipamento.id ?? ''}'), onTap: () {
          detalharOsAberturaEquipamento(widget.osAbertura, osAberturaEquipamento, context);
        }),
		DataCell(Text('${osAberturaEquipamento.osEquipamento?.nome ?? ''}'), onTap: () {
			detalharOsAberturaEquipamento(widget.osAbertura, osAberturaEquipamento, context);
		}),
		DataCell(Text('${osAberturaEquipamento.numeroSerie ?? ''}'), onTap: () {
			detalharOsAberturaEquipamento(widget.osAbertura, osAberturaEquipamento, context);
		}),
		DataCell(Text('${osAberturaEquipamento.tipoCobertura ?? ''}'), onTap: () {
			detalharOsAberturaEquipamento(widget.osAbertura, osAberturaEquipamento, context);
		}),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  detalharOsAberturaEquipamento(
      OsAbertura osAbertura, OsAberturaEquipamento osAberturaEquipamento, BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(
            builder: (BuildContext context) => OsAberturaEquipamentoDetalhePage(
                  osAbertura: osAbertura,
                  osAberturaEquipamento: osAberturaEquipamento,
                ))).then((_) {
				  setState(() {
					getRows();
				  });
				});
  }
}