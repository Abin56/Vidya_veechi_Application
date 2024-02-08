import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_application/controllers/userCredentials/user_credentials.dart';
import 'package:dujo_kerala_application/local_database/parent_login_database.dart';
import 'package:dujo_kerala_application/view/colors/colors.dart';
import 'package:dujo_kerala_application/view/constant/sizes/constant.dart';
import 'package:dujo_kerala_application/view/home/parent_home/school_parent_pages/carousel_slider.dart';
import 'package:dujo_kerala_application/view/home/parent_home/school_parent_pages/container_widget.dart';
import 'package:dujo_kerala_application/view/widgets/fonts/google_monstre.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../../controllers/multipile_students/multipile_students_controller.dart';

class ParentProfileHomePage extends StatefulWidget {
  const ParentProfileHomePage({super.key});

  @override
  State<ParentProfileHomePage> createState() => _ParentProfileHomePageState();
}

class _ParentProfileHomePageState extends State<ParentProfileHomePage> {
  MultipileStudentsController multipileStudentsController =
      Get.put(MultipileStudentsController()); 

  String deviceToken = '';

  void getDeviceToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        deviceToken = token ?? 'Not get the token ';
        log("User Device Token :: $token");
      });
      saveDeviceTokenToFireBase(deviceToken);
    });
  }

  void saveDeviceTokenToFireBase(String deviceToken) async {
    await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId)
        .collection('classes')
        .doc(UserCredentialsController.classId)
        .collection('ParentCollection')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({'deviceToken': deviceToken}, SetOptions(merge: true))
        .then((value) => log('Device Token Saved To FIREBASE'))
        .then((value) => FirebaseFirestore.instance
                .collection('PushNotificationToAll')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .set({
              'deviceToken': deviceToken,
              'schoolID': UserCredentialsController.schoolId,
              'batchID': UserCredentialsController.batchId,
              'classID': UserCredentialsController.classId,
              'personID': FirebaseAuth.instance.currentUser!.uid,
              'role': 'Parent'
            }))
        .then((value) => FirebaseFirestore.instance
                .collection('SchoolListCollection')
                .doc(UserCredentialsController.schoolId)
                .collection('PushNotificationList')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .set({
              'deviceToken': deviceToken,
              'batchID': UserCredentialsController.batchId,
              'classID': UserCredentialsController.classId,
              'personID': FirebaseAuth.instance.currentUser!.uid,
              'role': 'Parent'
            }));
  }

