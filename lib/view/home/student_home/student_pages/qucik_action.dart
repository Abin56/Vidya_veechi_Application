import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidya_veechi/controllers/userCredentials/user_credentials.dart';
import 'package:vidya_veechi/view/colors/colors.dart';
import 'package:vidya_veechi/view/home/student_home/time_table/ss.dart';
import 'package:vidya_veechi/view/pages/Attentence/take_attentence/attendence_book_status_month.dart';
import 'package:vidya_veechi/view/pages/Homework/view_home_work.dart';
import 'package:vidya_veechi/view/pages/chat/student_section/student_chat_screen.dart';

class QuickActionsWidgetAttendance extends StatelessWidget {
  const QuickActionsWidgetAttendance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86.h,
      width: 86.w,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Get.off(
              () => AttendenceBookScreenSelectMonth(
                  schoolId: UserCredentialsController.schoolId!,
                  batchId: UserCredentialsController.batchId!,
                  classID: UserCredentialsController.classId!),
            ),
            child: Container(
              height: 55.h,
              width: 55.w,
              decoration: BoxDecoration(
                  color: cWhite,
                  border: Border.all(color: cblack.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                'assets/flaticons/icons8-attendance-100.png',
                scale: 2.5,
              ),
            ),
          ),
          Text(
            "Attendence",
            style: TextStyle(fontSize: 12.sp),
          )
        ],
      ),
    );
  }
}

List<String> quicktext = ['Attendence', 'Home work', 'Exam', 'Chat'];

class QuickActionsWidgetHW extends StatelessWidget {
  const QuickActionsWidgetHW({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86.h,
      width: 86.w,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Get.off(
              () => const ViewHomeWorks(),
            ),
            child: Container(
              height: 55.h,
              width: 55.w,
              decoration: BoxDecoration(
                  color: cWhite,
                  border: Border.all(color: cblack.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                'assets/flaticons/icons8-homework-67.png',
                scale: 2.5,
              ),
            ),
          ),
          Text(
            "Homework",
            style: TextStyle(fontSize: 12.sp),
          )
        ],
      ),
    );
  }
}

class QuickActionsWidgetTT extends StatelessWidget {
  const QuickActionsWidgetTT({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86.h,
      width: 86.w,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Get.off(() => const SS()),
            child: Container(
              height: 55.h,
              width: 55.w,
              decoration: BoxDecoration(
                  color: cWhite,
                  border: Border.all(color: cblack.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                'assets/flaticons/study-time.png',
                scale: 2.5,
              ),
            ),
          ),
          Text(
            "TimeTable",
            style: TextStyle(fontSize: 12.sp),
          )
        ],
      ),
    );
  }
}

class QuickActionsWidgetChat extends StatelessWidget {
  const QuickActionsWidgetChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86.h,
      width: 86.w,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Get.off(
              () => const StudentChatScreen(),
            ),
            child: Container(
              height: 55.h,
              width: 55.w,
              decoration: BoxDecoration(
                  color: cWhite,
                  border: Border.all(color: cblack.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                'assets/flaticons/icons8-chat-100.png',
                scale: 2.5,
              ),
            ),
          ),
          Text(
            "Chat",
            style: TextStyle(fontSize: 12.sp),
          )
        ],
      ),
    );
  }
}
