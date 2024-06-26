import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:vidya_veechi/controllers/userCredentials/user_credentials.dart';
import 'package:get/get.dart';

class TeacherGetSubjectController extends GetxController {
  RxString teacherSubject = ''.obs;

  Future<void> getBatchYearId() async {
    // ignore: unused_local_variable
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(UserCredentialsController.classId!)
        .collection("teachers")
        .doc(UserCredentialsController.teacherModel!.docid!)
        .collection("teacherSubject")
        .get();
    // teacherSubject.value = vari.docs.;
  }
}
