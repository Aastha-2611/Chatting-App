import 'package:flutter/material.dart';
import 'package:v_chat/main.dart';

class GettingStarted extends StatelessWidget {
  const GettingStarted({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin:
              EdgeInsets.only(top: mq.height * .20, bottom: mq.height * .02),
          child: Image.asset('images/chat.png'),
          width: mq.width * .25,
          height: mq.height * .20,
          color: Colors.yellow,
        ),
        Container(
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'V',
                style: TextStyle(
                    fontSize: 32,
                    color: Color.fromARGB(255, 130, 198, 253),
                    fontWeight: FontWeight.w800)),
            TextSpan(
              text: 'C',
              style: TextStyle(
                  color: Color.fromARGB(255, 137, 249, 141),
                  fontSize: 32,
                  fontWeight: FontWeight.w800),
            ),
            TextSpan(
                text: 'hat',
                style: TextStyle(
                    color: Color.fromARGB(255, 137, 249, 141),
                    fontSize: 32,
                    fontWeight: FontWeight.w800)),
          ])),
        )
      ],
    );
  }
}
