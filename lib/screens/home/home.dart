import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pursa/composants/home_card.dart';
import 'package:pursa/screens/select%20scrypto/select_crypto.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  //
                  Get.to(() => const SelectCrypto());
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
