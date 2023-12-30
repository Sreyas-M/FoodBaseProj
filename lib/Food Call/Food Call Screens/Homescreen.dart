import 'dart:convert';

import 'package:apicall/Food%20Call/Food%20Call%20Provider/Slidermodal.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Food Call Provider/categorymodal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  Future<CategoryModal> getCategory() async {
    Response response = await get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));
    if (response.statusCode == 200) {
      var body = CategoryModal.fromJson(jsonDecode(response.body));
      return body;
    } else {
      return throw "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.home,
          color: Colors.white,
        ),
        title: const Text(
          'Home Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        actions: const [
          Icon(
            Icons.plus_one_sharp,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: Text(
              "Today's Meal",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder<SliderModal>(
              future: getData(),
              builder:
                  (BuildContext context, AsyncSnapshot<SliderModal> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.pink,
                    ),
                  );
                }
                if (snapshot.hasData) {
                  List<Meals>? mealsList = snapshot.data!.meals;
                  return CarouselSlider.builder(
                      itemCount: 6,
                      itemBuilder: (context, index, realindex) {
                        return Card(
                          color: Colors.grey.shade300,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 150,
                                width: 300,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            mealsList![index].strMealThumb!),
                                        fit: BoxFit.fitWidth)),
                              ),
                              Text(
                                mealsList![index].strMeal!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )
                            ],
                          ),
                        );
                      },
                      options: CarouselOptions(autoPlay: true));
                } else {
                  return const Center(
                    child: Text('Something Went Wrong'),
                  );
                }
              }),
          SizedBox(
            height: 10,
          ),
          Text("Popular Meal's",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(height: 10,),
          SizedBox(height: MediaQuery.of(context).size.height,
            child: FutureBuilder<CategoryModal>(
                future: getCategory(),
                builder: (context, AsyncSnapshot<CategoryModal> snapshot) {
                  return GridView.builder(
                    itemCount:14,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context,index){
                        if(snapshot.hasData){
                          List<Categories>? categories = snapshot.data!.categories;
                          return Card(
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
                                              categories![index].strCategoryThumb!),
                                          fit: BoxFit.fitWidth)),
                                ),
                                Text(
                                  categories![index].strCategory!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                )
                              ],
                            ),
                          );
                        }else {
                          return const Center(
                            child: Text('Something Went Wrong'),
                          );
                        }
                      });
                }),
          ),
        ],
      ),
    );
  }
}
