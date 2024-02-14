import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidya_veechi/view/colors/colors.dart';
import 'package:vidya_veechi/view/home/student_home/graph_std/attendance_std_g.dart';
import 'package:vidya_veechi/view/home/student_home/student_pages/slider/graph_showing_std.dart';
import 'package:vidya_veechi/view/widgets/fonts/google_poppins.dart';
import 'package:vidya_veechi/view/widgets/fonts/google_salsa.dart';

class CarouselSliderStd extends StatelessWidget {
  const CarouselSliderStd({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(items: const [
      GraphShowingPartStdAttendance(),
      GraphShowingPartStdExamResult(),
      GraphShowingPartStdHomework(),
      GraphShowingPartStdAssignProject()
    ],
     options: CarouselOptions(
        height: 200.w,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),);
  }
}



attendanceGraphDetails(){
  Get.bottomSheet(
    SingleChildScrollView(
      child: Container(
        color: cWhite,
        width: double.infinity,
        height: 600,
        child: Wrap(
          children: <Widget>[
            Column(
            children: [ 
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                        child: Image.asset(
                            'assets/flaticons/icons8-attendance-100.png'),
                      ),
                      GooglePoppinsWidgets(text: "Attendance Graph", fontsize: 21.sp,fontWeight: FontWeight.w500,),
                    ],
                  ),
                ),
                     const Padding(
                padding: EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 150,
                  width: 200,
                  child: AttendanceGraphOfStudent()),
                
              ),
               Column(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [ 
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset("assets/flaticons/menu.png",height: 30,),
                              ),
                              GoogleSalsaWidgets(text: 'Total Percentage :', fontsize: 15),
                               GoogleSalsaWidgets(text: '50', fontsize: 15),
                            ],
                          ),
                        ),
                         Padding(
                           padding: const EdgeInsets.all(4.0),
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset("assets/flaticons/menu.png",height: 30,),
                              ),
                               GoogleSalsaWidgets(text: 'Present Percentage :', fontsize: 15),
                                GoogleSalsaWidgets(text: '45', fontsize: 15),
                             ],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(4.0),
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset("assets/flaticons/menu.png",height: 30,),
                              ),
                               GoogleSalsaWidgets(text: 'Absent Percentage :', fontsize: 15),
                                GoogleSalsaWidgets(text: '5', fontsize: 15),
                             ],
                           ),
                         )
                      ],
                      )
            ],
          ),
           ],
        )
      ),
    )
  );
}