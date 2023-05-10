import 'package:flutter/material.dart';

class Botao extends StatefulWidget {
  final texto;
  final corBackground;
  final corFonte;
  final funcao;

  const Botao(
      {super.key, this.texto, this.corBackground, this.corFonte, this.funcao});

  @override
  State<Botao> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Center(
          child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: widget.corFonte,
          backgroundColor: widget.corBackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          minimumSize: const Size(200, 50),
        ),
        onPressed: widget.funcao,
        child: Text(widget.texto),
      )),
    );
  }
}
