import 'package:financas_pessoais/components/transacao_list_item.dart';
import 'package:flutter/material.dart';

class TransacoesListaPage extends StatefulWidget {
  const TransacoesListaPage({Key? key}) : super(key: key);

  @override
  State<TransacoesListaPage> createState() => _TransacoesListaPageState();
}

class _TransacoesListaPageState extends State<TransacoesListaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transações')),
      body: ListView(
        children: [
          TransacaoListItem(),
          Divider(),
          TransacaoListItem(),
          Divider(),
          TransacaoListItem(),
          Divider(),
          TransacaoListItem(),
        ],
      ),
    );
  }
}
