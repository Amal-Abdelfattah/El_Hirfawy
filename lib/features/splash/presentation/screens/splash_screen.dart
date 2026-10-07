import 'package:flutter/material.dart';

import '../widgets/splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF4F9F8),
      body: SplashBody(),
    );
  }
}