// }

  Future<void> sendPushMessage(String token, String body, String title) async {
    try {
      final reponse = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAAd0ScEck:APA91bELuwPRaLXrNxKTwj-z6EK-mCSPOon5WuZZAwkdklLhWvbi_NxXGtwHICE92vUzGJyE9xdOMU_-4ZPbWy8s2MuS_s-4nfcN_rZ1uBTOCMCcJ5aNS7rQHeUTXgYux54-n4eoYclp'
        },
        body: jsonEncode(
          <String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': body,
              'title': title,
            },
            "notification": <String, dynamic>{
              'title': title,
              'body': body,
              'android_channel_id': 'high_importance_channel'
            },
            'to': token,
          },
        ),
      );
      log(reponse.body.toString());
    } catch (e) {
      if (kDebugMode) {
        log("error push Notification");
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDeviceToken();

    //   sendPushMessage( deviceToken, 'Hello Everyone', 'DUJO APP');
  }

  
  @override
  Widget build(BuildContext context) {
    log("Parent DOCID :::::::::::::::::::  ${UserCredentialsController.parentModel?.docid}");
    log("Firebase Auth DOCID :::::::::::::::::::  ${FirebaseAuth.instance.currentUser?.uid}");
    final parentAuth = DBParentLogin(
        parentPassword: ParentPasswordSaver.parentPassword,
        parentEmail: ParentPasswordSaver.parentemailID,
        schoolID: UserCredentialsController.schoolId!,
        batchID: UserCredentialsController.batchId!,
        classID: UserCredentialsController.classId!,
        studentID: UserCredentialsController.parentModel!.studentID!,
        parentID: FirebaseAuth.instance.currentUser!.uid,
        emailID: FirebaseAuth.instance.currentUser!.email ?? "",
        parentDocID: FirebaseAuth.instance.currentUser!.uid);
    multipileStudentsController.checkalreadyexist(
        FirebaseAuth.instance.currentUser!.uid, parentAuth);

    String studentName = '';
  
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 220,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color.fromARGB(255, 130, 192, 243),
                            Color.fromARGB(153, 241, 240, 240),
                            Color.fromARGB(255, 149, 226, 236),
                            Color.fromARGB(99, 214, 212, 212),
                            Color.fromARGB(255, 139, 233, 223)
                          ]),

                      // color: Color.fromARGB(192, 208, 191, 234),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          bottomRight: Radius.circular(45))),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: screenSize.width / 30, top: 20),
                  child: Text(
                    "Welcome...",
                    style: GoogleFonts.abel(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: screenSize.width / 30, top: 50),
                  child: GestureDetector(
                          onTap: () {
                            log(UserCredentialsController
                                .parentModel!.studentID!);
                          },
                          child: SizedBox(
                            width: screenSize.width / 2,
                            child: GoogleMonstserratWidgets(
                              overflow: TextOverflow.ellipsis,
                              text: UserCredentialsController
                                  .parentModel!.parentName!,
                              fontsize: 23.sp,
                              fontWeight: FontWeight.bold,
                              color: cblack,
                            ),
                          ),
                        ),
                ),
                // Padding(
                //   padding:
                //       EdgeInsets.only(left: screenSize.width / 1.4, top: 30),
                //   child: const CircleAvatar(
                //     maxRadius: 40,
                //     backgroundImage: AssetImage('assets/images/IOT.jpg'),
                //   ),
                // ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, top: 130),
                  child:  FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection("SchoolListCollection")
                          .doc(UserCredentialsController.schoolId)
                          .collection("AllStudents")
                          .doc(UserCredentialsController
                                  .parentModel?.studentID ??
                              '')
                          .get(),
                      builder: (context, snap) {
                        if (snap.hasData) {
                          return GoogleMonstserratWidgets(
                            text:
                                'Student : ${snap.data?.data()?['studentName']}',
                            fontsize: 14.5.sp,
                            fontWeight: FontWeight.w500,
                            color: cblack.withOpacity(0.8),
                          );
                        } else {
                          return const Text('');
                        }
                      }),
                ),
                GoogleMonstserratWidgets(
                    text:
                        'email : ${UserCredentialsController.parentModel?.parentEmail ?? ""}',
                    fontsize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: cblack.withOpacity(0.7),
                  ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, top: 150),
                  child: FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('SchoolListCollection')
                          .doc(UserCredentialsController.schoolId)
                          .collection(UserCredentialsController.batchId!)
                          .doc(UserCredentialsController.batchId)
                          .collection('classes')
                          .doc(UserCredentialsController.classId)
                          .get(),
                      builder: (context, snaps) {
                        if (snaps.hasData) {
                          return GoogleMonstserratWidgets(
                            text: 'Class : ${snaps.data?.data()?['className']}',
                            fontsize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: cblack.withOpacity(0.8),
                          );
                        } else {
                          return const Text('');
                        }
                      }),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 40, top: 110),
                //   child: Container(
                //     height: 120,
                //     width: 150,
                //     decoration: const BoxDecoration(
                //         image: DecorationImage(
                //             image: AssetImage('assets/images/company.jpg'))),
                //   ),
                // ),
                Padding(
                  padding:
                      EdgeInsets.only(left: screenSize.width / 7, top: 180),
                  child: const CircleAvatar(
                    maxRadius: 40,
                    backgroundImage: AssetImage('assets/images/company.jpg'),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: screenSize.width / 2.5, top: 180),
                  child: const CircleAvatar(
                    maxRadius: 40,
                    backgroundImage: AssetImage('assets/images/AI.jpg'),
                  ),
                ),
              ],
            ),
            const CarouselSliderWidget(),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: ContainerWidget(
                              icon: Icons.waving_hand,
                              text: ' Attendance',
                              onTap: () {}),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: ContainerWidget(
                              icon: Icons.home_work,
                              text: 'Homework',
                              onTap: () {}),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: ContainerWidget(
                              icon: Icons.assignment_rounded,
                              text: 'Time Table',
                              onTap: () {}),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: ContainerWidget(
                              icon: Icons.person_2,
                              text: 'Teachers',
                              onTap: () {}),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ContainerWidget(
                              icon: Icons.attach_money_rounded,
                              text: 'Fees & Bills',
                              onTap: () {}),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: ContainerWidget(
                              icon: Icons.note_sharp,
                              text: 'Leave Letters',
                              onTap: () {}),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: ContainerWidget(
                              icon: Icons.list_alt,
                              text: 'Exams',
                              onTap: () {}),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ContainerWidget(
                              icon: Icons.add_chart,
                              text: 'Exam Results',
                              onTap: () {}),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: ContainerWidget(
                              icon: Icons.notification_add,
                              text: 'Notices',
                              onTap: () {}),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: ContainerWidget(
                              icon: Icons.event, text: 'Events', onTap: () {}),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ContainerWidget(
                              icon: Icons.meeting_room,
                              text: 'Meetings',
                              onTap: () {}),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: ContainerWidget(
                              icon: Icons.bus_alert,
                              text: 'Bus Route',
                              onTap: () {}),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: ContainerWidget(
                              icon: Icons.class_,
                              text: 'Class Test',
                              onTap: () {}),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ContainerWidget(
                              icon: Icons.view_list,
                              text: 'Monthly Class Test',
                              onTap: () {}),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: ContainerWidget(
                              icon: Icons.library_books,
                              text: 'Library',
                              onTap: () {}),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: ContainerWidget(
                              icon: Icons.food_bank,
                              text: 'Canteen',
                              onTap: () {}),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ContainerWidget(
                              icon: Icons.chat_rounded,
                              text: 'Chats',
                              onTap: () {}),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: ContainerWidget(
                              icon: Icons.import_contacts,
                              text: 'Subjects',
                              onTap: () {}),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )),
      
    );
  }
}
