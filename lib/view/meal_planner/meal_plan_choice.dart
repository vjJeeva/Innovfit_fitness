import 'package:flutter/material.dart';
import "package:fitness/view/meal_planner/meal_planner_view.dart";
import "package:fitness/view/meal_planner/day_measure.dart";
import "package:fitness/view/recipes/recipes_list_screen.dart";

class MealPlanChoiceContent extends StatelessWidget {
  const MealPlanChoiceContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/img/top_wave.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Diet Plan',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Choose your preference for a personalized diet plan.",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            top: 220,
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    _buildDietCard(
                      context,
                      title: "Weight Loss",
                      description: "Personalized calorie deficit plan for losing weight.",
                      imagePath: "assets/img/weight_loss1.png",
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => DayMeasure()));
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildDietCard(
                      context,
                      title: "Weight Gain",
                      description: "Balanced plan to gain healthy weight.",
                      imagePath: "assets/img/weight_gain1.png",
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => RecipesListScreen()));
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildDietCard(
                      context,
                      title: "Muscle Gain",
                      description: "High-protein plan for muscle building.",
                      imagePath: "assets/img/muscle_gain1.png",
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => MealPlannerView()));
                      },
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDietCard(
    BuildContext context, {
    required String title,
    required String description,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}