import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Home.dart';
import 'package:flutter_application_1/pages/sign_up.dart';
import 'package:flutter_application_1/pages/phone.dart';

void main() => runApp(const LoginPage());

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Login Page",
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
                //Image.asset('assets/DSC04815.jpg'),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              "Sign In",
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
          TextButton(onPressed: () {}, child: Text("Forgot Password",style: TextStyle(fontSize: 15),)),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
                child: Text("Login",
                  style: TextStyle(fontSize: 20),),
                onPressed: () {
                  //print(nameController);
                  //print(passwordController);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Don't have an account ?"),
        TextButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpPage()),
          );
        },
            child: Text("Sign Up",
              style: TextStyle(fontSize: 20)),)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
          Padding(
          padding: EdgeInsets.all(16.0),
      child: SizedBox(
        height:60, //height of button
        width:200,
        child:ElevatedButton(
            child: Text(
              "Google",
              style: TextStyle(fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            }),
      ),
    ),
              
              SizedBox(
                height:60, //height of button
                width:200,
                child:ElevatedButton(
                  child: Text(
                    "Phone No",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Phone()),
                    );
                    //Navigator.pop(context);
                  }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
