import 'package:flutter/material.dart';

class TransacoesListaPage extends StatefulWidget {
  const TransacoesListaPage({Key? key}) : super(key: key);

  @override
  State<TransacoesListaPage> createState() => _TransacoesListaPageState();
}

class _TransacoesListaPageState extends State<TransacoesListaPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Listagem de Transações'),
    );
  }
}
