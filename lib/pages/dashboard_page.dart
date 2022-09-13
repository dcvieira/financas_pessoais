import 'package:financas_pessoais/components/grafico_categorias.dart';
import 'package:financas_pessoais/models/transacao.dart';
import 'package:financas_pessoais/repository/transacao_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  Future<List<Transacao>>? futureTransacoes;

  @override
  void initState() {
    super.initState();
    futureTransacoes = TransacaoRepository().listarTransacoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard'),
      ),
      body: FutureBuilder<List<Transacao>>(
        future: futureTransacoes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            final transacoes = snapshot.data ?? [];
            return SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 8),
                    child: Text(
                      'Valor da Carteira',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    calcularValorTotal(transacoes),
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  String calcularValorTotal(List<Transacao> transacoes) {
    return NumberFormat.simpleCurrency(locale: 'pt_BR').format(100);
  }
}
