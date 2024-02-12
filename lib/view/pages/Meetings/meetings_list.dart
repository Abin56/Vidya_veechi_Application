import 'package:vidya_veechi/view/pages/Meetings/Tabs/class_level_meeting_tab.dart';
import 'package:vidya_veechi/view/pages/Meetings/Tabs/school_level_meetings_tab.dart';
import 'package:vidya_veechi/view/widgets/appbar_color/appbar_clr.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';

import '../../colors/colors.dart';

class MeetingList extends StatelessWidget {
  const MeetingList({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meeting List"),
          flexibleSpace: const AppBarColorWidget(),
          foregroundColor: cWhite,
          //  backgroundColor: adminePrimayColor,
          bottom: TabBar(tabs: [
            Tab(
              text: 'Class Level'.tr,
            ),
            Tab(
              text: 'School Level'.tr,
            )
          ]),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              const ClassLevelMeetingPage(),
              SchoolLevelMeetingPage(),
            ],
          ),
        ),
      ),
    );
  }
}
