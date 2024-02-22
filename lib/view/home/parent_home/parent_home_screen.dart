// ignore_for_file: use_key_in_widget_constructors, must_call_super, annotate_overrides, non_constant_identifier_names
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vidya_veechi/controllers/userCredentials/user_credentials.dart';
import 'package:vidya_veechi/local_database/parent_login_database.dart';
import 'package:vidya_veechi/view/colors/colors.dart';
import 'package:vidya_veechi/view/constant/sizes/constant.dart';
import 'package:vidya_veechi/view/home/all_class_test_monthly_show/all_class_list_monthly_show.dart';
import 'package:vidya_veechi/view/home/all_class_test_show/all_class_list_show.dart';
import 'package:vidya_veechi/view/home/events/event_list.dart';
import 'package:vidya_veechi/view/home/exam_Notification/users_exam_list_view/user_exam_acc.dart';
import 'package:vidya_veechi/view/home/parent_home/leave_application/apply_leave_application.dart';
import 'package:vidya_veechi/view/home/parent_home/parent%20home%20widget/parent_carosel_widget.dart';
import 'package:vidya_veechi/view/home/parent_home/parent%20home%20widget/parent_name_widget.dart';
import 'package:vidya_veechi/view/home/parent_home/parent%20home%20widget/parent_view_all_categories.dart';
import 'package:vidya_veechi/view/home/parent_home/parent%20home%20widget/qucik_action.dart';
import 'package:vidya_veechi/view/home/student_home/time_table/ss.dart';
import 'package:vidya_veechi/view/pages/Attentence/take_attentence/attendence_book_status_month.dart';
import 'package:vidya_veechi/view/pages/Homework/view_home_work.dart';
import 'package:vidya_veechi/view/pages/Meetings/Tabs/school_level_meetings_tab.dart';
import 'package:vidya_veechi/view/pages/Notice/notice_list.dart';
import 'package:vidya_veechi/view/pages/Subject/subject_display.dart';
import 'package:vidya_veechi/view/pages/chat/parent_section/parent_chat_screeen.dart';
import 'package:vidya_veechi/view/pages/exam_results/for_users/select_examlevel_uses.dart';
import 'package:vidya_veechi/view/pages/teacher_list/teacher_list.dart';
import 'package:vidya_veechi/view/widgets/icon/icon_widget.dart';

import '../../../controllers/multipile_students/multipile_students_controller.dart';

class ParentHomeScreen extends StatefulWidget {
    const ParentHomeScreen({super.key, required this.studentName});
  @override
  final String studentName;
  
  State<ParentHomeScreen> createState() => _ParentHomeScreenState();
}

class _ParentHomeScreenState extends State<ParentHomeScreen> {
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
              'key=AAAAT5j1j9A:APA91bFcF5EBAVJGG-vU-ybkkpPQSw2y-a95cAsKTokuRYEeco9CU2NoFPL6ceQRZsMXYHoBmsRIEZTDrs-aY0CseLYQwgdSytHnajpDA0s4ZVJjlAJLI7IL-uhqgCqESvEeMsExmmBK'
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

  
  
