import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For Clipboard
import 'package:pretty_gauge/pretty_gauge.dart';

class ScoreScreen extends StatelessWidget {
  final double bmiScore;
  final int age;

  ScoreScreen({Key? key, required this.bmiScore, required this.age}) : super(key: key);

  String _calculateStatus() {
    if (bmiScore < 18.5) {
      return "Underweight";
    } else if (bmiScore < 25) {
      return "Normal";
    } else if (bmiScore < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  String _calculateDescription() {
    if (bmiScore < 18.5) {
      return "You have a lower than normal body weight. You can eat a bit more.";
    } else if (bmiScore < 25) {
      return "You have a normal body weight. Good job!";
    } else if (bmiScore < 30) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else {
      return "Your body weight is in the obese range. Consult your doctor.";
    }
  }

  @override
  Widget build(BuildContext context) {
    final String bmiStatus = _calculateStatus();
    final String bmiDescription = _calculateDescription();

    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Result"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Card(
          elevation: 12,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Your Score is",
                  style: TextStyle(fontSize: 24, color: Colors.grey[600]),
                ),
                PrettyGauge(
                  gaugeSize: 250,
                  minValue: 10,
                  maxValue: 40,
                  segments: [
                    GaugeSegment('Underweight', 8.5, Colors.yellow), // 18.5 - 10
                    GaugeSegment('Normal', 6.5, Colors.green),       // 25 - 18.5
                    GaugeSegment('Overweight', 5, Colors.orange),    // 30 - 25
                    GaugeSegment('Obese', 10, Colors.red),           // 40 - 30
                  ],
                  currentValue: bmiScore,
                  displayWidget: Text(
                    bmiScore.toStringAsFixed(1),
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
                Text(
                  bmiStatus,
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    bmiDescription,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    final textToCopy =
                        "My BMI score is ${bmiScore.toStringAsFixed(1)} at age $age. Status: $bmiStatus";
                    Clipboard.setData(ClipboardData(text: textToCopy));

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('BMI info copied to clipboard!')),
                    );
                  },
                  icon: const Icon(Icons.copy),
                  label: const Text("Copy Info"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
