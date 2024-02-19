import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vidya_veechi/view/colors/colors.dart';
import 'package:vidya_veechi/view/home/class_teacher_HOme/graph_class_teacher/assignmentGraph.dart';
import 'package:vidya_veechi/view/home/class_teacher_HOme/graph_class_teacher/attendenceGraph.dart';
import 'package:vidya_veechi/view/home/class_teacher_HOme/graph_class_teacher/exam.dart';
import 'package:vidya_veechi/view/home/class_teacher_HOme/graph_class_teacher/projectGraph.dart';
import 'package:vidya_veechi/view/home/events/event_display_school_level.dart';

viewExamGraph() {
  Get.bottomSheet(
      backgroundColor: cWhite,
      Container(
        color: cWhite,
        height: double.infinity,
        width: double.infinity,
        child: Wrap(
          children: <Widget>[
            Column(
              children: [
                Column(
                  children: [
                    GooglePoppinsEventsWidgets(text: "Exam", fontsize: 30),
                    SizedBox(
                      height: 500,
                      width: double.infinity,
                      child: ExamGraphClassTeacher(),
                    ),
                  ],
                ),
                const Text(
                  "Exam",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ));
}

viewAttenceGraphn() {
  Get.bottomSheet(
      backgroundColor: cWhite,
      Container(
        color: cWhite,
        height: double.infinity,
        width: double.infinity,
        child: Wrap(
          children: <Widget>[
            Column(
              children: [
                GooglePoppinsEventsWidgets(text: "text", fontsize: 15),
                const SizedBox(
                  height: 500,
                  width: double.infinity,
                  child: PrjectClassThrGraph(),
                ),
              ],
            ),
          ],
        ),
      ));
}

viewAssignmenctGraph() {
  Get.bottomSheet(SizedBox(
    height: double.infinity,
    width: double.infinity,
    child: Wrap(
      children: <Widget>[
        Column(
          children: [
            SizedBox(
              height: 500,
              width: double.infinity,
              child: AssignmentGraphClassTeacher(),
            ),
          ],
        ),
      ],
    ),
  ));
}

viewProjectGraph() {
  Get.bottomSheet(Container(
    color: cWhite,
    height: double.infinity,
    width: double.infinity,
    child: Wrap(
      children: <Widget>[
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 0,
              ),
              child: GooglePoppinsEventsWidgets(
                  text: "Attendence",
                  fontsize: 22,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 300,
              width: double.infinity,
              child: AttendenceClassThrGraph(),
            ),
          ],
        ),
      ],
    ),
  ));
}
