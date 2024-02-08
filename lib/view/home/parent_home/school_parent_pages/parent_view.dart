// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// /// Local imports

// class ParentViewGraph extends StatelessWidget {
//   const ParentViewGraph({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<ChartData> chartData = [
//       ChartData('David', 25),
//       ChartData('Steve', 38),
//       ChartData('Jack', 34),
//       ChartData('Others', 52)
//     ];
//     return Scaffold(
//         body: SafeArea(
//       child: Column(
//         children: [
//           Row(
//             children: [
//               SfCircularChart(series: <CircularSeries>[
//                 // Render pie chart
//                 PieSeries<ChartData, String>(
//                     dataSource: chartData,
//                     pointColorMapper: (ChartData data, _) => data.color,
//                     xValueMapper: (ChartData data, _) => data.x,
//                     yValueMapper: (ChartData data, _) => data.y)
//               ]),
//             ],
//           )
//         ],
//       ),
//     ));
//   }
// }

// class ChartData {
//   ChartData(this.x, this.y, [this.color]);
//   final String x;
//   final double y;
//   final Color? color;
// }

// /// Package import

// //

// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// /// Bar chart example
// ///
// /// ***********************************
// ///
// ///
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/material.dart';

// class ExamGraph extends StatelessWidget {
//   const ExamGraph({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Exam Details',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Exams'),
//         ),
//         body: Center(
//           child: SizedBox(
//             height: 200,
//             child: _buildChart(),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildChart() {
//     final data = [
//       LinearSales("Jan", 100),
//       LinearSales("Feb", 75),
//       LinearSales("Mar", 50),
//       LinearSales("Apr", 25),
//       LinearSales("may", 45),
//       LinearSales("jun", 35),
//       LinearSales("jul", 65),
//       LinearSales("aug", 55),
//     ];
//     final chart = charts.BarChart(
//       [
//         charts.Series<LinearSales, String>(
//           id: 'EXAM',
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



// ******************************************
///*****************************

// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';

// class RadialGaugeGraph extends StatelessWidget {
//   const RadialGaugeGraph({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(title: const Text("Projects")),
//             body: Center(
//                 child: Container(
//                     child: SfRadialGauge(axes: <RadialAxis>[
//               RadialAxis(minimum: 0, maximum: 100, ranges: <GaugeRange>[
//                 GaugeRange(
//                     startValue: 0,
//                     endValue: 50,
//                     color: Colors.green,
//                     startWidth: 10,
//                     endWidth: 10),
//                 GaugeRange(
//                     startValue: 50,
//                     endValue: 100,
//                     color: Colors.orange,
//                     startWidth: 10,
//                     endWidth: 10),
//                 // GaugeRange(startValue: 100,endValue: 150,color: Colors.red,startWidth: 10,endWidth: 10)
//               ], pointers: const <GaugePointer>[
//                 NeedlePointer(value: 55)
//               ], annotations: <GaugeAnnotation>[
//                 GaugeAnnotation(
//                     widget: Container(
//                         child: const Text('55.0',
//                             style: TextStyle(
//                                 fontSize: 25, fontWeight: FontWeight.bold))),
//                     angle: 90,
//                     positionFactor: 0.5)
//               ])
//             ])))));
//   }
// }




// *****************************

// class RadialGaugeGraph1 extends StatelessWidget {
//   const RadialGaugeGraph1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Assignmet")),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 250,
//             child: Stack(
//               children: [
//                 PieChart(
//                   PieChartData(
//                     startDegreeOffset: 250,
//                     sectionsSpace: 0,
//                     centerSpaceRadius: 100,
//                     sections: [
//                       PieChartSectionData(
//                         value: 45,
//                         color: Colors.greenAccent,
//                         radius: 25,
//                         showTitle: false,
//                       ),
//                       PieChartSectionData(
//                         value: 35,
//                         color: Colors.blue.shade900,
//                         radius: 25,
//                         showTitle: false,
//                       ),
//                       PieChartSectionData(
//                         value: 20,
//                         color: Colors.grey.shade400,
//                         radius: 20,
//                         showTitle: false,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned.fill(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: 160,
//                         width: 160,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.shade200,
//                               blurRadius: 10.0,
//                               spreadRadius: 10.0,
//                               offset: const Offset(3.0, 3.0),
//                             ),
//                           ],
//                         ),
//                         child: const Center(
//                           child: Text(
//                             "10/10",
//                             style: TextStyle(fontSize: 20),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
// 
// *********************************************


