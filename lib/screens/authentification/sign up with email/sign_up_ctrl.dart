import 'package:get/get.dart';

class SignUpController extends GetxController {
  var isSelected = false.obs;
  var showButton = false.obs;
  var viewPassword = true.obs;
  var user_email = "".obs;

  var pin1 = "0".obs;
  var pin2 = "0".obs;
  var pin3 = "0".obs;
  var pin4 = "0".obs;
  var pin5 = "0".obs;

  var pin = "0".obs;

  String getPin() {
    return pin1.value + pin2.value + pin3.value + pin4.value + pin5.value;
  }
}
