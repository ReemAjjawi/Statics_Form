import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notification/config/color.dart';
import 'package:my_notification/models/question_model.dart';
import 'package:my_notification/providers/insert_provider.dart';
import 'package:fl_chart/fl_chart.dart';

class Static extends ConsumerWidget {
  final String type;

  Static({required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionsAsyncValue = ref.watch(staticProvider(type));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
      ),
      body: questionsAsyncValue.when(
        data: (questions) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height/1.5,
                                width: MediaQuery.of(context).size.width/1.2,

                child: BarChart(
                  BarChartData(
                    barGroups: _createBarGroups(questions),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            final questionIndex = value.toInt();
                            if (questionIndex < 0 || questionIndex >= questions.length) {
                              return const SizedBox.shrink();
                            }
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              space: 8.0, // Adjust as needed
                              child: Container(height: 15,
                                child: Text(questions[questionIndex].id.toString())),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  List<BarChartGroupData> _createBarGroups(List<Forms> questions) {
    return questions.asMap().entries.map((entry) {
      final index = entry.key;
      final question = entry.value;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: question.id_of_users!.length.toDouble(),
            color: AppColor.primary,
          ),
        ],
      );
    }).toList();
  }
}
