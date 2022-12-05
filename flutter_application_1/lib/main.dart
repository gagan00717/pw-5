import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/pages/Home.dart';
import 'package:flutter_application_1/pages/sign_up.dart';
import 'package:flutter_application_1/pages/Startup.dart';
import 'package:flutter_application_1/pages/onboard.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_application_1/pages/login.dart';

void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(children: [
        const Text(
          'InFit',
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ]),
      backgroundColor: Colors.black,
      nextScreen: const LoginPage(),
      splashIconSize: 250,
      duration: 2000,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
