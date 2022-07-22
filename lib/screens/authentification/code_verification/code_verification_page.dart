import 'package:flutter/material.dart';
import 'package:pursa/composants/elevated_button.dart';
import 'package:pursa/composants/text_field.dart';

class CodeVerification extends StatelessWidget {
  const CodeVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset("assets/images/logo.png")],
                ),
                const SizedBox(
                  height: 80.0,
                ),
                Text(
                  "You are on the last step",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Color(0xff218354),
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Enter the code you recieved by email",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                InputFormFieldWidget(
                  isnumberInput: true,
                  isEmailInput: false,
                  hintText: "Enter the code",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: 110.0,
                  child: DefaultElevatedButton(
                      text: Text("Verify", style: TextStyle(color: Colors.white)),
                      showArrowBack: false,
                      showArrowFoward: false,
                      backgroundColor: Color(0xff218354),
                      onPressed: () {
                        //an  action should be done here before we move foward
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
