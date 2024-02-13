import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:vidya_veechi/view/colors/colors.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86.h,
      width: 86.w,
      child: Column(
        children: [
          Container(
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
