import 'package:financas_pessoais/components/transacao_list_item.dart';
import 'package:financas_pessoais/models/transacao.dart';
import 'package:financas_pessoais/repository/transacao_repository.dart';
import 'package:flutter/material.dart';

class TransacoesListaPage extends StatefulWidget {
  const TransacoesListaPage({Key? key}) : super(key: key);

  @override
  State<TransacoesListaPage> createState() => _TransacoesListaPageState();
}

class _TransacoesListaPageState extends State<TransacoesListaPage> {
  final _futureTransacoes = TransacaoRepository().listarTransacoes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transações')),
      body: FutureBuilder<List<Transacao>>(
        future: _futureTransacoes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            final transacoes = snapshot.data ?? [];
            return ListView.separated(
              itemCount: transacoes.length,
              itemBuilder: (context, index) {
                final transacao = transacoes[index];
                return TransacaoListItem(transacao: transacao);
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/transacao-cadastro');
          },
          child: const Icon(Icons.add)),
    );
  }
}
