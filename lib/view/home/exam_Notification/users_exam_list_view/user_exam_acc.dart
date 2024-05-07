import 'package:vidya_veechi/view/colors/colors.dart';
import 'package:vidya_veechi/view/home/exam_Notification/users_exam_list_view/public.dart';
import 'package:vidya_veechi/view/home/exam_Notification/users_exam_list_view/state.dart';
import 'package:vidya_veechi/view/widgets/appbar_color/appbar_clr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserExmNotifications extends StatelessWidget {
  const UserExmNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Exams".tr),
          foregroundColor: cWhite,
          flexibleSpace: const AppBarColorWidget(),
          //  backgroundColor: adminePrimayColor,
          // bottom:
          // TabBar(tabs: [
          //   Tab(
          //     text: 'School Level'.tr,
          //   ),
          //   Tab(
          //     text: 'Public Level'.tr,
          //   )
          // ]),
        ),
        body: const SafeArea(child: UserPublicLevel()
            // TabBarView(
            //   children: [UserPublicLevel(), UserStateLevel()],
            // ),
            ),
      ),
    );
  }
}
