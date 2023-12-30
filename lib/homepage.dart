import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreenn extends StatefulWidget {
  const HomeScreenn({Key? key}) : super(key: key);

  @override
  State<HomeScreenn> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenn> {
  Future dispFunction() async {
    Response res = await get(
      Uri.parse("https://crm-beta-api.vozlead.in/api/v2/lead/lead_list/"),
      headers: {"Authorization": "Token 92027d4c10d246c44007206174c01871582161e3"},
    );
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      return data;
    } else
      throw "error";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue),
        body: FutureBuilder(
            future: dispFunction(),
            builder: (context, AsyncSnapshot snapshot) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 5),
                  itemCount:snapshot.data["data"]["leads"].length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            border: Border.all(
                                width: 2.5, style: BorderStyle.solid)),
                        height: 150,
                        width: 150,
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 12, right: 70),
                                child: Text(snapshot.data["data"]["leads"][index]["email"],
                                  style: TextStyle(fontSize: 10),
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 15, right: 100),
                              child:
                                  Text("Alll", style: TextStyle(fontSize: 12)),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }
}
