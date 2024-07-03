// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:testp/testingApp/style_body_text.dart';

class LikeCoffoeBox extends StatefulWidget {
  const LikeCoffoeBox({super.key});

  @override
  State<LikeCoffoeBox> createState() => _LikeCoffoeBoxState();
}

class _LikeCoffoeBoxState extends State<LikeCoffoeBox> {
  // ignore: non_constant_identifier_names
  Color _TextColor = Colors.white;

  void changecolor() {
    setState(() {
      _TextColor = Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            color: const Color.fromARGB(255, 182, 121, 99),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StyleBodyText("I like my coffee", _TextColor),
                Row(
                  children: [
                    FloatingActionButton(
                      mini: true,
                      onPressed: () {
                        changecolor();
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    FloatingActionButton(
                      mini: true,
                      onPressed: () {
                        setState(() {
                          _TextColor = Colors.red;
                          Future.delayed(const Duration(seconds: 3), () {
                            setState(() {
                              _TextColor = Colors.white;
                            });
                          });
                        });
                      },
                      child: const Text(
                        'No',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                )
              ],
            )),

        // ignore: sized_box_for_whitespace
      ],
    );
  }
}
