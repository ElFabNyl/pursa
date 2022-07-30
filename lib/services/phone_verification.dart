import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pursa/screens/authentification/sign%20up%20with%20email/sign_up_ctrl.dart';
import 'package:pursa/screens/authentification/signin/phone_otp.dart';
import 'package:pursa/screens/home/index.dart';

class PhoneVerification {
  //firebase phone authentification

  static phoneVerification(String user_phone_number) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    SignUpController controller = Get.find();
    //we display the loading...
    controller.showLoadingIndicator.value = true;
    await _auth.verifyPhoneNumber(
        phoneNumber: user_phone_number,
        verificationCompleted: (PhoneAuthCredential credential) async {
          //we remove the loading...
          controller.showLoadingIndicator.value = false;

          //we sign the user in (or link the user) with the auto-generated credential
          await _auth.signInWithCredential(credential).then((value) {
            CupertinoAlertDialog(
              title: const Text("Phone Authentification"),
              content: Text("Phone number verified"),
              actions: [
                CupertinoButton(
                    child: Text("Close"),
                    onPressed: () {
                      Get.offAll(() => Index());
                    })
              ],
            );
          });
        },
        verificationFailed: (FirebaseAuthException verificationFailed) async {
          //we remove the loading...
          controller.showLoadingIndicator.value = false;
          Get.snackbar(
              "PURSA NOTIFICATION", 'Mothing went wrong !Please try again',
              icon: const Icon(Icons.error, color: Colors.red),
              snackPosition: SnackPosition.TOP,
              duration: const Duration(seconds: 8));
        },
        codeSent: (String verificationId, int? resendToken) async {
          //we remove the loading...
          controller.showLoadingIndicator.value = false;
          controller.code_verification_id.value = verificationId;

          Get.to(() => const PhoneOtp());
        },
        codeAutoRetrievalTimeout: (String verificationId) async {
          //we remove the loading...
          controller.showLoadingIndicator.value = false;
        });
  }

  //this function takes the otp that the user has entered and verifies it
  static checkOtp(String codeOTP) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    SignUpController controller = Get.find();
    //we display  the loading...
    controller.showLoadingIndicator.value = true;
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: controller.code_verification_id.value,
          smsCode: codeOTP);

      await _auth.signInWithCredential(phoneAuthCredential);
      //we remove the loading...
      controller.showLoadingIndicator.value = false;
      
      Get.offAll(() => Index());
    } on FirebaseAuthException catch (e) {
      controller.showLoadingIndicator.value = false;
      Get.snackbar("PURSA NOTIFICATION", e.message.toString(),
          icon: const Icon(Icons.error, color: Colors.red),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 6));

      
    }
  }
}
