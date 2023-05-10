import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TelaBitcoin extends StatefulWidget {
  const TelaBitcoin({Key? key}) : super(key: key);

  @override
  State<TelaBitcoin> createState() => _TelaBitcoinState();
}

class _TelaBitcoinState extends State<TelaBitcoin> {
  double blockChain = 0;
  double coinBase = 0;
  double bitStamp = 0;
  double foxBit = 0;
  double mercadoBitcoin = 0;

  void HG() async {
    final String urlHgFinance =
        'https://api.hgbrasil.com/finance?format=json-cors&key=86decab5';
    Response resposta = await get(Uri.parse(urlHgFinance));
    Map insere = json.decode(resposta.body);
    setState(() {
      blockChain = insere['results']['bitcoin']['blockchain_info']['last'];
      coinBase = insere['results']['bitcoin']['coinBase']['last'];
      bitStamp = insere['results']['bitcoin']['bitstamp']['last'];
      foxBit = insere['results']['bitcoin']['foxbit']['last'];
      mercadoBitcoin = insere['results']['bitcoin']['mercadobitcoin']['last'];
    });
  }

  void initState() {
    super.initState();
    HG();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Finanças Hoje',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 10, 87, 27),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Expanded(
                  child: Text(
                'BITCOIN',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
            ],
          ),
          const SizedBox(height: 40),
          Column(
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 700,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Blockchain.info: $blockChain',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text('CoinBase: $coinBase',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('bitStamp: $bitStamp',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text('foxBit: $foxBit',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Mercado Bitcoin: $mercadoBitcoin',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 70),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/TelaPrincipal');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 10, 87, 27),
                        ),
                      ),
                      child: const Text('Pagina principal'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
