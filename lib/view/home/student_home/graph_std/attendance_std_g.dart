import 'package:vidya_veechi/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AttendanceGraphOfStudent extends StatelessWidget {
  const AttendanceGraphOfStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
          radiusFactor: 0.9,
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: true,
          interval: 8,
          ticksPosition: ElementsPosition.inside,
          tickOffset: 10,
          majorTickStyle: const MajorTickStyle(color: Colors.red, length: 0.5),
          minorTickStyle: const MinorTickStyle(color: Colors.white),
          axisLineStyle: const AxisLineStyle(
            thickness: 0.3,
            cornerStyle: CornerStyle.bothFlat,
            color: Color.fromARGB(255, 137, 238, 140),
            thicknessUnit: GaugeSizeUnit.factor,
          ),
          pointers: const <GaugePointer>[
            RangePointer(
              color: Colors.blue,
              value: 50,
              cornerStyle: CornerStyle.endCurve,
              width: 0.3,
              sizeUnit: GaugeSizeUnit.factor,
            ),
          ],
          annotations: const <GaugeAnnotation>[
            GaugeAnnotation(
              axisValue: 50,
              positionFactor: 0.2,
              widget: Text(
                '50%',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ])
    ]);
  }
}

class AttendanceGraph extends StatelessWidget {
  const AttendanceGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: cWhite,
      child: const AttendanceGraphOfStudent(),
    );
  }
}
