import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:v_chat/helper/authservices.dart';
import 'package:v_chat/routes/app_route_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseServices _firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WELCOME',
        ),
        leading: Icon(CupertinoIcons.home),
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add_comment_sharp),
          backgroundColor: Color.fromARGB(255, 178, 226, 248),
          hoverColor: Color.fromARGB(255, 146, 209, 238),
          elevation: 1,
        ),
      ),
    );
  }
}
