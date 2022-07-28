import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pursa/composants/elevated_button.dart';
import 'package:pursa/composants/text_field.dart';
import 'package:pursa/screens/authentification/sign%20up%20with%20email/sign_up_ctrl.dart';
import 'package:pursa/screens/home/index.dart';

class SignInWithPassword extends StatefulWidget {
  const SignInWithPassword({Key? key}) : super(key: key);

  @override
  State<SignInWithPassword> createState() => _SignInWithPasswordState();
}

class _SignInWithPasswordState extends State<SignInWithPassword> {
  @override
  Widget build(BuildContext context) {
    //for form validation
    final _formkey = GlobalKey<FormState>();
    //finding the controller
    SignUpController controller = Get.find();

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 15.0, right: 15.0),
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
                            'Sign in with password',
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
                        "Enter your password",
                        style: TextStyle(fontSize: 18.0),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Obx(
                    () => InputFormFieldWidget(
                      onChanged: (value) {
                        controller.user_email.value = value;
                      },
                      checkInput: (input) {
                        if (input == null || input.isEmpty) {
                          return 'The field is empty';
                        } else if (input.length < 8) {
                          return 'Password should have at least 8 digits';
                        }
                      },
                      isnumberInput: false,
                      isEmailInput: false,
                      obscureText: controller.viewPassword.value,
                      hintText: "Type here...",
                      suffixIcon: IconButton(
                        onPressed: () {
                          //
                          controller.viewPassword.value =
                              !controller.viewPassword.value;
                        },
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        ),
                      ),
                    ),
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
                          if (_formkey.currentState!.validate()) {
                            //

                            print("good");
                            //an  action should be done here before we move foward

                            // Get.offAll(
                            //   () => const Index(),
                            // );
                          }
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
