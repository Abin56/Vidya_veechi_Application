// ignore_for_file: must_be_immutable

import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vidya_veechi/view/colors/colors.dart';
import 'package:vidya_veechi/view/home/parent_home/graph_std/attendance_std_g.dart';
import 'package:vidya_veechi/view/home/parent_home/graph_std/exm_std.dart';
import 'package:vidya_veechi/view/home/parent_home/graph_std/homework_std_g.dart';
import 'package:vidya_veechi/view/home/parent_home/graph_std/pie%20chart/pie_chart.dart';
import 'package:vidya_veechi/view/home/parent_home/graph_std/project_assignmnt_chart.dart';
import 'package:vidya_veechi/view/widgets/fonts/google_poppins.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return CarouselSlider(
      items: [
        CaroselmageWidget(
          sliderWidget: graphList[0],
          slidertext: 'Homework', slidersecondtext: 'Average', count: '100/200',
        ),
        CaroselmageWidget(
          sliderWidget: graphList[1],
          slidertext: 'Exam Result',
           slidersecondtext: 'Average', count: '100/200',
        ),
        GestureDetector(
          onTap: (){
           _settingModalBottomSheet(context);
        
        },
          child: CaroselmageWidget(
            sliderWidget: graphList[2],
            slidertext: 'Attendance',
             slidersecondtext: 'Average', count: '100/200',
          ),
        ),
        // CaroselmageWidget(
        //   sliderWidget: graphList[3],
        //   slidertext: 'Assignment & Project',
        // ),
      ],
      options: CarouselOptions(
        height: 220.w,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}

class CaroselmageWidget extends StatelessWidget {
  Widget sliderWidget;
  String slidertext;
  String slidersecondtext;
  String count;
  CaroselmageWidget({
    required this.sliderWidget,
    required this.slidertext,
    required this.slidersecondtext,
    required this.count,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       
        Expanded(
                        // GooglePoppinsWidgets(text: slidersecondtext, fontsize: 18,color: ),
                        //     GooglePoppinsWidgets(text: count, fontsize: 18,color: Colors.black,fontWeight:FontWeight.bold ,)
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    const CircleAvatar(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: GooglePoppinsWidgets(
                          text: slidertext,
                          fontsize: 16.sp,
                          color: cblack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GooglePoppinsWidgets(
                  text: slidersecondtext,
                  fontsize: 24.sp,
                  color: Colors.amber,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GooglePoppinsWidgets(
                  text: count,
                  fontsize: 22.sp,
                  color: cblack,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
         Expanded(
          child: sliderWidget,
        ),
      ],
    );
  }
}

final List<Widget> graphList = [
  const HomeWorkGraph(),
  const ExamResultGraph(),
const AttendanceGraphOfStudent() , const StdProjectAndAssignmnetGraph()
];
void _settingModalBottomSheet(context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
          return SingleChildScrollView(
            child: SizedBox(height: 430,
              child:  Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                    child: GooglePoppinsWidgets(text: 'Attendance', fontsize: 20,fontWeight: FontWeight.bold,),
                  ),
                   const Padding(
                     padding: EdgeInsets.only(top: 10,),
                     child: ATP(presentPercentage: 21.2,),
                   ),
                  Wrap(
                  children: <Widget>[
                   Card(
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(color: Colors.green[50],
                         child: ListTile(shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                         leading:   const Icon(Icons.check),
                                         title:  const Text('Present'),
                                         trailing: GooglePoppinsWidgets(text: '21%', fontsize: 18),
                                         onTap: () => {}          
                                  ),
                       ),
                     ),
                   ),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Card(
                                 child: Container(color:Colors.red[50],
                                   child: ListTile(
                                                   leading:  const Icon(Icons.close),
                                                   title:  const Text('Absent'),
                                                    trailing: GooglePoppinsWidgets(text: '79%', fontsize: 18),
                                                   onTap: () => {},          
                                                             ),
                                 ),
                               ),
                             ),
                  ],
                            ),
                ],
              ),
            ),
          );
      }
    );
}