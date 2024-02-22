import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vidya_veechi/main.dart';
import 'package:vidya_veechi/view/colors/colors.dart';
import 'package:vidya_veechi/view/home/guardian_home/guardian_new_home.dart';
import 'package:vidya_veechi/view/widgets/appbar_color/appbar_clr.dart';

import '../../../controllers/userCredentials/user_credentials.dart';
import '../../pages/recorded_videos/select_subjects.dart';
import '../../pages/splash_screen/splash_screen.dart';
import '../drawer/guardian_drawer.dart';
import '../student_home/Student Edit Profile/guardian_edit_profile.dart';

class GuardianMainHomeScreen extends StatefulWidget {
  const GuardianMainHomeScreen({super.key});

  @override
  State<GuardianMainHomeScreen> createState() => _GuardianMainHomeScreenState();
}

class _GuardianMainHomeScreenState extends State<GuardianMainHomeScreen> {
  int _page = 0;

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    checkingSchoolActivate(context);
    List<Widget> pages = [
      GuardianHomeScreen2(studentName: UserCredentialsController.guardianModel!.studentID!,),
    //ClassTeacherHomePage(),
      RecSelectSubjectScreen(
        batchId: UserCredentialsController.batchId!,
        classID: UserCredentialsController.classId!,
        schoolId: UserCredentialsController.schoolId!,
      ),
      const GuardianEditProfileScreen(),
    ];
    return WillPopScope(
      onWillPop: () => onbackbuttonpressed(context),
      child: Scaffold(
    appBar: AppBar(
        flexibleSpace: const AppBarColorWidget(),
        foregroundColor: cWhite,
        title: SizedBox(
          // color: cred,
          height: 80,
          width: 115,
          child: Center(
              child: Image.asset(
            'assets/images/vidyaveechi.png',
            color: Colors.black,
            fit: BoxFit.cover,
          )),
        ),
        //  backgroundColor: adminePrimayColor
      ),
        body: pages[_page],
        bottomNavigationBar: Container(
          height: 71,
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0), topRight: Radius.circular(0)),
          border: Border.all(color: Colors.white.withOpacity(0.13)),
          color: const Color.fromARGB(255, 92, 180, 132),
        ),
          child:  GNav(
          gap: 8,
          rippleColor: Colors.grey,
          activeColor: Colors.white,
          color: Colors.white,
          tabs: [
            GButton(
                iconSize: 20,
                icon: LineIcons.home,
                text: 'Home'.tr,
                style: GnavStyle.google),
            GButton(
              iconSize: 30,
              textSize: 20,
              icon: Icons.tv,
              text: 'Recorded\nClasses'.tr,
            ),
            GButton(
              iconSize: 30,
              // iconSize: 10,
              textSize: 20,
              icon: Icons.laptop,
              text: 'Live\nClasses'.tr,
            ),
            GButton(
              iconSize: 30,
              textSize: 20,
              icon: Icons.chat,
              text: 'Ask\nDoubt'.tr,
            )
          ],
          selectedIndex: _page,
          onTabChange: (value) {
            onPageChanged(value);
          },
        ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const GuardianHeaderDrawer(),
                MyDrawerList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

