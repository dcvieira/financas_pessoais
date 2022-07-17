import 'package:flutter/material.dart';

class CategoriasListaPage extends StatefulWidget {
  const CategoriasListaPage({Key? key}) : super(key: key);

  @override
  State<CategoriasListaPage> createState() => _CategoriasListaPageState();
}

class _CategoriasListaPageState extends State<CategoriasListaPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Listagem de Transações'),
    );
  }
}
