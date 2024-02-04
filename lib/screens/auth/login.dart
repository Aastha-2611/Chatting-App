import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:v_chat/app_theme.dart/text_color.dart';
import 'package:v_chat/helper/authservices.dart';
import 'package:v_chat/main.dart';
import 'package:v_chat/routes/app_route_constant.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isSigning = false;

  final _formkey = GlobalKey<FormState>();
  final FirebaseServices _firebaseServices = FirebaseServices();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  _submitForm(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      print('login successful');
      signInAction(context);
    }
  }

  void dispose() {
    _emailController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(Icons.arrow_back_ios_new_sharp)),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Center(
                child: _isSigning
                    ? CircularProgressIndicator()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Image.asset(
                              'images/chat.png',
                              height: height * .08,
                              width: height * .08,
                            ),
                          ),
                          Flexible(
                            flex: 1,
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
                                      color: const Color.fromARGB(
                                          255, 135, 240, 138),
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
                          Flexible(
                            flex: 3,
                            child: Form(
                                key: _formkey,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextFormField(
                                      controller: _userNameController,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: InputDecoration(
                                          labelText: 'Username',
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.zero))),
                                      validator:
                                          Validators.required('Required'),
                                    ),
                                    TextFormField(
                                      controller: _emailController,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: Validators.compose([
                                        Validators.required('Required'),
                                        Validators.email('Invalid Email'),
                                      ]),
                                      decoration: InputDecoration(
                                          labelText: 'Email',
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.zero))),
                                    ),
                                    TextFormField(
                                      controller: _passwordController,
                                      validator: Validators.compose([
                                        Validators.required('Required'),
                                        Validators.patternRegExp(
                                            RegExp(
                                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
                                            ' Password should contain upper,lower,digit and Special character')
                                      ]),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      obscureText: true,
                                      obscuringCharacter: '*',
                                      decoration: InputDecoration(
                                          labelText: 'Password',
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.zero))),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: Size.fromHeight(60),
                                          elevation: 1,
                                          backgroundColor:
                                              AppConstantColors().blue,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero)),
                                      onPressed: () {
                                        _submitForm(context);
                                      },
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            letterSpacing: 2,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          Row(children: [
                            Expanded(
                              child: Divider(
                                color: Color.fromARGB(255, 73, 73, 73),
                                height: 35,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                'OR',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromARGB(255, 68, 68, 68)),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.black,
                                height: 10,
                              ),
                            ),
                          ]),
                          Flexible(
                            flex: 1,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 103, 215, 238)),
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 2,
                                        color: Colors.black)),
                                TextSpan(
                                    text: 'Google',
                                    style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w500,
                                        color: AppConstantColors().blue)),
                              ])),
                              icon: Image.asset(
                                'images/google.png',
                                width: width * .06,
                                height: width * .06,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  'Do not have an account?',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  GoRouter.of(context).pushNamed(
                                      MyAppRoutesConstants.signUpRoute);
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: AppConstantColors().blue),
                                ),
                                style: TextButton.styleFrom(
                                    textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                )),
                              )
                            ],
                          ),
                        ],
                      )),
          ),
        ));
  }

  void signInAction(BuildContext context) async {
    setState(() {
      _isSigning = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user =
        await _firebaseServices.signInWithEmailAndPassword(email, password);
    setState(() {
      _isSigning = false;
    });
    if (user != null) {
      print('Successful signin');
      GoRouter.of(context).pushNamed(MyAppRoutesConstants.homeRoute);
    } else
      print("some error occured");
  }
}
