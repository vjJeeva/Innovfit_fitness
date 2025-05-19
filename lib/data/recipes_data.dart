import '../models/recipe.dart';

final List<Recipe> allRecipes = [
  Recipe(
    id: '1',
    title: 'Overnight soaked almonds',
    imagePath: 'assets/almonds.jpg',
    time: '5 min prep | 8 hrs soak',
    shortInfo: 'Rich in healthy fats and protein',
    fullRecipe: '1. Soak 10 almonds and 2 walnuts in water overnight\n'
        '2. Drain water in the morning\n'
        '3. Consume on empty stomach',
    ingredients: ['10 almonds', '2 walnuts', '1 cup water'],
    mealTime: 'early-morning',
  ),
  Recipe(
    id: '2',
    title: 'Banana Milkshake',
    imagePath: 'assets/banana_shake.jpg',
    time: '5 min prep',
    shortInfo: 'High calorie healthy drink',
    fullRecipe: '1. Peel and slice 1 ripe banana\n'
        '2. Add to blender with 1 cup milk\n'
        '3. Add 1 tbsp honey or dates\n'
        '4. Blend until smooth',
    ingredients: ['1 banana', '1 cup milk', '1 tbsp honey'],
    mealTime: 'early-morning',
  ),
  Recipe(
    id: '2',
    title: 'Banana Milkshake',
    imagePath: 'assets/banana_shake.jpg',
    time: '5 min prep',
    shortInfo: 'High calorie healthy drink',
    fullRecipe: '1. Peel and slice 1 ripe banana\n'
        '2. Add to blender with 1 cup milk\n'
        '3. Add 1 tbsp honey or dates\n'
        '4. Blend until smooth',
    ingredients: ['1 banana', '1 cup milk', '1 tbsp honey'],
    mealTime: 'breakfast',
  ),
  
  // Add more recipes...
];