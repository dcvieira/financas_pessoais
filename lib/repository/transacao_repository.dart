import 'package:financas_pessoais/models/tipo_lancamento.dart';
import 'package:financas_pessoais/models/transacao.dart';

import '../models/categorial.dart';

class TransacaoRepository {
  List<Transacao> listarTransacoes() {
    return [
      Transacao(
        descricao: 'Almoço',
        valor: 25,
        tipoTransacao: TipoTransacao.despesa,
        data: DateTime.now(),
        observacao: 'Almoço do dia de trabalho',
        categoria: Categoria(
          id: 1,
          categoriaDescricao: 'Alimentação',
          categoriaCor: 'pink',
          categoriaIcone: 'restaurant',
          categoriaTipoTransacao: TipoTransacao.despesa,
        ),
      ),
      Transacao(
        descricao: 'Curso de Inglês',
        valor: 350,
        tipoTransacao: TipoTransacao.despesa,
        data: DateTime.now(),
        observacao: 'Parcela 5/12 do curso',
        categoria: Categoria(
          id: 3,
          categoriaDescricao: 'Educação',
          categoriaCor: 'indigo',
          categoriaIcone: 'school',
          categoriaTipoTransacao: TipoTransacao.despesa,
        ),
      ),
      Transacao(
        descricao: 'Salário do Mês',
        valor: 350,
        tipoTransacao: TipoTransacao.receita,
        data: DateTime.now(),
        categoria: Categoria(
          id: 7,
          categoriaDescricao: 'Salário',
          categoriaCor: 'green',
          categoriaIcone: 'money',
          categoriaTipoTransacao: TipoTransacao.receita,
        ),
      ),
    ];
  }
}
