import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:vidya_veechi/view/colors/colors.dart';

class NotificationPartOfStd extends StatelessWidget {
  const NotificationPartOfStd({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'NOTIFICATIONS',
              style: TextStyle(
                  color: const Color.fromARGB(255, 48, 88, 86),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 1.h,
                  color: const Color.fromARGB(255, 48, 88, 86).withOpacity(0.1),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 290.h,
          child: ListView.separated(
              // physics:
              //     const NeverScrollableScrollPhysics(),
              // shrinkWrap: false,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: cWhite,
                    radius: 25.sp,
                    child: Center(
                      child: CircleAvatar(
                        radius: 20.sp,
                      ),
                    ),
                  ),
                  title: Text(
                    "Holiday",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 48, 88, 86),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    "Tommorow is Holiday",
                    style: TextStyle(
                      color: Color.fromARGB(255, 48, 88, 86),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox();
              },
              itemCount: 10),
        )
      ],
    );
  }
}
