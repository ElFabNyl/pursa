import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pursa/composants/elevated_button.dart';
import 'package:pursa/screens/buy%20bitcoins/transaction_status.dart';

class TransactionSummeryScreen extends StatelessWidget {
  const TransactionSummeryScreen({Key? key}) : super(key: key);

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
          "Transaction Summery",
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
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffE8F4EF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 10, right: 10, bottom: 15.0),
                  child: Column(
                    children: [
                      Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pay:",
                            style: TextStyle(
                                color: const Color(0xff688088), fontSize: 16.0),
                          ),
                          Text(
                            "73684.24 " + "XAF",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w700),
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
                            "From:",
                            style: TextStyle(
                                color: const Color(0xff688088), fontSize: 16.0),
                          ),
                          Text(
                            "695632659",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0,fontWeight: FontWeight.w700),
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
                            "Receive:",
                            style: TextStyle(
                                color: const Color(0xff688088), fontSize: 16.0),
                          ),
                          Text(
                            "73684.24 " + "XAF",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0,fontWeight: FontWeight.w700),
                          ),
                          
                        ],
                      ),
                      const SizedBox(
                            height: 10.0,
                          ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "On:",
                            style: TextStyle(
                                color: const Color(0xff688088), fontSize: 16.0),
                          ),
                          Text(
                            "25/12/2022",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0,fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 130.0,
                            child: DefaultElevatedButton(
                                text: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    "Edit",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                showArrowBack: false,
                                elevation: 3.0,
                                showArrowFoward: false,
                                backgroundColor: Color(0xffFF8514),
                                onPressed: () {
                                  Get.back();
                                }),
                          ),
                          SizedBox(
                            width: 130.0,
                            child: DefaultElevatedButton(
                                text: Padding(
                                  padding: const EdgeInsets.only(left: 14.0),
                                  child: Text(
                                    "Confirm",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                showArrowBack: false,
                                elevation: 3.0,
                                showArrowFoward: false,
                                backgroundColor: Color(0xff218354),
                                onPressed: () {
                                  //
                                  Get.to(()=>const TransactionStatusScreen() );
                                }),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
