import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pursa/composants/elevated_button.dart';
import 'package:pursa/screens/authentification/select_country/select_country_ctrl.dart';
import 'package:country_picker/country_picker.dart';
import 'package:pursa/screens/buy%20bitcoins/amount.dart';

class ChooseCountryScreen extends StatefulWidget {
  const ChooseCountryScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCountryScreen> createState() => _ChooseCountryScreenState();
}

class _ChooseCountryScreenState extends State<ChooseCountryScreen> {
  //
  CountryController controller = Get.put(CountryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0, left: 18.0, right: 18.0),
          child: SingleChildScrollView(
              child: Obx(
            () => Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      showPhoneCode: false,
                      exclude: <String>[],
                      favorite: <String>[
                        'CM',
                        'NG',
                        'RW',
                        'SN',
                      ],
                      countryListTheme: CountryListThemeData(
                        flagSize: 25,
                        backgroundColor: Colors.white,

                        textStyle:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                        bottomSheetHeight:
                            500, // Optional. Country list modal height
                        //Optional. Sets the border radius for the bottomsheet.
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        //Optional. Styles the search field.
                        inputDecoration: InputDecoration(
                          labelText: 'Search',
                          hintText: 'Start typing to search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xFF8C98A8).withOpacity(0.2),
                            ),
                          ),
                        ),
                      ),
                      onSelect: (Country country) {
                        //i need to split to take only the name because it comes on this format : Name (contry code) phone code
                        controller.choose_country.value =
                            country.displayName.split("(")[0];
                      },
                    );
                    controller.country_is_selected.value = true;
                  },
                  child: Obx(
                    () => Container(
                      height: 50.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xffFFFBFB),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Text(
                              controller.choose_country.value,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                controller.country_is_selected.value
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: (() {
                                //
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 400,
                                        decoration:
                                            BoxDecoration(color: Colors.white),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  //les methodes vont venir de l'API, mais ici je fais d'abord ca comme ca

                                                  controller.payment_method
                                                      .value = "Orange Money ";

                                                  Get.back();
                                                },
                                                child: Text(
                                                  "Orange Money",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  //
                                                },
                                                child: Text(
                                                  "MTN Mobile Money",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  //
                                                },
                                                child: Text(
                                                  "Bank",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });

                                controller.show_confirm_button.value = true;
                              }),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Color(0xffFFFBFB),
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.wallet,
                                            color: Color(0xff34AA72),
                                          ),
                                          const SizedBox(width: 20.0),
                                          Text(
                                            controller.payment_method.value,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : LoadingIndicator(
                        indicatorType: Indicator.ballScale,
                        colors: const [Color(0xff218354)],
                        strokeWidth: 2,
                        pathBackgroundColor: Colors.red),
                controller.show_confirm_button.value
                    ? Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: SizedBox(
                          width: 115.0,
                          child: DefaultElevatedButton(
                            text: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                "confirm",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            showArrowBack: false,
                            showArrowFoward: false,
                            backgroundColor: Color(0xff218354),
                            onPressed: () {
                              //an  action should be done here before we move foward

                              Get.to(() => const AmountScreen());
                            },
                          ),
                        ),
                      )
                    : Text("")
              ],
            ),
          )),
        ),
      ),
    );
  }
}
