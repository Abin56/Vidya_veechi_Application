import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  void submitForm(Function function) {
    if (formKey.currentState!.validate()) {
      function;
      // Form is valid, process data further
      // print("Form is valid");
      // Example: Authenticate user, send data to server, etc.
    } else {
      // Form is invalid
      // print("Form is invalid");
    }
  }
}
