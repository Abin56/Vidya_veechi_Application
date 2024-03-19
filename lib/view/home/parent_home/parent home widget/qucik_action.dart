import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidya_veechi/controllers/userCredentials/user_credentials.dart';
import 'package:vidya_veechi/view/colors/colors.dart';
import 'package:vidya_veechi/view/home/events/event_display_school_level.dart';
import 'package:vidya_veechi/view/home/exam_Notification/users_exam_list_view/user_exam_acc.dart';
import 'package:vidya_veechi/view/pages/Attentence/take_attentence/attendence_book_status_month.dart';
import 'package:vidya_veechi/view/pages/Homework/view_home_work.dart';
import 'package:vidya_veechi/view/pages/chat/parent_section/parent_chat_screeen.dart';

class QuickActionsWidget extends StatelessWidget {
  String text;
  String image;
  Function onTap;
   QuickActionsWidget({
    required this.text,
    required this.image,
    required this.onTap,

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
           onTap: onTap as void Function()? ,
            child: Container(
              height: 55.h,
              width: 55.w,
              decoration: BoxDecoration(
                  color: cWhite,
                  border: Border.all(color: cblack.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                image,
                scale: 2.5,
              ),
            ),
          ),
          GooglePoppinsEventsWidgets(text:text , fontsize: 12,)
        ],
      ),
    );
  }
}

List<String> quicktext = ['Attendence', 'Home work', 'Exam', 'Chat'];


