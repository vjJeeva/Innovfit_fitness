import "package:fitness/models/recipe.dart" ;

final List<Recipe> allRecipes = [
  Recipe(
    id: '1',
    title: 'Overnight soaked almonds',
    imagePath: 'assets/img/almonds.png',
    time: '5 min prep | 8 hrs soak',
    shortInfo: 'Rich in healthy fats and protein',
    fullRecipe: 'Pancakes are some people\'s favorite breakfast...',
    ingredients: [
      Ingredient(
        name: "Almonds", 
        amount: "10 pieces", 
        imagePath: "assets/img/almonds.png"
      ),
      Ingredient(
        name: "Walnuts", 
        amount: "2 pieces", 
        imagePath: "assets/img/walnuts.png"
      ),
    ],
    mealTime: 'early-morning',
    planType: 'weight-gain',
    nutrition: [
      NutritionInfo(
        title: "180kCal", 
        imagePath: "assets/img/burn.png"
      ),
      NutritionInfo(
        title: "30g fats", 
        imagePath: "assets/img/egg.png"
      ),
    ],
    steps: [
      RecipeStep(
        number: "1", 
        detail: "Prepare all ingredients"
      ),
      RecipeStep(
        number: "2", 
        detail: "Soak overnight"
      ),
    ],
  ),
  // Add more recipes...
];