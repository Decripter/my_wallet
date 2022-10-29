import 'package:flutter/material.dart';

enum CardType {
  elo,
  master,
  visa,
  other,
}

class CardWidget extends StatefulWidget {
  final String cardNumber;
  const CardWidget({
    required this.cardNumber,
    super.key,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  final textColor = const Color.fromARGB(255, 250, 252, 158);
  late Animation colorAAnimation;
  late Animation colorBAnimation;
  late Animation colorCAnimation;
  late Animation colorDAnimation;
  late Animation colorEAnimation;
  late Animation colorFAnimation;

  var colorTweenCardA = Color.fromARGB(255, 112, 255, 131);
  var colorTweenCardB = Color.fromARGB(255, 241, 80, 31);
  var colorTweenCardC = Color.fromARGB(255, 8, 45, 255);
  var colorTweenCardD = Color.fromARGB(255, 68, 189, 57);
  var colorTweenCardE = Color.fromARGB(255, 230, 76, 56);
  var colorTweenCardF = Color.fromARGB(255, 41, 66, 211);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );
    controller.addListener(() {
      setState(() {});
    });
    setColors();
  }

  @override
  Widget build(BuildContext context) {
    var card = CardType.other;

    if (widget.cardNumber[0] == '4') {
      card = CardType.visa;
    } else if (widget.cardNumber[0] == '5') {
      card = CardType.master;
    } else if (widget.cardNumber[0] == '6') {
      card = CardType.elo;
    }
    if (card == CardType.elo) {
      colorTweenCardA = const Color.fromARGB(255, 104, 252, 220);
      colorTweenCardB = const Color.fromARGB(255, 116, 252, 104);
      colorTweenCardC = const Color.fromARGB(255, 104, 126, 252);
      colorTweenCardD = const Color.fromARGB(255, 116, 252, 104);
      colorTweenCardE = const Color.fromARGB(255, 104, 126, 252);
      colorTweenCardF = const Color.fromARGB(255, 104, 252, 220);
      setColors();
    } else if (card == CardType.master) {
      colorTweenCardA = const Color.fromARGB(255, 252, 249, 104);
      colorTweenCardB = const Color.fromARGB(255, 252, 134, 104);
      colorTweenCardC = const Color.fromARGB(255, 241, 163, 18);
      colorTweenCardD = const Color.fromARGB(255, 252, 242, 104);
      colorTweenCardE = const Color.fromARGB(255, 241, 89, 18);
      colorTweenCardF = const Color.fromARGB(255, 252, 242, 104);
      setColors();
    } else if (card == CardType.visa) {
      colorTweenCardA = const Color.fromARGB(255, 175, 184, 197);
      colorTweenCardB = const Color.fromARGB(255, 195, 196, 255);
      colorTweenCardC = const Color.fromARGB(255, 8, 45, 255);
      colorTweenCardD = const Color.fromARGB(255, 176, 202, 255);
      colorTweenCardE = const Color.fromARGB(255, 133, 135, 255);
      colorTweenCardF = const Color.fromARGB(255, 41, 66, 211);
      setColors();
    } else if (card == CardType.other) {
      colorTweenCardA = const Color.fromARGB(255, 112, 255, 131);
      colorTweenCardB = const Color.fromARGB(255, 241, 80, 31);
      colorTweenCardC = const Color.fromARGB(255, 8, 45, 255);
      colorTweenCardD = const Color.fromARGB(255, 68, 189, 57);
      colorTweenCardE = const Color.fromARGB(255, 230, 76, 56);
      colorTweenCardF = const Color.fromARGB(255, 41, 66, 211);
      setColors();
    }

    var heigth = MediaQuery.of(context).size.height * 0.5;
    var width = MediaQuery.of(context).size.width * 0.5;
    final fontSize = width * 0.099;
    width = width * (14 / 9);
    heigth = width / (14 / 9);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 5,
                blurRadius: 8,
                offset: const Offset(5, 9), // changes position of shadow
              ),
            ],
            gradient: SweepGradient(
              colors: [
                colorAAnimation.value,
                colorBAnimation.value,
                colorCAnimation.value,
                colorDAnimation.value,
                colorEAnimation.value,
                colorFAnimation.value,
                colorAAnimation.value,
              ],
              tileMode: TileMode.decal,
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
          child: Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.cardNumber,
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

  setColors() {
    //
    colorAAnimation = ColorTween(
      begin: colorTweenCardA,
      end: colorTweenCardB,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.fastLinearToSlowEaseIn),
    );
    //
    colorBAnimation = ColorTween(
      begin: colorTweenCardB,
      end: colorTweenCardC,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.fastLinearToSlowEaseIn),
    );
    //
    colorCAnimation = ColorTween(
      begin: colorTweenCardC,
      end: colorTweenCardD,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
    );
    //
    colorDAnimation = ColorTween(
      begin: colorTweenCardD,
      end: colorTweenCardE,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.bounceInOut),
    );
    //
    colorEAnimation = ColorTween(
      begin: colorTweenCardE,
      end: colorTweenCardF,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.bounceInOut),
    );
    //
    colorFAnimation = ColorTween(
      begin: colorTweenCardF,
      end: colorTweenCardA,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.ease),
    );
    controller.repeat(reverse: true);
  }
}
