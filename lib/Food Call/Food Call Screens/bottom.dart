import 'package:apicall/Food%20Call/Food%20Call%20Screens/menuscreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'Homescreen.dart';
import 'MainProfile.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int mainindex=0;
  List pages=[const HomeScreen(),const MenuScreen(),const MainProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[mainindex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepPurpleAccent,
        index: mainindex,
        items: const [
          Icon(Icons.home),
          Icon(Icons.menu_book),
          Icon(Icons.person)

        ],
        onTap: (index){
          setState(() {
            mainindex=index;
          });
        }
    ),
    );
    }
  }

