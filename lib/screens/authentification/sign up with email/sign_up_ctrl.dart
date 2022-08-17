import 'package:get/get.dart';

class SignUpController extends GetxController {
  var isSelected = false.obs;
  var showButton = false.obs;
  var viewPassword = true.obs;
  var showLoadingIndicator = false.obs;
  var user_is_connected = false.obs;
  //
  var user_email = "".obs;
  var user_name = "".obs;
  var user_password = "".obs;
  var user_phone_number = "".obs;
  var user_code_tel = "".obs;

  var email_validation_code = "".obs;
  var user_come_from_web = false.obs;
  var user_phone_was_checked = false.obs;

  //
  //these variables are not supposed to be true in the bigining.
  var show_Next_Bottom_Sheet1 = true.obs;
  var show_Next_Bottom_Sheet2 = true.obs;
  

//
  var code_verification_id = "".obs;

  var pin1 = "".obs;
  var pin2 = "".obs;
  var pin3 = "".obs;
  var pin4 = "".obs;
  var pin5 = "".obs;
  var pin6 = "".obs;

  var pin_phone = "".obs;

  var pin_email = "".obs;

  String getPin() {
    return pin1.value + pin2.value + pin3.value + pin4.value + pin5.value;
  }

  String getPinForPhoneOtpCheck() {
    return pin1.value +
        pin2.value +
        pin3.value +
        pin4.value +
        pin5.value +
        pin6.value;
  }
}
