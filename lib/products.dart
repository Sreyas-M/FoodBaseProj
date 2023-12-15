// // import 'package:apicall/prod_provider.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// //
// // class Prod extends StatelessWidget {
// //   const Prod({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.green,
// //         title: Text("API Call"),
// //       ),
// //       body: FutureBuilder(
// //           future:
// //               Provider.of<ProductProvider>(context, listen: false).getData(),
// //           builder: (context, snapshot) {
// //             return ListView.builder(
// //                 itemCount:50,
// //                 itemBuilder: (context, index) {
// //                   return ListTile(
// //                       title: Text(snapshot.data["products"][index]["price"].toString()),
// //                       leading: Text(snapshot.data["products"][index]["description"]),
// //                       trailing: Text(snapshot.data["products"][index]["title"]),
// //                       tileColor: Colors.pinkAccent);
// //                 });
// //           }),
// //     );
// //   }
// // }
//
//
// mealsList![index].strMealThumb!import 'dart:convert';
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
// import '../model/fooditemmodel.dart';
// import 'package:http/http.dart' as http;
//
// class HomeScreenClass extends StatelessWidget {
//   const HomeScreenClass({Key? key}) : super(key: key);
//
//   Future<FoodItemModel> getFoodItems() async {
//     var res = await http.get(
//         Uri.parse("https://www.themealdb.com/api/json/v1/1/search.php?f=b"));
//     if (res.statusCode == 200) {
//       var data = FoodItemModel.fromJson(jsonDecode(res.body));
//       return data;
//     } else {
//       throw Exception("Api Error");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double ht = MediaQuery.of(context).size.height;
//     double wth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         leading: const Icon(
//           Icons.food_bank,
//           color: Colors.white,
//         ),
//         title: const Text(
//           'Home Screen',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.lightGreen,
//         actions: const [
//           Icon(
//             Icons.logout,
//             color: Colors.white,
//           ),
//           SizedBox(
//             width: 10,
//           )
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: 20,
//           ),
//           const Padding(
//             padding: EdgeInsets.only(
//               left: 10,
//             ),
//             child: Text(
//               "Today's Meal",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           FutureBuilder(
//               future: getFoodItems(),
//               builder: (BuildContext context,
//                   AsyncSnapshot<FoodItemModel> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: CircularProgressIndicator(
//                       color: Colors.lightGreen,
//                     ),
//                   );
//                 }
//                 if (snapshot.hasData) {
//                   List<Meals>? mealsList = snapshot.data!.meals;
//                   return CarouselSlider.builder(
//                       itemCount: 6,
//                       itemBuilder: (context, index, realindex) {
//                         return Card(
//                           child: Column(
//                             children: [
//                               SizedBox(height: 20,),
//                               Container(
//                                 height: 150,
//                                 width: wth,
//                                 decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                         image: NetworkImage(
//                                             mealsList![index].strMealThumb!),fit: BoxFit.fitWidth)),
//                               ),
//                               Text(mealsList![index].strMeal!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
//                             ],
//                           ),
//                         );
//                       },
//                       options: CarouselOptions(autoPlay: true));
//                 } else {
//                   return const Center(
//                     child: Text('Something Went Wrong'),
//                   );
//                 }
//               }),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
