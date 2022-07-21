import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pursa/composants/elevated_button.dart';
import 'package:pursa/screens/authentification/select_country/select_country_ctrl.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  @override
  Widget build(BuildContext context) {
    //finding the controller
    CountryController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 18.0, right: 18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/images/logo.png'),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Welcome to PursaExchange',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff101437),
                          ),
                        ),
                        Text(
                          'Please select your country',
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Obx(() => TextField(
                        onChanged: ((value) {
                          controller.filterCountries(value);
                        }),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF6F6F6),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                          hintText:
                              controller.selected_country["country_name"] ??
                                  "Type here...",
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        cursorColor: Color.fromARGB(255, 4, 80, 7),
                      )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 200,
                  child: Obx(
                    (() => ListView.builder(
                          itemCount: controller.foundCountries.value.length,
                          itemBuilder: ((context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    //

                                    controller.selected_country.value =
                                        controller.foundCountries.value[index];
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(controller.foundCountries
                                          .value[index]["flag"]!),
                                      const SizedBox(
                                        width: 30.0,
                                      ),
                                      Text(controller.foundCountries
                                          .value[index]["country_name"]!),
                                    ],
                                  ),
                                ),
                              )),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 25.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 350,
                        child: Text(
                          'If your country is not on the list it means our services does not extend to your area.',
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: 110.0,
                  child: DefaultElevatedButton(
                      text: Text("Proceed",
                          style: TextStyle(color: Colors.white)),
                      showArrowBack: false,
                      showArrowFoward: false,
                      backgroundColor: Color(0xff02210B),
                      onPressed: () {}),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
