import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pursa/composants/elevated_button.dart';
import 'package:pursa/composants/text_field.dart';
import 'package:pursa/screens/authentification/inbox_check_message/inbox_check_message_page.dart';
import 'package:pursa/screens/authentification/select_country/select_country_page.dart';
import 'package:pursa/screens/authentification/sign_up/sign_up_ctrl.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 6),
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
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        InputFormFieldWidget(
                          isnumberInput: false,
                          isEmailInput: false,
                          hintText: "Enter user name",
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
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
                          height: 10.0,
                        ),
                        Obx(() => InputFormFieldWidget(
                              isnumberInput: false,
                              isEmailInput: false,
                              obscureText: controller.viewPassword.value,
                              hintText: "Create password",
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
                            )),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Already have and account",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                              ),
                              TextButton(
                                  onPressed: () {
                                    //
                                  },
                                  child: Text(
                                    " sign in instead",
                                    style: TextStyle(
                                        color: Color(0xff345CAA),
                                        fontWeight: FontWeight.w400),
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Obx(() => Checkbox(
                                value: controller.isSelected.value,
                                onChanged: (checked) {
                                  //
                                  controller.isSelected.value = checked!;
                                  controller.showButton.value = checked;
                                })),
                            TextButton(
                              onPressed: () {
                                // direct to the terms and conditions of pursa
                              },
                              child: SizedBox(
                                width: 250,
                                child: Text(
                                  "I have read and agreed to the tearms and conditions of using pursa",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Color(0xff475777),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Obx(
                          () => controller.showButton.value
                              ? SizedBox(
                                  width: 110.0,
                                  child: DefaultElevatedButton(
                                      text: Text("Proceed",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      showArrowBack: false,
                                      showArrowFoward: false,
                                      backgroundColor: Color(0xff218354),
                                      onPressed: () {
                                        //an  action should be done here before we move foward

                                        Get.offAll(
                                            () => const InboxCheckMessage());
                                      }),
                                )
                              : Text(""),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.to(() => const SelectCountry());
                              },
                              child: Text(
                                "Back",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
