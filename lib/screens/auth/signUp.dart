import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:v_chat/app_theme.dart/text_color.dart';
import 'package:v_chat/routes/app_route_constant.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final _formkey = GlobalKey<FormState>();

  _submitForm() {
    if (_formkey.currentState!.validate()) {
      ScaffoldMessenger.of(_formkey.currentContext!)
          .showSnackBar(const SnackBar(content: Text('Form Submitted')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton.outlined(
              onPressed: () => context.pop(),
              icon: Icon(Icons.arrow_back_ios_new_sharp)),
        ),
        body: Center(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, bottom: 25),
              child: Image.asset('images/chat.png'),
              width: 100,
              height: 100,
            ),
            RichText(
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
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 35, right: 35),
              child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.zero))),
                        validator: Validators.required('Required'),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: Validators.compose([
                          Validators.required('Required'),
                          Validators.email('Invalid Email'),
                        ]),
                        decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.zero))),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        validator: Validators.compose([
                          Validators.required('Required'),
                          Validators.patternRegExp(
                              RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
                              ' Password should contain upper,lower,digit and Special character')
                        ]),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.zero))),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(60),
                            elevation: 1,
                            backgroundColor: AppConstantColors().blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero)),
                        onPressed: _submitForm,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              letterSpacing: 2,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(children: [
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 30, right: 15.0),
                      child: Divider(
                        color: Color.fromARGB(255, 73, 73, 73),
                        height: 10,
                      )),
                ),
                Text(
                  'OR',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 68, 68, 68)),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 30),
                      child: Divider(
                        color: Colors.black,
                        height: 10,
                      )),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    side: BorderSide(
                        width: 1, color: Color.fromARGB(255, 103, 215, 238)),
                    minimumSize: Size.fromHeight(60),
                    elevation: 1,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero)),
                onPressed: () {},
                label: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Sign Up with ',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                          color: Colors.black)),
                  TextSpan(
                      text: 'Google',
                      style: TextStyle(
                          fontSize: 22,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w700,
                          color: AppConstantColors().blue)),
                ])),
                icon: Image.asset(
                  'images/google.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      child: Text(
                        'Already have and account?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context)
                          .pushNamed(MyAppRoutesConstants.loginRoute);
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: AppConstantColors().blue),
                    ),
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    )),
                  )
                ],
              ),
            ),
          ],
        )));
  }
}
