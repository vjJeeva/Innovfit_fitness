import 'package:flutter/material.dart';

void main() {
  runApp(const DayMeasure());
}

class DayMeasure extends StatelessWidget {
  const DayMeasure({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const WeightGainScreen(),
    );
  }
}

class WeightGainScreen extends StatefulWidget {
  const WeightGainScreen({super.key});

  @override
  State<WeightGainScreen> createState() => _WeightGainScreenState();
}

class _WeightGainScreenState extends State<WeightGainScreen> {
  // Sample data - in a real app, this would come from a database or API
  final List<DayData> days = List.generate(31, (index) => DayData(
    dayNumber: index + 1,
    calories: 2847,
    date: DateTime.now().add(Duration(days: index)),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Gain'),
      ),
      body: Column(
        children: [
          // Current day header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Day ${days[6].dayNumber}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _getDayName(days[6].date.weekday),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          
          // Calendar grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: days.length,
              itemBuilder: (context, index) {
                return DayCard(
                  dayData: days[index],
                  onTap: () => _navigateToDayDetail(context, days[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToDayDetail(BuildContext context, DayData dayData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DayDetailScreen(dayData: dayData),
      ),
    );
  }

  String _getDayName(int weekday) {
    switch (weekday) {
      case 1: return 'Monday';
      case 2: return 'Tuesday';
      case 3: return 'Wednesday';
      case 4: return 'Thursday';
      case 5: return 'Friday';
      case 6: return 'Saturday';
      case 7: return 'Sunday';
      default: return '';
    }
  }
}

class DayData {
  final int dayNumber;
  final int calories;
  final DateTime date;

  DayData({
    required this.dayNumber,
    required this.calories,
    required this.date,
  });
}

class DayCard extends StatelessWidget {
  final DayData dayData;
  final VoidCallback onTap;

  const DayCard({
    super.key,
    required this.dayData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(2, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Day ${dayData.dayNumber}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Calories:\n${dayData.calories}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DayDetailScreen extends StatelessWidget {
  final DayData dayData;

  const DayDetailScreen({
    super.key,
    required this.dayData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Day ${dayData.dayNumber} Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Day ${dayData.dayNumber}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Date: ${dayData.date.toString().split(' ')[0]}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Calories: ${dayData.calories}',
              style: const TextStyle(fontSize: 20),
            ),
            // Add more details here as needed
          ],
        ),
      ),
    );
  }
}