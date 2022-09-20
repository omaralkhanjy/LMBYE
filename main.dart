import 'package:flutter/material.dart';
import 'package:letmeyoureyes/screens/MapPage.dart';
import 'package:letmeyoureyes/screens/mainPage.dart';
import 'package:letmeyoureyes/screens/splashPage.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyC7caF-5KSKNVcG6qPw3y0vJ0yirIjeZqQ", // Your apiKey
      appId: "1:704390507189:android:4c0ada85f5d2078d95ecfc", // Your appId
      messagingSenderId: "704390507189", // Your messagingSenderId
      projectId: "letmebeyoureyes", // Your projectId
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Let me be your eyes',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MapPage(),
      // routes: {
      //   // "/": (context) => MainPage(),
      //   // MainPage.blind_Route: (context) => (),
      // },
    );
  }
}
