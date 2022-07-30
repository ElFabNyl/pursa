import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pursa/composants/elevated_button.dart';
import 'package:pursa/composants/text_field.dart';
import 'package:pursa/screens/authentification/sign%20up%20with%20email/sign_up_ctrl.dart';
import 'package:pursa/screens/home/index.dart';
import 'package:pursa/services/api_service_auth.dart';

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
        child: controller.showLoadingIndicator.value
            ? Center(
                child: LoadingIndicator(
                    indicatorType: Indicator.ballScale,
                    colors: const [Color(0xff218354)],
                    strokeWidth: 2,
                    pathBackgroundColor: Colors.red),
              )
            : Form(
                key: _formkey,
                child: Padding(
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
                              controller.user_password.value = value;
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
                              onPressed: () async {
                                if (_formkey.currentState!.validate()) {
                                  //
                                  controller.showLoadingIndicator.value = true;
                                  var result_query =
                                      await AuthentificationApiService.login(
                                          controller.user_email.value,
                                          controller.user_password.value);

                                  if (result_query['status']) {
                                    Get.offAll(() => Index());
                                    controller.showLoadingIndicator.value =
                                        false;
                                  } else {
                                    Get.snackbar("PURSA NOTIFICATION",
                                        "Invalid password. try again !",
                                        icon: const Icon(Icons.error,
                                            color: Colors.red),
                                        snackPosition: SnackPosition.TOP,
                                        duration: const Duration(seconds: 5));
                                    controller.showLoadingIndicator.value =
                                        false;
                                  }
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
