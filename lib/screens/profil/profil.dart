import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff37AB7D),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.grey,
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Justin folly",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 20.0),
                          ),
                          Text(
                            "+233 699 89 48 59",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 15.0),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 350,
                      child: Card(
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "My Wallet",
                                style: TextStyle(
                                    color: const Color(0xff3C3B7B),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 3.0,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffEBE6E6),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "zsdidsoifenfasodf13a4e#d",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90.0, left: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.userGroup,
                      color: Colors.green,
                      size: 15.0,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Invite friends get reward",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "Share this code",
                          style: TextStyle(
                              color: const Color(0xff3C3B7B),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "https://ptsereser",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                IconButton(
                                  onPressed: () {
                                    //
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.copy,
                                    color: Colors.grey,
                                    size: 13.0,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 100.0,
                            ),
                            TextButton(
                              onPressed: () {
                                //
                              },
                              child: Text(
                                "Share",
                                style: TextStyle(
                                    color: const Color(0xff3C3B7B),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 20.0),
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                TextButton(
                  onPressed: () {
                    //
                  },
                  child: Text(
                    "Settings",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 20.0),
            child: Row(
              children: [
                Icon(
                  Icons.help,
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                TextButton(
                  onPressed: () {
                    //
                  },
                  child: Text(
                    "Help and Support",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.black),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
