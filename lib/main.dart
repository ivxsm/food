import 'package:flutter/material.dart';
import 'package:food/data/global_recipe.dart';
import 'package:food/pages/home.dart';
import 'package:food/services/api.dart';

void main() async{
  runApp(const MainApp());
 await Api().getdata();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home()
    );
  }
}
