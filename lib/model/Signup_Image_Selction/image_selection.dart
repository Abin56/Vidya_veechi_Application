// ignore_for_file: override_on_non_overriding_member, unused_local_variable

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vidya_veechi/utils/utils.dart';

class GetImage extends GetxController {
  RxString pickedImage = RxString("");

  Future<void> pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        pickedImage.value = image.path;
        print(image.path);
      }
    } catch (e) {
      showToast(msg: "Failed to Pick Image");
    }
  }

  clearPicked() {
    pickedImage.value = "";
  }
}
