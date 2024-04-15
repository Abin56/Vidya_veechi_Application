import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vidya_veechi/controllers/userCredentials/user_credentials.dart';
import 'package:vidya_veechi/utils/utils.dart';
import 'package:vidya_veechi/view/constant/sizes/constant.dart';

class TeacherAttendenceController extends GetxController {
  RxInt classWiseWoringDayCount = 0.obs;
  RxInt teacherAttendCount = 0.obs;
  Future<void> addTeacherAttendence(
      String classID, String className, String period) async {
    final date = DateTime.now();
    DateTime parseDate = DateTime.parse(date.toString());
    final month = DateFormat('MMMM-yyyy');
    String monthwise = month.format(parseDate);
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(parseDate);
    final String docid = uuid.v1();
    await server
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId)
        .collection('TeacherAttendence')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) async {
      if (value.data() == null) {
        teacherAttendCount.value = 1;
        await server
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId)
            .collection('TeacherAttendence')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({
          'docid': FirebaseAuth.instance.currentUser!.uid,
          'teacherName': UserCredentialsController.teacherModel!.teacherName,
          'CountClassAttended': teacherAttendCount.value,
          // 'total'
        }, SetOptions(merge: true)).then((value) async {
          await server
              .collection(UserCredentialsController.batchId!)
              .doc(UserCredentialsController.batchId)
              .collection('TeacherAttendence')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('DayWiseAttendence')
              .doc(formatted)
              .set({
            'docid': formatted,
            'date': formatted,
            'teacherdocid': FirebaseAuth.instance.currentUser!.uid,
            'teacherName': UserCredentialsController.teacherModel!.teacherName,
          }).then((value) async {
            await server
                .collection(UserCredentialsController.batchId!)
                .doc(UserCredentialsController.batchId)
                .collection('TeacherAttendence')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('DayWiseAttendence')
                .doc(formatted)
                .collection('AttendedClasses')
                .doc(docid)
                .set({
              'docid': docid,
              'ClassName': className,
              'CountClassAttended': teacherAttendCount.value,
              'period': period,
            }).then((value) async {
              await server
                  .collection(UserCredentialsController.batchId!)
                  .doc(UserCredentialsController.batchId)
                  .collection('TeacherAttendence')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('MonthWiseAttendence')
                  .doc(monthwise)
                  .set({
                'docid': monthwise,
                'month': monthwise,
                'teacherdocid': FirebaseAuth.instance.currentUser!.uid,
                'teacherName':
                    UserCredentialsController.teacherModel!.teacherName,
              }).then((value) async {
                await server
                    .collection(UserCredentialsController.batchId!)
                    .doc(UserCredentialsController.batchId)
                    .collection('TeacherAttendence')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('MonthWiseAttendence')
                    .doc(monthwise)
                    .collection('AttendedClasses')
                    .doc(docid)
                    .set({
                  'docid': docid,
                  'ClassName': className,
                  'CountClassAttended': teacherAttendCount.value,
                  'period': period,
                });
              });
            });
          });
        });
      } else {
        teacherAttendCount.value = value.data()?['CountClassAttended'] + 1;
        await server
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId)
            .collection('TeacherAttendence')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({
          'docid': FirebaseAuth.instance.currentUser!.uid,
          'teacherName': UserCredentialsController.teacherModel!.teacherName,
          'CountClassAttended': teacherAttendCount.value,
          // 'total'
        }, SetOptions(merge: true)).then((value) async {
          await server
              .collection(UserCredentialsController.batchId!)
              .doc(UserCredentialsController.batchId)
              .collection('TeacherAttendence')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('DayWiseAttendence')
              .doc(formatted)
              .set({
            'docid': formatted,
            'date': formatted,
            'teacherdocid': FirebaseAuth.instance.currentUser!.uid,
            'teacherName': UserCredentialsController.teacherModel!.teacherName,
          }).then((value) async {
            await server
                .collection(UserCredentialsController.batchId!)
                .doc(UserCredentialsController.batchId)
                .collection('TeacherAttendence')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('DayWiseAttendence')
                .doc(formatted)
                .collection('AttendedClasses')
                .doc(docid)
                .set({
              'docid': docid,
              'ClassName': className,
              'CountClassAttended': teacherAttendCount.value,
              'period': period,
            }).then((value) async {
              await server
                  .collection(UserCredentialsController.batchId!)
                  .doc(UserCredentialsController.batchId)
                  .collection('TeacherAttendence')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('MonthWiseAttendence')
                  .doc(monthwise)
                  .set({
                'docid': monthwise,
                'month': monthwise,
                'teacherdocid': FirebaseAuth.instance.currentUser!.uid,
                'teacherName':
                    UserCredentialsController.teacherModel!.teacherName,
              }).then((value) async {
                await server
                    .collection(UserCredentialsController.batchId!)
                    .doc(UserCredentialsController.batchId)
                    .collection('TeacherAttendence')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('MonthWiseAttendence')
                    .doc(monthwise)
                    .collection('AttendedClasses')
                    .doc(docid)
                    .set({
                  'docid': docid,
                  'ClassName': className,
                  'CountClassAttended': teacherAttendCount.value,
                  'period': period,
                });
              });
            });
          });
        });
      }
    });
  }

  Future<void> workingDaysMark(String classID) async {
    // While taking attendece getting count for Working days
    final todaydate = stringTimeToDateConvert(DateTime.now().toString());
    await server
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId)
        .collection('classes')
        .doc(classID)
        .get()
        .then((value) async {
      if (value.data()?['workingDaysCount'] == null ||
          value.data()?['lastClassDay'] == null) {
        await server
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId)
            .collection('classes')
            .doc(classID)
            .set({'workingDaysCount': 1, 'lastActiveClassDay': todaydate},
                SetOptions(merge: true));
      } else {
        await server
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId)
            .collection('classes')
            .doc(classID)
            .get()
            .then((value) async {
          if (value.data()?['lastActiveClassDay'] != todaydate) {
            classWiseWoringDayCount.value = value.data()!['workingDaysCount'];
            await server
                .collection(UserCredentialsController.batchId!)
                .doc(UserCredentialsController.batchId)
                .collection('classes')
                .doc(classID)
                .set({'workingDaysCount': classWiseWoringDayCount.value + 1},
                    SetOptions(merge: true)).then((value) async {
              classWiseWoringDayCount.value = 0;
            });
          }
        });
      }
    });
  }
}
