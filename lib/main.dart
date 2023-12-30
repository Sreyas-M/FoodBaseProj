import 'package:apicall/homepage.dart';
import 'package:apicall/loginProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Food Call/Food Call Screens/Homescreen.dart';
import 'login.dart';

void main() async{
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => LoginProvider()),
  ],child:MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home:HomeScreenn(),
    );
  }
}

