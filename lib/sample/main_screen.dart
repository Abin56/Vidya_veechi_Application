// import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:vidya_veechi/controllers/userCredentials/user_credentials.dart';
// import 'package:vidya_veechi/sample/sample_homepage.dart';
// import 'package:vidya_veechi/view/colors/colors.dart';
// import 'package:vidya_veechi/view/home/drawer/student_drawer.dart';
// import 'package:vidya_veechi/view/home/exam_Notification/users_exam_list_view/user_exam_acc.dart';
// import 'package:vidya_veechi/view/home/student_home/time_table/ss.dart';
// import 'package:vidya_veechi/view/pages/Attentence/take_attentence/attendence_book_status_month.dart';
// import 'package:vidya_veechi/view/pages/Homework/view_home_work.dart';
// import 'package:vidya_veechi/view/widgets/appbar_color/appbar_clr.dart';
// import 'package:vidya_veechi/view/widgets/icon/icon_widget.dart';

// import '../../../main.dart';

// class SampleMainHomeScreen extends StatefulWidget {
//   // var schoolID;
//   // var classID;
//   // var studentEmailid;
//   const SampleMainHomeScreen({
//     //   required this.schoolID,
//     // required this.classID,
//     // required this.studentEmailid,
//     super.key,
//   });

//   @override
//   State<SampleMainHomeScreen> createState() => _amplesMainHomeScreenState();
// }

// class _amplesMainHomeScreenState extends State<SampleMainHomeScreen> {
// //

//   int _page = 0;

//   onPageChanged(int page) {
//     setState(() {
//       _page = page;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     checkingSchoolActivate(context);
//     List<Widget> pages = [const SampleHome()];
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: const AppBarColorWidget(),
//         foregroundColor: cWhite,
//         title: SizedBox(
//           // color: cred,
//           height: 80.h,
//           width: 115.w,
//           child: Center(
//               child: Image.asset(
//             'assets/images/vidyaveechi.png',
//             color: Colors.black,
//             fit: BoxFit.cover,
//           )),
//         ),
//         //  backgroundColor: adminePrimayColor
//       ),
//       body: pages[_page],
//       bottomNavigationBar: Container(
//         height: 71,
//         decoration: BoxDecoration(
//           // color: Colors.white,
//           borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(0), topRight: Radius.circular(0)),
//           border: Border.all(color: Colors.white.withOpacity(0.13)),
//           color: const Color.fromARGB(255, 92, 180, 132),
//         ),
//         child: GNav(
//           gap: 8,
//           rippleColor: Colors.grey,
//           activeColor: Colors.white,
//           color: Colors.white,
//           tabs: [
//             GButton(
//                 iconSize: 20,
//                 icon: LineIcons.home,
//                 text: 'Home'.tr,
//                 style: GnavStyle.google),
//             GButton(
//               iconSize: 30,
//               textSize: 20,
//               icon: Icons.tv,
//               text: 'Recorded\nClasses'.tr,
//             ),
//             GButton(
//               iconSize: 30,
//               // iconSize: 10,
//               textSize: 20,
//               icon: Icons.laptop,
//               text: 'Live\nClasses'.tr,
//             ),
//             GButton(
//               iconSize: 30,
//               textSize: 20,
//               icon: Icons.chat,
//               text: 'Ask\nDoubt'.tr,
//             )
//           ],
//           selectedIndex: _page,
//           onTabChange: (value) {
//             onPageChanged(value);
//           },
//         ),
//       ),
//       drawer: Drawer(
//         backgroundColor: cblack,
//         child: SingleChildScrollView(
//           child: Column(
            //  children: [   StudentsHeaderDrawer(),
            //   MyDrawerList(context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// viewallMenus() {
//   final screenNavigationOfStd = [
//     AttendenceBookScreenSelectMonth(
//         schoolId: UserCredentialsController.schoolId!,
//         batchId: UserCredentialsController.batchId!,
//         classID: UserCredentialsController.classId!), //Attendence

//     const ViewHomeWorks(), // Home Works

//     const SS(), //Time table

    //   TeacherSubjectWiseList(navValue: 'student'), //Teachers

    //   const StudentChatScreen(), // Chats

    //  // StudentSubjectScreen(), //Subjects/////////<--

    // const UserExmNotifications(), //Exam

    //   UsersSelectExamLevelScreen(
    //       classId: UserCredentialsController.classId!,
    //       studentID:
    //           UserCredentialsController.studentModel!.docid), ////// exam result

    //   NoticePage(), //Notice
    //   const EventList(), //Events

    //   SchoolLevelMeetingPage(), //Meetings
    //   BusRouteListPage(),

    //   AllClassTestPage(
    //     pageNameFrom: "student",
    //   ), //class test page
    //   AllClassTestMonthlyPage(
    //     pageNameFrom: "student",
    //   ),
    // HostelHomePage(),
