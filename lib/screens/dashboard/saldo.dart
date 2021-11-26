import 'package:bytebank/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaldoCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
        child: Consumer<Saldo>(
      builder: (context, valor, child) => Padding(
        padding: const EdgeInsets.all(20),
        child: Text(valor.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            )),
      ),
    ));
  }
}
