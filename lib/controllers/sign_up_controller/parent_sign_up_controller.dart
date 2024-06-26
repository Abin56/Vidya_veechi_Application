import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../model/Signup_Image_Selction/image_selection.dart';
import '../../model/parent_model/parent_model.dart';
import '../../utils/utils.dart';
import '../userCredentials/user_credentials.dart';

class ParentSignUpController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController houseNameController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController altPhoneNoController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<ParentModel> parentModelList = [];

  FirebaseAuth auth = FirebaseAuth.instance;

  RxBool isLoading = RxBool(false);
//for image uploading unique uid      0
  Uuid uuid = const Uuid();

  String? gender;

  //updating parent signup data

  Future<void> updateParentData() async {
    String imageId = "";
    String imageUrl = "";
    try {
      if (Get.find<GetImage>().pickedImage.value.isNotEmpty) {
        auth
            .signInWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim())
            .then((value) async {
          isLoading.value = true;
          imageId = uuid.v1();
          final result = await FirebaseStorage.instance
              .ref(
                  "files/parentProfilePhotos/${UserCredentialsController.schoolId}/${UserCredentialsController.batchId}/${UserCredentialsController.parentModel?.parentName}$imageId")
              .putFile(File(Get.find<GetImage>().pickedImage.value));
          imageUrl = await result.ref.getDownloadURL();
          final ParentModel parentModel = ParentModel(
              createdate:
                  UserCredentialsController.parentModel?.createdate ?? "",
              district: districtController.text,
              docid: value.user?.uid,
              gender: gender,
              houseName: houseNameController.text,
              parentEmail: emailController.text,
              parentName:
                  UserCredentialsController.parentModel?.parentName ?? "",
              parentPhoneNumber:
                  UserCredentialsController.parentModel?.parentPhoneNumber ??
                      "",
              pincode: pinCodeController.text,
              place: placeController.text,
              profileImageID: imageId,
              profileImageURL: imageUrl,
              state: stateController.text,
              studentID: UserCredentialsController.parentModel?.studentID ?? "",
              userRole: 'parent');
          await server
              .collection(UserCredentialsController.batchId ?? "")
              .doc(UserCredentialsController.batchId)
              .collection('classes')
              .doc(UserCredentialsController.classId)
              .collection('Parents')
              .doc(value.user?.uid)
              .set(parentModel.toMap())
              .then((value) async {
            await server
                .collection('AllParents')
                .doc(parentModel.docid)
                .set(parentModel.toMap())
                .then((value) async {
              await server
                  .collection(UserCredentialsController.batchId ?? "")
                  .doc(UserCredentialsController.batchId)
                  .collection('classes')
                  .doc(UserCredentialsController.classId)
                  .collection('Temp_ParentCollection').doc(tempParentDocID.value).delete();
            });
          });
          //add data to firebase

          // .then(
          //   (value) => Get.toAll(
          //     ParentLoginScreen(),
          //   ),
          // );
          Get.find<GetImage>().pickedImage.value = "";
          isLoading.value = false;
          showToast(msg: "Successfully Created");
          clearControllers();
        });
      } else {
        isLoading.value = false;
        showToast(msg: 'Please Upload Image');
      }

      //getting firebase uid and updated it to collection
    } catch (e) {
      showToast(msg: "Updation Failed");
      isLoading.value = false;
    }
  }

  bool checkAllFieldIsEmpty() {
    if (userNameController.text.isEmpty ||
        houseNameController.text.isEmpty ||
        houseNumberController.text.isEmpty ||
        placeController.text.isEmpty ||
        districtController.text.isEmpty ||
        altPhoneNoController.text.isEmpty ||
        pinCodeController.text.isEmpty ||
        stateController.text.isEmpty ||
        gender == null) {
      return true;
    } else {
      return false;
    }
  }
  //

  void clearControllers() {
    userNameController.clear();
    houseNameController.clear();
    houseNumberController.clear();
    placeController.clear();
    districtController.clear();
    altPhoneNoController.clear();
    pinCodeController.clear();
    stateController.clear();
  }

  List<ParentModel> tempParentList = [];
  RxString tempParentDocID = ''.obs;
  RxString tempParentName = ''.obs;
  Future<List<ParentModel>> fetchAllTempParent() async {
    tempParentList.clear();

    await server
        .collection(UserCredentialsController.batchId ?? "")
        .doc(UserCredentialsController.batchId ?? "")
        .collection("classes")
        .doc(UserCredentialsController.classId)
        .collection("Temp_ParentCollection")
        .get()
        .then((value) async {
      final result =
          value.docs.map((e) => ParentModel.fromMap(e.data())).toList();
      tempParentList.addAll(result);
    });

    return tempParentList;
  }
}