//   ];
//   Get.bottomSheet(
//       SizedBox(
//         height: double.infinity,
//         width: double.infinity,
//         child: Wrap(
//           children: <Widget>[
//             Column(
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text("All Categories"),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   // crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     ContainerWidget(
//                         icon: 'assets/flaticons/icons8-attendance-100.png',
//                         //  icon: Icons.waving_hand,
//                         text: ' Attendance',
//                         onTap: () {
//                           // print("object");
//                           Get.to(() => screenNavigationOfStd[0]);
//                         }),
//                     ContainerWidget(
//                         icon: 'assets/flaticons/icons8-homework-67.png',
//                         //  icon: Icons.home_work,
//                         text: 'Homework',
//                         onTap: () {
//                           Get.to(() => screenNavigationOfStd[1]);
//                         }),
//                     ContainerWidget(
//                         icon: 'assets/flaticons/study-time.png',
//                         //  icon: Icons.assignment_rounded,
//                         text: 'Time Table',
//                         onTap: () {
//                           Get.to(() => screenNavigationOfStd[2]);
//                         }),
//                   ],
                //),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     ContainerWidget(
                //         icon: 'assets/flaticons/icons8-teacher-100.png',
                //         //  icon: Icons.person_2,
                //         text: 'Teachers',
                //         onTap: () {
                //           Get.to(() => screenNavigationOfStd[3]);
                //         }),
                //     ContainerWidget(
                //         icon: 'assets/flaticons/icons8-chat-100.png',
                //         // icon: Icons.chat_rounded,
                //         text: 'Chats',
                //         onTap: () {
                //           Get.to(() => screenNavigationOfStd[4]);
                //         }),
                //     ContainerWidget(
                //         icon: 'assets/flaticons/icons8-books-48.png',
                //         //  icon: Icons.import_contacts,
                //         text: 'Subjects',
                //         onTap: () {
                //           Get.to(() => screenNavigationOfStd[5]);
                //         }),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     ContainerWidget(
                //         icon: 'assets/flaticons/exam.png',
                //         // icon: Icons.list_alt,
                //         text: 'Exams',
                //         onTap: () {
                //           Get.to(() => screenNavigationOfStd[6]);
                //         }),
                //     ContainerWidget(
                //         icon: 'assets/flaticons/icons8-grades-100.png',
                //         //   icon: Icons.add_chart,
                //         text: 'Exam Results',
                //         onTap: () {
                //           Get.to(() => screenNavigationOfStd[7]);
                //         }),
                //     ContainerWidget(
                //         icon: 'assets/flaticons/icons8-notice-100.png',
                //         //  icon: Icons.notification_add,
                //         text: 'Notices',
                //         onTap: () {
                //           Get.to(() => screenNavigationOfStd[8]);
                //         }),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     ContainerWidget(
                //         icon: 'assets/flaticons/schedule.png',
                //         //   icon: Icons.event,
                //         text: 'Events',
                //         onTap: () {
                //           Get.to(() => screenNavigationOfStd[9]);
                //         }),
                //     ContainerWidget(
                //         icon: 'assets/flaticons/meeting.png',
                //         //  icon: Icons.meeting_room,
                //         text: 'Meetings',
                //         onTap: () {
                //           Get.to(() => screenNavigationOfStd[10]);
                //         }),
                //     ContainerWidget(
                //         icon: 'assets/flaticons/exam (1).png',
                //         //   icon: Icons.class_,
                //         text: 'Class Test',
                //         onTap: () {
                //           Get.to(() => screenNavigationOfStd[12]);
                //         }),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     ContainerWidget(
                //         icon: 'assets/flaticons/test.png',
                //         // icon: Icons.view_list,
                //         text: 'Monthly Class Test',
                //         onTap: () {
                //           Get.to(() => screenNavigationOfStd[13]);
                //         }),
                //   ],
                // ),
//               ],
//             )
//           ],
//         ),
//       ),
//       backgroundColor: Colors.white);
// }

// class ViewAllContainerWidget extends StatelessWidget {
//   const ViewAllContainerWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20, top: 20),
//       child: Container(
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadiusDirectional.all(
//             Radius.circular(10),
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.greenAccent,
//               offset: Offset(
//                 5.0,
//                 5.0,
//               ),
//               blurRadius: 10.0,
//               spreadRadius: 2.0,
//             ), //BoxShadow
//             BoxShadow(
//               color: Colors.white,
//               offset: Offset(0.0, 0.0),
//               blurRadius: 0.0,
//               spreadRadius: 0.0,
//             ),
//           ],
//         ),
//         height: 70,
//         width: 70,
//       ),
//     );
//   }
// }
