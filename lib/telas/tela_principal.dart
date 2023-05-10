import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaPrincipal> {
  double dolar = 0;
  double euro = 0;
  double yen = 0;
  double peso = 0;

  void HG() async {
    final String urlHgFinance =
        'https://api.hgbrasil.com/finance?format=json-cors&key=86decab5';
    Response resposta = await get(Uri.parse(urlHgFinance));
    Map insere = json.decode(resposta.body);
    setState(() {
      dolar = insere['results']['currencies']['USD']['buy'];
      euro = insere['results']['currencies']['EUR']['buy'];
      yen = insere['results']['currencies']['JPY']['buy'];
      peso = insere['results']['currencies']['ARS']['buy'];
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
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 10, 87, 27),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Expanded(
                  child: Text('MOEDAS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
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
                          Text(
                            'Dólar: \n$dolar',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('euro: \n$euro',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('peso: \n$peso',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text('yen: \n$yen',
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
                        Navigator.pushNamed(context, '/TelaAcoes');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 10, 87, 27),
                        ),
                      ),
                      child: const Text('Ir para Ações'),
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
