import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:vidya_veechi/controllers/userCredentials/user_credentials.dart';
import 'package:vidya_veechi/model/user_deviceID_model/user_devideID_model.dart';
import 'package:vidya_veechi/utils/utils.dart';

class PushNotificationController extends GetxController {
  RxString deviceID = ''.obs;
  Future<void> getUserDeviceID() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      deviceID.value = token ?? "";
    });
  }
  Future<void> allUSerDeviceID() async {
    try {
      final UserDeviceIDModel userModel = UserDeviceIDModel(
          batchID: UserCredentialsController.batchId!,
          classID: UserCredentialsController.classId!,
          devideID: deviceID.value,
          uid: userUID,
          userrole: UserCredentialsController.userRole ?? "",
          schoolID: UserCredentialsController.schoolId!);
      await server
          .collection('AllUsersDeviceID')
          .doc(userUID)
          .set(userModel.toMap());
    } catch (e) {
      log(e.toString());
    }
  }
  final String userUID = FirebaseAuth.instance.currentUser!.uid;
  /////////////////////////////////// Parent Part
  final String parentUID = UserCredentialsController.parentModel!.docid ??
      FirebaseAuth.instance.currentUser!.uid;

  Future<void> allParentDeviceID() async {
    try {
      final UserDeviceIDModel parentmodel = UserDeviceIDModel(
          batchID: UserCredentialsController.batchId!,
          classID: UserCredentialsController.classId!,
          devideID: deviceID.value,
          uid: parentUID,
          userrole: 'parent',
          schoolID: UserCredentialsController.schoolId!);
      await server
          .collection('AllParentDeviceID')
          .doc(parentUID)
          .set(parentmodel.toMap())
          .then((value) async {
        await parentDeviceID();
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> parentDeviceID() async {
    try {
      final UserDeviceIDModel parentmodel = UserDeviceIDModel(
          batchID: UserCredentialsController.batchId!,
          classID: UserCredentialsController.classId!,
          devideID: deviceID.value,
          uid: parentUID,
          userrole: 'parent',
          schoolID: UserCredentialsController.schoolId!);
      await server
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .doc(UserCredentialsController.classId!)
          .collection('Parents')
          .doc(parentUID)
          .collection('DevideID')
          .doc('DevideID')
          .set(parentmodel.toMap());
    } catch (e) {
      log(e.toString());
    }
  }

  /////////////////////////////////// Parent Part

}
