import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidya_veechi/controllers/userCredentials/user_credentials.dart';
import 'package:vidya_veechi/utils/utils.dart';
import 'package:vidya_veechi/view/colors/colors.dart';
import 'package:vidya_veechi/view/constant/sizes/sizes.dart';
import 'package:vidya_veechi/view/home/teachers_home/homeworks/view_homework.dart';
import 'package:vidya_veechi/view/widgets/appbar_color/appbar_clr.dart';
import 'package:vidya_veechi/view/widgets/fonts/google_poppins.dart';

class ViewStudentsList extends StatelessWidget {
  const ViewStudentsList({super.key, required this.homeworkID});
  final String homeworkID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
            kHeight20,
            GooglePoppinsWidgets(
                text: "Homework submitted students".tr, fontsize: 20.h)
          ],
        ),
        flexibleSpace: const AppBarColorWidget(),
        foregroundColor: cWhite,
        // backgroundColor: adminePrimayColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10.h, right: 10.h, top: 10.h),
          child: StreamBuilder(
              stream: server
                  .collection(UserCredentialsController.batchId!)
                  .doc(UserCredentialsController.batchId)
                  .collection("classes")
                  .doc(UserCredentialsController.classId)
                  .collection("HomeWorks")
                  .doc(homeworkID)
                  .collection('Submit')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No homeworks submitted '));
                }
                return ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  separatorBuilder: ((context, index) {
                    return const Divider(
                      height: 10,
                    );
                  }),
                  itemBuilder: (context, index) {
                    final data = snapshot.data!.docs[index];
                    final List<String> downloadUrl = [];
                    downloadUrl.add(data['downloadUrl']);
                    downloadUrl.add(data['downloadUrl']);
                    return Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              // color: Color.fromARGB(236, 228, 244, 255),
                              ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.check_circle_outline_rounded,
                              size: 40,
                              color: Colors.green,
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GooglePoppinsWidgets(
                                        text: "Name : ${data['uploadedBy']} ",
                                        fontsize: 16.h,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return StudentHomeWork(
                                                downloadUrl: downloadUrl,
                                              );
                                            },
                                          ));
                                        },
                                        child: GooglePoppinsWidgets(
                                          text: "View ",
                                          fontsize: 15.h,
                                          color: cblue,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          GooglePoppinsWidgets(
                                            text: "Status :  ",
                                            fontsize: 15.h,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          GooglePoppinsWidgets(
                                            text: "Submitted",
                                            fontsize: 15.h,
                                            color: Colors.green,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                      // GooglePoppinsWidgets(
                                      //   text: "Submitted on 10:10 ",
                                      //   fontsize: 15.h,
                                      //   fontWeight: FontWeight.w500,
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
