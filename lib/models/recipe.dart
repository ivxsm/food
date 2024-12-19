import 'package:food/models/nutrition.dart';

class Recipe {
  int? id;
  String? title;
  String? image;
  Nutrition? nutrition;

// normal constuctor

  Recipe({
    required this.id,
    required this.title,
    required this.image,
    required this.nutrition,
  });

// factory one

  factory Recipe.fromJson(Map json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      nutrition: Nutrition.fromJson(json['nutrition']['nutrients']),
    );
  }
}
