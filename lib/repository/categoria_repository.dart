import 'package:financas_pessoais/database/fake_database.dart';

import '../models/categorial.dart';
import '../models/tipo_lancamento.dart';

class CategoriaRepository {
  Future<List<Categoria>> listarCategorias() async {
    var connected = await FakeDatabase().connectDatabase();

    if (!connected) return [];

    return [
      Categoria(
        id: 1,
        categoriaDescricao: 'Alimentação',
        categoriaCor: 'pink',
        categoriaIcone: 'restaurant',
        categoriaTipoTransacao: TipoTransacao.despesa,
      ),
      Categoria(
        id: 2,
        categoriaDescricao: 'Casa',
        categoriaCor: 'deepPurple',
        categoriaIcone: 'home',
        categoriaTipoTransacao: TipoTransacao.despesa,
      ),
      Categoria(
        id: 3,
        categoriaDescricao: 'Educação',
        categoriaCor: 'indigo',
        categoriaIcone: 'school',
        categoriaTipoTransacao: TipoTransacao.despesa,
      ),
      Categoria(
        id: 4,
        categoriaDescricao: 'Mercado',
        categoriaCor: 'pink',
        categoriaIcone: 'shopping_cart',
        categoriaTipoTransacao: TipoTransacao.despesa,
      ),
      Categoria(
        id: 5,
        categoriaDescricao: 'Cuidados Pessoais',
        categoriaCor: 'amber',
        categoriaIcone: 'self_improvement',
        categoriaTipoTransacao: TipoTransacao.despesa,
      ),
      Categoria(
        id: 6,
        categoriaDescricao: 'Assinatura e Serviços',
        categoriaCor: 'lightBlue',
        categoriaIcone: 'live_tv',
        categoriaTipoTransacao: TipoTransacao.despesa,
      ),
      Categoria(
        id: 7,
        categoriaDescricao: 'Salário',
        categoriaCor: 'green',
        categoriaIcone: 'money',
        categoriaTipoTransacao: TipoTransacao.receita,
      ),
      Categoria(
        id: 8,
        categoriaDescricao: 'Empréstimo',
        categoriaCor: 'lightGreen',
        categoriaIcone: 'account_balance',
        categoriaTipoTransacao: TipoTransacao.receita,
      ),
      Categoria(
        id: 9,
        categoriaDescricao: 'Outras Receitas',
        categoriaCor: 'green',
        categoriaIcone: 'money',
        categoriaTipoTransacao: TipoTransacao.receita,
      ),
    ];
  }
}
