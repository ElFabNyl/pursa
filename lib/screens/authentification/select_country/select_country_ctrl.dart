import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/countries_model.dart';

class CountryController extends GetxController {
//available countries list

  List<CountriesModel> _available_countries_list = [
    CountriesModel( Image.asset('assets/images/flags/CM.png') , 'Cameroon'),
    CountriesModel(Image.asset('assets/images/flags/BF.png'), 'Burkina Faso'),
    CountriesModel(Image.asset('assets/images/flags/CD.png'), 'RD Congo'),
    CountriesModel(Image.asset('assets/images/flags/CI.png'), 'Ivory Coast'),
    CountriesModel(Image.asset('assets/images/flags/GH.png'), 'Ghana'),
    CountriesModel(Image.asset('assets/images/flags/TD.png'), 'Tchad'),
  ];

  List<CountriesModel> get available_countries_list => _available_countries_list;

//this function will be used to filter the country list
  void updateList(String value) {}
}
