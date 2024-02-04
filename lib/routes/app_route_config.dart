import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:v_chat/routes/app_route_constant.dart';
import 'package:v_chat/screens/auth/login.dart';
import 'package:v_chat/screens/auth/signUp.dart';

import 'package:v_chat/screens/getting_started.dart';

import 'package:v_chat/screens/home.dart';
import 'package:v_chat/screens/page_not_found.dart';

class MyAppRoute {
  GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/getting_started',
        name: MyAppRoutesConstants.gettingStartedRoute,
        pageBuilder: (context, state) {
          return MaterialPage(child: GettingStarted());
        },
      ),
      GoRoute(
        path: '/home',
        name: MyAppRoutesConstants.homeRoute,
        pageBuilder: (context, state) {
          return MaterialPage(child: HomeScreen());
        },
      ),
      GoRoute(
        path: '/login',
        name: MyAppRoutesConstants.loginRoute,
        pageBuilder: (context, state) {
          return MaterialPage(child: LoginScreen());
        },
      ),
      GoRoute(
          path: '/',
          name: MyAppRoutesConstants.signUpRoute,
          pageBuilder: (context, state) {
            return MaterialPage(child: SignUp());
          }),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(child: PageNotFound());
    },
  );
}
