import 'package:financas_pessoais/models/tipo_lancamento.dart';

class Categoria {
  int id;
  String categoriaDescricao;
  String categoriaCor;
  String categoriaIcone;
  TipoTransacao categoriaTipoTransacao;

  Categoria({
    required this.id,
    required this.categoriaDescricao,
    required this.categoriaCor,
    required this.categoriaIcone,
    required this.categoriaTipoTransacao,
  });
}
