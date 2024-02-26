import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:v_chat/Riverpods/auth_pod.dart';
import 'package:v_chat/helper/authservices.dart';
import 'package:v_chat/main.dart';
import 'package:v_chat/models/user_fields.dart';
import 'package:v_chat/routes/app_route_constant.dart';
import 'package:v_chat/widgets/chat_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ChatUser> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WELCOME',
        ),
        leading: Icon(CupertinoIcons.home),
        actions: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final authNotifier = ref.watch(authProvider);
              return IconButton(
                  onPressed: () {
                    authNotifier.logOutUser();
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
                  icon: Icon(Icons.search_rounded));
            },
          ),
          IconButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(
                  MyAppRoutesConstants.userProfileRoute,
                );
              },
              icon: Icon(Icons.more_vert_rounded))
        ],
      ),
      body: SafeArea(
          child: StreamBuilder(
              stream:
                  FirebaseServices.firestore.collection('Users').snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );

                  case ConnectionState.active:
                  case ConnectionState.done:
                    final data = snapshot.data?.docs;
                    list = data
                            ?.map((e) => ChatUser.fromJson(e.data()))
                            .toList() ??
                        [];

                    if (list.isNotEmpty) {
                      return ListView.builder(
                        padding: EdgeInsets.only(top: mq.height * .01),
                        itemCount: list.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return ChatUserCard(
                            chatUser: list[index],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text('no data found'),
                      );
                    }
                }
              })),
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
