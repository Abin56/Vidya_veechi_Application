// // ignore_for_file: use_key_in_widget_constructors, must_call_super, annotate_overrides, non_constant_identifier_names
// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:vidya_veechi/controllers/userCredentials/user_credentials.dart';
// import 'package:vidya_veechi/view/colors/colors.dart';
// import 'package:vidya_veechi/view/constant/sizes/sizes.dart';
// import 'package:vidya_veechi/view/home/class_teacher_HOme/accessories.dart';
// import 'package:vidya_veechi/view/home/student_home/Student%20Edit%20Profile/teacher_edit_profile.dart';
// import 'package:vidya_veechi/view/widgets/fonts/google_monstre.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
// import 'package:get/get.dart';

// class ClassTeacherHomeScreen extends StatefulWidget {
//   @override
//   State<ClassTeacherHomeScreen> createState() => _ClassTeacherHomeScreenState();
// }

// class _ClassTeacherHomeScreenState extends State<ClassTeacherHomeScreen> {
//   String deviceToken = '';

//   void getDeviceToken() async {
//     await FirebaseMessaging.instance.getToken().then((token) {
//       setState(() {
//         deviceToken = token ?? 'Not get the token ';
//         log("User Device Token :: $token");
//       });
//       saveDeviceTokenToFireBase(deviceToken);
//     });
//   }

//   void saveDeviceTokenToFireBase(String deviceToken) async {
//     await FirebaseFirestore.instance
//         .collection("SchoolListCollection")
//         .doc(UserCredentialsController.schoolId)
//         .collection(UserCredentialsController.batchId!)
//         .doc(UserCredentialsController.batchId)
//         .collection('classes')
//         .doc(UserCredentialsController.classId)
//         .collection('teachers')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .set({'deviceToken': deviceToken}, SetOptions(merge: true))
//         .then((value) => log('Device Token Saved To FIREBASE'))
//         .then((value) => FirebaseFirestore.instance
//                 .collection('PushNotificationToAll')
//                 .doc(FirebaseAuth.instance.currentUser!.uid)
//                 .set({
//               'deviceToken': deviceToken,
//               'schoolID': UserCredentialsController.schoolId,
//               'batchID': UserCredentialsController.batchId,
//               'classID': UserCredentialsController.classId,
//               'personID': FirebaseAuth.instance.currentUser!.uid,
//               'role': 'Class Teacher'
//             }))
//         .then((value) => FirebaseFirestore.instance
//                 .collection('SchoolListCollection')
//                 .doc(UserCredentialsController.schoolId)
//                 .collection('PushNotificationList')
//                 .doc(FirebaseAuth.instance.currentUser!.uid)
//                 .set({
//               'deviceToken': deviceToken,
//               'batchID': UserCredentialsController.batchId,
//               'classID': UserCredentialsController.classId,
//               'personID': FirebaseAuth.instance.currentUser!.uid,
//               'role': 'Class Teacher'
//             }));
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getDeviceToken();

//     //   sendPushMessage( deviceToken, 'Hello Everyone', 'DUJO APP');
//   }

