import 'package:get/get.dart';
import 'package:pursa/screens/authentification/select_country/select_country_ctrl.dart';

class InitializeDepedencies implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountryController());
  }
}
