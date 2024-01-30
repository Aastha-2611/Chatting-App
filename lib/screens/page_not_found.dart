import 'package:flutter/material.dart';

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
