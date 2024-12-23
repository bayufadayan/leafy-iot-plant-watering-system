import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 180,
              child: Image.asset('images/logo 1.png'),
            ),
            SizedBox(
              width: 130,
              child: Image.asset('images/logo 2.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Siram Tanaman, Hijaukan Harapan',
              style: TextStyle(
                color: Color(0xFF00643C),
                fontWeight: FontWeight.bold,
              )
            ),
            const SizedBox(
              height: 90,
            ),
            const CircularProgressIndicator(
              color: Color(0xFF006769),
              strokeWidth: 5,
            )
          ],
        ),
      ),
    );
  }
}
