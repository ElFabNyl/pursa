import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pursa/composants/elevated_button.dart';
import 'package:pursa/screens/buy%20bitcoins/transaction_status.dart';
import 'package:pursa/screens/home/index.dart';

class AwaitingPaymentScreen extends StatelessWidget {
  const AwaitingPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TimerCountdown(
                      format: CountDownTimerFormat.minutesSeconds,
                      enableDescriptions: false,
                      spacerWidth: 5,
                      timeTextStyle: TextStyle(
                          color: Color(0xff218354),
                          fontSize: 22,
                          fontWeight: FontWeight.w900),
                      endTime: DateTime.now().add(
                        Duration(minutes: 8),
                      ),
                      onEnd: () {
                        //we are going to reset the field here
                        print("Timer finished");
                      },
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      children: [
                        Text(
                          "Pending payment of ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "  15000" + " XAF",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "from ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "699508197",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Follow up code",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "PTCN71TDL8",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 80,
                      width: 80.0,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballScale,
                        colors: const [Color(0xff218354)],
                        strokeWidth: 2,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        SizedBox(
                            width: 130.0,
                            child: DefaultElevatedButton(
                                text: Padding(
                                  padding: const EdgeInsets.only(left: 14.0),
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                showArrowBack: false,
                                elevation: 3.0,
                                showArrowFoward: false,
                                backgroundColor: Color.fromARGB(255, 230, 188, 3),
                                onPressed: () {
                                  //
                                 Get.offAll(()=>const Index());
                                }),
                          ),
                          const SizedBox(width: 10.0,),
                           SizedBox(
                            width: 130.0,
                            child: DefaultElevatedButton(
                                text: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Expanded(
                                    child: Text(
                                      "I paid",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                showArrowBack: false,
                                elevation: 3.0,
                                showArrowFoward: false,
                                backgroundColor: Color.fromARGB(255, 24, 169, 236),
                                onPressed: () {
                                  //
                                 Get.to(()=>const TransactionStatusScreen());
                                }),
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
