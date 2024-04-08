// ignore_for_file: use_key_in_widget_constructors, must_call_super, annotate_overrides, non_constant_identifier_names
import 'package:get/get.dart';
import 'package:vidya_veechi/controllers/attendence_controller/attendence_controller.dart';
import 'package:vidya_veechi/controllers/push_notification_controller/push_notification_controller.dart';
import 'package:vidya_veechi/controllers/userCredentials/user_credentials.dart';
import 'package:vidya_veechi/view/colors/colors.dart';
import 'package:vidya_veechi/view/home/teachers_home/teacher_classes_list.dart';
import 'package:vidya_veechi/view/widgets/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';

import '../student_home/Student Edit Profile/teacher_edit_profile.dart';

class TeacherHomeScreen extends StatefulWidget {
  final PushNotificationController pushNotificationController =
      Get.put(PushNotificationController());
  final AttendanceController attendanceController =
      Get.put(AttendanceController());
  static String routeName = '';

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  @override
  void initState() {
    widget.pushNotificationController.getUserDeviceID().then((value) async =>
        await widget.pushNotificationController.allTeacherDeviceID().then(
            (value) async =>
                await widget.pushNotificationController.allUSerDeviceID(UserCredentialsController.teacherModel!.userRole)));
    super.initState();
  }

  Widget build(BuildContext context) {
    widget.attendanceController.sendPushMessage(
        'fcVt5-k8QgaQSsATPUlGMs:APA91bFo3C_zQ9ejHQka-UAN2Mvtsyu0kW9oqQniDMPPSRVRbyTqsqmq0TJxAyyBsHXuOCs9-d9410Tr5Xw-eK2DAilvqXzWjbhKQgQi_TQYU0YpKeq074eE_ZTSgncXdeEJxegRvvUy',
        "body",
        "title");
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: cgraident,
              width: double.infinity,
              height: screenSize.width * 0.5,
              padding: EdgeInsets.all(15.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: screenSize.width / 2,
                          child: GoogleMonstserratWidgets(
                            overflow: TextOverflow.ellipsis,
                            text: UserCredentialsController
                                    .teacherModel?.teacherName ??
                                "",
                            fontsize: 23.sp,
                            fontWeight: FontWeight.bold,
                            color: cWhite,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const TeacherEditProfileScreen();
                              },
                            ));
                            // Get.off(() => const TeacherEditProfileScreen());
                          },
                          child: Container(
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      UserCredentialsController
                                              .teacherModel?.imageUrl ??
                                          ""),
                                  radius: 50,
                                ),
                                const Positioned(
                                  right: 6,
                                  bottom: 1,
                                  child: Center(
                                      child: Icon(
                                    Icons.info,
                                    color: cWhite,
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GoogleMonstserratWidgets(
                    text:
                        'Employee IDd : ${UserCredentialsController.teacherModel?.employeeID ?? ""}',
                    fontsize: 14.5.sp,
                    fontWeight: FontWeight.w500,
                    color: cWhite.withOpacity(0.8),
                  ),
                  GoogleMonstserratWidgets(
                    text:
                        'email : ${UserCredentialsController.teacherModel?.teacherEmail ?? ""}',
                    fontsize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: cWhite.withOpacity(0.7),
                  ),
                ],
              ),
            ),
            TeacherClassListView(),
          ],
        ),
      ),
    );
  }
}

Widget MenuItem(int id, String image, String title, bool selected, onTap) {
  return Material(
    color: Colors.white,
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(image))),
              ),
            ),
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ))
          ],
        ),
      ),
    ),
  );
}
