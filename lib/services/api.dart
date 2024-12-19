import 'dart:convert';

import 'package:food/data/global_recipe.dart';
import 'package:food/models/recipe.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  String link = dotenv.env['API']!;
 Future getdata()async{
  var uri = Uri.parse(link);
  var response = await http.get(uri);
  var responsejson = jsonDecode(response.body);
  for (var element in responsejson['results']) {
    allRecipes.add(Recipe.fromJson(element));
  }
   print(allRecipes.length);
  print(allRecipes[0].title);

}

}