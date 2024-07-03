// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:testp/firstApp/app.dart';
import 'package:testp/firstApp/provider/cart_provider.dart';
import 'package:testp/firstApp/provider/favourite_provider.dart';
import 'package:testp/testingApp/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        home: App(),
      ),
    ));