//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               color: cgraident,
//               width: double.infinity,
//               height: screenSize.width * 0.5,
//               padding: EdgeInsets.all(15.h),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(8.h),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           width: screenSize.width / 2,
//                           child: GoogleMonstserratWidgets(
//                             overflow: TextOverflow.ellipsis,
//                             text: UserCredentialsController
//                                     .teacherModel?.teacherName ??
//                                 " ",
//                             fontsize: 23.sp,
//                             fontWeight: FontWeight.bold,
//                             color: cWhite,
//                           ),
//                         ),
//                         UserCredentialsController.teacherModel?.imageUrl == null
//                             ? kHeight
//                             : GestureDetector(
//                                 onTap: () {
//                                   Get.to(const TeacherEditProfileScreen());
//                                 },
//                                 child: Stack(
//                                   children: [
//                                     Container(
//                                       height: 100,
//                                       width: 100,
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         image: DecorationImage(
//                                           fit: BoxFit.cover,
//                                           image: NetworkImage(
//                                               UserCredentialsController
//                                                       .teacherModel?.imageUrl ??
//                                                   " "),
//                                         ),
//                                       ),
//                                     ),
//                                     const Positioned(
//                                       right: 6,
//                                       bottom: 1,
//                                       child: CircleAvatar(
//                                         radius: 12,
//                                         child: Center(child: Icon(Icons.info)),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                       ],
//                     ),
//                   ),
//                   GoogleMonstserratWidgets(
//                     text:
//                         'ID : ${UserCredentialsController.teacherModel?.employeeID ?? " "}',
//                     fontsize: 14.sp,
//                     fontWeight: FontWeight.w500,
//                     color: cWhite.withOpacity(0.8),
//                   ),
//                   FutureBuilder(
//                       future: FirebaseFirestore.instance
//                           .collection('SchoolListCollection')
//                           .doc(UserCredentialsController.schoolId)
//                           .collection(UserCredentialsController.batchId!)
//                           .doc(UserCredentialsController.batchId)
//                           .collection('classes')
//                           .doc(UserCredentialsController.classId)
//                           .get(),
//                       builder: (context, snaps) {
//                         if (snaps.hasData) {
//                           return GoogleMonstserratWidgets(
//                             text: 'Class : ${snaps.data!.data()!['className']}',
//                             fontsize: 14.sp,
//                             fontWeight: FontWeight.w500,
//                             color: cWhite.withOpacity(0.8),
//                           );
//                         } else {
//                           return const Text('');
//                         }
//                       }),
//                   GoogleMonstserratWidgets(
//                     text:
//                         'email : ${UserCredentialsController.teacherModel?.teacherEmail ?? " "}',
//                     fontsize: 12.sp,
//                     fontWeight: FontWeight.w500,
//                     color: cWhite.withOpacity(0.7),
//                   ),
//                 ],
//               ),
//             ),
//             ClassTeacherAccessories(
//               classID: '',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget MenuItem(int id, String image, String title, bool selected, onTap) {
//   return Material(
//     color: Colors.white,
//     child: InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Row(
//           children: [
//             Expanded(
//               child: Container(
//                 height: 30,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(image: AssetImage(image))),
//               ),
//             ),
//             Expanded(
//                 flex: 3,
//                 child: Text(
//                   title,
//                   style: const TextStyle(color: Colors.black, fontSize: 16),
//                 ))
//           ],
//         ),
//       ),
//     ),
//   );
// }
import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vidya_veechi/controllers/userCredentials/user_credentials.dart';
import 'package:vidya_veechi/view/colors/colors.dart';
import 'package:vidya_veechi/view/home/class_teacher_HOme/class_teacher_mainhome.dart';
import 'package:vidya_veechi/view/home/class_teacher_HOme/graph_class_teacher/showbottomgraph/viewAllGraph.dart';
import 'package:vidya_veechi/view/home/class_teacher_HOme/quick_Action.dart';
import 'package:vidya_veechi/view/home/events/event_display_school_level.dart';

class ClassTeacherHome extends StatelessWidget {
  const ClassTeacherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 160.sp),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 218, 247, 229),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.sp),
                      topRight: Radius.circular(15.sp)),
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 120.sp, right: 20.sp, left: 20.sp),
                      child: Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: cblack.withOpacity(0.1)),
                            color: const Color.fromARGB(255, 218, 247, 229),
                            borderRadius: BorderRadius.circular(20.sp)),
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'QUICK ACTIONS',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 11, 2, 74),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  viewallMenus();
                                },
                                child: Text(
                                  "View all",
                                  style:
                                      TextStyle(color: cblack.withOpacity(0.8)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 80.sp, right: 20.sp, left: 20.sp),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'NOTIFICATIONS',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 11, 2, 74),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.h,
                                    color: const Color.fromARGB(255, 11, 2, 74)
                                        .withOpacity(0.1),
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
                                          color: const Color.fromARGB(255, 11, 2, 74),
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: const Text(
                                      "Tommorow is Holiday",
                                      style: TextStyle(
                                        color: const Color.fromARGB(255, 11, 2, 74),
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
                      ),
                    ),
                  ],
                ),

                // child: const Column(
                //   children: [],
                // ),
              ),
            ),
            //................................>>>>>>>>>>>>>>>>>>>>>>>>>>>Carosal slider>>>>>>>>>>>>>>>>>>>>>>
            Padding(
              padding: const EdgeInsets.only(top: 80, right: 10, left: 10),
              child: Center(
                child: Container(
                  height: 200.h,
                  width: 350.w,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: cblack,
                        ),
                      ],
                      color: cWhite,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: CarouselSlider(
                    items: [
                      CaroselWidget(
                          sliderImagePath: imagesList[0], slidertext: "Exam"),
                      CaroselWidget(
                          sliderImagePath: imagesList[1],
                          slidertext: "Project"),
                      GestureDetector(
                        onTap: () => viewProjectGraph(),
                        child: CaroselWidget(
                            sliderImagePath: imagesList[2],
                            slidertext: "Attendence"),
                      ),
                      CaroselWidget(
                          sliderImagePath: imagesList[3],
                          slidertext: "Assignment")
                    ],
                    options: CarouselOptions(
                      // aspectRatio: 1,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      height: 230,

                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 0.9,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100.h,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 05.sp,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              UserCredentialsController
                                      .teacherModel?.imageUrl ??
                                  " "),
                          radius: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12, top: 10),
                        child: SizedBox(
                          width: 200,
                          child: GooglePoppinsEventsWidgets(
                            text: UserCredentialsController
                                    .teacherModel?.teacherName ??
                                " ",
                            fontsize: 17.sp,
                            color: cblack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.now_widgets)))
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 340.sp, left: 40),
              child: const Row(
                children: [
                  QuickActionsWidgetAttendence(),
                  QuickActionWidgetExam(),
                  QuickActionWidgetChat(),
                  QuickActionWidgetTimetable(),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
