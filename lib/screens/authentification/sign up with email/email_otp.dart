import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pursa/composants/elevated_button.dart';
import 'package:pursa/screens/authentification/sign%20up%20with%20email/create_password.dart';
import 'package:pursa/screens/authentification/sign%20up%20with%20email/sign_up_ctrl.dart';

class EmailOtpScreen extends StatelessWidget {
  const EmailOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 15.0, right: 15.0),
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
                      "Enter the verification code sent to you by email",
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
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        onChanged: (value) {
                          //
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin1) {
                          //
                          controller.pin1.value = pin1.toString();
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
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        onChanged: (value) {
                          //
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin2) {
                          //

                          controller.pin2.value = pin2.toString();
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
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        onChanged: (value) {
                          //
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin3) {
                          //

                          controller.pin3.value = pin3.toString();
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
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        onChanged: (value) {
                          //
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin4) {
                          //
                          controller.pin4.value = pin4.toString();
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
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        onSaved: (pin5) {
                          //
                          controller.pin5.value = pin5.toString();
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
                    text: Text("Proceed"),
                    showArrowBack: false,
                    showArrowFoward: true,
                    elevation: 3.0,
                    backgroundColor: Color(0xff218354),
                    onPressed: () {
                      //
                      controller.pin.value = controller.getPin();

                      print(controller.pin.value);

                      Get.offAll(
                        () => const CreatePasswordScreen(),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
