import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pursa/composants/elevated_button.dart';
import 'package:pursa/screens/authentification/sign%20up%20with%20email/sign_up_ctrl.dart';
import 'package:pursa/services/phone_verification.dart';

class PhoneOtp extends StatelessWidget {
  const PhoneOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //finding the controller
    SignUpController controller = Get.find();
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: controller.showLoadingIndicator.value
              ? Center(
                  child: LoadingIndicator(
                      indicatorType: Indicator.ballScale,
                      colors: const [Color(0xff218354)],
                      strokeWidth: 0.5,
                      pathBackgroundColor: Colors.red),
                )
              : Padding(
                  padding: const EdgeInsets.only(
                      top: 100.0, left: 15.0, right: 15.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/logo.png"),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 300,
                            child: Text(
                              "Enter the verification code sent to you by SMS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: TextFormField(
                                onChanged: (value) {
                                  //
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  controller.pin1.value = value;
                                },
                                style: Theme.of(context).textTheme.headline6,
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(9),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(9),
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: TextFormField(
                                onChanged: (value) {
                                  //
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  controller.pin2.value = value;
                                },
                                style: Theme.of(context).textTheme.headline6,
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(9),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(9),
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: TextFormField(
                                onChanged: (value) {
                                  //
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  controller.pin3.value = value;
                                },
                                style: Theme.of(context).textTheme.headline6,
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(9),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(9),
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: TextFormField(
                                onChanged: (value) {
                                  //
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  controller.pin4.value = value;
                                },
                                style: Theme.of(context).textTheme.headline6,
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(9),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(9),
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: TextFormField(
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  controller.pin5.value = value;
                                },
                                style: Theme.of(context).textTheme.headline6,
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(9),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(9),
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: TextFormField(
                                onChanged: (value) {
                                  controller.pin6.value = value;
                                },
                                style: Theme.of(context).textTheme.headline6,
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(9),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(9),
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: 130.0,
                        child: DefaultElevatedButton(
                            text: Text(
                              "Proceed",
                            ),
                            showArrowBack: false,
                            showArrowFoward: true,
                            elevation: 3.0,
                            backgroundColor: Color(0xff218354),
                            onPressed: () async {
                              //
                              controller.pin.value =
                                  controller.getPinForPhoneOtpCheck();

                              if (controller.pin.value.length < 6) {
                                Get.snackbar(
                                  "PURSA NOTIFICATION",
                                  "please fill all the OTP input",
                                  icon: const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  snackPosition: SnackPosition.TOP,
                                  duration: const Duration(seconds: 6),
                                );
                              } else {
                                //

                                PhoneVerification.checkOtp(
                                    controller.pin.value);
                              }
                            }),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
