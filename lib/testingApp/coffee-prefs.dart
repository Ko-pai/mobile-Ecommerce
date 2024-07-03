import 'package:flutter/material.dart';
import 'package:testp/testingApp/style_body_text.dart';
import 'package:testp/testingApp/style_button.dart';

class Coffeeprefs extends StatefulWidget {
  const Coffeeprefs({super.key});

  @override
  State<Coffeeprefs> createState() => _CoffeeprefsState();
}

class _CoffeeprefsState extends State<Coffeeprefs> {
  int strengthNum = 1;
  int sugarNum = 1;

  void onPressedStrength() {
    setState(() {
      strengthNum = strengthNum >= 5 ? 1 : strengthNum + 1;
    });
  }

  void onPressedSugar() {
    setState(() {
      sugarNum = sugarNum > 7 ? 0 : sugarNum + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            height: 120,
            color: const Color.fromARGB(251, 231, 186, 170),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const StyleBodyText("Strength : ", Colors.black),
                    for (int i = 0; i < strengthNum; i++)
                      Image.asset(
                        'assets/img/coffee_bean.png',
                        width: 25,
                        color: const Color.fromARGB(251, 231, 186, 170),
                        colorBlendMode: BlendMode.multiply,
                      ),
                    const Expanded(child: SizedBox()),
                    StyleButton(
                        onPressed: onPressedStrength, child: const Text('+'))
                  ],
                ),
                Row(
                  children: [
                    const StyleBodyText('Sugar : ', Colors.black),
                    if (sugarNum == 0) const Text('No Sugar...'),
                    for (int i = 0; i < sugarNum; i++)
                      Image.asset(
                        'assets/img/sugar_cube.png',
                        width: 25,
                        color: const Color.fromARGB(251, 231, 186, 170),
                        colorBlendMode: BlendMode.multiply,
                      ),
                    const Expanded(child: SizedBox()),
                    StyleButton(
                        onPressed: onPressedSugar, child: const Text('+'))
                  ],
                )
              ],
            )),
      ],
    );
  }
}
