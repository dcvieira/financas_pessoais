import 'package:financas_pessoais/models/tipo_lancamento.dart';
import 'package:financas_pessoais/models/transacao.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../util/helper_colors.dart';
import '../util/helper_icons.dart';

class GraficoCategoria extends StatefulWidget {
  final List<Transacao> transacoes;
  const GraficoCategoria({Key? key, required this.transacoes})
      : super(key: key);

  @override
  State<GraficoCategoria> createState() => _GraficoCategoriaState();
}

class _GraficoCategoriaState extends State<GraficoCategoria> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        child: AspectRatio(
          aspectRatio: 1,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              }),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 0,
              centerSpaceRadius: 60,
              sections: showingSections(),
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    List<PieChartSectionData> sections = [];
    var lancamentos = widget.transacoes
        .where((l) => l.tipoTransacao == TipoTransacao.despesa)
        .toList();

    var categorias = lancamentos.map((l) => l.categoria).toSet().toList();

    for (var i = 0; i < categorias.length; i++) {
      final categoria = categorias[i];
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      sections.add(
        PieChartSectionData(
          color: HelperColors.mapColors[categoria.categoriaCor],
          value: calcularPorcentagemPorCategoria(categoria.id),
          title:
              '${calcularPorcentagemPorCategoria(categoria.id).toStringAsFixed(1)}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
          badgeWidget: _Badge(
            HelperIcons.mapIcons[categoria.categoriaIcone]!,
            size: widgetSize,
            borderColor: const Color(0xff0293ee),
          ),
          badgePositionPercentageOffset: .98,
        ),
      );
    }

    return sections;
  }

  double calcularPorcentagemPorCategoria(int categoriaId) {
    var totalDespesas = widget.transacoes
        .where((l) => l.tipoTransacao == TipoTransacao.despesa)
        .map((l) => l.valor)
        .reduce((value, element) => value + element);

    if (totalDespesas == 0) {
      return totalDespesas;
    }

    double totalPorCategoria = widget.transacoes
        .where((l) => l.categoria.id == categoriaId)
        .map((l) => l.valor)
        .reduce((value, element) => value + element);

    double porcentagemCategoria = (totalPorCategoria / totalDespesas) * 100;

    return porcentagemCategoria;
  }
}

class _Badge extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color borderColor;

  const _Badge(
    this.icon, {
    Key? key,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: Icon(icon),
      ),
    );
  }
}
