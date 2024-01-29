import 'package:flutter/material.dart';
import 'package:v_chat/main.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Positioned(
        child: Center(
          child: Image.asset('images/error.jpg'),
        ),
      ),
    );
  }
}
