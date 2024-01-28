import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v_chat/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to VChat'),
        leading: Icon(CupertinoIcons.back),
      ),
      body: Stack(
        children: [
          Positioned(
            top: mq.height * .08,
            left: mq.width * .38,
            right: mq.width * .38,
            bottom: mq.height * .65,
            child: Image.asset('images/chat.png'),
          ),
          Positioned(
            top: mq.height * .70,
            left: mq.width * .05,
            right: mq.width * .05,
            bottom: mq.height * .18,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Image.asset(
                'images/google.png',
                height: mq.height * .05,
              ),
              label: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'Sign In With ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                ),
                TextSpan(
                    text: 'Google',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))
              ])),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 157, 235, 159),
                  shape: StadiumBorder()),
            ),
          ),
        ],
      ),
    );
  }
}
