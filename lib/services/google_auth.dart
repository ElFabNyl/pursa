import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  static Future<dynamic> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
          return Get.snackbar("PURSA NOTIFICATION",
              "account-exists-with-different-credential",
              icon: const Icon(Icons.error, color: Colors.red),
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 7));
        } else if (e.code == 'invalid-credential') {
          // handle the error here
          Get.snackbar("PURSA NOTIFICATION", "invalid-credential",
              icon: const Icon(Icons.error, color: Colors.red),
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 7));
        }
      } catch (e) {
        // handle the error here
        Get.snackbar(
          "PURSA NOTIFICATION",
          "an error has occured! try later",
          icon: const Icon(Icons.error, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7),
        );
      }
    }
  }
}
