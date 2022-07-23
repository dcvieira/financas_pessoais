import 'package:financas_pessoais/database/database_manager.dart';
import 'package:sqflite/sqflite.dart';

import '../models/categorial.dart';
import '../models/tipo_lancamento.dart';

class CategoriaRepository {
  Future<List<Categoria>> listarCategorias() async {
    Database db = await DatabaseManager.instance.database;
    final rows = await db.query('categorias');
    return rows
        .map(
          (row) => Categoria(
              id: int.parse(row['id'].toString()),
              categoriaDescricao: row['categoriaDescricao'].toString(),
              categoriaCor: row['categoriaCor'].toString(),
              categoriaIcone: row['categoriaIcone'].toString(),
              categoriaTipoTransacao:
                  TipoTransacao.values[row['categoriaTipoTransacao'] as int]),
        )
        .toList();
  }
}
