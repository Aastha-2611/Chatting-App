import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:v_chat/routes/app_route_constant.dart';
import 'package:v_chat/screens/auth/login_screen.dart';
import 'package:v_chat/screens/getting_started.dart';
import 'package:v_chat/screens/home_screen.dart';
import 'package:v_chat/screens/page_not_found.dart';

class MyAppRoute {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: MyAppRoutesConstants.gettingStartedRoute,
        pageBuilder: (context, state) {
          return MaterialPage(child: GettingStarted());
        },
      ),
      GoRoute(
        path: '/home_screen',
        name: MyAppRoutesConstants.homeRoute,
        pageBuilder: (context, state) {
          return MaterialPage(child: HomeScreen());
        },
      ),
      GoRoute(
        path: '/login_screen',
        name: MyAppRoutesConstants.loginRoute,
        pageBuilder: (context, state) {
          return MaterialPage(child: LoginScreen());
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(child: PageNotFound());
    },
  );
}
