import 'package:flutter/material.dart';
import 'package:v_chat/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: mq.height * .30,
            left: mq.width * .40,
            right: mq.width * .40,
            bottom: mq.height * .40,
            child: Center(child: Image.asset('images/chat.png')),
          ),
        ],
      ),
    );
  }
}
