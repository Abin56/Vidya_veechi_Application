// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:get/get.dart';
// import 'package:vidya_veechi/controllers/log_out/user_logout_controller.dart';
// import 'package:vidya_veechi/controllers/userCredentials/user_credentials.dart';
// import 'package:vidya_veechi/sample/qucik_action.dart';
// import 'package:vidya_veechi/view/colors/colors.dart';
// import 'package:vidya_veechi/view/home/bus_route_page/all_bus_list.dart';
// import 'package:vidya_veechi/view/home/class_teacher_HOme/class_teacher_new_homepage.dart';
// import 'package:vidya_veechi/view/home/class_teacher_HOme/leave_letters/leave_lettersList.dart';
// import 'package:vidya_veechi/view/home/class_teacher_HOme/my_students/my_students.dart';
// import 'package:vidya_veechi/view/home/drawer/student_drawer.dart';
// import 'package:vidya_veechi/view/home/events/event_display_school_level.dart';
// import 'package:vidya_veechi/view/home/events/event_list.dart';
// import 'package:vidya_veechi/view/home/exam_Notification/teacher_adding/add_subject.dart';
// import 'package:vidya_veechi/view/home/student_home/graph_std/attendance_std_g.dart';
// import 'package:vidya_veechi/view/home/student_home/slider/carosal_silder.dart';
// import 'package:vidya_veechi/view/home/student_home/student_home.dart';
// import 'package:vidya_veechi/view/home/student_home/student_new_homepage.dart';
// import 'package:vidya_veechi/view/home/student_home/subjects/subject_display.dart';
// import 'package:vidya_veechi/view/home/student_home/time_table/ss.dart';
// import 'package:vidya_veechi/view/pages/Attentence/select_period.dart';
// import 'package:vidya_veechi/view/pages/Attentence/take_attentence/attendence_book_status_month.dart';
// import 'package:vidya_veechi/view/pages/Homework/homework.dart';
// import 'package:vidya_veechi/view/pages/Meetings/Tabs/school_level_meetings_tab.dart';
// import 'package:vidya_veechi/view/pages/Notice/notice_list.dart';
// import 'package:vidya_veechi/view/pages/chat/teacher_section/teacher_chat-screen.dart';
// import 'package:vidya_veechi/view/pages/live_classes/students_room/list_room.dart';
// import 'package:vidya_veechi/view/pages/teacher_list/teacher_list.dart';
// import 'package:vidya_veechi/view/widgets/appbar_color/appbar_clr.dart';
// import 'package:flutter/material.dart';
// import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
// import 'package:get/get_utils/get_utils.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:vidya_veechi/view/widgets/fonts/google_poppins.dart';
// import 'package:vidya_veechi/view/widgets/icon/icon_widget.dart';

// import '../../../main.dart';
// import '../view/home/student_home/graph_std/homework_std_g.dart';

// class SampleMainHomeScreen extends StatefulWidget {
//   // var schoolID;
//   // var classID;
//   // var studentEmailid;
//   const SampleMainHomeScreen(
//       {
//       //   required this.schoolID,
//       // required this.classID,
//       // required this.studentEmailid,
//       super.key});

//   @override
//   State<SampleMainHomeScreen> createState() => _amplesMainHomeScreenState();
// }

