
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pursa/composants/elevated_button.dart';
import 'package:pursa/screens/authentification/select_country/select_country_ctrl.dart';
import 'package:country_picker/country_picker.dart';

class WhereToBy extends StatefulWidget {
  const WhereToBy({Key? key}) : super(key: key);

  @override
  State<WhereToBy> createState() => _WhereToByState();
}

class _WhereToByState extends State<WhereToBy> {
  //
  CountryController controller = Get.find();
  bool showButton = false;
  final paymentMethods = ["Method 1", "Method 2", "Method 3", "Method 4"];
  String value = "Select payment method";
  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: value,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
    );
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0, left: 18.0, right: 18.0),
          child: SingleChildScrollView(
            child: Column(
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

                        setState(() {
                          showButton = true;
                        });
                      },
                    );
                  },
                  child: Obx(
                    () => Container(
                      height: 50.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xffF6F6F6),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            controller.choose_country.value,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey,
                            size: 45,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                DropdownButton<String>(
                    items: paymentMethods.map(buildMenuItem).toList(),
                    onChanged: (value) {
                      //
                      setState(() {
                        this.value = value!;
                      });
                    }),
                showButton
                    ? SizedBox(
                        width: 110.0,
                        child: DefaultElevatedButton(
                            text: Text("Proceed",
                                style: TextStyle(color: Colors.white)),
                            showArrowBack: false,
                            showArrowFoward: false,
                            backgroundColor: Color(0xff218354),
                            onPressed: () {
                              //an  action should be done here before we move foward

                             
                            }),
                      )
                    : Text("")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
