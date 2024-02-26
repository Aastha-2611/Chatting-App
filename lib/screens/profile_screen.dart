import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:v_chat/helper/authservices.dart';
import 'package:v_chat/routes/app_route_constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseServices _firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).replaceNamed(MyAppRoutesConstants.homeRoute);
            },
            icon: Icon(Icons.arrow_back_ios_outlined)),
        title: Text(
          'Profile',
        ),
        actions: [
          IconButton(
              onPressed: () {
                _firebaseServices.signOut();
                GoRouter.of(context)
                    .replaceNamed(MyAppRoutesConstants.signUpRoute);
                Fluttertoast.showToast(
                    msg: 'Sign out successful',
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              icon: Icon(Icons.search_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded))
        ],
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [],
        ),
      )),
    );
  }
}
