import 'dart:convert';
import 'package:apicall/Cart%20Call/Cart%20Call%20Modal/userModal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';



class CartExample extends StatefulWidget {
  const CartExample({Key? key}) : super(key: key);

  @override
  State<CartExample> createState() => _CartExampleState();
}

class _CartExampleState extends State<CartExample> {
  Future<UserModals> userGetFunc()async {
    Response response=await get(Uri.parse("https://dummyjson.com/users"));
    if(response.statusCode==200){
      var data=UserModals.fromJson(jsonDecode(response.body));
      print(data);
      return data;
    }
    else{
      throw "Errr";
    }

  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrangeAccent),
      body: FutureBuilder<UserModals>(
        future: userGetFunc(),
        builder: (BuildContext context,AsyncSnapshot<UserModals> snapshot) {
          if(snapshot.connectionState== ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(color: Colors.green,));
          }
          if(snapshot.hasData){
            List<Users>? users=snapshot.data!.users;
            return GridView.builder(
              itemCount: 10,
              itemBuilder: (context,index) {
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
                                  image: NetworkImage(users![index].image!)),
                              color: Colors.red),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(users![index].username!,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                );
              }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            );
          }
          else{
            return Text("Error");
          }
        }
      ),
    );
  }
}
