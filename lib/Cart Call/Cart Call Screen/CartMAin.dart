import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CartMainScreen extends StatefulWidget {
  const CartMainScreen({Key? key}) : super(key: key);

  @override
  State<CartMainScreen> createState() => _CartMainScreenState();
}

class _CartMainScreenState extends State<CartMainScreen> {
  Future getData() async {
    Response response = await get(Uri.parse("https://dummyjson.com/users"));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      // print(body);
      return body;
    } else {
      return Text("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey),
      body: FutureBuilder(
        future: getData(),
        builder: (context,AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(
              backgroundColor: Colors.greenAccent,);
          }
          if(snapshot.hasData){
            return Padding(
              padding:
              const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
              child: GridView.builder(
                itemCount: snapshot.data['users'].length,
                itemBuilder: (context, index) {
                  dynamic gg=snapshot.data['users'];
                  return Card(
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(snapshot.data['users'][index]['image'])),
                                color: Colors.red),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(gg[index]['hair']['type'],
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  );
                }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 15)
              ),
            );
          }
          else{
            return Text("something went wrong");
          }
        }
      ),
    );
  }
}
