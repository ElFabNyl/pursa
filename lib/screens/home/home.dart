import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:pursa/composants/home_card.dart';
import 'package:pursa/composants/text_field.dart';
import 'package:pursa/screens/authentification/sign%20up%20with%20email/sign_up_ctrl.dart';
import 'package:pursa/screens/home/index.dart';
import 'package:pursa/screens/select%20scrypto/select_crypto.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pursa/services/inutilisable_ailleur.dart';
import 'package:pursa/services/phone_verification.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../composants/elevated_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
   
    //
    Widget _buildDropdownItem(Country country) => Container(
          child: Row(
            children: <Widget>[
              CountryPickerUtils.getDefaultFlagImage(country),
              SizedBox(
                width: 8.0,
              ),
              Text("+${country.phoneCode}(${country.isoCode})"),
            ],
          ),
        );
    //
    SignUpController controller = Get.find();
    //
    String codeOtp = "";

    return Column(
      children: [
        CarouselSlider(
          items: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffEAF5F8),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 90,
                        width: 90,
                        child: Text(
                          "Refer others to pursa and gain 20% commission",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 19.0),
                        ),
                      ),
                      Image.asset("assets/images/slide1.png")
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0)),
            )
          ],
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20.0),
          child: Column(
            children: [
              HomeCard(
                crytoImage: CircleAvatar(
                  backgroundColor: Color(0xffB6F8E0),
                  radius: 30.0,
                  child: Icon(
                    FontAwesomeIcons.coins,
                    color: Color(0xff477747),
                  ),
                ),
                cardTitle: "Buy crypto",
                carDescription: "Buy crypto currency directly into your wallet",
                action: () {
                  
                  //===================================================
                  controller.user_phone_was_checked.value
                      ? Get.to(() => const SelectCrypto())
                      : showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Obx(
                              () => Container(
                                height: 600,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: controller.showLoadingIndicator.value
                                      ? Center(
                                          child: LoadingIndicator(
                                              indicatorType:
                                                  Indicator.ballScale,
                                              colors: const [Color(0xff218354)],
                                              strokeWidth: 2,
                                              pathBackgroundColor: Colors.red),
                                        )
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    const SizedBox(
                                                        height: 15.0),
                                                    Text(
                                                      "Phone verification",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 22.0,
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                    const SizedBox(
                                                        height: 10.0),
                                                    SizedBox(
                                                      width: 270,
                                                      child: Text(
                                                        "you need to provide a valid phone number to make a transaction",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 17.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          child:
                                                              CountryPickerDropdown(
                                                            initialValue: 'CM',
                                                            itemBuilder:
                                                                _buildDropdownItem,
                                                            priorityList: [
                                                              CountryPickerUtils
                                                                  .getCountryByIsoCode(
                                                                      'GB'),
                                                              CountryPickerUtils
                                                                  .getCountryByIsoCode(
                                                                      'CN'),
                                                            ],
                                                            sortComparator: (Country
                                                                        a,
                                                                    Country
                                                                        b) =>
                                                                a.isoCode
                                                                    .compareTo(b
                                                                        .isoCode),
                                                            onValuePicked:
                                                                (Country
                                                                    country) {
                                                              controller
                                                                      .user_code_tel
                                                                      .value =
                                                                  "+" +
                                                                      country
                                                                          .phoneCode
                                                                          .toString();
                                                              // print(controller
                                                              //     .user_code_tel
                                                              //     .value);
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 200.0,
                                                          child:
                                                              InputFormFieldWidget(
                                                            onChanged: (value) {
                                                              controller
                                                                  .user_phone_number
                                                                  .value = value;
                                                            },
                                                            isnumberInput: true,
                                                            isEmailInput: false,
                                                            hintText:
                                                                "Enter Phone",
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15.0,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 130,
                                                  child: DefaultElevatedButton(
                                                      text: Text(
                                                        "Proceed",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      showArrowBack: false,
                                                      showArrowFoward: true,
                                                      backgroundColor:
                                                          Color(0xff218354),
                                                      onPressed: () async {
                                                        //an  action should be done here before we move foward
                                                        controller.user_code_tel
                                                                .value.isEmpty
                                                            ? controller
                                                                .user_code_tel
                                                                .value = "+237"
                                                            : debugPrint("");
                                                        await CheckPhone
                                                            .phoneVerification2(
                                                                controller
                                                                        .user_code_tel
                                                                        .value +
                                                                    controller
                                                                        .user_phone_number
                                                                        .value);
                                                        print(controller
                                                            .show_Next_Bottom_Sheet1
                                                            .value);
                                                        controller
                                                                .show_Next_Bottom_Sheet1
                                                                .value
                                                            ? showModalBottomSheet(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return Obx(
                                                                    () =>
                                                                        Container(
                                                                      height:
                                                                          600,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(10.0),
                                                                        child: controller.showLoadingIndicator.value
                                                                            ? Center(
                                                                                child: LoadingIndicator(indicatorType: Indicator.ballScale, colors: const [Color(0xff218354)], strokeWidth: 2, pathBackgroundColor: Colors.red),
                                                                              )
                                                                            : Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Column(
                                                                                        children: [
                                                                                          const SizedBox(height: 15.0),
                                                                                          Text(
                                                                                            "Phone verification",
                                                                                            textAlign: TextAlign.center,
                                                                                            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800),
                                                                                          ),
                                                                                          const SizedBox(height: 10.0),
                                                                                          SizedBox(
                                                                                            width: 270,
                                                                                            child: Text(
                                                                                              "Enter the OTP code sent to you by SMS",
                                                                                              textAlign: TextAlign.center,
                                                                                              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500, color: Colors.grey),
                                                                                            ),
                                                                                          ),
                                                                                          const SizedBox(
                                                                                            height: 15.0,
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              SizedBox(
                                                                                                width: 300.0,
                                                                                                child: InputFormFieldWidget(
                                                                                                  onChanged: (value) {
                                                                                                    setState(() {
                                                                                                      codeOtp = value;
                                                                                                    });
                                                                                                  },
                                                                                                  isnumberInput: true,
                                                                                                  isEmailInput: false,
                                                                                                  hintText: "Enter code",
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    height: 15.0,
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: 130,
                                                                                        child: DefaultElevatedButton(
                                                                                            text: Text(
                                                                                              "Proceed",
                                                                                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                                                                                            ),
                                                                                            showArrowBack: false,
                                                                                            showArrowFoward: true,
                                                                                            backgroundColor: Color(0xff218354),
                                                                                            onPressed: () async {
                                                                                              //an  action should be done here before we move foward
                                                                                              CheckPhone.checkOtp2(codeOtp);
                                                                                              //
                                                                                              controller.show_Next_Bottom_Sheet2.value
                                                                                                  ? showModalBottomSheet(
                                                                                                      context: context,
                                                                                                      builder: (BuildContext context) {
                                                                                                        return Obx(
                                                                                                          () => Container(
                                                                                                            height: 600,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: Colors.white,
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: const EdgeInsets.all(10.0),
                                                                                                              child: controller.showLoadingIndicator.value
                                                                                                                  ? Center(
                                                                                                                      child: LoadingIndicator(indicatorType: Indicator.ballScale, colors: const [Color(0xff218354)], strokeWidth: 2, pathBackgroundColor: Colors.red),
                                                                                                                    )
                                                                                                                  : Column(
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Row(
                                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                          children: [
                                                                                                                            Column(
                                                                                                                              children: [
                                                                                                                                const SizedBox(height: 15.0),
                                                                                                                                Text(
                                                                                                                                  "Phone verification",
                                                                                                                                  textAlign: TextAlign.center,
                                                                                                                                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800),
                                                                                                                                ),
                                                                                                                                const SizedBox(height: 10.0),
                                                                                                                                SizedBox(
                                                                                                                                  width: 280,
                                                                                                                                  child: Text(
                                                                                                                                    "Phone  number verified you can now make your transactions with ease",
                                                                                                                                    textAlign: TextAlign.center,
                                                                                                                                    style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500, color: Colors.grey),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                const SizedBox(
                                                                                                                                  height: 15.0,
                                                                                                                                ),
                                                                                                                                SizedBox(
                                                                                                                                  height: 120,
                                                                                                                                  width: 120,
                                                                                                                                  child: Lottie.asset("assets/animations/success.json", repeat: true),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            )
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        const SizedBox(
                                                                                                                          height: 20.0,
                                                                                                                        ),
                                                                                                                        Row(
                                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                          children: [
                                                                                                                            SizedBox(
                                                                                                                              width: 130,
                                                                                                                              child: DefaultElevatedButton(
                                                                                                                                  text: Text(
                                                                                                                                    "Done",
                                                                                                                                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                                                                                                                                  ),
                                                                                                                                  showArrowBack: false,
                                                                                                                                  showArrowFoward: false,
                                                                                                                                  backgroundColor: Color(0xff218354),
                                                                                                                                  onPressed: () async {
                                                                                                                                    //i should call the update endpoint here. passing to it the email
                                                                                                                                    //and the phone number of this user                                                                                                                           //
                                                                                                                                    print(" ok tu peux store le numero en memoire");

                                                                                                                                    // Get.offAll(() => const Index());
                                                                                                                                    // Get.snackbar(
                                                                                                                                    //   "PURSA NOTIFICATION",
                                                                                                                                    //   'You can now buy your Crypto',
                                                                                                                                    //   icon: const Icon(Icons.error, color: Colors.green),
                                                                                                                                    //   snackPosition: SnackPosition.BOTTOM,
                                                                                                                                    //   duration: const Duration(seconds: 8),
                                                                                                                                    // );
                                                                                                                                  }),
                                                                                                                            )
                                                                                                                          ],
                                                                                                                        )
                                                                                                                      ],
                                                                                                                    ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      })
                                                                                                  : null;
                                                                                            }),
                                                                                      )
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                })
                                                            : null;
                                                      }),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                ),
                              ),
                            );
                          });
                },
              ),
              const SizedBox(
                height: 15.0,
              ),
              HomeCard(
                crytoImage: CircleAvatar(
                  backgroundColor: Color(0xffFFEAAD),
                  radius: 30.0,
                  child: Icon(
                    FontAwesomeIcons.coins,
                    color: Color(0xffB76300),
                  ),
                ),
                cardTitle: "Sell Crypto",
                carDescription: "Buy crypto currency directly into your wallet",
                action: () {
                  //
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
