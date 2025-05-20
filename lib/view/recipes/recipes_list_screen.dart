import 'package:flutter/material.dart';
import '../../models/recipe.dart';
import '../../data/recipes_data.dart';
import './recipe_detail_view.dart';

class RecipesListScreen extends StatelessWidget {
  final String mealPlanType;
  
  const RecipesListScreen({
    super.key,
    required this.mealPlanType,
  });

  List<Recipe> _getRecipesByMealTime(String mealTime) {
    return allRecipes.where((recipe) => 
      recipe.mealTime == mealTime && 
      recipe.planType == mealPlanType
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${mealPlanType.replaceAll('-', ' ').toTitleCase()} Recipes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildMealSection(context, 'Early Morning', _getRecipesByMealTime('early-morning')),
            _buildMealSection(context, 'Breakfast', _getRecipesByMealTime('breakfast')),
            // Add more sections as needed
          ],
        ),
      ),
    );
  }

  Widget _buildMealSection(BuildContext context, String title, List<Recipe> recipes) {
    if (recipes.isEmpty) return const SizedBox.shrink();
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return _buildRecipeCard(context, recipes[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeCard(BuildContext context, Recipe recipe) {
    return GestureDetector(
      onTap: () => _navigateToDetail(context, recipe),
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                recipe.imagePath,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => 
                  Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.fastfood, size: 40),
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    recipe.time,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDetail(BuildContext context, Recipe recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailView(
          recipe: recipe,
          mObj: {"name": recipe.mealTime}, // Pass your meal object here
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String toTitleCase() {
    return split(' ').map((str) => 
      str.isNotEmpty ? str[0].toUpperCase() + str.substring(1) : ''
    ).join(' ');
  }
}