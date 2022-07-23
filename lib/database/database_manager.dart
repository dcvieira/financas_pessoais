import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {
  // Construtor com acesso privado
  DatabaseManager._();
  // Criar uma instancia de DB
  static final DatabaseManager instance = DatabaseManager._();
  //Instancia do SQLite
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'financas.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int versao) async {
    await db.execute(_categorias);
    await db.execute(_lancamentos);
    await db.insert('categorias', {
      'categoriaDescricao': 'Alimentação',
      'categoriaCor': 'pink',
      'categoriaIcone': 'restaurant',
      'categoriaTipoTransacao': 0
    });
    await db.insert('categorias', {
      'categoriaDescricao': 'Casa',
      'categoriaCor': 'deepPurple',
      'categoriaIcone': 'home',
      'categoriaTipoTransacao': 0
    });
    await db.insert('categorias', {
      'categoriaDescricao': 'Educação',
      'categoriaCor': 'indigo',
      'categoriaIcone': 'school',
      'categoriaTipoTransacao': 0
    });
    await db.insert('categorias', {
      'categoriaDescricao': 'Mercado',
      'categoriaCor': 'pink',
      'categoriaIcone': 'shopping_cart',
      'categoriaTipoTransacao': 0
    });
    await db.insert('categorias', {
      'categoriaDescricao': 'Cuidados Pessoais',
      'categoriaCor': 'amber',
      'categoriaIcone': 'self_improvement',
      'categoriaTipoTransacao': 0
    });
    await db.insert('categorias', {
      'categoriaDescricao': 'Assinatura e Serviços',
      'categoriaCor': 'lightBlue',
      'categoriaIcone': 'live_tv',
      'categoriaTipoTransacao': 0
    });
    await db.insert('categorias', {
      'categoriaDescricao': 'Salário',
      'categoriaCor': 'green',
      'categoriaIcone': 'money',
      'categoriaTipoTransacao': 1
    });
    await db.insert('categorias', {
      'categoriaDescricao': 'Empréstimo',
      'categoriaCor': 'lightGreen',
      'categoriaIcone': 'account_balance',
      'categoriaTipoTransacao': 1
    });
    await db.insert('categorias', {
      'categoriaDescricao': 'Outras Receitas',
      'categoriaCor': 'green',
      'categoriaIcone': 'money',
      'categoriaTipoTransacao': 1
    });
  }

  String get _categorias => '''
    CREATE TABLE IF NOT EXISTS categorias (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      categoriaDescricao TEXT,
      categoriaCor TEXT,
      categoriaIcone TEXT, 
      categoriaTipoTransacao INTEGER
    );
  ''';

  String get _lancamentos => '''
    CREATE TABLE IF NOT EXISTS transacoes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      descricao TEXT,
      tipoTransacao INTEGER,
      valor REAL,
      data INTEGER,
      observacao TEXT, 
      categoriaId INTEGER,
      FOREIGN KEY(categoriaId) REFERENCES categorias(id)
    );
  ''';
}
