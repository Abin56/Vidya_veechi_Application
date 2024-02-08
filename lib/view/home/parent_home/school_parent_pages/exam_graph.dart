// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/material.dart';

// class ExamGraph extends StatelessWidget {
//   const ExamGraph({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // title: 'Exam Details',
//       home: Scaffold(
//         appBar: AppBar(
//             // title: const Text('Exams'),
//             ),
//         body: Center(
//           child: SizedBox(
//             height: 200,
//             width: 400,
//             child: _buildChart(),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildChart() {
//     final data = [
//       LinearSales("SUB 1", 100),
//       LinearSales("SUB 2", 75),
//       LinearSales("SUB 3", 50),
//       LinearSales("SUB 4", 25),
//       LinearSales("SUB 5", 45),
//       LinearSales("SUB 6", 35),
//       LinearSales("SUB 7", 65),
//       LinearSales("SUB 8", 55),
//     ];
//     final chart = charts.BarChart(
//       [
//         charts.Series<LinearSales, String>(
//           id: 'EXAM RESULT',
//           colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//           domainFn: (LinearSales exams, _) => exams.subject,
//           measureFn: (LinearSales exams, _) => exams.term,
//           data: data,
//         ),
//       ],
//       animate: true,
//     );
//     return chart;
//   }
// }

// class LinearSales {
//   final String subject;
//   final int term;
//   LinearSales(this.subject, this.term);
// }

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExamGraph extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ExamGraph({Key? key}) : super(key: key);

  @override
  ExamGraphState createState() => ExamGraphState();
}

class ExamGraphState extends State<ExamGraph> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('SUB 1', 32),
      _ChartData('SUB 2', 15),
      _ChartData('SUB 3', 30),
      _ChartData('SUB 4', 20),
      _ChartData('SUB 5', 14),
      _ChartData('SUB 6', 45),
      _ChartData('SUB 7', 65),
      _ChartData('SUB 8', 50)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Syncfusion Flutter chart'),
        // ),
        body: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 100, interval: 50),
            tooltipBehavior: _tooltip,
            series: <CartesianSeries<_ChartData, String>>[
          ColumnSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              name: 'Gold',
              color: const Color.fromRGBO(8, 142, 255, 1))
        ]));
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
