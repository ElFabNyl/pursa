import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryController extends GetxController {
  var selected_country = {
    "flag": 'assets/images/flags/CM.png',
    "country_name": 'Cameroon',
  }.obs;
//available countries list
  final List<Map<String, String>> available_countries_list = [
    {
      "flag": 'assets/images/flags/CM.png',
      "country_name": 'aaaaa',
    },
    {
      "flag": 'assets/images/flags/CM.png',
      "country_name": 'wwww',
    },
    {
      "flag": 'assets/images/flags/CM.png',
      "country_name": 'eeeee',
    },
    {
      "flag": 'assets/images/flags/CM.png',
      "country_name": 'rrrrrr',
    },
    {
      "flag": 'assets/images/flags/CM.png',
      "country_name": 'yuyyyyy',
    },
    // {
    //   "flag": Image.asset(
    //     'assets/images/flags/BF.png',
    //     scale: 2.0,
    //   ),
    //   "country_name": 'Burkina Faso',
    // },
    // {
    //   "flag": Image.asset(
    //     'assets/images/flags/CD.png',
    //     width: 35,
    //   ),
    //   "country_name": 'RD Congo',
    // },
    // {
    //   "flag": Image.asset(
    //     'assets/images/flags/CI.png',
    //     scale: 2,
    //   ),
    //   "country_name": 'Ivory Coast',
    // },
    // {
    //   "flag": Image.asset(
    //     'assets/images/flags/GH.png',
    //     scale: 2,
    //   ),
    //   "country_name": 'Ghana',
    // }
  ];

  Rx<List<Map<String, String>>> foundCountries =
      Rx<List<Map<String, String>>>([]);

  @override
  void onInit() {
    super.onInit();
    foundCountries.value = available_countries_list;
  }

  //this  is to filter the list
  void filterCountries(String countryName) {
    List<Map<String, String>> results = [];

    if (countryName.isEmpty) {
      results = available_countries_list;
    } else {
      results = available_countries_list
          .where((element) => element["country_name"]
              .toString()
              .toLowerCase()
              .contains(countryName.toLowerCase()))
          .toList();
    }

    foundCountries.value = results;
  }
}
