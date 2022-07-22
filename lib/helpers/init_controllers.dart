import 'package:get/get.dart';
import 'package:pursa/screens/authentification/login/login_ctrl.dart';
import 'package:pursa/screens/authentification/select_country/select_country_ctrl.dart';
import 'package:pursa/screens/authentification/sign_up/sign_up_ctrl.dart';

import '../screens/authentification/code_verification/code_verification_ctrl.dart';

class InitializeDepedencies implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountryController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => CodeVerficationController());
    Get.lazyPut(() => LoginController());
  }
}
