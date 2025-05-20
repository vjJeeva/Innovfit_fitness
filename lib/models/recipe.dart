class Recipe {
  final String id;
  final String title;
  final String imagePath;
  final String time;
  final String shortInfo;
  final String fullRecipe;
  final List<Ingredient> ingredients;
  final String mealTime;
  final String planType;
  final String author;
  final List<NutritionInfo> nutrition;
  final List<RecipeStep> steps;

  const Recipe({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.time,
    required this.shortInfo,
    required this.fullRecipe,
    required this.ingredients,
    required this.mealTime,
    required this.planType,
    this.author = "James Ruth",
    required this.nutrition,
    required this.steps,
  });
}

class Ingredient {
  final String name;
  final String amount;
  final String imagePath;

  const Ingredient({
    required this.name,
    required this.amount,
    required this.imagePath,
  });
}

class NutritionInfo {
  final String title;
  final String imagePath;

  const NutritionInfo({
    required this.title,
    required this.imagePath,
  });
}

class RecipeStep {
  final String number;
  final String detail;

  const RecipeStep({
    required this.number,
    required this.detail,
  });
}