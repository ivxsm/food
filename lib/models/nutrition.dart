class Nutrition {
double? calories;
double? protein;
double? fat;

// normal consturcter.
Nutrition({required this.calories,required this.fat, required this.protein});

// factory one 
factory Nutrition.fromJson(List<dynamic> json){

  // function to get it from the list
  double getNutrient(String name){
    return json.firstWhere((item)=> item['name']==name, orElse: () => {'amount':0.0})['amount'];
  }
// yeey now we have the usual return type !!
  return Nutrition(
      calories: getNutrient('Calories'),
      protein: getNutrient('Protein'),
      fat: getNutrient('Fat'),
    );
}

}