import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pursa/screens/authentification/sign%20up%20with%20email/email_input.dart';
import 'package:pursa/screens/authentification/sign%20up%20with%20email/sign_up_ctrl.dart';
import 'package:pursa/screens/home/index.dart';
import 'package:pursa/services/api_service_auth.dart';

class SplashBitcoinScreen extends StatefulWidget {
  const SplashBitcoinScreen({Key? key}) : super(key: key);

  @override
  State<SplashBitcoinScreen> createState() => _SplashBitcoinScreenState();
}

class _SplashBitcoinScreenState extends State<SplashBitcoinScreen> {
  //
 
  @override
  void initState() {
    super.initState();
    SignUpController controller = Get.find();
    Future.delayed(
      const Duration(seconds: 4),
      () {
        if (controller.user_phone_was_checked.value ) {
          Get.offAll(() => const Index());
        } else {
          Get.offAll(() => const EmailInputScreen());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff02210B),
        body: Center(
          child: SizedBox(
            height: 170.0,
            width: 170.0,
            child: Lottie.asset('assets/animations/bitcoin.json',
                fit: BoxFit.fill),
          ),
        ));
  }
}