// class _amplesMainHomeScreenState extends State<SampleMainHomeScreen> {
//   UserLogOutController userLogOutController = Get.put(UserLogOutController());
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
//             children: [
//               const StudentsHeaderDrawer(),
//               MyDrawerList(context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SampleHome extends StatelessWidget {
//   const SampleHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 244, 244, 244),
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(top: 160.sp),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 218, 247, 229),
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(15.sp),
//                       topRight: Radius.circular(15.sp)),
//                 ),
//                 child: ListView(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(
//                           top: 120.sp, right: 20.sp, left: 20.sp),
//                       child: Container(
//                         height: 100.h,
//                         decoration: BoxDecoration(
//                             border: Border.all(color: cblack.withOpacity(0.1)),
//                             color: const Color.fromARGB(255, 218, 247, 229),
//                             borderRadius: BorderRadius.circular(20.sp)),
//                         child: Padding(
//                           padding: EdgeInsets.all(10.sp),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'QUICK ACTIONS',
//                                 style: TextStyle(
//                                     color:
//                                         const Color.fromARGB(255, 48, 88, 86),
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               const Spacer(),
//                               GestureDetector(
//                                 onTap: () {
//                                   viewallMenus();
//                                 },
//                                 child: Text(
//                                   "View all",
//                                   style:
//                                       TextStyle(color: cblack.withOpacity(0.8)),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           top: 80.sp, right: 20.sp, left: 20.sp),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 'NOTIFICATIONS',
//                                 style: TextStyle(
//                                     color:
//                                         const Color.fromARGB(255, 48, 88, 86),
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Container(
//                                     height: 1.h,
//                                     color: const Color.fromARGB(255, 48, 88, 86)
//                                         .withOpacity(0.1),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 290.h,
//                             child: ListView.separated(
//                                 // physics:
//                                 //     const NeverScrollableScrollPhysics(),
//                                 // shrinkWrap: false,
//                                 itemBuilder: (context, index) {
//                                   return ListTile(
//                                     leading: CircleAvatar(
//                                       backgroundColor: cWhite,
//                                       radius: 25.sp,
//                                       child: Center(
//                                         child: CircleAvatar(
//                                           radius: 20.sp,
//                                         ),
//                                       ),
//                                     ),
//                                     title: Text(
//                                       "Holiday",
//                                       style: TextStyle(
//                                           color: const Color.fromARGB(
//                                               255, 48, 88, 86),
//                                           fontSize: 18.sp,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     subtitle: const Text(
//                                       "Tommorow is Holiday",
//                                       style: TextStyle(
//                                         color: Color.fromARGB(255, 48, 88, 86),
//                                       ),
//                                     ),
//                                   );
//                                 },
//                                 separatorBuilder: (context, index) {
//                                   return const SizedBox();
//                                 },
//                                 itemCount: 10),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),

//                 // child: const Column(
//                 //   children: [],
//                 // ),
//               ),
//             ),
//             //................................>>>>>>>>>>>>>>>>>>>>>>>>>>>Carosal slider>>>>>>>>>>>>>>>>>>>>>>
//             Padding(
//               padding: const EdgeInsets.only(top: 80, right: 10, left: 10),
//               child: Center(
//                 child: Container(
//                   height: 200.h,
//                   width: 350.w,
//                   decoration: const BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: cblack,
//                         ),
//                       ],
//                       color: cWhite,
//                       borderRadius: BorderRadius.all(Radius.circular(20))),
//                   child: CarouselSlider(
//                     items: [
//                       CaroselWidget(
//                           sliderImagePath: imagesList[0], slidertext: "Exam"),
//                       CaroselWidget(
//                           sliderImagePath: imagesList[1],
//                           slidertext: "Attendence"),
//                       CaroselWidget(
//                           sliderImagePath: imagesList[2],
//                           slidertext: "Project"),
//                       CaroselWidget(
//                           sliderImagePath: imagesList[3],
//                           slidertext: "Assignment")
//                     ],
//                     options: CarouselOptions(
//                       // aspectRatio: 1,
//                       autoPlay: true,
//                       enlargeCenterPage: true,
//                       height: 230,

//                       aspectRatio: 16 / 9,
//                       autoPlayCurve: Curves.fastOutSlowIn,
//                       autoPlayAnimationDuration:
//                           const Duration(milliseconds: 800),
//                       viewportFraction: 0.9,
//                     ),
//                   ),
//                   //  Row(
//                   //   mainAxisAlignment: MainAxisAlignment.start,
//                   //   children: [
//                   //     Expanded(
//                   //       flex: 1,
//                   //       child: Column(
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         children: [
//                   //           Padding(
//                   //             padding: const EdgeInsets.only(left: 10, top: 08),
//                   //             child:
//                   //             Row(
//                   //               children: [
//                   //                 SizedBox(
//                   //                   height: 40.h,
//                   //                   child: Image.asset(
//                   //                       'assets/flaticons/icons8-attendance-100.png'),
//                   //                 ),
//                   //                 Text(
//                   //                   '  Attendance',
//                   //                   style: TextStyle(
//                   //                       color:
//                   //                           const Color.fromARGB(255, 48, 88, 86),
//                   //                       fontSize: 16.sp,
//                   //                       fontWeight: FontWeight.bold),
//                   //                 ),
//                   //               ],
//                   //             ),
//                   //           ),
//                   //           Padding(
//                   //             padding: const EdgeInsets.only(top: 05, left: 20),
//                   //             child: Text(
//                   //               'AVERAGE',
//                   //               style: TextStyle(
//                   //                   color:
//                   //                       const Color.fromARGB(255, 228, 173, 21),
//                   //                   fontSize: 30.sp,
//                   //                   fontWeight: FontWeight.bold),
//                   //             ),
//                   //           ),
//                   //           Padding(
//                   //             padding: const EdgeInsets.only(top: 05, left: 25),
//                   //             child: Text(
//                   //               '200/300',
//                   //               style: TextStyle(
//                   //                   fontSize: 35.sp, fontWeight: FontWeight.bold),
//                   //             ),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //     const Expanded(
//                   //       flex: 1,
//                   //       child: Padding(
//                   //         padding: EdgeInsets.only(top: 10),
//                   //         child: AttendanceGraphOfStudent(),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 100.h,
//               child: Padding(
//                 padding: EdgeInsets.only(
//                   top: 05.sp,
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       flex: 1,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: CircleAvatar(
//                           backgroundImage: NetworkImage(
//                               UserCredentialsController
//                                       .teacherModel?.imageUrl ??
//                                   " "),
//                           radius: 25,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 5,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 12, top: 10),
//                         child: SizedBox(
//                           width: 200,
//                           child: GooglePoppinsEventsWidgets(
//                             text: UserCredentialsController
//                                     .teacherModel?.teacherName ??
//                                 " ",
//                             fontsize: 17.sp,
//                             color: cblack,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                         flex: 1,
//                         child: IconButton(
//                             onPressed: () {},
//                             icon: const Icon(Icons.now_widgets)))
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: 340.sp, left: 40),
//               child: const Row(
//                 children: [
//                   QuickActionsWidgetAttendence(),
//                   QuickActionWidgetExam(),
//                   QuickActionWidgetChat(),
//                   QuickActionWidgetTimetable(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }

// viewallMenus() {
//   UserLogOutController userLogOutController = Get.put(UserLogOutController());
//    final screenNavigationOfClsTr = [
//   SelectPeriodWiseScreen(
//       batchId: UserCredentialsController.batchId!,
//       classID: UserCredentialsController.classId!,
//       schoolId: UserCredentialsController.schoolId!), //Take Attendance

//   AttendenceBookScreenSelectMonth(
//     batchId: UserCredentialsController.batchId!,
//     classID: UserCredentialsController.classId!,
//     schoolId: UserCredentialsController.schoolId!,
//   ), ////////////  Attendance book

//       const TeacherChatScreen(), // Chats

//      const SS(), //TimeTable

//   LeaveLettersListviewScreen(
//       schooilID: UserCredentialsController.schoolId!,
//       batchID: UserCredentialsController.batchId!,
//       classID: UserCredentialsController.classId!), //Leave letters

//   HomeWorkUpload(
//     batchId: UserCredentialsController.batchId!,
//     classId: UserCredentialsController.classId!,
//     schoolID: UserCredentialsController.schoolId!,
//     teacherID: UserCredentialsController.teacherModel!.docid!,
//   ), //////////Home Work

//   const MyStudents(), //My students

//       const StudentSubjectHome(), //Subject

//       SchoolLevelMeetingPage(), //Meetings

//   const AddTimeTable(), //Exam

//       // SelectExamLevelScreen(classId: classID), //exam result upload

//       NoticePage(), //Notice

//       const EventList(), //Events

//   TeacherSubjectWiseList(navValue: ''), //Teachers

//       BusRouteListPage(), /////// all bus
//     ];

//   Get.bottomSheet(
//       SizedBox(
//         height: double.infinity,
//         width: double.infinity,
//         child: Wrap(
//           children: <Widget>[
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
//                   child: Text("All Catagories", style: TextStyle(fontSize: 15)),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   // crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     ContainerWidget(
//                       //icon: Icons.import_contacts,
//                       text: 'Attendance Book',
//                       onTap: () => Get.to(
//                         () => screenNavigationOfClsTr[1]
//                       ),

//                       icon: 'assets/flaticons/book.png',
//                     ),
//                     ContainerWidget(
//                       //icon: Icons.import_contacts,
//                       text: 'Leave Letters',
//                       onTap: () {
//                         Get.to(
//                           () => screenNavigationOfClsTr[4]
//                         );
//                       },
//                       icon: 'assets/flaticons/email.png',
//                     ),
//                     ContainerWidget(
//                       //icon: Icons.chat_rounded,
//                       text: 'Home Work',
//                       onTap: () {
//                         Get.to(
//                           () => screenNavigationOfClsTr[5]
//                         );
//                       },
//                       icon: 'assets/flaticons/homework.png',
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   // crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     ContainerWidget(
//                       // icon: Icons.waving_hand,
//                       text: 'My Students ',
//                       onTap: () {
//                         Get.to(() => screenNavigationOfClsTr[6]);
//                       },
//                       icon: 'assets/flaticons/students.png',
//                     ),
//                     ContainerWidget(
//                       //icon: Icons.import_contacts,
//                       text: 'Study Materials',
//                       onTap: () {
//                         Get.to(
//                           () => const MyStudents(),
//                         );
//                       },
//                       icon: 'assets/flaticons/school-material.png',
//                     ),
//                     ContainerWidget(
//                       //icon: Icons.chat_rounded,
//                       text: 'Meeting',
//                       onTap: () {
//                         Get.to(() => screenNavigationOfClsTr[9]);
//                       },
//                       icon: 'assets/flaticons/teamwork.png',
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   // crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     ContainerWidget(
//                       //icon: Icons.import_contacts,
//                       text: 'Notices',
//                       onTap: () {
//                         Get.to(() =>screenNavigationOfClsTr[11]);
//                       },
//                       icon: 'assets/flaticons/icons8-notice-100.png',
//                     ),
//                     ContainerWidget(
//                       //icon: Icons.chat_rounded,
//                       text: 'Events',
//                       onTap: () {
//                         Get.to(() =>  screenNavigationOfClsTr[12]);
//                       },
//                       icon: 'assets/flaticons/calendar.png',
//                     ),
//                     ContainerWidget(
//                       // icon: Icons.waving_hand,
//                       text: 'Teacher ',
//                       onTap: () {
//                         Get.to(
//                           () => screenNavigationOfClsTr[13]
//                         );
//                       },
//                       icon: 'assets/flaticons/female.png',
//                     ),
//                   ],
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//       backgroundColor: Colors.white);
// }
