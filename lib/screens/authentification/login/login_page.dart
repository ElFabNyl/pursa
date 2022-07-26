import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pursa/composants/elevated_button.dart';
import 'package:pursa/composants/text_field.dart';
import 'package:pursa/screens/authentification/login/login_ctrl.dart';
import 'package:pursa/screens/authentification/select_country/choose_country_screen.dart';
import 'package:pursa/screens/home/index.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 100.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/logo.png"),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Sign in",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Color(0xff218354),
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                InputFormFieldWidget(
                  isnumberInput: false,
                  isEmailInput: true,
                  hintText: "Enter email",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Obx(
                  () => InputFormFieldWidget(
                    isnumberInput: false,
                    isEmailInput: false,
                    obscureText: controller.viewPassword.value,
                    hintText: "Enter password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          //
                          controller.viewPassword.value =
                              !controller.viewPassword.value;
                        },
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        )),
                  ),
                ),
                const SizedBox(height: 15.0),
                DefaultElevatedButton(
                    text:
                        Text("Proceed", style: TextStyle(color: Colors.white)),
                    showArrowBack: false,
                    showArrowFoward: false,
                    backgroundColor: Color(0xff218354),
                    onPressed: () {
                      //an  action should be done here before we move foward

                      Get.offAll(
                        () => const Index(),
                      );
                    }),
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            //
                          },
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700),
                          )),
                      TextButton(
                          onPressed: () {
                            //
                            Get.to(() => const ChooseCountryScreen());
                          },
                          child: Text(
                            "Create  an account",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
