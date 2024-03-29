import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final TextEditingController _controladorCampoValor = TextEditingController();

class FormularioDeposito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _tituloAppBar = 'Receber depósito';
    const _dicaCampoValor = '0.00';
    const _rotuloCampoValor = 'Valor';
    String _textoBotaoConfirmar = 'Confirmar';

    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              dica: _dicaCampoValor,
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaDeposito(context),
            ),
          ],
        ),
      ),
    );
  }
}

_criaDeposito(BuildContext context) {
  final double valor = double.tryParse(_controladorCampoValor.text);
  final depositoValido = _validaDeposito(valor);

  if (depositoValido) {
    _atualizaEstado(context, valor);
    Navigator.pop(context);
  }
}

_validaDeposito(valor) {
  final _campoPreenchido = valor != null;
  return _campoPreenchido;
}

_atualizaEstado(context, valor) {
  Provider.of<Saldo>(context, listen: false).adiciona(valor);
}
