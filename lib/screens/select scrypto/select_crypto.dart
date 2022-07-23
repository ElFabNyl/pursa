import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pursa/screens/buy%20bitcoins/where_to_buy.dart';

class SelectCrypto extends StatelessWidget {
  const SelectCrypto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 80.0),
          child: Column(
            children: [
              Text(
                "Select crypto to buy",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
              ),
              const SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  //

                  Get.snackbar(
                    "PURSA NOTIFICATION",
                    "Still working on this",
                  );
                  // Get.to(() => const WhereToBy());
                },
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffF6F6F6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(backgroundColor: Color(0xffFFEAAD)),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              "Bitcoin",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 18.0),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  //
                   Get.snackbar(
                    "PURSA NOTIFICATION",
                    "Still working on this",
                    
                  );
                },
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffF6F6F6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(backgroundColor: Color(0xff698A9C)),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              "Etherium",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 18.0),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  //
                   Get.snackbar(
                    "PURSA NOTIFICATION",
                    "Still working on this",
                    
                  );
                },
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffF6F6F6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(backgroundColor: Color(0xff35C0B0)),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              "USDT",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 18.0),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
