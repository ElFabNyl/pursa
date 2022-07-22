import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pursa/screens/authentification/login/login_page.dart';

import '../authentification/select_country/select_country_page.dart';

class SplashBitcoinScreen extends StatefulWidget {
  const SplashBitcoinScreen({Key? key}) : super(key: key);

  @override
  State<SplashBitcoinScreen> createState() => _SplashBitcoinScreenState();
}

class _SplashBitcoinScreenState extends State<SplashBitcoinScreen> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Get.offAll(() => const Login());
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
