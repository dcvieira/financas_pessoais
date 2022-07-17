import 'package:financas_pessoais/components/categoria_list_item.dart';
import 'package:financas_pessoais/repository/categoria_repository.dart';
import 'package:flutter/material.dart';

import '../models/categorial.dart';

class CategoriasListaPage extends StatefulWidget {
  CategoriasListaPage({Key? key}) : super(key: key);

  @override
  State<CategoriasListaPage> createState() => _CategoriasListaPageState();
}

class _CategoriasListaPageState extends State<CategoriasListaPage> {
  final List<Categoria> _categorias = CategoriaRepository().listarCategorias();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categorias')),
      body: ListView.separated(
        itemCount: _categorias.length,
        itemBuilder: (context, index) {
          final categoria = _categorias[index];
          return CategoriaListItem(categoria: categoria);
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
