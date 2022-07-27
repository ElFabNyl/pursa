import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:loading_indicator/loading_indicator.dart';
import 'package:pursa/composants/elevated_button.dart';
import 'package:pursa/composants/text_field.dart';
import 'package:pursa/screens/authentification/inbox_check_message/inbox_check_message_page.dart';
import 'package:pursa/screens/authentification/sign%20up%20with%20email/sign_up_ctrl.dart';
import 'package:pursa/services/api_service_auth.dart';

class EmailInputScreen extends StatefulWidget {
  const EmailInputScreen({Key? key}) : super(key: key);

  @override
  State<EmailInputScreen> createState() => _EmailInputScreenState();
}

class _EmailInputScreenState extends State<EmailInputScreen> {
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
                                  'Welcome to PursaExchange',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xff101437),
                                  ),
                                ),
                                Text(
                                  'Please enter your email address',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        InputFormFieldWidget(
                          onChanged: (value) {
                            controller.user_email.value = value;
                          },
                          isnumberInput: false,
                          isEmailInput: true,
                          hintText: "Enter a valid email address",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        DefaultElevatedButton(
                            text: Text(
                              "Proceed",
                              style: TextStyle(color: Colors.white),
                            ),
                            showArrowBack: false,
                            showArrowFoward: true,
                            backgroundColor: Color(0xff218354),
                            onPressed: () async {
                              //an  action should be done here before we move foward
                              controller.showLoadingIndicator.value = true;
                              var res =
                                  await AuthentificationApiService.verifyEmailAddress(
                                      "sakineb139@galotv.com");
                              controller.showLoadingIndicator.value = false;
                              print(res);

                              // Get.to(
                              //   () => const InboxCheckMessage(),
                              // );
                            })
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
