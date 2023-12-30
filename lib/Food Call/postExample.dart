import 'dart:convert';

import 'package:apicall/Food%20Call/postModal.dart';
import 'package:apicall/Food%20Call/postProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Cart Call/Cart Call Screen/todo_exp.dart';

class PostExam extends StatelessWidget {
  const PostExam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.pinkAccent),
      body: FutureBuilder(
          future: Provider.of<Post>(context).postFun(),
          builder: (context, AsyncSnapshot<List<PostModal>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(color: Colors.green);
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TodoApp(
                                    post_id:
                                        snapshot.data![index].id.toString(),
                                    bdy: snapshot.data![index].body,
                                  )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.yellowAccent,
                              borderRadius: BorderRadius.circular(20)),
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(snapshot.data![index].name!),
                              SizedBox(
                                height: 5,
                              ),
                              Text(snapshot.data![index].email!),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                                  snapshot.data![index].body!,
                                  style: TextStyle(fontSize: 5),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              throw "eoo";
            }
          }),
    );
  }
}
