import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import 'package:pursa/screens/authentification/sign%20up%20with%20email/email_otp.dart';
import 'package:pursa/screens/authentification/sign%20up%20with%20email/sign_up_ctrl.dart';

class InboxCheckMessage extends StatelessWidget {
  const InboxCheckMessage({Key? key}) : super(key: key);

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
                          SizedBox(
                            height: 70.0,
                            width: 70.0,
                            child: Lottie.asset(
                                "assets/animations/envelop.json",
                                fit: BoxFit.fill),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Obx(
                                () => Text(
                                  controller.user_email.value,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20.0),
                                ),
                              ),
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Not the correct email ?",
                                    style: TextStyle(
                                        color: Color(0xff6D6D6D),
                                        fontSize: 14.0),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      //
                                      Get.back();
                                    },
                                    child: Text(
                                      "correct it here",
                                      style: TextStyle(
                                          color: Color(0xff0B48E4), fontSize: 14.0, fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                              TextButton(
                                  onPressed: () {
                                    //
                                    Get.to(() => const EmailOtpScreen());
                                  },
                                  child: Text(
                                    "Send verification code",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color(0xff0B48E4),
                                        fontWeight: FontWeight.w800),
                                  ))
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
