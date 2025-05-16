import 'package:flutter/material.dart';
import 'package:fitness/view/login/signup_view.dart'; // import SignUpView

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image (white wave design)
          Positioned.fill(
            child: Image.asset(
              "assets/img/Wel.png",
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/img/Rect1.png", // Your white wave image
              fit: BoxFit.cover,
            ),
          ),

          // Welcome title
          Positioned(
            left: 20,
            bottom: 170,
            child: SizedBox(
              width: 200,
              child: Text(
                'Welcome To\nInnovFit',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          // Subtitle
          Positioned(
            left: 20,
            bottom: 120,
            child: Text(
              'Built by consistency, \nfueled by goals',
              style: const TextStyle(
                color: Color(0xFF777676),
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Get Started button
          Positioned(
            right: 20,
            bottom: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpView()),
                );
              },
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
