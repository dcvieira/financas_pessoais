import 'package:financas_pessoais/models/tipo_lancamento.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transacao.dart';

class GraficoReceita extends StatefulWidget {
  final List<Transacao> transacoes;
  const GraficoReceita({Key? key, required this.transacoes}) : super(key: key);

  @override
  State<GraficoReceita> createState() => _GraficoReceitaState();
}

class _GraficoReceitaState extends State<GraficoReceita> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIndicator(
                  color: Colors.greenAccent,
                  text: 'Receitas',
                  valorTotal: calcularValorTotal(TipoTransacao.receita),
                ),
                _buildIndicator(
                  color: Colors.redAccent,
                  text: 'Despesas',
                  valorTotal: calcularValorTotal(TipoTransacao.despesa),
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback:
                          (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 60,
                      sections: showingSections()),
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            )
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.greenAccent,
            value: calcularPorcentagem(TipoTransacao.receita),
            title:
                '${calcularPorcentagem(TipoTransacao.receita).toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.redAccent,
            value: calcularPorcentagem(TipoTransacao.despesa),
            title:
                '${calcularPorcentagem(TipoTransacao.despesa).toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }

  Widget _buildIndicator(
      {double size = 20,
      required Color color,
      required String text,
      required double valorTotal}) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              NumberFormat.simpleCurrency(locale: 'pt_BR').format(valorTotal),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black54),
            ),
          ],
        )
      ],
    );
  }

  double calcularPorcentagem(TipoTransacao tipoLancamento) {
    return 10;
  }

  double calcularValorTotal(TipoTransacao tipoLancamento) {
    return 20;
  }
}
