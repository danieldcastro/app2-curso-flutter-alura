import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'lista.dart';

final _titulo = 'Últimas transferências';

class semTransferenciaCadastrada extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.all(40),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Você ainda não cadastrou nenhuma transferência',
            textAlign: TextAlign.center,
          ),
        ),
      );
}

class UltimasTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(
            _titulo,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Consumer<Transferencias>(
            builder: (context, transferencias, child) {
              final _ultimasTransferencias =
                  transferencias.transferencias.reversed.toList();
              final _quantidade = transferencias.transferencias.length;
              int tamanho = 2;

              if (_quantidade == 0) {
               return semTransferenciaCadastrada();
              }
              if (_quantidade < 2) {
                tamanho = _quantidade;
              }
              return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: tamanho,
                  shrinkWrap: true,
                  itemBuilder: (context, indice) =>
                      ItemTransferencia(_ultimasTransferencias[indice]));
            },
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListaTransferencias(),
                  ),
                );
              },
              child: Text('Todas as transferências')),
        ],
      );
}
