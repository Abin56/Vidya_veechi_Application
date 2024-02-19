import 'package:vidya_veechi/view/pages/exam_notification/view_exams.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ExamNotification extends StatelessWidget {
  const ExamNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: () async {
                Get.to(() => const ViewExamsScreen());
              },
              child: const Text('View'))
        ],
      ),
    );
  }
}
