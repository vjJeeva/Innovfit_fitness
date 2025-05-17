import 'package:flutter/material.dart';
import "package:fitness/view/main_tab/main_tab_view.dart";

void main() {
  runApp(const NewStart());
}

class NewStart extends StatelessWidget {
  const NewStart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const WelcomeScreen2(),
    );
  }
}

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 412,
        height: 917,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.38, -0.29),
            end: Alignment(1.00, 0.99),
            colors: [Color(0xFF9DCEFF), Color(0xFF92A3FD)],
          ),
        ),
        child: Stack(
          children: [
            const Positioned(
              left: 126,
              top: 320,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'InnovFi',
                      style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 36,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'T',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 108,
              top: 381,
              child: Text(
                'Every body can train',
                style: TextStyle(
                  color: Color(0xFF696969),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              left: 52,
              top: 726,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainTabView()), // <-- Make sure to import MainTab
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 112, vertical: 18),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                  child: const Text(
                    'Get started',
                    style: TextStyle(
                      color: Color(0xFF529AE2),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import your MainTab.dart and make sure it has a const constructor
// Example: const MainTab()
