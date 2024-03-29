import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:v_chat/main.dart';
import 'package:v_chat/routes/app_route_constant.dart';

class GettingStarted extends StatelessWidget {
  const GettingStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                'images/chat.png',
                height: height * .10,
                width: height * .10,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'V',
                      style: TextStyle(
                          color: Color.fromARGB(255, 142, 230, 237),
                          fontWeight: FontWeight.bold,
                          fontSize: 36)),
                  TextSpan(
                      text: 'C',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 135, 240, 138),
                          fontWeight: FontWeight.bold,
                          fontSize: 36)),
                  TextSpan(
                      text: 'hat',
                      style: TextStyle(
                          color: Color.fromARGB(255, 135, 240, 138),
                          fontWeight: FontWeight.bold,
                          fontSize: 36)),
                ])),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Discovering the World of Chatting',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 79, 78, 78)),
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(60),
                      elevation: 1,
                      backgroundColor: Color.fromARGB(255, 103, 215, 238),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                  onPressed: () {
                    GoRouter.of(context)
                        .pushNamed(MyAppRoutesConstants.signUpRoute);
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 35, right: 35, top: 25),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(
                          width: 1, color: Color.fromARGB(255, 103, 215, 238)),
                      minimumSize: Size.fromHeight(60),
                      elevation: 1,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                  onPressed: () {
                    GoRouter.of(context)
                        .pushNamed(MyAppRoutesConstants.loginRoute);
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    ));
  }
}
