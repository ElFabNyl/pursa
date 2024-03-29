import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pursa/composants/elevated_button.dart';
import 'package:pursa/screens/authentification/sign%20up%20with%20email/sign_up_ctrl.dart';
import 'package:pursa/services/phone_verification.dart';

class SignInWithPhoneNumber extends StatefulWidget {
  const SignInWithPhoneNumber({Key? key}) : super(key: key);

  @override
  State<SignInWithPhoneNumber> createState() => _SignInWithPhoneNumberState();
}

class _SignInWithPhoneNumberState extends State<SignInWithPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    //finding the controller
    SignUpController controller = Get.find();

    return Scaffold(
        body: Obx(
      () => SafeArea(
        child: controller.showLoadingIndicator.value
            ? Center(
                child: LoadingIndicator(
                    indicatorType: Indicator.ballScale,
                    colors: const [Color(0xff218354)],
                    strokeWidth: 2,
                    pathBackgroundColor: Colors.red),
              )
            : Padding(
                padding:
                    const EdgeInsets.only(top: 100, left: 15.0, right: 15.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Image.asset('assets/images/logo.png'),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                'Sign in with phone number',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff101437),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Phone number",
                            style: TextStyle(fontSize: 18.0),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "+" +
                                controller.user_code_tel.value +
                                " " +
                                controller.user_phone_number.value
                                    .substring(0, 3) +
                                "** **" +
                                controller.user_phone_number.value
                                    .substring(7, 9),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffDFE5DE),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: 140.0,
                        child: DefaultElevatedButton(
                            text: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                "Done",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            showArrowBack: false,
                            showArrowFoward: false,
                            elevation: 4.0,
                            backgroundColor: Color(0xff218354),
                            onPressed: () {
                              //an  action should be done here before we move foward
                              PhoneVerification.phoneVerification("+" +
                                  controller.user_code_tel.value +
                                  controller.user_phone_number.value);
                            }),
                      )
                    ],
                  ),
                ),
              ),
      ),
    ));
  }
}
