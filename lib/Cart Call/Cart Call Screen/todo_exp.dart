import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Cart Call Modal/todoModal.dart';

class TodoApp extends StatefulWidget {
  String post_id;
  final bdy;
   TodoApp({super.key, required this.post_id,required this.bdy});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
   Future <List<TodoList>>todoFunction() async {
     Response res= await get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
     if(res.statusCode==200){
       List<dynamic> body=jsonDecode(res.body);
       List<TodoList> todoList=body.map((e) => TodoList.fromJson(e)).toList();
       return todoList;
     }
     else throw "error";
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO LIST"),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder(
        future: todoFunction(),
        builder: (context,AsyncSnapshot<List<TodoList>> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasData){
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount:snapshot.data!.length,
              itemBuilder: (BuildContext context,index) {
                return Padding(
                  padding: EdgeInsets.only(top: 10, left: 5,right: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        border: Border.all(width:2.5, style: BorderStyle.solid)),
                    height: 150,
                    width: 150,
                    child:Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 12, right: 70),
                            child: Text(
                             snapshot.data![index].title!,
                              style: TextStyle(fontSize: 10),
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 15,right: 100),
                          child: Text(snapshot.data![index].completed!.toString(), style: TextStyle(fontSize: 12)),
                        ),
                        Text(widget.post_id),
                        Text(widget.bdy),

                      ],
                    ),
                  ),
                );
              },
            );
          }
          else {
            return const Text("Error");
          }
        }
      ),
    );
  }
}
