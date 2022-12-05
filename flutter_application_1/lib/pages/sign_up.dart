import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:provider/provider.dart';

import '../services/firebase_auth_methods.dart';

void main() => runApp(const SignUpPage());

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  _EmailPasswordSignupState createState() => _EmailPasswordSignupState();
}

class _EmailPasswordSignupState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signUpUser() async {
    context.read<FirebaseAuthMethods>().signUpWithEmail(
      email: nameController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Sign Up Page",
        home: Scaffold(
          body: MyStatefulWidget(),
        ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text(
                    "inFit",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  //Image.asset('./assets/DSC04815.jpg'),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "User Name",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: confirmController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Confirm Password",
                  ),
                )),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                    child: Text("Sign Up",style: TextStyle(fontSize: 20),),
                    onPressed: () {
                        signUpUser();
                    })),
            Row(
              children: <Widget>[
                Text("Already have an account ?"),
                TextButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                  child: Text("Sign In",
                      style: TextStyle(fontSize: 20)),)
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }


  void signUpUser() async {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    context.read<FirebaseAuthMethods>().signUpWithEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }
}
