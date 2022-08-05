import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final Widget crytoImage;
  final String cardTitle;
  final String carDescription;
  final Function() action;
  const HomeCard({
    Key? key,
    required this.cardTitle,
    required this.carDescription,
    required this.action,
    required this.crytoImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Card(
          elevation: 5.0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 7.0, vertical: 20.0),
            child: Row(
              children: [
                crytoImage,
                const SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cardTitle,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: 238,
                      child: Text(
                        carDescription,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
