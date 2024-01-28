import 'package:flutter/material.dart';
import 'package:v_chat/main.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Positioned(
        bottom: mq.height * .40,
        top: mq.height * .40,
        left: mq.width * .40,
        right: mq.width * .40,
        child: Center(
          child: Image.asset('images/error.jpg'),
        ),
      ),
    );
  }
}
