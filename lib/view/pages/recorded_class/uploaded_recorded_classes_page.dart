import 'package:vidya_veechi/controllers/form_controller/form_controller.dart';
import 'package:vidya_veechi/view/constant/sizes/sizes.dart';
import 'package:vidya_veechi/view/pages/recorded_class/recorded_classes_shows_page.dart';
import 'package:vidya_veechi/view/widgets/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/recorded_class_controller/recorded_class_controller.dart';
import '../../../utils/utils.dart';
import '../../../view/colors/colors.dart';
import '../../../view/widgets/button_container_widget.dart';
import '../../constant/sizes/constant.dart';

class RecordedClassUploadPage extends StatelessWidget {
  RecordedClassUploadPage(
      {super.key,
      required this.subjectID,
      required this.subjectName,
      required this.chapterID,
      required this.chapterName});

  final String subjectID;
  final String subjectName;
  final String chapterName;
  final String chapterID;

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
final RecordedClassCntl cntrl = Get.put(RecordedClassCntl());
  final RecordedClassController recordedClsCtr =
      Get.put(RecordedClassController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: cblack,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Recorded Classes",
          style: GoogleFonts.montserrat(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: cblack),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            kHeight10,
            SizedBox(
              height: 680.w,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: cntrl.formKey,
                  child: Column(
                    children: [
                      GoogleMonstserratWidgets(
                          text: 'Recorded class upload',
                          fontsize: 13.h,
                          color: cgrey,
                          fontWeight: FontWeight.w700),
                      kWidth20,
                      RecordedClassUploadWidget(),
                      kWidth20,
                      kHeight20,
                      TextFormField(
                        validator: checkFieldEmpty,
                        controller: recordedClsCtr.topicController,
                        decoration:
                            const InputDecoration(hintText: 'Enter Topic'),
                      ),
                      kHeight20,
                      TextFormField(
                        validator: checkFieldEmpty,
                        controller: recordedClsCtr.titleController,
                        decoration:
                            const InputDecoration(hintText: 'Enter Title'),
                      ),
                      kHeight40,
                      GestureDetector(
                          onTap: () async {
                            if (cntrl.formKey.currentState
                                    ?.validate() ??
                                false) {
                              if (recordedClsCtr.file.value != null) {
                                recordedClsCtr.uploadToFirebase(
                                  context: context,
                                  subjectID: subjectID,
                                  chapterID: chapterID,
                                  subjectName: subjectName,
                                  chapterName: chapterName,
                                );
                              } else {
                                showToast(msg: "Please Select File");
                              }
                            }
                          },
                          child: ButtonContainerWidget(
                            curving: 18,
                            colorindex: 2,
                            height: 60.w,
                            width: 300.w,
                            child: Center(child: Obx(() {
                              if (recordedClsCtr.isLoading.value) {
                                final progress =
                                    (recordedClsCtr.progressData.value * 100)
                                        .toInt();
                                return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Center(
                                        child: CircularProgressIndicator(
                                          value:
                                              recordedClsCtr.progressData.value,
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                  Color>(
                                            Colors.white,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '$progress%',
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ]);
                              } else {
                                return Text(
                                  "Submit",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                );
                              }
                            })),
                          )),
                      kHeight20,
                      GestureDetector(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecordedClassesShowsPage(
                                subjectID: subjectID,
                                chapterID: chapterID,
                              ),
                            ),
                          );
                        },
                        child: ButtonContainerWidget(
                          curving: 18,
                          colorindex: 2,
                          height: 60.w,
                          width: 300.w,
                          child: Center(
                            child: Text(
                              "Uploaded Recorded Classes",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            kHeight30,
          ],
        ),
      ),
    );
  }
}

class SubmitButtonRecordedClassWidget extends StatelessWidget {
  SubmitButtonRecordedClassWidget({
    super.key,
    required this.formKey,
    required this.subjectID,
    required this.chapterID,
    required this.subjectName,
    required this.chapterName,
  });

  final GlobalKey<FormState> formKey;
  final String subjectID;
  final String chapterID;
  final String subjectName;
  final String chapterName;
  final RecordedClassController recordedClassController =
      Get.put(RecordedClassController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          if (formKey.currentState?.validate() ?? false) {
            if (recordedClassController.file.value != null) {
              recordedClassController.uploadToFirebase(
                context: context,
                subjectID: subjectID,
                chapterID: chapterID,
                subjectName: subjectName,
                chapterName: chapterName,
              );
            } else {
              showToast(msg: "Please Select File");
            }
          }
        },
        child: ButtonContainerWidget(
          curving: 18,
          colorindex: 2,
          height: 60.w,
          width: 300.w,
          child: Center(child: Obx(() {
            if (recordedClassController.isLoading.value) {
              final progress =
                  (recordedClassController.progressData.value * 100).toInt();
              return Stack(alignment: Alignment.center, children: [
                Center(
                  child: CircularProgressIndicator(
                    value: recordedClassController.progressData.value,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                  ),
                ),
                Text(
                  '$progress%',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ]);
            } else {
              return Text(
                "Submit",
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              );
            }
          })),
        ));
  }
}

class RecordedClassUploadWidget extends StatelessWidget {
  RecordedClassUploadWidget({
    super.key,
  });

  final RecordedClassController _recordedClassController =
      Get.put(RecordedClassController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _recordedClassController.pickFile();
      },
      child: Container(
        height: 130.h,
        width: double.infinity - 20.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: cblue,
            width: 2.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Icon(Icons.attach_file_rounded,
                  color: cblue, size: 30.w, weight: 10),
            ),
            FittedBox(
              child: Obx(
                () {
                  String textData = _recordedClassController.file.value == null
                      ? 'Upload file here'
                      : _recordedClassController.file.value!.path
                          .split('/')
                          .last;
                  return Text(
                    textData,
                    style: const TextStyle(
                        fontSize: 15,
                        color: cblue,
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
