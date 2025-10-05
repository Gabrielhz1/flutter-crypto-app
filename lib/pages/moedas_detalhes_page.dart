import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_perguntas/models/moeda.dart';
import 'package:intl/intl.dart';

class MoedasDetalhesPage extends StatefulWidget {
  Moeda moeda;
  MoedasDetalhesPage({super.key, required this.moeda});

  @override
  State<MoedasDetalhesPage> createState() => _MoedasDetalhesPageState();
}

class _MoedasDetalhesPageState extends State<MoedasDetalhesPage> {

   NumberFormat real = NumberFormat.currency(locale: 'pt-BR' , name:'R\$');
   final _form = GlobalKey<FormState>();
   final _valor = TextEditingController();
   double quantidade = 0;

   comprar() {
    if(_form.currentState!.validate()) {
      //Salvar compra (será feito posteriormente)
      
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Compra realizada com sucesso!')),
      );
    }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.moeda.nome),
        backgroundColor: Colors.indigo, 
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Padding(
              padding:EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.asset(widget.moeda.icone),
                    width: 50,
                  ),
                  Container(width: 10),
                  Text(
                    real.format(widget.moeda.preco),
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1,
                      color: Colors.grey[800],
                    ),
                  )
                  
                ],
              ),
               ),
               (quantidade > 0 )   //Condicional: se o número digitado no input for maior que zero, aparece o valor da moeda, senão não aparece nada e usamos apenas um container com Padding vazio  
               ? SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  child: Text('$quantidade ${widget.moeda.sigla}',
                  style: TextStyle(
                    fontSize: 22, 
                    color: Colors.teal,
                    ),
                    ),
                margin: EdgeInsets.only(bottom: 24),
                alignment: Alignment.center,
                ),
              )
              : Container(
                margin: EdgeInsets.only(bottom: 24),
                
              ),
            


              Form(
                key: _form,
                child: TextFormField(
                  controller: _valor,
                  style: TextStyle(fontSize: 22),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Valor',
                    prefixIcon: Icon(Icons.monetization_on_outlined, color: Colors.indigo, ),
                    suffix: Text(
                      'Valor',
                      style: TextStyle(fontSize: 14, color: Colors.indigo),
                    )

                  ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value)  {
                  if(value!.isEmpty) {
                    return 'Informe o valor da compra';

                  } else if (double.parse(value) < 50) {
                    return 'Compra mínima é R\$ 50,00';
                  }
                  return null;

                },
                onChanged: (value) {
                  setState(() {
                    quantidade = (value.isEmpty) ? 0 : double.parse(value) / widget.moeda.preco;
                  });
                  
                    
                  
                },
                ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 24),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // Remove o arredondamento
                      ),
                    ),
                    onPressed: comprar, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Icon(Icons.check,color: Colors.white, size: 24,),
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('Comprar', style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),),
                          )
                      ],
                    )
                    ),
                )
          ],

        ),

        ),
    );
  }
}