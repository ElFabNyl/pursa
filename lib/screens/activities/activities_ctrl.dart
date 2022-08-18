import 'package:get/get.dart';

class ActivitiesController extends GetxController {
  final List<Map<String, String>> available_activities_list = [
    {
      "image": 'assets/images/btc.png',
      "title": 'Bought BTC',
      "amount": "0.0674",
      "dollard_equivalent": "491",
      "date": "9 Apr 2022"
    },
    {
      "image": 'assets/images/btc.png',
      "title": 'Sell BTC',
      "amount": "1.0674",
      "dollard_equivalent": "491",
      "date": "10 june 2022"
    },
    {
      "image": 'assets/images/btc.png',
      "title": 'Bought BTC',
      "amount": "0.0674",
      "dollard_equivalent": "491",
      "date": "12 december 2022"
    },
  ];

  Rx<List<Map<String, String>>> foundActivities =
      Rx<List<Map<String, String>>>([]);

  @override
  void onInit() {
    super.onInit();
    foundActivities.value = available_activities_list;
  }

  //this  is to filter the list
  void filterActivities(String ActivityName) {
    List<Map<String, String>> results = [];

    if (ActivityName.isEmpty) {
      results = available_activities_list;
    } else {
      results = available_activities_list
          .where((element) => element["date"]
              .toString()
              .toLowerCase()
              .contains(ActivityName.toLowerCase()))
          .toList();
    }

    foundActivities.value = results;
  }
}
