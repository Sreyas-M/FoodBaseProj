import 'package:apicall/home.dart';
import 'package:apicall/prod_provider.dart';
import 'package:apicall/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom.dart';

void main() async{
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) =>ProductProvider() ,)
  ],child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home:BottomPage(),
    );
  }
}

