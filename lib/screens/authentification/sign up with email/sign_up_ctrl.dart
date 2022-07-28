import 'package:get/get.dart';

class SignUpController extends GetxController {
  var isSelected = false.obs;
  var showButton = false.obs;
  var viewPassword = true.obs;
  var user_email = "".obs;
  var user_name = "".obs;
  var user_password = "".obs;
  var user_phone_number = "".obs;

  var phoneNumberIsChecked = false.obs;

  var showLoadingIndicator = false.obs;

  var pin1 = "".obs;
  var pin2 = "".obs;
  var pin3 = "".obs;
  var pin4 = "".obs;
  var pin5 = "".obs;

  var pin = "".obs;

  String getPin() {
    return pin1.value + pin2.value + pin3.value + pin4.value + pin5.value;
  }
}
