import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:v_chat/routes/app_route_config.dart';

late Size mq;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized;

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAm56WJSq-d8yI_sJrXG78q7-gw-pY-eb0",
            appId: "1:485062014072:web:c2be727f6e845f925d698d",
            messagingSenderId: "485062014072",
            projectId: "vchat-9c9e5"));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: MyAppRoute().router.routeInformationParser,
      routerDelegate: MyAppRoute().router.routerDelegate,
      routeInformationProvider: MyAppRoute().router.routeInformationProvider,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1),
              backgroundColor: Color.fromARGB(255, 178, 226, 248),
              centerTitle: true,
              elevation: 1,
              shadowColor: Colors.black)),
      title: 'VChat',
    );
  }
}
