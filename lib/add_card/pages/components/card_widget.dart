import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height * 0.5;
    var width = MediaQuery.of(context).size.height / 4;
    final fontSize = width * 0.12;
    heigth = heigth / (16 / 9);
    print(width);
    width = width * (16 / 9);
    const textColor = Color.fromARGB(255, 250, 252, 158);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 5,
                blurRadius: 8,
                offset: const Offset(5, 9), // changes position of shadow
              ),
            ],
            gradient: const SweepGradient(
              colors: [
                Color.fromARGB(255, 104, 252, 220),
                Color.fromARGB(255, 116, 252, 104),
                Color.fromARGB(255, 104, 126, 252),
                Color.fromARGB(255, 116, 252, 104),
                Color.fromARGB(255, 104, 126, 252),
                Color.fromARGB(255, 104, 252, 220),
              ],
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                12,
              ),
            ),
            border: Border.all(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          height: heigth,
          width: width,
          duration: const Duration(seconds: 1),
          child: Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '4410 1251 5541 6060',
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 8,
                        offset: Offset(2, 2.1),
                      )
                    ],
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                    color: textColor,
                    letterSpacing: 1.2,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'JSON ARAUJO',
                      style: TextStyle(
                        fontSize: fontSize - 2,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                        shadows: [
                          Shadow(
                            blurRadius: 8,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      '25/22',
                      style: TextStyle(
                        fontSize: fontSize - 2,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                        shadows: [
                          Shadow(
                            blurRadius: 8,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
