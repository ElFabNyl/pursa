import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pursa/screens/authentification/select_country/choose_country_screen.dart';

class SelectCrypto extends StatelessWidget {
  const SelectCrypto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Buy crypto",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 80.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  //
                  Get.to(() => const ChooseCountryScreen());
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
                            Icon(
                              FontAwesomeIcons.bitcoin,
                              color: Color(0xffE28323),
                              size: 40.0,
                            ),
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
                          size: 18,
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
                    "Service not yet available",
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
                            Icon(
                              FontAwesomeIcons.ethereum,
                              color: Color(0xff346088),
                              size: 40.0,
                            ),
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
                          size: 18,
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
                    "Service not yet available",
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
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: SizedBox(
                                height: 30.0,
                                width: 30.0,
                                child: Image.asset(
                                  "assets/images/usdt.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 18,
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
                          size: 18,
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
