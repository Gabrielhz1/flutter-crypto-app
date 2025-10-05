import 'package:flutter/material.dart';
import 'package:projeto_perguntas/pages/moedas_detalhes_page.dart';
import 'package:projeto_perguntas/repositories/moeda_repository.dart';
import 'package:intl/intl.dart';
import 'package:projeto_perguntas/models/moeda.dart';

class MoedasPage extends StatefulWidget {

  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {

  List<Moeda> selecionadas = [];

  appBarDinamica() {
    if(selecionadas.isEmpty) {
      return AppBar(
        title: const Text("Criptomoedas"),
        backgroundColor: Colors.indigo, 
        foregroundColor: Colors.white, 
        centerTitle: true,
      );
    }
    else {
      return AppBar(
        leading: IconButton(
         icon: Icon(Icons.close),
         onPressed:(){
          setState(() {
            selecionadas = [];
          });
         },
         
         ),
         title: Text('${selecionadas.length} selecionadas'),
         backgroundColor:  const Color.fromARGB(255, 111, 125, 207),
         elevation: 1,

      );
    }
    
  }

  mostrarDetalhes(Moeda moeda){
     Navigator.push(
     context, 
     MaterialPageRoute(
      builder:  (_) => MoedasDetalhesPage(moeda: moeda)
      ));
  }

  @override
  Widget build(BuildContext context) {

    final tabela = MoedaRepository.tabela;
    NumberFormat real = NumberFormat.currency(locale: 'pt-BR' , name:'R\$');
    
    return Scaffold(
      appBar: appBarDinamica(),

      body: ListView.separated(
        itemBuilder: (BuildContext context, int moeda) {
          return ListTile (
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),

              leading: (selecionadas.contains(tabela[moeda]))
              ? CircleAvatar(
                child: Icon(Icons.check),
              )

             : SizedBox(
                width: 50,
                child: Image.asset(tabela[moeda].icone),
              ),

              title: Text(tabela[moeda].nome, 
                style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600 
              ),),
              trailing: Text(real.format(tabela[moeda].preco,), style: TextStyle(
                 fontSize: 14
              ),),

              selected: selecionadas.contains(tabela[moeda]),
              selectedTileColor: Colors.indigo[50],
              onLongPress: (){
                setState(() {
                (selecionadas.contains(tabela[moeda]))
                  ? selecionadas.remove(tabela[moeda])
                  : selecionadas.add (tabela[moeda]); 
                });
                
              },
              onTap: ()=> mostrarDetalhes(tabela[moeda]),
          );},

        padding: EdgeInsets.all(16),
        separatorBuilder: (_,___) => Divider(),
        itemCount: tabela.length,),
        
        floatingActionButton:selecionadas.isNotEmpty ? 
        FloatingActionButton.extended(
          onPressed: (){}, 
          icon: Icon(Icons.star),
          label: Text (
          'FAVORITAR',
          style: TextStyle(
            letterSpacing: 0,
            fontWeight: FontWeight.bold,
          ),
          ),
        backgroundColor: const Color.fromARGB(255, 94, 114, 226),        // cor de fundo
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(50))  
          )
        : null
        
      );
    
  }
}