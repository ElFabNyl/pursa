import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:pursa/screens/buy%20bitcoins/amount.dart';

class TransactionStatusScreen extends StatelessWidget {
  const TransactionStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.off(()=>const AmountScreen());
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
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tracking code",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text(
                        "PTC123654",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff264A55),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          //
                        },
                        icon: Icon(
                          FontAwesomeIcons.copy,
                          color: Color(0xff2F7543),
                          size: 18,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffE8F4EF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.circleCheck,
                                    color: const Color(0xff088450),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Pay",
                                    style: TextStyle(
                                      color: Color(0xff264A55),
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "completed",
                                style: TextStyle(
                                    color: const Color(0xff088450),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Amount",
                                      style: TextStyle(
                                          color: const Color(0xff2D7140),
                                          fontSize: 16.0),
                                    ),
                                    Text(
                                      "180000 " + "XAF",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Via",
                                      style: TextStyle(
                                          color: const Color(0xff2D7140),
                                          fontSize: 16.0),
                                    ),
                                    Text(
                                      " Orange Money CM",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "From",
                                      style: TextStyle(
                                          color: const Color(0xff2D7140),
                                          fontSize: 16.0),
                                    ),
                                    Text(
                                      "+2376558***03",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Color(0xffE8F4EF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  
                                  color: Colors.green,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "Receive",
                                  style: TextStyle(
                                    color: Color(0xff264A55),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "Pending",
                              style: TextStyle(
                                  color: const Color(0xffDD8605),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Amount",
                                    style: TextStyle(
                                        color: const Color(0xff2D7140),
                                        fontSize: 16.0),
                                  ),
                                  Text(
                                    " 0.012307  " + "BTC",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Via",
                                    style: TextStyle(
                                        color: const Color(0xff2D7140),
                                        fontSize: 16.0),
                                  ),
                                  Text(
                                    " BItcoin",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "From",
                                    style: TextStyle(
                                        color: const Color(0xff2D7140),
                                        fontSize: 16.0),
                                  ),
                                  Text(
                                    "3d8sdqfsdf556",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),

            ],
          ),
        ),
      )),
    );
  }
}
