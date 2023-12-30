import 'dart:convert';

import 'package:apicall/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier{
  final TextEditingController usercontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  var data1;
  int user_id=0;

  Future Login(
      {required String user,
        required String password,
        required BuildContext context}) async {
    var data = {"username": user, "password": password};
    Response response = await post(

        Uri.parse("https://crm-beta-api.vozlead.in/api/v2/account/login/"),
        body: data);
    print("<<<<<<<<<<<<<<${response.body}");
    if(response.statusCode==200){
      SharedPreferences preferences = await SharedPreferences.getInstance();
      // preferences.setInt("user");
      var result = jsonDecode(response.body);
      data1 = result;
      if (result["data"] == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Please register"),
        ));
      } else {
        var data1 = result["data"]["user_id"];
        user_id = int.parse(data1);
        preferences.getString("token");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreenn()));
      }
    }
  }


}