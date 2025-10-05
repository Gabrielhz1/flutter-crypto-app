import 'package:projeto_perguntas/models/moeda.dart';

class MoedaRepository {
 static List<Moeda> tabela = [
    Moeda(icone: 'images/bitcoin.png', nome: 'Bitcoin', sigla: 'BTC', preco: 164603.00),
    Moeda(icone: 'images/cardano.png', nome: 'Cardano', sigla: 'ADA', preco: 6.32),
    Moeda(icone: 'images/etherum.png', nome: 'Etherum', sigla: 'ETH', preco: 9716.00),
    Moeda(icone: 'images/litecoin.png', nome: 'Litecoin', sigla: 'LTC', preco: 669.93),
    Moeda(icone: 'images/usdc.png', nome: 'USD Coin', sigla: 'USDC', preco: 5.02),
    Moeda(icone: 'images/xrp.png', nome: 'Xrp', sigla: 'XRP', preco: 3.34),
  ];
}
