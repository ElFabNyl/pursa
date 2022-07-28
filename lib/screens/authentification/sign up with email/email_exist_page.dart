import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pursa/screens/authentification/sign%20up%20with%20email/sign_up_ctrl.dart';
import 'package:pursa/screens/authentification/signin/sign_in_with_password.dart';
import 'package:pursa/screens/authentification/signin/sign_in_with_phone_number.dart';

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
                          horizontal: 15.0, vertical: 15.0),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Welcome back ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20.0,
                                        color: Colors.grey),
                                  ),
                                  Obx(
                                    () => Text(
                                      controller.user_name.value,
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
                                ],
                              ),
                              const SizedBox(
                                height: 9.0,
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              TextButton(
                                onPressed: () {
                                  //
                                  Get.to(() => const SignInWithPassword());
                                },
                                child: Text(
                                  "Password",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xff176EAD),
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              TextButton(
                                onPressed: () {
                                  //
                                  Get.to(() => const SignInWithPhoneNumber());
                                },
                                child: Text(
                                  "Phone number",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xff176EAD),
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              TextButton(
                                onPressed: () {
                                  //
                                },
                                child: Text(
                                  "Google account",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xff176EAD),
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
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
