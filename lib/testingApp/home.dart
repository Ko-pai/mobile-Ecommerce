// ignore_for_file: avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:testp/testingApp/coffee-prefs.dart';
import 'package:testp/testingApp/likeCoffee.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: duplicate_ignore
    // ignore: avoid_unnecessary_containers
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown.shade400,
          title: const Text(
            'My Coffee',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const LikeCoffoeBox(),
            const Coffeeprefs(),
            Expanded(
                child: Image.asset(
              'assets/img/coffee_bg.jpg',
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter,
            ))
          ],
        ));
  }
}

// 