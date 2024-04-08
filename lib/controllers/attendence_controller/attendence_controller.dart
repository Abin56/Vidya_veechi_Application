import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:vidya_veechi/controllers/userCredentials/user_credentials.dart';
import 'package:vidya_veechi/model/student_attendence_model/student_attendece_model.dart';
import 'package:vidya_veechi/utils/utils.dart';
import 'package:vidya_veechi/view/constant/sizes/constant.dart';

class AttendanceController extends GetxController {
  RxInt notificationTimer = 0.obs;
  RxList abStudentUIDList = [].obs;
  RxList abStsParentUIDList = [].obs;
  RxString schoolName = ''.obs;
  RxString dateformated = ''.obs;
  RxString timeformated = ''.obs;
  dailyAttendanceController(String classID) async {
    final firebase = FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId)
        .collection('classes')
        .doc(classID)
        .collection('Attendence');
    final date = DateTime.now();
    DateTime parseDate = DateTime.parse(date.toString());
    final month = DateFormat('MMMM-yyyy');
    String monthwise = month.format(parseDate);
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(parseDate);
    ////////////////////////////
    ///
    for (var i = 1; i <= 15; i++) {
      final docid = uuid.v1();
      await firebase
          .doc(monthwise)
          .collection(monthwise)
          .doc(formatted)
          .collection("PeriodCollection")
          .doc(docid)
          .set({
        'docid': docid,
        'period': i,
      });
    }
  }

  Future<void> getSubjectStudentAttendenceList({
    required String studentDocid,
    required String subjectDocid,
    required String studentName,
    required bool present,
    required String subjectName,
    required int periodNo,
  }) async {
    try {
      log("Loading.............+++++");
      final date = DateTime.now();

      final attendenceDetail = StudentAttendenceModel(
          docid: uuid.v1(),
          studentDocid: studentDocid,
          studentName: studentName,
          present: present,
          date: date,
          subjectName: subjectName,
          subjectID: subjectDocid,
          periodNo: periodNo);
      server
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId)
          .collection('classes')
          .doc(UserCredentialsController.classId)
          .collection('Students')
          .doc(studentDocid)
          .collection('MyAttendenceList')
          .doc(attendenceDetail.docid)
          .set(attendenceDetail.toMap());
      log("Submmited.............+++++");
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> sendPushMessage(String token, String body, String title) async {
    log("messageOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
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

  Future<void> getNotificationTimer() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(UserCredentialsController.schoolId)
        .collection('Notifications')
        .doc('Attendance')
        .get();
    notificationTimer.value =
        int.parse(vari.data()!['timeToDeliverAbsenceNotification']);
  }

  Future<void> sendAbNotificationToParent(
      String studentName, String subject) async {
    try {
      await Future.delayed(Duration(minutes: notificationTimer.value))
          .then((value) async {
        for (var i = 0; i < abStsParentUIDList.length; i++) {
          sendPushMessage(
              abStsParentUIDList[i],
              'Sir/Madam, your child was absent on for $subject period at ${timeformated.value} on ${dateformated.value}, സർ/മാഡം, ${dateformated.value} തീയതി ${timeformated.value} ഉണ്ടായിരുന്ന $subject പീരീഡിൽ നിങ്ങളുടെ കുട്ടി ഹാജരായിരുന്നില്ല',
              'Absent Notification from $studentName');
        }
      });
      log("sendAbNotificationToParent Success....");
    } catch (e) {
      log(e.toString());
      log("sendAbNotificationToParent Failed****");
    }
  }

  Future<void> getAbStsParentDeviceID() async {
    try {
      for (var i = 0; i < abStudentUIDList.length; i++) {
        final parentresult = await server
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId)
            .collection('AllStudents')
            .doc(abStudentUIDList[i])
            .get();

        abStsParentUIDList.add(parentresult.data()?['parentId'] ?? '');
      }
      log("getAbStsParentDeviceID Success....");
    } catch (e) {
      log("getAbStsParentDeviceID Failed ***");
      log(e.toString());
    }
  }

  Future<void> getStudentAbsentList(
      {required String subjectID,
      required String subject,
      required String studentName}) async {
    try {
      final date = DateTime.now();
      DateTime parseDate = DateTime.parse(date.toString());
      final month = DateFormat('MMMM-yyyy');
      String monthwise = month.format(parseDate);
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      String formatted = formatter.format(parseDate);
      await Future.delayed(Duration(minutes: notificationTimer.value))
          .then((value) async {
        final abResult = await server
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId)
            .collection('classes')
            .doc(UserCredentialsController.classId)
            .collection('Attendence')
            .doc(monthwise)
            .collection(monthwise)
            .doc(formatted)
            .collection('Subjects')
            .doc(subjectID)
            .collection('AttendenceList')
            .where('present', isEqualTo: false)
            .get();
        for (var i = 0; i < abResult.docs.length; i++) {
          abStudentUIDList.add(abResult.docs[i].data()['uid']);
        }
      }).then((value) async {
        log("getStudentAbsentList Success....");

        await getAbStsParentDeviceID().then((value) async {
          await sendAbNotificationToParent(studentName, subject);
        });
      });
      // ).then((value) async => await getAbStsParentDeviceID().then(
      //         (value) async =>
      //             await sendAbNotificationToParent(studentName, subject)));
    } catch (e) {
      log("getStudentAbsentList Failed ***");

      log(e.toString());
    }
  }

  Future<void> activeClasses(
      {required String classID,
      required String teacherDocid,
      required String subjectName,
      required String subjectDocid}) async {
try {
  log('activeClasses.........................');
      final date = DateTime.now();
    DateTime parseDate = DateTime.parse(date.toString());
 
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(parseDate);
    await server
        
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId)
        .collection('TodayActiveClasses')
        .doc(formatted)
        .set({'docid': formatted}).then((value) async {
      await server
         
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId)
          .collection('TodayActiveClasses')
          .doc(formatted)
          .collection('Classes')
          .doc(classID)
          .set({
        'docid': classID,
        'teacherDocid': teacherDocid,
        'subjectName': subjectName,
        'subjectDocid': subjectDocid,
      });
    });
  
} catch (e) {
  log(e.toString());
  
}
  }

  @override
  void onInit() async {
    await getNotificationTimer();

    super.onInit();
  }
}
