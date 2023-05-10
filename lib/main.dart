import 'package:flutter/material.dart';
import 'package:prova_pratica/telas/tela_acoes.dart';
import 'package:prova_pratica/telas/tela_bitcoin.dart';
import 'package:prova_pratica/telas/tela_principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/TelaMoedas",
      routes: {
        '/TelaMoedas': (context) => const TelaPrincipal(),
        '/TelaBitcoin': (context) => const TelaBitcoin(),
        '/TelaAcoes': (context) => const TelaAcoes(),
      },
    );
  }
}
