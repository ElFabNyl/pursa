import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pursa/screens/authentification/select_country/select_country_ctrl.dart';

class SelectCountry extends StatelessWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountryController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 85.0),
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
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffE3E4EB),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none),
                  hintText: "Type here",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
                cursorColor: Colors.green,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.available_countries_list.length,
                itemBuilder: (context, index) => ListTile(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
