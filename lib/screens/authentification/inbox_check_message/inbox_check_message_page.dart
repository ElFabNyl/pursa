import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:pursa/screens/authentification/code_verification/code_verification_page.dart';

class InboxCheckMessage extends StatelessWidget {
  const InboxCheckMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          Text(
                            "Please verify your email address",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20.0),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "We sent a verification code to",
                                style: TextStyle(
                                    color: Color(0xff6D6D6D), fontSize: 17.0),
                              ),
                              Text(
                                "derekagendia1@gmail.com",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              TextButton(
                                  onPressed: () {
                                    //
                                    Get.offAll(() => const CodeVerification());
                                  },
                                  child: Text(
                                    "Verify the code",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.blue,
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
