import 'package:financas_pessoais/database/database_manager.dart';
import 'package:financas_pessoais/models/tipo_lancamento.dart';
import 'package:financas_pessoais/models/transacao.dart';
import 'package:sqflite/sqflite.dart';

import '../models/categorial.dart';

class TransacaoRepository {
  Future<List<Transacao>> listarTransacoes() async {
    Database db = await DatabaseManager.instance.database;
    List rows = await db.rawQuery('''
          SELECT 
            transacoes.id, 
            transacoes.descricao,
            transacoes.tipoTransacao,
            transacoes.valor, 
            transacoes.categoriaId, 
            transacoes.data,
            transacoes.observacao, 
            categorias.categoriaDescricao,
            categorias.categoriaCor,
            categorias.categoriaIcone,
            categorias.categoriaTipoTransacao
          FROM transacoes
    INNER JOIN categorias ON categorias.id = transacoes.categoriaId
''');
    return rows
        .map(
          (row) => Transacao(
            id: row['id'] as int,
            descricao: row['descricao'],
            tipoTransacao: TipoTransacao.values[row['tipoTransacao'] as int],
            valor: double.parse(row['valor'].toString()),
            data: DateTime.fromMillisecondsSinceEpoch(row['data']),
            observacao: row['observacao'],
            categoria: Categoria(
                id: row['categoriaId'],
                categoriaCor: row['categoriaCor'],
                categoriaDescricao: row['categoriaDescricao'],
                categoriaIcone: row['categoriaIcone'],
                categoriaTipoTransacao:
                    TipoTransacao.values[row['categoriaTipoTransacao'] as int]),
          ),
        )
        .toList();
  }

  Future<int> cadastrarTransacao(Transacao transacao) async {
    Database db = await DatabaseManager.instance.database;
    return db.insert('transacoes', {
      'descricao': transacao.descricao,
      'tipoTransacao': transacao.tipoTransacao.index,
      'valor': transacao.valor,
      'data': transacao.data.millisecondsSinceEpoch,
      'observacao': transacao.observacao,
      'categoriaId': transacao.categoria.id,
    });
  }

  Future<void> removerTransacao(int id) async {
    Database db = await DatabaseManager.instance.database;
    await db.delete('transacoes', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> editarTransacao(Transacao transacao) async {
    Database db = await DatabaseManager.instance.database;
    return db.update(
        'transacoes',
        {
          'descricao': transacao.descricao,
          'tipoLancamento': transacao.tipoTransacao.index,
          'valor': transacao.valor,
          'data': transacao.data.millisecondsSinceEpoch,
          'observacao': transacao.observacao,
          'categoriaId': transacao.categoria.id,
        },
        where: 'id = ?',
        whereArgs: [transacao.id]);
  }
}
