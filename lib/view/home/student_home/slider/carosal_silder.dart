// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:vidya_veechi/view/colors/colors.dart';
import 'package:vidya_veechi/view/home/student_home/graph_std/attendance_std_g.dart';
import 'package:vidya_veechi/view/home/student_home/graph_std/exm_std.dart';
import 'package:vidya_veechi/view/home/student_home/graph_std/homework_std_g.dart';
import 'package:vidya_veechi/view/home/student_home/graph_std/project_assignmnt_chart.dart';
import 'package:vidya_veechi/view/widgets/fonts/google_poppins.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return CarouselSlider(
      items: [
        CaroselmageWidget(
          sliderWidget: graphList[0],
          slidertext: 'Homework',
        ),
        CaroselmageWidget(
          sliderWidget: graphList[1],
          slidertext: 'Exam Result',
        ),
        CaroselmageWidget(
          sliderWidget: graphList[2],
          slidertext: 'Attendance',
        ),
        CaroselmageWidget(
          sliderWidget: graphList[3],
          slidertext: 'Assignment & Project',
        ),
      ],
      options: CarouselOptions(
        height: 220.w,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}

class CaroselmageWidget extends StatelessWidget {
  Widget sliderWidget;
  String slidertext;
  CaroselmageWidget({
    required this.sliderWidget,
    required this.slidertext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: sliderWidget,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GooglePoppinsWidgets(
            text: slidertext,
            fontsize: 19.sp,
            color: cblack,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}

final List<Widget> graphList = [
  const HomeWorkGraph(),
  const ExamResultGraph(),
  const AttendanceGraph(),
  const StdProjectAndAssignmnetGraph()
];
