import 'package:get/get.dart';
import 'package:pursa/screens/activities/activities_ctrl.dart';

import 'package:pursa/screens/authentification/select_country/select_country_ctrl.dart';
import 'package:pursa/screens/buy%20bitcoins/buy_btc_ctrl.dart';

import '../screens/authentification/sign up with email/sign_up_ctrl.dart';

class InitializeDepedencies implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountryController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => BuyBtcController());
    Get.lazyPut(() => ActivitiesController());
  }
}
