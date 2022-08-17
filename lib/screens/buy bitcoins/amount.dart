import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pursa/composants/elevated_button.dart';
import 'package:pursa/composants/text_field.dart';
import 'package:pursa/screens/authentification/select_country/select_country_ctrl.dart';
import 'package:pursa/screens/buy%20bitcoins/transaction_summery.dart';

class AmountScreen extends StatefulWidget {
  const AmountScreen({Key? key}) : super(key: key);

  @override
  State<AmountScreen> createState() => _AmountScreenState();
}

class _AmountScreenState extends State<AmountScreen> {
  // Create a text controller. Later, use it to retrieve the
  // current value of the TextField.
  final myController = TextEditingController();
  //
  // the function that will check if the amount entered is valid.
  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  //
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  //for form validation
  final _formkey = GlobalKey<FormState>();
  CountryController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 18.0,
          ),
        ),
        title: Text(
          "Buy Bitcoin",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(() => Form(
              key: _formkey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 400,
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            //les methodes vont venir de l'API, mais ici je fais d'abord ca comme ca
                                          },
                                          child: Text(
                                            "Orange Money ",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            //
                                            controller.payment_method.value =
                                                "MoMo";

                                            Get.back();
                                          },
                                          child: Text(
                                            "MTN Mobile Money",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            //
                                          },
                                          child: Text(
                                            "Bank",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 11.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffD9FFDF),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Buy Bitcoin with " +
                                          controller.payment_method.value,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff0F5232),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(width: 9.0),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: const Color(0xff0F5232),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TimerCountdown(
                        format: CountDownTimerFormat.minutesSeconds,
                        enableDescriptions: false,
                        spacerWidth: 5,
                        timeTextStyle: TextStyle(
                            color: Color(0xff218354),
                            fontSize: 22,
                            fontWeight: FontWeight.w900),
                        endTime: DateTime.now().add(
                          Duration(minutes: 2),
                        ),
                        onEnd: () {
                          //we are going to reset the field here
                          print("Timer finished");
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffE8F4EF),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50.0),
                                      child: Text(
                                        "I have",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Color(0xffFFAF13),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    SizedBox(
                                      width: 275,
                                      child: TextFormField(
                                        //
                                        controller: myController,
                                        //
                                        onChanged: (value) {
                                          //
                                        },
                                        validator: (input) {
                                          if (input == null || input.isEmpty) {
                                            return 'The field is empty';
                                          }
                                        },
                                        textAlign: TextAlign.right,
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xffFFFBFB),
                                          hintText: "0",
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 13.0, left: 3.0),
                                            child: Text(
                                              "XAF",
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff9C9BA1),
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 20.0),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(9),
                                            ),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                              width: 0.5,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(9),
                                            ),
                                          ),
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(9),
                                            ),
                                          ),
                                        ),
                                        cursorColor:
                                            Color.fromARGB(255, 17, 66, 19),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12.0,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50.0),
                                      child: Text(
                                        "I need",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.asset(
                                        "assets/images/btc.png",
                                        fit: BoxFit.cover,
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    SizedBox(
                                      width: 275,
                                      child: TextFormField(
                                        onChanged: (value) {
                                          //
                                        },
                                        validator: (input) {
                                          if (input == null || input.isEmpty) {
                                            return 'The field is empty';
                                          }
                                        },
                                        textAlign: TextAlign.right,
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xffFFFBFB),
                                          hintText: "0",
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 13.0, left: 3.0),
                                            child: Text(
                                              "USD",
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff9C9BA1),
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 20.0),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(9),
                                            ),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                              width: 0.5,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(9),
                                            ),
                                          ),
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(9),
                                            ),
                                          ),
                                        ),
                                        cursorColor:
                                            Color.fromARGB(255, 17, 66, 19),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        //
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.retweet,
                                        color: Color(0xff0B48E4),
                                        size: 20.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 15.0),
                                      child: Text(
                                        "0.002 " + "BTC",
                                        style: TextStyle(
                                            color: Color(0xff0B48E4),
                                            fontSize: 15.0),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                //====================================================
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 300.0,
                                      child: InputFormFieldWidget(
                                          isnumberInput: false,
                                          isEmailInput: false,
                                          hintText: "6XX XXX XXX",
                                          prefixIcon: Icon(
                                            Icons.phone,
                                            color: Colors.grey,
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    SizedBox(
                                      width: 300.0,
                                      child: InputFormFieldWidget(
                                        isnumberInput: false,
                                        isEmailInput: false,
                                        hintText: "Enter your Bitcoin address",
                                        prefixIcon: Icon(
                                          FontAwesomeIcons.wallet,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                //====================================================
                                SizedBox(
                                  width: 130.0,
                                  child: DefaultElevatedButton(
                                      text: Text(
                                        "Proceed",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      showArrowBack: false,
                                      showArrowFoward: true,
                                      backgroundColor: Color(0xff218354),
                                      onPressed: () {
                                        if (_formkey.currentState!.validate()) {
                                          //an  action should be done here before we move foward
                                          Get.to(() =>
                                              const TransactionSummeryScreen());
                                        }
                                      }),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
