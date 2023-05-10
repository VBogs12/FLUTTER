import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() => runApp(TelaAcoes());

class TelaAcoes extends StatefulWidget {
  const TelaAcoes({Key? key}) : super(key: key);

  @override
  State<TelaAcoes> createState() => _TelaAcaoState();
}

class _TelaAcaoState extends State<TelaAcoes> {
  double ibovespa = 0;
  double ifix = 0;
  double nasdaq = 0;
  double dowjones = 0;
  double cac = 0;
  double nikkei = 0;

  void HG() async {
    final String urlHgFinance =
        'https://api.hgbrasil.com/finance?format=json-cors&key=6c677801';
    Response resposta = await get(Uri.parse(urlHgFinance));
    Map insere = json.decode(resposta.body);
    setState(() {
      ibovespa = insere['results']['stocks']['ibovespa']['points'];
      ifix = insere['results']['stocks']['ifix']['points'];
      nasdaq = insere['results']['stocks']['nasdaq']['points'];
      dowjones = insere['results']['stocks']['dowjones']['points'];
      cac = insere['results']['stocks']['cac']['points'];
      nikkei = insere['results']['stocks']['nikkei']['points'];
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
                'AÇÕES',
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
                          Text('ibovespa: $ibovespa',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text('ifix: $ifix',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('nasdaq: $nasdaq',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text('dowjones: $dowjones',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('cac: $cac',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text('nikkei: $nikkei',
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
                        Navigator.pushNamed(context, '/TelaBitcoin');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 10, 87, 27),
                        ),
                      ),
                      child: const Text('Ir para Bitcoin'),
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
