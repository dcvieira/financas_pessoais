import 'package:financas_pessoais/components/categoria_list_item.dart';
import 'package:flutter/material.dart';

class CategoriasListaPage extends StatefulWidget {
  const CategoriasListaPage({Key? key}) : super(key: key);

  @override
  State<CategoriasListaPage> createState() => _CategoriasListaPageState();
}

class _CategoriasListaPageState extends State<CategoriasListaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categorias')),
      body: ListView(
        children: [
          CategoriaListItem(),
          Divider(),
          CategoriaListItem(),
          Divider(),
          CategoriaListItem(),
          Divider(),
          CategoriaListItem(),
        ],
      ),
    );
  }
}
