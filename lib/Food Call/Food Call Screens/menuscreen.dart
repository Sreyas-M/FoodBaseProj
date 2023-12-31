import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'SinglePage.dart';
import '../Food Call Provider/Slidermodal.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuState();
}

class _MenuState extends State<MenuScreen> {
  Future<SliderModal> getData() async {
    Response response = await get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/search.php?f=b"));
    if (response.statusCode == 200) {
      var body = SliderModal.fromJson(jsonDecode(response.body));
      return body;
    } else {
      return throw "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent, title: Text("MenuScreen")),
      body: FutureBuilder<SliderModal>(
          future: getData(),
          builder: (context, AsyncSnapshot<SliderModal> snapshot) {
            return GridView.builder(
                itemCount: 14,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  if (snapshot.hasData) {
                    Meals meals=snapshot.data!.meals![index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FoodSingle(meal: meals,)));
                      },
                      child: Card(
                        color: Colors.grey.shade300,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(30),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          meals!.strMealThumb!),
                                      fit: BoxFit.fitWidth)),
                            ),
                            Text(
                              meals!.strCategory!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text('Something Went Wrong'),
                    );
                  }
                });
          }),
    );
  }
}
