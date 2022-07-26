import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import 'package:pursa/screens/authentification/sign%20up%20with%20email/email_otp.dart';
import 'package:pursa/screens/authentification/sign%20up%20with%20email/sign_up_ctrl.dart';

class EmailExistScreen extends StatelessWidget {
  const EmailExistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.find();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 60.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset("assets/images/logo.png")],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 239, 241, 247),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 30.0),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Obx(
                                    () => Text(
                                      "Welcome back " +
                                          controller.user_email.value,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20.0),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Sign in into your account using your",
                                    style: TextStyle(
                                        color: Color(0xff6D6D6D),
                                        fontSize: 16.0),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              TextButton(
                                onPressed: () {
                                  //
                                },
                                child: Text(
                                  "Password",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xff0B48E4),
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              TextButton(
                                onPressed: () {
                                  //
                                },
                                child: Text(
                                  "Phone number",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xff0B48E4),
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                                TextButton(
                                onPressed: () {
                                  //
                                },
                                child: Text(
                                  "Google account",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xff0B48E4),
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              const SizedBox(height: 15.0),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
