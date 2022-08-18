import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pursa/screens/activities/activities_ctrl.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  @override
  Widget build(BuildContext context) {
    ActivitiesController controller = Get.find();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50),
        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                onChanged: ((value) {
                  controller.filterActivities(value);
                }),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffFFFBFB),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none),
                  hintText: "Search activity by date",
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
                cursorColor: Color.fromARGB(255, 4, 80, 7),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 1000,
              child: Obx(
                (() => ListView.builder(
                      itemCount: controller.foundActivities.value.length,
                      itemBuilder: ((context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: GestureDetector(
                                onTap: () {
                                  //
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                      color: const Color(0xffEBF6F1)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              controller.foundActivities
                                                  .value[index]["image"]!,
                                              fit: BoxFit.cover,
                                            ),
                                            const SizedBox(
                                              width: 15.0,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.foundActivities
                                                      .value[index]["title"]!,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                Text(
                                                  controller.foundActivities
                                                      .value[index]["date"]!,
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                                  controller.foundActivities
                                                      .value[index]["amount"]! +"BTC",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  controller.foundActivities
                                                      .value[index]["dollard_equivalent"]! +"\$",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          )),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
