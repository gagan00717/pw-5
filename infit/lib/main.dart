import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:infit/pages/google_sign_in.dart';
import 'package:infit/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infit/pages/VerifyEmail.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(children: const [
        Text(
          'InFit',
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ]),
      backgroundColor: Colors.black,
      nextScreen: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child:  CircularProgressIndicator());
          }
          else if (snapshot.hasError){
            return Center(child: Text('Something Went wrong'));
          }
          else if (snapshot.hasData){
            return VerifyEmail();
          }
          else {
            return LoginPage();
          }
        },
      ),
      splashIconSize: 250,
      duration: 2000,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Infit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
  ),
  );
}