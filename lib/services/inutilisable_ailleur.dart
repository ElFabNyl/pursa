import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/authentification/sign up with email/sign_up_ctrl.dart';

class CheckPhone {


    /***
   * exceptionnellement je creais la fonction ci qui va verifier un numero de telephone mais avec differents return
   * 
   */
  static phoneVerification2(String user_phone_number) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    SignUpController controller = Get.find();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    //we display the loading...
    controller.showLoadingIndicator.value = true;
    await _auth.verifyPhoneNumber(
        phoneNumber: user_phone_number,
        verificationCompleted: (PhoneAuthCredential credential) async {
          //we remove the loading...
          controller.showLoadingIndicator.value = false;
          controller.show_Next_Bottom_Sheet1.value = true;
          //we sign the user in (or link the user) with the auto-generated credential
          await _auth.signInWithCredential(credential).then((value) {
            CupertinoAlertDialog(
              title: const Text("Phone Authentification"),
              content: Text("Phone number verified"),
              actions: [
                CupertinoButton(
                    child: Text("Close"),
                    onPressed: () {
                      //
                    })
              ],
            );
          });
        },
        verificationFailed: (FirebaseAuthException verificationFailed) async {
          //we remove the loading...
          controller.showLoadingIndicator.value = false;
          Get.snackbar(
            "PURSA NOTIFICATION",
            'Something went wrong !Please check your phone number and try again',
            icon: const Icon(Icons.error, color: Colors.red),
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 8),
          );
        },
        codeSent: (String verificationId, int? resendToken) async {
          //we remove the loading...
          controller.showLoadingIndicator.value = false;
          controller.code_verification_id.value = verificationId;
          
          preferences.remove("user_phone_number");
          preferences.setString("user_phone_number", user_phone_number);

          //
          controller.show_Next_Bottom_Sheet1.value = true;
        },
        codeAutoRetrievalTimeout: (String verificationId) async {
          //we remove the loading...
          controller.showLoadingIndicator.value = false;
        });
  }

  //this function takes the otp that the user has entered and verifies it
  static checkOtp2(String codeOTP) async {
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
      controller.show_Next_Bottom_Sheet2.value = true;
      
    } on FirebaseAuthException catch (e) {
      controller.showLoadingIndicator.value = false;
      Get.snackbar("PURSA NOTIFICATION", e.message.toString(),
          icon: const Icon(Icons.error, color: Colors.red),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 6));
    }
  }

}