import 'package:apicall/Food%20Call/Food%20Call%20Screens/user_tile_extract.dart';
import 'package:flutter/material.dart';

class UserPro extends StatefulWidget {
  const UserPro({Key? key}) : super(key: key);

  @override
  State<UserPro> createState() => _UserProState();
}

class _UserProState extends State<UserPro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.blueAccent],
          ),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            ClipOval(
              child: Image.network(
                "null",
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(height: 40),
            UserTile(head: 'Name :', value: ""),
            SizedBox(height: 20,),
            UserTile(head: 'E-Mail :', value: ""),
            SizedBox(height: 20,),
            UserTile(head: "Phone :", value: "")
          ],
        ),
      ),
    );
  }
}
