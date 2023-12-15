import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class ProductProvider extends ChangeNotifier{
Future getData()async{
 Response response= await get(Uri.parse("https://dummyjson.com/products"));
if(response.statusCode==200){
var result =jsonDecode(response.body);
print(result);
return result;
}else {
  return Text("error");
}
}

}