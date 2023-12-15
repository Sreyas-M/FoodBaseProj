import 'dart:convert';

import 'package:apicall/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest API Call'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(itemCount: users.length,itemBuilder: (context, index) {
        final user= users[index];
        //final email=user.email;
        final color =user.gender=='male' ? Colors.blue :Colors.pink;
        return ListTile(
          title:Text(user.gender),
          subtitle: Text(user.phone),
          tileColor: color,
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
      ),
    );
  }

  void fetchUsers()async{
    print("fetchUser called");
    const url='https://randomuser.me/api/?results=100';
    final uri=Uri.parse(url);
    final response=await http.get(uri);
    final body=response.body;
    final json=jsonDecode(body);
    final results=json['results'] as List<dynamic>;
    final transformed=results.map((e) {
      return User(
        cell: e['cell'],
        email: e['email'],
        gender: e['gender'],
        nat: e['nat'],
        phone: e['phone'],

      );
    }).toList();
    setState(() {
      users=transformed;
    });
  }
}