     List<Widget> screenNav=[AttendenceBookScreenSelectMonth(
          schoolId: UserCredentialsController.schoolId!,
          batchId: UserCredentialsController.batchId!,
          classID: UserCredentialsController.classId!),///////////////////Attendance 0

           const ViewHomeWorks(), // Home Works...............1
               const UserExmNotifications(), // Exams...........2
               const ParentChatScreen(),/////......3
               
          
          ];
    return Scaffold(
      body: SafeArea(
        child:
        SingleChildScrollView(
      child: Stack(
        children: [
          ParentViewAllCategories(
            onTap: () {
              viewallMenus();
            },
          ),
          const ParentCaroselWidget(),
          const ParentNameWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 400, left: 40),
            child: Row(
              children: [
                QuickActionsWidget(
                  text: quicktext[0],
                  image: image[0], onTap:(){Get.to(screenNav[0]) ;}
                ),
                QuickActionsWidget(
                  text: quicktext[1],
                  image: image[1], onTap:(){Get.to(screenNav[1]);} ,
                ),
                QuickActionsWidget(
                  text: quicktext[2],
                  image: image[2], onTap:(){Get.to(screenNav[2]);} ,
                ),
                QuickActionsWidget(
                  text: quicktext[3],
                  image: image[3], onTap: (){Get.to(screenNav[3]);},
                ),
              ],
            )
          ),
        ],
      ),
    )
       
      ),
    );
  }
  viewallMenus() {
    final screenNavigationOfParent = [
      AttendenceBookScreenSelectMonth(
          schoolId: UserCredentialsController.schoolId!,
          batchId: UserCredentialsController.batchId!,
          classID: UserCredentialsController.classId!), //Attendence...0

          const ViewHomeWorks(), // Home Works...............1
           const SS(), // Time Table...........2
           TeacherSubjectWiseList(
          navValue: 'parent'), //Teachers.................3
          StudentSubjectScreen(), //Subjects...............4
          LeaveApplicationScreen(
          studentName: widget.studentName,
          guardianName: UserCredentialsController.parentModel!.parentName!,
          classID: UserCredentialsController.classId!,
          schoolId: UserCredentialsController.schoolId!,
          studentID: UserCredentialsController.parentModel!.studentID!,
          batchId: UserCredentialsController.batchId!), //Leave Letter////...5
          const UserExmNotifications(), // Exams...........6
          UsersSelectExamLevelScreen(
          classId: UserCredentialsController.classId!,
          studentID: UserCredentialsController
              .parentModel!.studentID!), ////// exam result............7
              NoticePage(), //Notice.........8
              const EventList(), //Events.................9
              SchoolLevelMeetingPage(),////////////////////////////10

                const ParentChatScreen(),/////......11
                 AllClassTestPage(
        pageNameFrom: "parent",
      ), //class test page////////////////////////////12
      AllClassTestMonthlyPage(
        pageNameFrom: "parent",
      ), //////////////13
              
      

     

    ];

    Get.bottomSheet(
        SingleChildScrollView(
          child: SizedBox(
            height: 800,
            width: double.infinity,
            child: Wrap(
              children: <Widget>[
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text("All Categories"),
                    ),
                     SingleChildScrollView(
                       child: SizedBox(
                        height: 400,
                         child: GridView.count(
                           padding: const EdgeInsets.all(10),
                           crossAxisCount: 3,
                           crossAxisSpacing: 20,
                           mainAxisSpacing: 20,
                           children: List.generate(
                             14,
                             (index) => Container(
                               decoration: BoxDecoration(
                                 color: cWhite,
                                 borderRadius: BorderRadius.circular(20),
                               ),
                               height: 60,
                         
                               // ignore: sort_child_properties_last
                               child: Padding(
                                 padding:
                                     const EdgeInsets.only(left: 20, top: 10, right: 20),
                                // child: SingleChildScrollView(
                                   child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         ContainerWidget(
                                           icon: img[index],
                                           //icon: Icons.view_list,
                                           text: text[index], onTap: () { Get.to(screenNavigationOfParent[index]); },
                                         ),
                                       ]),
                                // ),//
                               ),
                         
                               // GooglePoppinsWidgets(text: "Subject", fontsize: 16),
                               // kHeight10,
                             ),
                           ),
                         ),
                       ),
                     ),
                    // const SizedBox(height: 20,)
                  ],
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white);
  } 
}

List<String> quicktext = ['Attendence', 'Home work', 'Exam', 'Chat'];
List<String> image = [
  'assets/flaticons/icons8-attendance-100.png',
  'assets/flaticons/icons8-homework-100.png',
  'assets/flaticons/icons8-books-48.png',
  'assets/flaticons/icons8-chat-100.png'
];


List<String> img = [
  'assets/flaticons/icons8-attendance-100.png',
  'assets/flaticons/icons8-homework-67.png',
  'assets/flaticons/study-time.png',
  'assets/flaticons/icons8-teacher-100.png',
  'assets/flaticons/icons8-books-48.png',
  'assets/flaticons/leave_letter.png',
  'assets/flaticons/exam.png',
  'assets/flaticons/icons8-grades-100.png',
  'assets/flaticons/icons8-notice-100.png',
  'assets/flaticons/schedule.png',
  'assets/flaticons/meeting.png',
  'assets/flaticons/icons8-chat-100.png',
  'assets/flaticons/exam (1).png',
  'assets/flaticons/test.png',
];
List <String> text=[
  'Attendance',
  'Homework',
   'Time Table',
   'Teachers',
   'Subjects',
    'Leave Letters',
     'Exams',
     'Exam Results',
     'Notices',
     'Events',
     'Meetings',
     'Chats',
     'Class Test',
     'Monthly Class Test',
];

