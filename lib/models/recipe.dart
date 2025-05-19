class Recipe {
  final String id;
  final String title;
  final String imagePath;
  final String time;
  final String shortInfo;
  final String fullRecipe;
  final List<String> ingredients;
  final String mealTime; // 'early-morning', 'breakfast', etc.

  const Recipe({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.time,
    required this.shortInfo,
    required this.fullRecipe,
    required this.ingredients,
    required this.mealTime,
  });
}